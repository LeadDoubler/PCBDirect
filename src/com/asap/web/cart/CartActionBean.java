/*
 * SpecificationActionBean.java
 *
 * Created on 21. oktober 2007, 18:34
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.asap.web.cart;

import com.asap.catalog.dao.Qoute;
import com.asap.catalog.dao.Specification;
import com.asap.web.CatalogActionBean;
import com.asap.web.specification.SpecificationActionBean;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.DontValidate;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;

import java.util.List;

/**
 *
 * @author JRO
 */
public class CartActionBean extends CatalogActionBean{
    
    private Qoute qoute;
    
    /** Creates a new instance of SpecificationActionBean */
    public CartActionBean() {
    }
    
    @DefaultHandler
    @DontValidate
    public Resolution edit(){
       qoute.setQuantity(qoute.getSpecification().getResquantity());
       return new ForwardResolution("edit.jsp");
    }
    
    public Resolution save(){
        //persist(getQoute());
        return new ForwardResolution("edit.jsp");
    }
    
    public Resolution update(){
        
        qoute.getSpecification().setTransport(qoute.getTransport());
        
        qoute.getSpecification().setOwnpanelquantity(qoute.getQuantity());
        qoute.getSpecification().setAzquantity(qoute.getQuantity());
        qoute.getSpecification().setSgquantity(qoute.getQuantity());
        qoute.getSpecification().processxls(getContext().getServletContext().getRealPath(SpecificationActionBean.filename));
        
        return new ForwardResolution("result.jsp");
    }
    
    public Resolution addToCart(){
        return new ForwardResolution("cart.jsp");
    }
    
    public List getAllSpecs(){
        return getSession().createCriteria(Specification.class).list();
    }

    public Qoute getQoute() {
        return qoute;
    }

    public void setQoute(Qoute qoute) {
        this.qoute = qoute;
    }
    
}