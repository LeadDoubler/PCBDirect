/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.asap.web.productTemplate;

import com.asap.catalog.dao.ProductTemplate;
import com.asap.catalog.dao.Qoute;
import com.asap.catalog.dao.Specification;
import com.asap.security.Role;
import com.asap.security.Secure;
import com.asap.web.CatalogActionBean;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.FileBean;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.RedirectResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.StreamingResolution;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.io.IOUtils;
import org.hibernate.Criteria;
import util.HibernateUtil;

/**
 *
 * @author Jonas
 */
public class ProductTemplateActionBean extends CatalogActionBean {

    private ProductTemplate productTemplate;
    private Specification specification;
    private FileBean fileBean;
    private Double width;
    private Double height;
    private Double unitPrice;
    private Integer quantity;
    private Long pt1;
    private Long pt2;
    private Long pt3;

    @DefaultHandler
    public Resolution showProductTemplates() {
        return new ForwardResolution("showProductTemplates.jsp");
    }

    public Resolution showProductTemplate() {
        return new ForwardResolution("createProductTemplate.jsp");
    }

    public Resolution showProductTemplatesWithId() {
        return new ForwardResolution("limitedProductTemplates.jsp");
    }

    public Resolution getImage() {
        return new StreamingResolution(getProductTemplate().getFileContent()) {
            public void stream(HttpServletResponse response) throws Exception {
                response.getOutputStream().write(getProductTemplate().getTheFile());
            }
        };
    }

    @Secure(role = Role.USER)
    public Resolution orderProduct() {
        return new ForwardResolution("orderProduct.jsp");
    }

    /*
    public Resolution makeQuote() {
        Specification newSpecification = new Specification();
        Qoute quote = new Qoute();
        try {
            BeanUtils.copyProperties(newSpecification, getProductTemplate().getSpecification());

            System.out.println("Old spec: " + getProductTemplate().getSpecification());
            System.out.println("Removing references to collection..");
            newSpecification.setProductTemplates(null);
            newSpecification.setAzitechOrders(null);
            newSpecification.setId(null);
            newSpecification.setSgpcbdimx(getWidth());
            newSpecification.setSgpcbdimy(getHeight());
            newSpecification.setUser(this.getContext().getUser());
            newSpecification.setTransport(getProductTemplate().getTransport());
            newSpecification.setResquantity(getQuantity());
            newSpecification.setResworkingdays(getProductTemplate().getProductionDays());
            newSpecification.setGerberdata(null);
            newSpecification.setGerberdata1(null);
            persist(newSpecification);
            System.out.println("New spec: " + newSpecification);

            quote.setSpecification(newSpecification);
            quote.setUser(newSpecification.getUser());
            quote.setQuantity(getQuantity());
            quote.setDays(getProductTemplate().getProductionDays());
            quote.setTransport(getProductTemplate().getTransport());
            quote.setTotal(getProductTemplate().getPrice());
            quote.setUnitPrice(getUnitPrice());
            quote.setTooling(0d);
            quote.setFreight(0d);

            persist(quote);
            System.out.println("Saved new quote: " + quote);
        } catch (IllegalAccessException ex) {
            ex.printStackTrace();
        } catch (InvocationTargetException ex) {
            ex.printStackTrace();
        }
        return new RedirectResolution("/qoute/Qoute.action?setUploads&specification=" + newSpecification + "&qoute=" + quote + "&goBack=false");
    }
     */
    public Resolution buyTemplate() {
        System.out.println("Buying new template..");
        Specification newSpecification = new Specification();
        try {
            BeanUtils.copyProperties(newSpecification, getProductTemplate().getSpecification());

            System.out.println("Creating copy of specification");
            newSpecification.setProductTemplates(null);
            newSpecification.setAzitechOrders(null);
            newSpecification.setId(null);
            newSpecification.setPcbreference("");
            newSpecification.setSgpcbdimx(getWidth());
            newSpecification.setAzpcbdimx(getWidth());
            newSpecification.setOwnpaneldimx(getWidth());
            newSpecification.setSgpcbdimy(getHeight());
            newSpecification.setAzpcbdimy(getHeight());
            newSpecification.setOwnpaneldimy(getHeight());
            newSpecification.setUser(this.getContext().getUser());
            newSpecification.setTransport(getProductTemplate().getTransport());
            newSpecification.setResquantity(getQuantity());
            newSpecification.setResworkingdays(getProductTemplate().getProductionDays());
            newSpecification.setLayout("Single");
            newSpecification.setGerberdata(null);
            newSpecification.setGerberdata1(null);
            persist(newSpecification);
            createQuoteFromTemplate(newSpecification);
            System.out.println("New spec: " + newSpecification);

        } catch (IllegalAccessException ex) {
            ex.printStackTrace();
        } catch (InvocationTargetException ex) {
            ex.printStackTrace();
        }
        return new RedirectResolution("/specification/Specification.action?specification=" + newSpecification + "&fromTemplate=true");
        //return new RedirectResolution("/qoute/Qoute.action?setUploads&specification=" + newSpecification + "&qoute=" + quote + "&goBack=false");
    }

    public void createQuoteFromTemplate(Specification newSpecification) {
        Qoute quote = new Qoute();
        quote.setSpecification(newSpecification);
        quote.setUser(newSpecification.getUser());
        quote.setQuantity(getQuantity());
        quote.setDays(getProductTemplate().getProductionDays());
        quote.setTransport(getProductTemplate().getTransport());
        quote.setTotal(getProductTemplate().getPrice());
        quote.setUnitPrice(getUnitPrice());
        quote.setTooling(0d);
        quote.setFreight(0d);
        quote.setCreatedFromTemplate(true);

        persist(quote);
        System.out.println("Saved new quote: " + quote);
    }

    public Resolution saveProductTemplate() {

        if (getProductTemplate() == null) {
            setProductTemplate(new ProductTemplate());
        }

        if (getFileBean() != null) {
            try {
                getProductTemplate().setTheFile(IOUtils.toByteArray(getFileBean().getInputStream()));
                getProductTemplate().setFileContent(getFileBean().getContentType());
            } catch (IOException ex) {
                System.out.println("FEJL: " + ex);
                ex.printStackTrace();
            }
        }

        if (getSpecification() != null) {
            getProductTemplate().setSpecification(getSpecification());
        }

        if (getProductTemplate().getPublished() == null) {
            getProductTemplate().setPublished(false);
        }

        persist(getProductTemplate());
        return showProductTemplates();
    }

    public Resolution deleteProductTemplate() {
        if (getProductTemplate() != null) {
            HibernateUtil.getSessionFactory().getCurrentSession().delete(getProductTemplate());
            persist();
        }
        return new RedirectResolution("/productTemplate/ProductTemplate.action");
    }

    public List<ProductTemplate> getProductTemplates() {
        ArrayList<ProductTemplate> list = new ArrayList();
        if (getProductTemplate() == null) {
            Criteria crit = HibernateUtil.getSessionFactory().getCurrentSession().createCriteria(ProductTemplate.class);
            list = (ArrayList<ProductTemplate>) crit.list();
        } else {
            list.add(getProductTemplate());
        }
        return list;
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

    /**
     * @return the specification
     */
    public Specification getSpecification() {
        if (specification == null && getProductTemplate() != null) {
            specification = getProductTemplate().getSpecification();
        }
        return specification;
    }

    /**
     * @param specification the specification to set
     */
    public void setSpecification(Specification specification) {
        this.specification = specification;
    }

    /**
     * @return the fileBean
     */
    public FileBean getFileBean() {
        return fileBean;
    }

    /**
     * @param fileBean the fileBean to set
     */
    public void setFileBean(FileBean fileBean) {
        this.fileBean = fileBean;
    }

    /**
     * @return the width
     */
    public Double getWidth() {
        return width;
    }

    /**
     * @param width the width to set
     */
    public void setWidth(Double width) {
        this.width = width;
    }

    /**
     * @return the height
     */
    public Double getHeight() {
        return height;
    }

    /**
     * @param height the height to set
     */
    public void setHeight(Double height) {
        this.height = height;
    }

    /**
     * @return the quantity
     */
    public Integer getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    /**
     * @return the unitPrice
     */
    public Double getUnitPrice() {
        return unitPrice;
    }

    /**
     * @param unitPrice the unitPrice to set
     */
    public void setUnitPrice(Double unitPrice) {
        this.unitPrice = unitPrice;
    }

    /**
     * @return the pt1
     */
    public Long getPt1() {
        return pt1;
    }

    /**
     * @param pt1 the pt1 to set
     */
    public void setPt1(Long pt1) {
        this.pt1 = pt1;
    }

    /**
     * @return the pt2
     */
    public Long getPt2() {
        return pt2;
    }

    /**
     * @param pt2 the pt2 to set
     */
    public void setPt2(Long pt2) {
        this.pt2 = pt2;
    }

    /**
     * @return the pt3
     */
    public Long getPt3() {
        return pt3;
    }

    /**
     * @param pt3 the pt3 to set
     */
    public void setPt3(Long pt3) {
        this.pt3 = pt3;
    }

}
