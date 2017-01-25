package com.asap.catalog.dao.manager;

import com.asap.catalog.dao.User;
import util.HibernateUtil;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class UserHelper {

    public List<User> getUnapprovedUsers() {
        List<User> list = HibernateUtil.getSessionFactory().getCurrentSession().createCriteria(User.class).list();
        List result = new ArrayList<User>();
        Iterator<User> it = list.iterator();
        while(it.hasNext()){
            User user = it.next();
            if( (user.getApproved() == null || user.getApproved().intValue() == 0) && (user.getDeactivated()==null || user.getDeactivated().equals("no"))){
                result.add(user);
            }
        }
        return result;
    }
}