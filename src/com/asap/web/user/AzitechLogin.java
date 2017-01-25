/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.asap.web.user;

import com.asap.catalog.dao.ProductTemplate;
import java.util.ArrayList;
import java.util.List;
import net.sourceforge.stripes.action.UrlBinding;
import org.hibernate.Criteria;
import util.HibernateUtil;

/**
 *
 * @author Jonas
 */
@UrlBinding("/Login.action")
public class AzitechLogin extends LoginActionBean {

    private ProductTemplate productTemplate;

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

}
