/*
 * SpecificationActionBean.java
 *
 * Created on 21. oktober 2007, 18:34
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package com.asap.web.specification;

import com.asap.catalog.dao.ProductTemplate;
import com.asap.catalog.dao.Qoute;
import com.asap.catalog.dao.Specification;
import com.asap.catalog.dao.User;
import com.asap.catalog.dao.Specification_Share;
import com.asap.web.CatalogActionBean;
import net.sourceforge.stripes.action.*;
import net.sourceforge.stripes.validation.Validate;
import net.sourceforge.stripes.validation.ValidateNestedProperties;
import org.hibernate.criterion.Restrictions;

import java.util.*;

import util.HibernateUtil;

/**
 * @author JRO
 */
public class SpecificationActionBean extends CatalogActionBean {

    public static final String filename = "/scheme.xls";
    private Boolean fromTemplate;
    private String tab;

    @ValidateNestedProperties({
        @Validate(field = "reference", required = true),
        @Validate(field = "pcbreference", required = true)
    })

    private Specification specification;
    private Specification showspec;
    private User user;
    private Qoute quote;
    private ProductTemplate productTemplate;

    /**
     * Creates a new instance of SpecificationActionBean
     */
    public SpecificationActionBean() {
    }

    @DefaultHandler
    @DontValidate
    public Resolution edit() {
        showspec = specification;
        Calendar c = Calendar.getInstance(TimeZone.getTimeZone("Asia/Calcutta"));
        System.out.println(new Date());
        System.out.println("Time in Calcutta: "
                + c.get(Calendar.HOUR_OF_DAY) + ":"
                + c.get(Calendar.MINUTE));

        Calendar calNewYork = Calendar.getInstance();
        Calendar calParis = Calendar.getInstance();
        Calendar calTokyo = Calendar.getInstance();

        calNewYork.setTimeZone(TimeZone.getTimeZone("CET"));
        calParis.setTimeZone(TimeZone.getTimeZone("Europe/Copenhagen"));
        calTokyo.setTimeZone(TimeZone.getTimeZone("Asia/Tokyo"));

        System.out.println("Time in CET: "
                + calNewYork.get(Calendar.HOUR_OF_DAY) + ":"
                + calNewYork.get(Calendar.MINUTE));

        System.out.println("Time in Copenhagen: "
                + calParis.get(Calendar.HOUR_OF_DAY) + ":"
                + calParis.get(Calendar.MINUTE));

        System.out.println("Time in Tokyo: "
                + calTokyo.get(Calendar.HOUR_OF_DAY) + ":"
                + calTokyo.get(Calendar.MINUTE));

        if (specification == null) {
            specification = new Specification();
            specification.init(getContext().getServletContext().getRealPath(filename));
        }

        if (specification.getUser() == null) {
            User user = (User) getContext().getRequest().getSession().getAttribute("user");
            specification.setUser(user);
        }

        return new ForwardResolution("edit.jsp");
    }

    @DontValidate
    public Resolution viewAndOrder() {
        if (specification == null) {
            return new RedirectResolution("/startup/Startup.action?home");
        }
        specification.setSpecAccess(1);
        return new ForwardResolution("view&orderSpec.jsp");
    }

    @DontValidate
    public Resolution viewOnly() {
        if (specification == null) {
            return new RedirectResolution("/startup/Startup.action?home");
        }
        specification.setSpecAccess(2);
        return new ForwardResolution("roSpec.jsp");
    }

    @DontValidate
    public Resolution nonEditableView() {
        showspec = specification;

        if (specification == null) {
            specification = new Specification();
            specification.init(getContext().getServletContext().getRealPath(filename));
        }

        if (specification.getUser() == null) {
            User user = (User) getContext().getRequest().getSession().getAttribute("user");
            specification.setUser(user);
        }

        return new ForwardResolution("roSpec.jsp");
    }

    @DontValidate
    public Resolution update() {
        specification.processxls(getContext().getServletContext().getRealPath(filename));
        return new ForwardResolution("aziresult.jsp");
    }

    public void updateQoutes() {
        Iterator<Qoute> qoutes = getSession().createCriteria(Qoute.class).add(Restrictions.eq("specification", specification)).list().iterator();
        String transport = specification.getTransport();
        double opq = specification.getOwnpanelquantity();
        double azq = specification.getAzquantity();
        double sgq = specification.getSgquantity();
        double opd = specification.getOwnproddays();
        double azd = specification.getAzproddays();
        double sgd = specification.getSgproddays();
        while (qoutes.hasNext()) {
            Qoute qoute = qoutes.next();
            if (qoute.getCreatedFromTemplate() == null || !qoute.getCreatedFromTemplate()) {
                specification.setTransport(qoute.getTransport());
                specification.setOwnpanelquantity(qoute.getQuantity());
                specification.setAzquantity(qoute.getQuantity());
                specification.setSgquantity(qoute.getQuantity());
                specification.setOwnproddays(qoute.getWorkingDays());
                specification.setAzproddays(qoute.getWorkingDays());
                specification.setSgproddays(qoute.getWorkingDays());

                specification.processxls(getContext().getServletContext().getRealPath(SpecificationActionBean.getFilename()));

                qoute.setTotal((100 - specification.getUser().getDiscount().doubleValue()) * 0.01 * specification.getRestotal());
                qoute.setUnitPrice(specification.getRespriceperunit());
                qoute.setTooling(specification.getRestestandtooling());
                qoute.setFreight(specification.getResfreightcost());
//            qoute.setWeight(specification.getResweight());
                //persist(qoute);
            }
        }

        specification.setOwnpanelquantity(opq);
        specification.setAzquantity(azq);
        specification.setSgquantity(sgq);
        specification.setOwnproddays(opd);
        specification.setAzproddays(azd);
        specification.setSgproddays(sgd);
        specification.setTransport(transport);
    }

    public Resolution save() {
        specification.processxls(getContext().getServletContext().getRealPath(filename));
        specification.setCreatedOn(new Date());
        specification.setLastUpdateOn(specification.getCreatedOn());
        specification.setLastUpdateBy(((User) getContext().getRequest().getSession().getAttribute("user")).getId());
        persist(specification);
        updateQoutes();
        return new RedirectResolution("/specification/Specification.action?specification=" + specification.getId() + "&tab=layout");
    }

    public Resolution next() {
        Long specId = specification.getId();
        if (specId != null) {
            if (getSession().isDirty()) {
                specification.processxls(getContext().getServletContext().getRealPath(filename));
                specification.setLastUpdateOn(new Date());
                specification.setLastUpdateBy(((User) getContext().getRequest().getSession().getAttribute("user")).getId());
                persist(specification);
                updateQoutes();
            }
        } else {
            specification.processxls(getContext().getServletContext().getRealPath(filename));
            persist(specification);
        }

        return new RedirectResolution("/qoute/Qoute.action?specification=" + specification.getId() + "&productTemplate=" + getProductTemplate());
    }


    public Resolution saveandBack() {
        if (getSession().isDirty()) {
            specification.processxls(getContext().getServletContext().getRealPath(filename));
            specification.setLastUpdateOn(new Date());
            specification.setLastUpdateBy(((User) getContext().getRequest().getSession().getAttribute("user")).getId());
            persist(specification);
            updateQoutes();
        }
        return new RedirectResolution("/startup/Startup.action?home");
    }

    @DontValidate
    public Resolution list() {
        return new ForwardResolution("list.jsp");
    }

    @DontValidate
    public Resolution delete() {
        if (specification != null && specification.getProductTemplates().size() == 0) {
            getContext().getRequest().getSession().setAttribute("user", specification.getUser());
            List<Specification_Share> list = HibernateUtil.getSessionFactory().getCurrentSession().createCriteria(Specification_Share.class).add(Restrictions.eq("spec", specification)).list();
            for (Specification_Share obj : list) {
                delete(obj);
            }
            List quoteList = HibernateUtil.getSessionFactory().getCurrentSession().createCriteria(Qoute.class).add(Restrictions.eq("specification", specification)).list();
            for (Object qoute : quoteList) {
                delete(qoute);
            }
            delete(specification);
        }
        return new ForwardResolution("/user/UserLoggedIn.jsp");
    }

    @DontValidate
    public Resolution deleteFromAdmin() {
        if (specification != null && specification.getProductTemplates().size() == 0) {
            List<Specification_Share> list = HibernateUtil.getSessionFactory().getCurrentSession().createCriteria(Specification_Share.class).add(Restrictions.eq("spec", specification)).list();
            for (Specification_Share obj : list) {
                delete(obj);
            }
            List quoteList = HibernateUtil.getSessionFactory().getCurrentSession().createCriteria(Qoute.class).add(Restrictions.eq("specification", specification)).list();
            for (Object qoute : quoteList) {
                delete(qoute);
            }
            delete(specification);
        }
        return list();
    }

    public static String getFilename() {
        return filename;
    }

    public Specification getSpecification() {
        return specification;
    }

    public void setSpecification(Specification specification) {
        this.specification = specification;
    }

    public List getAllSpecs() {
        if (user != null) {
            return getSession().createCriteria(Specification.class).add(Restrictions.eq("user", user)).list();
        }
        return getSession().createCriteria(Specification.class).add(Restrictions.eq("user", getContext().getRequest().getSession().getAttribute("user"))).list();
    }

    public Specification getShowspec() {
        return showspec;
    }

    public void setShowspec(Specification showspec) {
        this.showspec = showspec;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    /**
     * @return the fromTemplate
     */
    public Boolean getFromTemplate() {
        return fromTemplate;
    }

    /**
     * @param fromTemplate the fromTemplate to set
     */
    public void setFromTemplate(Boolean fromTemplate) {
        this.fromTemplate = fromTemplate;
    }

    /**
     * @return the tab
     */
    public String getTab() {
        return tab;
    }

    /**
     * @param tab the tab to set
     */
    public void setTab(String tab) {
        this.tab = tab;
    }

    /**
     * @return the quote
     */
    public Qoute getQuote() {
        return quote;
    }

    /**
     * @param quote the quote to set
     */
    public void setQuote(Qoute quote) {
        this.quote = quote;
    }

    /**
     * @return the productTemplate
     */
    public ProductTemplate getProductTemplate() {
        return productTemplate;
    }

    /**
     * @param productTemplate the productTemplate to set
     */
    public void setProductTemplate(ProductTemplate productTemplate) {
        this.productTemplate = productTemplate;
    }
}
