/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.blob.web.listener;

import com.asap.catalog.dao.AzitechOrder;
import com.asap.catalog.dao.Qoute;
import com.asap.catalog.dao.User;
import com.asap.configuration.ConfigurationManager;
import com.asap.web.azitechorder.AzitechSalesNotice;
import util.HibernateUtil;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
 
/**
 *
 * @author mortenmatras 
 */
public class StripesSessionListener implements HttpSessionListener{

    public void sessionCreated(HttpSessionEvent sessionEvent) {
        System.out.println("StripesSessionListener added");
    }

    public void sessionDestroyed(HttpSessionEvent sessionEvent) {
        System.out.println("StripesSessionListener stopped");
        User user = (User) sessionEvent.getSession().getAttribute("user");
        if (user != null){
            System.out.println("user != null");
            AzitechOrder order = (AzitechOrder) sessionEvent.getSession().getAttribute("order");
            Qoute qoute = (Qoute) sessionEvent.getSession().getAttribute("qoute");
            if (qoute != null && order == null){
                HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
                System.out.println("qoute != null && order == null - sending mail");
                String to = ConfigurationManager.getParameter("email");
                AzitechSalesNotice notice = new AzitechSalesNotice();
                notice.setProperty("user", user);
                notice.setProperty("qoute", qoute);
                notice.setTo(to);
                notice.setSubject("En bruger har benyttet online bestilling uden at bestille");
                notice.setFrom(to);
                notice.send();
                HibernateUtil.getSessionFactory().getCurrentSession().close();
            }
        }
    }
}
