/*
 * SpecManager.java
 *
 * Created on 23. november 2007, 19:44
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.asap.catalog.dao.manager;

import com.asap.catalog.dao.AzitechOrder;
import com.asap.catalog.dao.User;
import com.asap.catalog.dao.Specification;
import org.hibernate.criterion.Restrictions;
import util.HibernateUtil;

import java.util.Collections;
import java.util.List;
import java.util.ArrayList;

/**
 * @author JRO
 */
public class OrderManager
{

    private User user;

    public User getUser()
    {
        return user;
    }

    public void setUser(User user)
    {
        this.user = user;
    }


    /**
     * Creates a new instance of SpecManager
     */
    public OrderManager()
    {
    }

    public List getOrders()
    {
        List list;
        try
        {
            list = HibernateUtil.getSessionFactory().getCurrentSession().createCriteria(AzitechOrder.class).add(Restrictions.eq("username", user.getUsername())).list();
            List<Object[]> l1 = HibernateUtil.getSessionFactory().getCurrentSession().createQuery("select distinct(o),o1.accessLevel from AzitechOrder_Share o1 join o1.order o where o1.status = '1' and o1.user = " + user).list();
            List finalList = new ArrayList();
            for (int j = 0; j < l1.size(); j++) {
                ((AzitechOrder) l1.get(j)[0]).setOrderAccess((Double)l1.get(j)[1]);
                finalList.add(l1.get(j)[0]);
            }
            list.addAll(finalList);
        }
        catch (Exception foe)
        {
            list = HibernateUtil.getSessionFactory().getCurrentSession().createCriteria(AzitechOrder.class).list();
        }
        Collections.reverse(list);
        return list;
    }
}
