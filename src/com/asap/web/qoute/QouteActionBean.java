/*
 * SpecificationActionBean.java
 *
 * Created on 21. oktober 2007, 18:34
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package com.asap.web.qoute;

import com.asap.catalog.dao.Qoute;
import com.asap.catalog.dao.Specification;
import com.asap.catalog.dao.User;
import com.asap.configuration.ConfigurationManager;
import com.asap.web.CatalogActionBean;
import com.asap.web.specification.SpecificationActionBean;
import net.sourceforge.stripes.action.*;
import net.sourceforge.stripes.validation.SimpleError;
import net.sourceforge.stripes.validation.ValidationErrors;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * @author JRO
 */
public class QouteActionBean extends CatalogActionBean {

    private Qoute qoute;
    private Specification specification;

    private String transport;
    private double quantity;
    private String country;
    private String currency;
    private double total;
    private double days;
    private double priceprunit;
    private double tooling;
    private double freight;
    private double weight;
    private double subtotal;
    private boolean sentEmail;
    private Boolean goBack;

    public static final String filename = "/scheme.xls";

    private String error;
    private FileBean file1;
    private FileBean file;

    /**
     * Creates a new instance of SpecificationActionBean
     */
    public QouteActionBean() {
    }

    private Double getSchemeVersion() {
        if (getContext().getRequest().getSession().getAttribute("schemeVer") == null) {
            getContext().getRequest().getSession().removeAttribute("schemeVer");
            getContext().getRequest().getSession().setAttribute("schemeVer", Specification.getSchemeVersion(Specification.filename)); //todo: added on 03 April 2010
        }
        return ((Double) getContext().getRequest().getSession().getAttribute("schemeVer"));
    }

    @DefaultHandler
    public Resolution edit() {
        if (specification != null) {
            country = specification.getUser().getCountry();//specification.getCountry();
            transport = specification.getTransport();
            currency = specification.getUser().getCurrency();//specification.getCurrency();
            quantity = specification.getResquantity();
            days = specification.getResworkingdays();
            weight = specification.getResweight();
        }
        sentEmail = false;
        return new ForwardResolution("edit.jsp");
    }

    public Resolution upload() {
        if (!getHasFile() && !getHasFile1() && file == null && file1 == null) {
            ValidationErrors error = new ValidationErrors();
            error.add("file", new SimpleError("Minimum one file upload is required"));
            getContext().setValidationErrors(error);
            return new ForwardResolution("/specification/uploadTAB.jsp");
        } else {
            saveGerberFile();
            persist(qoute);
            return new RedirectResolution("/azitechorder/Order.action?newOrder&qoute=" + qoute.getId());
        }
    }

    public Resolution initializeReorder() {
        if (specification != null) {
            country = specification.getUser().getCountry();//specification.getCountry();
            transport = specification.getTransport();
            currency = specification.getUser().getCurrency();//specification.getCurrency();
            quantity = specification.getResquantity();
            days = specification.getResworkingdays();
            weight = specification.getResweight();
            specification.setSpecAccess(1);
        }
        sentEmail = false;
        return new ForwardResolution("roQuote.jsp");
    }

    public Resolution initializeOrderWithViewOrderAccess() {
        if (specification != null) {
            country = specification.getUser().getCountry();//specification.getCountry();
            transport = specification.getTransport();
            currency = specification.getUser().getCurrency();//specification.getCurrency();
            quantity = specification.getResquantity();
            days = specification.getResworkingdays();
            weight = specification.getResweight();
            specification.setSpecAccess(1);
        }
        sentEmail = false;
        return new ForwardResolution("view&orderQuote.jsp");
    }

    public Resolution listAllQoutes() {
        return new ForwardResolution("list.jsp");
    }

    public List getAllQoutesByUser() {
        return getSession().createCriteria(Qoute.class).addOrder(Order.desc("id")).list();
    }

    public Resolution sendToAzitech() {
        QuoteToAzitech email = new QuoteToAzitech();
        User user = (User) getContext().getRequest().getSession().getAttribute("user");
        List<Object> loQuotes = getQoutes();
        String to = ConfigurationManager.getParameter("email");

        email.setProperty("user", user);
        email.setProperty("qoutes", loQuotes);
        email.setProperty("specification", specification);

        email.setTo(to);
        email.setFrom("sales@azitech.dk");
        email.setSubject("Quotation");
        email.send();

        AzitechQouteEmail email1 = new AzitechQouteEmail();
        email1.setProperty("user", user);
        email1.setProperty("qoutes", loQuotes);
        email1.setProperty("specification", specification);
        email1.setFrom(to);
        email1.setTo(user.getEmail());
        email1.setSubject("Quotation from PCB-direct");
        email1.send();

        sentEmail = true;
        return new ForwardResolution("edit.jsp");
    }

    public Resolution sendToAzitechRO() {
        QuoteToAzitech email = new QuoteToAzitech();
        User user = (User) getContext().getRequest().getSession().getAttribute("user");
        List<Object> loQuotes = getQoutesRO();
        String to = ConfigurationManager.getParameter("email");

        email.setProperty("user", user);
        email.setProperty("qoutes", loQuotes);
        email.setProperty("specification", specification);

        email.setTo(to);
        email.setFrom("sales@azitech.dk");
        email.setSubject("Quotation");
        email.send();

        AzitechQouteEmail email1 = new AzitechQouteEmail();
        email1.setProperty("user", user);
        email1.setProperty("qoutes", loQuotes);
        email1.setProperty("specification", specification);
        email1.setFrom(to);
        email1.setTo(user.getEmail());
        email1.setSubject("Quotation from PCB-direct");
        email1.send();

        sentEmail = true;
        return new ForwardResolution("edit.jsp");
    }

    public Resolution save() {
        if (qoute.getUser() == null) {
            User user = (User) getContext().getRequest().getSession().getAttribute("user");
            qoute.setUser(user);
        }
        persist(qoute);
        return new ForwardResolution("edit.jsp");
    }

    public Resolution update() {
        String tp = specification.getTransport();
        double opq = specification.getOwnpanelquantity();
        double azq = specification.getAzquantity();
        double sgq = specification.getSgquantity();
        double opd = specification.getOwnproddays();
        double spd = specification.getSgproddays();
        double apd = specification.getAzproddays();

        specification.setTransport(transport);
        specification.setOwnpanelquantity(quantity);
        specification.setAzquantity(quantity);
        specification.setSgquantity(quantity);
        specification.setOwnproddays(days);
        specification.setAzproddays(days);
        specification.setSgproddays(days);

        specification.processxls(getContext().getServletContext().getRealPath(SpecificationActionBean.filename));

        priceprunit = specification.getRespriceperunit();
        tooling = specification.getRestestandtooling();
        freight = specification.getResfreightcost();
        subtotal = priceprunit * quantity;

        total = specification.getRestotal();
        days = specification.getRestotaldays();
        weight = specification.getResweight();

        if (qoute == null) {
            qoute = new Qoute();
        }

        qoute.setSpecification(specification);
        qoute.setTransport(transport);
        qoute.setQuantity(quantity);
        qoute.setTotal(total);
        qoute.setDays(days);
        qoute.setFreight(freight);
        qoute.setTooling(specification.getRestestandtooling());
        qoute.setUnitPrice(specification.getRespriceperunit());
        qoute.setWorkingDays(specification.getResworkingdays());

        specification.setTransport(tp);
        specification.setOwnpanelquantity(opq);
        specification.setAzquantity(azq);
        specification.setSgquantity(sgq);
        specification.setOwnproddays(opd);
        specification.setSgproddays(spd);
        specification.setAzproddays(apd);

        getContext().getRequest().getSession().setAttribute("qoute", qoute);

        return new ForwardResolution("result.jsp");
    }

    public Resolution updateReorder() {
        String tp = specification.getTransport();
        double opq = specification.getOwnpanelquantity();
        double azq = specification.getAzquantity();
        double sgq = specification.getSgquantity();
        double opd = specification.getOwnproddays();
        double spd = specification.getSgproddays();
        double apd = specification.getAzproddays();

        specification.setTransport(transport);
        specification.setOwnpanelquantity(quantity);
        specification.setAzquantity(quantity);
        specification.setSgquantity(quantity);
        specification.setOwnproddays(days);
        specification.setAzproddays(days);
        specification.setSgproddays(days);

        specification.processxls(getContext().getServletContext().getRealPath(SpecificationActionBean.filename));

        priceprunit = specification.getRespriceperunit();
        tooling = 0.0;
        freight = specification.getResfreightcost();
        subtotal = priceprunit * quantity;
        total = specification.getRestotalreorder();
        days = specification.getRestotaldays();
        weight = specification.getResweight();

        if (qoute == null) {
            qoute = new Qoute();
        }

        qoute.setSpecification(specification);
        qoute.setTransport(transport);
        qoute.setQuantity(quantity);
        qoute.setTotal(total);
        qoute.setDays(days);
        qoute.setFreight(freight);
        qoute.setTooling(0.0);
        qoute.setUnitPrice(specification.getRespriceperunit());
        qoute.setWorkingDays(specification.getResworkingdays());

        specification.setTransport(tp);
        specification.setOwnpanelquantity(opq);
        specification.setAzquantity(azq);
        specification.setSgquantity(sgq);
        specification.setOwnproddays(opd);
        specification.setSgproddays(spd);
        specification.setAzproddays(apd);

        getContext().getRequest().getSession().setAttribute("qoute", qoute);

        return new ForwardResolution("result.jsp?sp=r");
    }

    private Qoute reCalculate(Qoute loQuote, boolean flagIsRO) {
        specification = loQuote.getSpecification();

        String tp = specification.getTransport();
        double opq = specification.getOwnpanelquantity();
        double azq = specification.getAzquantity();
        double sgq = specification.getSgquantity();
        double opd = specification.getOwnproddays();
        double spd = specification.getSgproddays();
        double apd = specification.getAzproddays();

        specification.setTransport(loQuote.getTransport());
        specification.setOwnpanelquantity(loQuote.getQuantity());
        specification.setAzquantity(loQuote.getQuantity());
        specification.setSgquantity(loQuote.getQuantity());
        specification.setOwnproddays(loQuote.getDays());
        specification.setAzproddays(loQuote.getDays());
        specification.setSgproddays(loQuote.getDays());

        specification.processxls(getContext().getServletContext().getRealPath(SpecificationActionBean.filename));

        loQuote.setWeight(specification.getResweight());
        loQuote.setDays(specification.getRestotaldays());
        loQuote.setFreight(specification.getResfreightcost());
        if (!flagIsRO) {
            loQuote.setTooling(specification.getRestestandtooling());
            loQuote.setTotal(specification.getRestotal());
        } else {
            loQuote.setTooling(0.0);
            loQuote.setTotal(specification.getRestotalreorder());
        }
        loQuote.setUnitPrice(specification.getRespriceperunit());
        loQuote.setWorkingDays(specification.getResworkingdays());

        specification.setTransport(tp);
        specification.setOwnpanelquantity(opq);
        specification.setAzquantity(azq);
        specification.setSgquantity(sgq);
        specification.setOwnproddays(opd);
        specification.setSgproddays(spd);
        specification.setAzproddays(apd);

        return loQuote;
    }

    public List<Object> getQoutes() {
        List<Object> result = new ArrayList<Object>();
        double schemeVersion = getSchemeVersion();
        specification.processxls(getContext().getServletContext().getRealPath(SpecificationActionBean.filename));
        for (Object qoute : getSession().createCriteria(Qoute.class).add(Restrictions.eq("specification", specification)).addOrder(Order.desc("id")).list()) {
            if (((Qoute) qoute).getVersion() < schemeVersion) {
                qoute = reCalculate((Qoute) qoute, false);
                ((Qoute) qoute).setVersion(schemeVersion);
                persist(qoute);
                System.out.println("Quote recalculated from version: 0 to version: " + schemeVersion);
            }
            result.add(qoute);
        }

        return result;
    }

    public List<Object> getQoutesRO() {
        List<Object> result = new ArrayList<Object>();

        double schemeVersion = getSchemeVersion();
        for (Object qoute : getSession().createCriteria(Qoute.class).add(Restrictions.eq("specification", specification)).addOrder(Order.desc("id")).list()) {
            if (((Qoute) qoute).getTooling() > 0) {
                ((Qoute) qoute).setFreez(true);
            } else {
                ((Qoute) qoute).setFreez(false);
            }
//            System.out.println("scheme version:********** "+ schemeVersion);
            if (((Qoute) qoute).getVersion() < schemeVersion) {
                qoute = reCalculate((Qoute) qoute, true);
                ((Qoute) qoute).setVersion(schemeVersion);
                persist(qoute);
                System.out.println("Quote recalculated from version: 0 to version: " + schemeVersion);
            }
            result.add(qoute);
        }
        return result;
    }

    public Resolution addToCart() {
        qoute = (Qoute) getContext().getRequest().getSession().getAttribute("qoute");
        double schemeVersion = getSchemeVersion();
        if (qoute != null) {
            User user = (User) getContext().getRequest().getSession().getAttribute("user");
            qoute.setUser(user);
            qoute.setWeight(qoute.getSpecification().getResweight());
            qoute.setVersion(schemeVersion);
            persist(qoute);
            //Add support for more qoutes
            qoute.setSpecification(specification);
            this.getContext().getRequest().getSession().setAttribute("qoute", qoute);
        }
        if (specification != null) {
            country = specification.getUser().getCountry();//specification.getCountry();
            transport = specification.getTransport();
            currency = specification.getUser().getCurrency();//specification.getCurrency();
            quantity = specification.getResquantity();
            days = specification.getResworkingdays();
            weight = qoute.getSpecification().getResweight();
        }
        if (getContext().getRequest().getParameter("sp") != null && getContext().getRequest().getParameter("sp").equals("r")) {
            return new RedirectResolution("/qoute/Qoute.action?initializeReorder=&specification=" + this.specification);
        } else {
            return new RedirectResolution("/qoute/Qoute.action?specification=" + this.specification);
        }
    }

    public Resolution backToSpecification() {
        return new RedirectResolution("/specification/Specification.action?specification=" + specification.getId() + "&tab=" + getContext().getRequest().getParameter("tab"));
    }

    public Resolution backToSpecificationRO() {
        if (getContext().getRequest().getParameter("tab") == null) {
            return new RedirectResolution("/specification/Specification.action?nonEditableView&specification=" + specification.getId());
        } else {
            return new RedirectResolution("/specification/Specification.action?nonEditableView&specification=" + specification.getId() + "&tab=layout");
        }
    }

    public Resolution backToSpecificationVOShared() {
        if (getContext().getRequest().getParameter("tab") == null) {
            return new RedirectResolution("/specification/Specification.action?viewAndOrder&specification=" + specification.getId());
        } else {
            return new RedirectResolution("/specification/Specification.action?viewAndOrder&specification=" + specification.getId() + "&tab=layout");
        }
    }

    public Resolution setUploads() {
        return new ForwardResolution("/specification/uploadTAB.jsp");
    }

    public Resolution setUploadsViewOnly() {
        return new ForwardResolution("/specification/viewUpload.jsp");
    }

    public File getDir() {
        return new File(getContext().getServletContext().getRealPath("/azitechData/" + specification.getId()));
    }

    public void saveGerberFile() {
        String name;
        getDir().mkdirs();
        if (file != null) {
            name = file.getFileName();
            try {
                File fileToSaveIn = new File(getDir(), name);
                file.save(fileToSaveIn);
                specification.setGerberdata(file.getFileName());
                System.out.println("Gerberdata saved In: " + fileToSaveIn.getPath());
            } catch (IOException ex) {
                ex.printStackTrace();
                error = "An error occured!: " + ex;
            }
        }

        if (file1 != null) {
            name = file1.getFileName();
            try {
                File fileToSaveIn = new File(getDir(), name);
                file1.save(fileToSaveIn);
                specification.setGerberdata1(file1.getFileName());
                System.out.println("Gerberdata saved In: " + fileToSaveIn.getPath());
            } catch (IOException ex) {
                ex.printStackTrace();
                error = "An error occured!: " + ex;
            }
        }

        persist(specification);
    }

    public Resolution delete() {
        delete(qoute);
        String lsMode = getContext().getRequest().getParameter("sp");
        if (lsMode != null && lsMode.equals("r")) {
            return new ForwardResolution("roQuote.jsp");
        } else {
            return new ForwardResolution("edit.jsp");
        }
    }

    public List getAllSpecs() {
        return getSession().createCriteria(Specification.class).add(Restrictions.eq("user", specification.getUser())).list();
    }

    @DontValidate
    public boolean getHasFile() {
        return (specification.getGerberdata() != null);
    }

    @DontValidate
    public boolean getHasFile1() {
        return (specification.getGerberdata1() != null);
    }

    @DontValidate
    public Resolution file() {
        InputStream reader = new ByteArrayInputStream(specification.getFile_file());
        return new StreamingResolution("text/html", reader);
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public FileBean getFile() {
        return file;
    }

    public void setFile(FileBean file) {
        this.file = file;
    }

    public static String getFilename() {
        return filename;
    }

    public FileBean getFile1() {
        return file1;
    }

    public void setFile1(FileBean file1) {
        this.file1 = file1;
    }

    public Qoute getQoute() {
        return qoute;
    }

    public void setQoute(Qoute qoute) {
        this.qoute = qoute;
    }

    public Specification getSpecification() {
        return specification;
    }

    public void setSpecification(Specification specification) {
        this.specification = specification;
    }

    public String getTransport() {
        return transport;
    }

    public void setTransport(String transport) {
        this.transport = transport;
    }

    public double getQuantity() {
        return quantity;
    }

    public void setQuantity(double quantity) {
        this.quantity = quantity;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public double getDays() {
        return days;
    }

    public void setDays(double days) {
        this.days = days;
    }

    public double getPriceprunit() {
        return priceprunit;
    }

    public void setPriceprunit(double priceprunit) {
        this.priceprunit = priceprunit;
    }

    public double getTooling() {
        return tooling;
    }

    public void setTooling(double tooling) {
        this.tooling = tooling;
    }

    public double getFreight() {
        return freight;
    }

    public void setFreight(double freight) {
        this.freight = freight;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public boolean getSentEmail() {
        return sentEmail;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    /**
     * @return the goBack
     */
    public Boolean getGoBack() {
        return goBack;
    }

    /**
     * @param goBack the goBack to set
     */
    public void setGoBack(Boolean goBack) {
        this.goBack = goBack;
    }
}
