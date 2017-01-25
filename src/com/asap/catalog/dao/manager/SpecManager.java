/*
 * SpecManager.java
 *
 * Created on 23. november 2007, 19:44
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.asap.catalog.dao.manager;

import com.asap.catalog.dao.Specification;
import com.asap.catalog.dao.User;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import util.HibernateUtil;

import java.math.BigInteger;
import java.util.List;
import java.util.ArrayList;

/**
 * @author JRO
 */
public class SpecManager {

    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    /**
     * Creates a new instance of SpecManager
     */
    public SpecManager() {
    }

    /*
        select * from specification s where s.id in (SELECT s.id FROM specification s where s.user_id=2)
        or s.id in (select s.id from specification_share s1 inner join specification s on (s.id=s1.spec_id) where s1.status = '1' and s1.user_id =2)
     */
    
    public List getUserSpecs() {
        List speclist = HibernateUtil.getSessionFactory().getCurrentSession().createCriteria(Specification.class).add(Restrictions.eq("user", user)).addOrder(Order.desc("id")).list();
        List<Object[]> speclist_Shared = HibernateUtil.getSessionFactory().getCurrentSession().createQuery("select s, s1.accessLevel from Specification_Share s1 join s1.spec s where s1.status = '1' and s1.user = " + user).list();
        List specsinorders = HibernateUtil.getSessionFactory().getCurrentSession().createSQLQuery("select distinct specification_id from azitechorder").list();
        int specid, i, j;
        List finalList = new ArrayList();
        for (i = 0; i < specsinorders.size(); i++) {
            specid = ((BigInteger) specsinorders.get(i)).intValue();
            for (j = 0; j < speclist.size(); j++) {
                if (((Specification) speclist.get(j)).getId().intValue() == specid) {
                    ((Specification) speclist.get(j)).setIsorderplaced("Y");
                    break;
                }
            }
        }
        for (j = 0; j < speclist_Shared.size(); j++) {
            ((Specification) speclist_Shared.get(j)[0]).setSpecAccess((Double) speclist_Shared.get(j)[1]);
            finalList.add(speclist_Shared.get(j)[0]);
        }
        speclist.addAll(finalList);
        return speclist;
    }

/*    public List getUserSpecs() {
//        List speclist = HibernateUtil.getSessionFactory().getCurrentSession().createCriteria(Specification.class).add(Restrictions.eq("user", user)).addOrder(Order.desc("id")).list();
        String lsQuery = "select * from\n" +
                "(SELECT s0,'9',s0.createdOn as sdate FROM specification s0 where s0.user_id="+user.getId()+"\n" +
                "UNION\n" +
                "select s, ssh.accessLevel, ssh.shareDate as sdate from specification_share ssh inner join specification s on (s.id=ssh.spec_id)\n" +
                "where ssh.status='1' and ssh.user_id="+user.getId()+") t order by t.sdate desc;";
        List<Object[]> speclist_Shared = HibernateUtil.getSessionFactory().getCurrentSession().createSQLQuery(lsQuery).list();
        List specsinorders = HibernateUtil.getSessionFactory().getCurrentSession().createSQLQuery("select distinct specification_id from azitechorder").list();
//        int specid, i, j;
//        List finalList = new ArrayList();
//        for (i = 0; i < specsinorders.size(); i++) {
//            specid = ((BigInteger) specsinorders.get(i)).intValue();
//            for (j = 0; j < speclist.size(); j++) {
//                if (((Specification) speclist.get(j)).getId().intValue() == specid) {
//                    ((Specification) speclist.get(j)).setIsorderplaced("Y");
//                    break;
//                }
//            }
//        }
//        for (j = 0; j < speclist_Shared.size(); j++) {
//            ((Specification) speclist_Shared.get(j)[0]).setSpecAccess((Double) speclist_Shared.get(j)[1]);
//            finalList.add(speclist_Shared.get(j)[0]);
//        }
//        speclist.addAll(finalList);
        return new ArrayList();
    }*/
    
    public List getAllSpecs() {
        return HibernateUtil.getSessionFactory().getCurrentSession().createCriteria(Specification.class).addOrder(Order.asc("user")).addOrder(Order.desc("id")).list();
    }
}
