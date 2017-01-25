/*
 * Register.java
 *
 * Created on 5. marts 2007, 09:41
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.asap.web.user;

import com.asap.catalog.dao.*;
import com.asap.configuration.ConfigurationManager;
import com.asap.security.Role;
import com.asap.security.Secure;
import com.asap.util.PasswordHash;
import com.asap.web.CatalogActionBean;
import net.sourceforge.stripes.action.*;
import net.sourceforge.stripes.validation.*;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.Restrictions;
import org.apache.log4j.Logger;

import java.util.List;
import java.util.Date;

import util.HibernateUtil;

/**
 * @author mortenandersen
 */
@UrlBinding("/user/AzitechRegister.action")
public class AzitechRegisterActionBean extends CatalogActionBean {
    @ValidateNestedProperties({
            @Validate(field = "username", required = true),
            @Validate(field = "firstName", required = true),
            @Validate(field = "lastName", required = true),
            @Validate(field = "firstName", required = true),
            @Validate(field = "lastName", required = true),
            @Validate(field = "cvr", required = true),
            @Validate(field = "country", required = true),
            @Validate(field = "street", required = true),
            @Validate(field = "postalCode", required = true),
            @Validate(field = "phone", required = true),
            @Validate(field = "city", required = true),
            @Validate(field = "currency", required = true),
            @Validate(field = "email", required = true, converter = EmailTypeConverter.class),
            @Validate(field = "sentinvoiceto", converter = EmailTypeConverter.class)
    })
    private User user;

    private String password1;
    private String password2;
    private static final Logger logger = Logger.getLogger(AzitechRegisterActionBean.class);

    @ValidationMethod
    public void canUserBeAdded(ValidationErrors errors) {
        int uid1 = -1;
        int uid2 = -2;

        if (user != null) {
            if (user.getId() != null) {
                uid1 = user.getId().intValue();
            }
        }

        if (getContext().getUser() != null) {
            if (getContext().getUser().getId() != null) {
                uid2 = getContext().getUser().getId().intValue();
            }
        }

        if (uid1 != -1 && (uid1 != uid2 || (password1 == null && password2 == null))) {
            password1 = user.getPassword();
            password2 = password1;
        }

        long id = -1;
        if (user.getId() != null) id = user.getId();

        List<User> list = getSession().createCriteria(User.class).add(Expression.eq("email", user.getEmail())).add(Expression.ne("id", id)).list();
        if (!list.isEmpty()) {
            errors.add("user.email", new SimpleError("User with defined email allready exists"));
        }

        list = getSession().createCriteria(User.class).add(Expression.eq("username", user.getUsername())).add(Expression.ne("id", id)).list();
        if (!list.isEmpty()) {
            errors.add("user.username", new SimpleError("User with defined username allready exists"));
        }

        if (password1 == null || password1.length() == 0) {
            errors.add("password1", new SimpleError("Please fill out this field"));
        }
        if (password2 == null || password2.length() == 0) {
            errors.add("password2", new SimpleError("Please fill out this field"));
        } else if (!password1.equals(password2)) {
            errors.add("password2", new SimpleError("The two passwords should match"));
        }
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Resolution save() {
        System.out.println("Adding user: " + user.getUsername());
        logger.debug("Adding user: " + user.getFullname());
        try{
            user.setPassword(PasswordHash.createHash(password1));
        }catch(Exception e){
            e.printStackTrace();
        }
        boolean sendEmail = false;
        if (user.getId() == null) {
            sendEmail = true;
        }
        //persist(getUser());
        if (sendEmail) {
            AzitechUserEmail email = new AzitechUserEmail();
            email.setProperty("user", user);
            String to = ConfigurationManager.getParameter("email");
            email.setTo(to);
            email.setFrom("sales@azitech.dk");
            email.setSubject("Log in request");
            email.send();
        }
        persist(user);
        if (sendEmail)
            return new RedirectResolution("/user/notifyRegistration.jsp");
        else
            return new RedirectResolution("/user/notifyProfileEdit.jsp");
    }

    public Resolution processInvReg() {
        System.out.println("Adding Invited user: " + user.getUsername());
        user.setPassword(password1);
        boolean sendEmail = false;
        if (user.getId() == null) {
            sendEmail = true;
        }
        if (sendEmail) {

            AzitechUserEmail email = new AzitechUserEmail();
            email.setProperty("user", user);
            String to = ConfigurationManager.getParameter("email");
            email.setTo(to);
            email.setFrom("sales@azitech.dk");
            email.setSubject("Log in request");
            email.send();
        }
        persist(user);

        if (user != null && user.getToken() != null) {
            String token = user.getToken();
            List<Share_Invitation> invList = HibernateUtil.getSessionFactory().getCurrentSession().createQuery("from Share_Invitation s where s.invitationCode=" + token).list();
            for (int i = 0; i < invList.size(); i++) {
                Share_Invitation inv = invList.get(i);
                String lsType = inv.getType();
                if (lsType.equals("0")) {
                    Specification_Share shareQ = new Specification_Share();
                    shareQ.setAccessLevel(inv.getAccessLevel());

                    Specification spec = new Specification();
                    spec.setId(inv.getDocId());
                    shareQ.setSpec(spec);

                    shareQ.setShareComments("");
                    shareQ.setShareDate(new Date());
                    shareQ.setUser(user);
                    shareQ.setStatus("1");
                    getSession().save(shareQ);
                } else {
                    AzitechOrder_Share shareO = new AzitechOrder_Share();
                    shareO.setAccessLevel(inv.getAccessLevel());

                    AzitechOrder order = new AzitechOrder();
                    order.setId(inv.getDocId());
                    shareO.setOrder(order);

                    shareO.setShareComments("");
                    shareO.setShareDate(new Date());
                    shareO.setUser(user);
                    shareO.setStatus("1");
                    getSession().save(shareO);
                }
                getSession().delete(invList.get(i));
            }
            getContext().setCommit(new Boolean(true));
        }

        if (sendEmail)
            return new RedirectResolution("/user/notifyRegistration.jsp");
        else
            return new RedirectResolution("/user/notifyProfileEdit.jsp");
    }

    @DefaultHandler
    @DontValidate
    public Resolution edit() {
        if (user != null && getContext().getUser() != null) {
            if (user.getId().intValue() != getContext().getUser().getId().intValue()
                    && user.getRole().getValue() > getContext().getUser().getRole().getValue()) {
                return new RedirectResolution("/user/Login.action");
            }
        }

        return new ForwardResolution("/user/register.jsp");
    }

    @DontValidate
    public Resolution add() {
        if (user != null) {
            user = new User();
        }
        return new ForwardResolution("/user/register.jsp");
    }

    @DontValidate
    @Secure(role = Role.MODERATOR)
    public Resolution approve() {
        user.setApproved(1);
        persist(user);

        AzitechUserEmail email = new AzitechUserEmail();
        email.setProperty("user", user);
        String to = ConfigurationManager.getParameter("email");
        email.setTo(user.getEmail());
        email.setFrom(to);
        email.setSubject("Welcome to PCB-direct");
        email.setTemplateName("Approve");
        email.send();

        return new RedirectResolution("/startup/Startup.action?home");
    }

    @DontValidate
    @Secure(role = Role.MODERATOR)
    public Resolution list() {
        return new ForwardResolution("/user/list.jsp");
    }

    @DontValidate
    @Secure(role = Role.MODERATOR, currentUser = true)
    public Resolution view() {
        return new ForwardResolution("/user/view.jsp");
    }

    @DontValidate
    public Resolution delete() {
        if (user.getRole().getValue() > getContext().getUser().getRole().getValue()) {
            return new RedirectResolution("/user/Login.action");
        }
        for (Object spec : getSession().createCriteria(Specification.class).add(Restrictions.eq("user", user)).list()) {
            for (Object qoute : getSession().createCriteria(Qoute.class).add(Restrictions.eq("specification", spec)).list())
                delete(qoute);
            for (Object order : getSession().createCriteria(AzitechOrder.class).add(Restrictions.eq("specification", spec)).list())
                delete(order);
            delete(spec);
        }
        delete(user);
        return new ForwardResolution("/user/list.jsp");
    }

    @DontValidate
    public Resolution deactivate() {
        if (user.getRole().getValue() > getContext().getUser().getRole().getValue()) {
            return new RedirectResolution("/user/Login.action");
        }
        user.setDeactivated("yes");
        persist(user);

        AzitechUserEmail email = new AzitechUserEmail();
        email.setProperty("user", user);
        String to = ConfigurationManager.getParameter("email");
        email.setTo(user.getEmail());
        email.setFrom(to);
        email.setSubject("Suspended from PCB-direct");
        email.setTemplateName("Suspend");
        email.send();

        return new ForwardResolution("/user/list.jsp");
    }

    @DontValidate
    public Resolution activate() {
        if (user.getRole().getValue() > getContext().getUser().getRole().getValue()) {
            return new RedirectResolution("/user/Login.action");
        }
        user.setDeactivated("no");
        persist(user);
        return new ForwardResolution("/user/list.jsp");
    }

    @DontValidate
    public String getPassword1() {
        return password1;
    }

    @DontValidate
    public void setPassword1(String password1) {
        this.password1 = password1;
    }

    @DontValidate
    public String getPassword2() {
        return password2;
    }

    @DontValidate
    public void setPassword2(String password2) {
        this.password2 = password2;
    }

    @DontValidate
    public Resolution forgotPassword() {
        return new ForwardResolution("/user/forgotpass.jsp");
    }

}
