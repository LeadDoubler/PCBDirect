package com.asap.web.share;

import com.asap.catalog.dao.*;
import com.asap.security.Role;
import com.asap.security.Secure;
import com.asap.web.CatalogActionBean;
import net.sourceforge.stripes.action.*;
import org.hibernate.Query;
import org.hibernate.criterion.Expression;
import util.HibernateUtil;

import java.io.StringReader;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import org.mortena.mail.Email;

/**
 * Created by IntelliJ IDEA.
 * User: Gaurav
 * Time: 10:03:06 PM
 * To change this template use File | Settings | File Templates.
 */
public class SharingActionBean extends CatalogActionBean {
    public static final String filename = "/scheme.xls";

    private User user;

    private List specList;
    private List orderList;

    private List<Specification_Share> share_quote;
    private List<AzitechOrder_Share> share_order;

    private List permissionQuoteList;

    private List<Specification> quoteChk;
    private List<AzitechOrder> orderChk;

    private String invUser;
    private String invDesc;
    private String invAccess;
    private String chkEmailNotify;
    private String chkCopyToMyself;

    private Specification_Share specShare;
    private AzitechOrder_Share orderShare;

    @DefaultHandler
    @DontValidate
    @Secure(role = Role.USER)
    public Resolution dashboard() {
        String action = getContext().getRequest().getParameter("act");
        if (getContext().getRequest().getSession().getAttribute("user") != null) {
            User user = (User) getContext().getRequest().getSession().getAttribute("user");
            if (action != null && action.equals("q")) {
                List l1 = HibernateUtil.getSessionFactory().getCurrentSession().createQuery("select distinct(s),(select count(*) from s1 where s1.spec = s and s1.status='1') from Specification_Share s1 right join s1.spec s where s.user = " + user + " order by s desc").list();
                specList = new ArrayList();
                Specification spec;
                Object[] loObj;
                for (int i = 0; i < l1.size(); i++) {
                    loObj = (Object[]) l1.get(i);
                    spec = (Specification) loObj[0];
                    spec.setSpecAccess(0);
                    if (spec.getLastUpdateBy() == null)
                        spec.setLastAction(formatDate(spec.getCreatedOn()));
                    else spec.setLastAction(spec.getLastUpdateBy() + "," + spec.getLastUpdateOn());
                    spec.setShareToCount("Me with " + loObj[1].toString() + ((((Long) loObj[1]) > 1) ? " users" : " user"));
                    specList.add(spec);
                }
                return new ForwardResolution("shareQuoteDBoard.jsp");
            } else {
                List l1 = HibernateUtil.getSessionFactory().getCurrentSession().createQuery("select distinct(o),(select count(*) from o1 where o1.order = o and o1.status='1') from AzitechOrder_Share o1 right join o1.order o where o.specification.user = " + user + " order by o desc").list();
                orderList = new ArrayList();
                AzitechOrder order;
                Object[] loObj;
                for (int i = 0; i < l1.size(); i++) {
                    loObj = (Object[]) l1.get(i);
                    order = (AzitechOrder) loObj[0];
                    order.setOrderAccess(0);
                    order.setLastAction(formatDate(order.getDate()));
                    order.setShareToCount("Me with " + loObj[1].toString() + ((((Long) loObj[1]) > 1) ? " users" : " user"));
                    orderList.add(order);
                }
                return new ForwardResolution("shareOrderDBoard.jsp");
            }
        }
        return new ForwardResolution("/startup/Startup.action?home");
    }

    @DontValidate
    @Secure(role = Role.USER)
    public Resolution quoteFilterDashboard() {
        String filter = getContext().getRequest().getParameter("fltr");
        Specification spec;
        User user = (User) getContext().getRequest().getSession().getAttribute("user");
        specList = new ArrayList();
        Object[] loObj;
        if (filter != null && filter.equals("owned")) {
            List l1 = HibernateUtil.getSessionFactory().getCurrentSession().createQuery("select distinct(s),(select count(*) from s1 where s1.spec = s and s1.status='1') from Specification_Share s1 right join s1.spec s where s.user = " + user + " order by s desc").list();
            for (int i = 0; i < l1.size(); i++) {
                loObj = (Object[]) l1.get(i);
                spec = (Specification) loObj[0];
                spec.setSpecAccess(0);
                if (spec.getCreatedOn() == null)
                    spec.setLastAction("-");
                else spec.setLastAction(spec.getLastUpdateBy() + "," + spec.getLastUpdateOn());
                spec.setShareToCount("Me with " + loObj[1].toString() + ((((Long) loObj[1]) > 1) ? " users" : " user"));
                specList.add(spec);
            }
        } else if (filter != null && filter.equals("shared")) {
            List l1 = HibernateUtil.getSessionFactory().getCurrentSession().createQuery("select s,s1.accessLevel,(select count(*) from s1 where s1.spec = s and s1.status='1') from Specification_Share s1 join s1.spec s where s1.status='1' and s1.user = " + user).list();
            for (int i = 0; i < l1.size(); i++) {
                loObj = (Object[]) l1.get(i);
                spec = (Specification) loObj[0];
                spec.setSpecAccess((Double) loObj[1]);
                if (spec.getCreatedOn() == null)
                    spec.setLastAction("-");
                else spec.setLastAction(spec.getLastUpdateBy() + "," + spec.getLastUpdateOn());
                spec.setShareToCount((spec.getUser().getFullname()) + ((((Double) loObj[1]) == 2) ? "" : (" with " + loObj[2].toString() + ((((Long) loObj[2]) > 1) ? " users" : " user"))));
                specList.add(spec);
            }
        }
        return new ForwardResolution("shareQuoteDBoard.jsp");
    }

    @DontValidate
    @Secure(role = Role.USER)
    public Resolution orderFilterDashboard() {
        String filter = getContext().getRequest().getParameter("fltr");
        AzitechOrder order;
        User user = (User) getContext().getRequest().getSession().getAttribute("user");
        orderList = new ArrayList();
        Object[] loObj;
        if (filter != null && filter.equals("owned")) {
            List l1 = HibernateUtil.getSessionFactory().getCurrentSession().createQuery("select distinct(o),(select count(*) from o1 where o1.order = o and o1.status='1') from AzitechOrder_Share o1 right join o1.order o where o.specification.user = " + user + " order by o desc").list();
            for (int i = 0; i < l1.size(); i++) {
                loObj = (Object[]) l1.get(i);
                order = (AzitechOrder) loObj[0];
                order.setOrderAccess(0);
                order.setLastAction(formatDate(order.getDate()));
                order.setShareToCount("Me with " + loObj[1].toString() + ((((Long) loObj[1]) > 1) ? " users" : " user"));
                orderList.add(order);
            }
        } else if (filter != null && filter.equals("shared")) {
            List l1 = HibernateUtil.getSessionFactory().getCurrentSession().createQuery("select distinct(o),o1.accessLevel,(select count(*) from o1 where o1.order = o and o1.status='1') from AzitechOrder_Share o1 join o1.order o where o1.status='1' and o1.user = " + user).list();
            for (int i = 0; i < l1.size(); i++) {
                loObj = (Object[]) l1.get(i);
                order = (AzitechOrder) loObj[0];
                order.setOrderAccess((Double) loObj[1]);
                order.setLastAction(formatDate(order.getDate()));
                order.setShareToCount((order.getSpecification().getUser().getFullname()) + ((((Double) loObj[1]) == 2) ? "" : (" with " + loObj[2].toString() + ((((Long) loObj[2]) > 1) ? " users" : " user"))));
                orderList.add(order);
            }
        }
        return new ForwardResolution("shareOrderDBoard.jsp");
    }

    public Resolution populateQuoteShareBox() {
        HashMap<User, Specification_Share> map = new HashMap<User, Specification_Share>();
        if (quoteChk != null) {
            Query query = HibernateUtil.getSessionFactory().getCurrentSession().createQuery("from Specification_Share share where share.spec in (:specList) and share.status = '1' order by share.id");
            query.setParameterList("specList", quoteChk);
            share_quote = query.list();

            query = HibernateUtil.getSessionFactory().getCurrentSession().createQuery("select spec.user from Specification spec where spec in (:specList)");
            query.setParameterList("specList", quoteChk);
            List owners = query.list();
            for (int i = 0; i < owners.size(); i++) {
                Specification_Share share1 = new Specification_Share();
                share1.setUser((User) owners.get(i));
                share1.setAccessLevel(9);
                share1.setSpec(quoteChk.get(i));
                share_quote.add(share1);
            }

            for (int i = 0; i < share_quote.size(); i++) {
                Specification_Share share = share_quote.get(i);
                if (map.get(share.getUser()) == null) {
                    share.inCreaseIteration();
                    share_quote.set(i, share);
                    map.put(share.getUser(), share);
                } else {
                    double prevaccess = map.get(share.getUser()).getAccessLevel();
                    if (prevaccess != 9 && prevaccess != share.getAccessLevel()) {
                        share = map.get(share.getUser());
                        share.setAccessLevel(8);
                    } else if (prevaccess == 9 && prevaccess != share.getAccessLevel()) {
                        share = map.get(share.getUser());
                        share.setAccessLevel(8);
                    } else if (prevaccess == 9 && prevaccess == share.getAccessLevel()) {
                        share = map.get(share.getUser());
                    } else {
                        share.setIteration(map.get(share.getUser()).getIteration());
                    }
                    share.inCreaseIteration();
                    share_quote.set(i, share);
                    map.put(share.getUser(), share);
                }
            }
        }

        share_quote = new ArrayList<Specification_Share>();
        share_quote.addAll(map.values());
        return new ForwardResolution("shareBoxQuote.jsp");
    }

    public Resolution populateOrderShareBox() {
        HashMap<User, AzitechOrder_Share> map = new HashMap<User, AzitechOrder_Share>();
        if (orderChk != null) {
            Query query = HibernateUtil.getSessionFactory().getCurrentSession().createQuery("from AzitechOrder_Share share where share.order in (:orderList) and share.status = '1' order by share.id");
            query.setParameterList("orderList", orderChk);
            share_order = query.list();

            query = HibernateUtil.getSessionFactory().getCurrentSession().createQuery("select order.specification.user from AzitechOrder order where order in (:orderList)");
            query.setParameterList("orderList", orderChk);
            List owners = query.list();

            for (int i = 0; i < owners.size(); i++) {
                AzitechOrder_Share share1 = new AzitechOrder_Share();
                share1.setUser((User) owners.get(i));
                share1.setAccessLevel(9);
                share1.setOrder(orderChk.get(i));
                share_order.add(share1);
            }

            for (int i = 0; i < share_order.size(); i++) {
                AzitechOrder_Share share = share_order.get(i);
                if (map.get(share.getUser()) == null) {
                    share.inCreaseIteration();
                    share_order.set(i, share);
                    map.put(share.getUser(), share);
                } else {
                    double prevaccess = map.get(share.getUser()).getAccessLevel();
                    if (prevaccess != 9 && prevaccess != share.getAccessLevel()) {
                        share = map.get(share.getUser());
                        share.setAccessLevel(8);
                    } else if (prevaccess == 9 && prevaccess != share.getAccessLevel()) {
                        share = map.get(share.getUser());
                        share.setAccessLevel(8);
                    } else if (prevaccess == 9 && prevaccess == share.getAccessLevel()) {
                        share = map.get(share.getUser());
                    } else {
                        share.setIteration(map.get(share.getUser()).getIteration());
                    }
                    share.inCreaseIteration();
                    share_order.set(i, share);
                    map.put(share.getUser(), share);
                }
            }
        }

        share_order = new ArrayList<AzitechOrder_Share>();
        share_order.addAll(map.values());
        return new ForwardResolution("shareBoxOrder.jsp");
    }

    public Resolution doShareQuote() {
        List<User> list = HibernateUtil.getSessionFactory().getCurrentSession().createCriteria(User.class).add(Expression.eq("email", invUser.split(",")[0])).list();
        Share_Invitation loinv;
        if (list.isEmpty()) {
            long token = System.currentTimeMillis();
            for (int i = 0; i < quoteChk.size(); i++) {
                loinv = new Share_Invitation();
                loinv.setInvEmail(invUser);
                loinv.setUserFrom((User) getContext().getRequest().getSession().getAttribute("user"));
                loinv.setInvitationCode(token);
                loinv.setType("0"); //Indicates Specs
                loinv.setDocId(quoteChk.get(i).getId());
                loinv.setActive("1");
                loinv.setInvDate(new Date());
                loinv.setAccessLevel(Double.parseDouble(invAccess));
                loinv.setInvComments(invDesc);
                getSession().save(loinv);
            }
            getContext().setCommit(new Boolean(true));
            shareToUnmappedUser(invUser, invDesc, token);
        } else {
            Specification_Share loShare;
            for (int i = 0; i < quoteChk.size(); i++) {
                loShare = new Specification_Share();
                loShare.setUser(list.get(0));
                loShare.setAccessLevel(Double.parseDouble(invAccess));
                loShare.setStatus("1");
                loShare.setShareComments(invDesc);
                loShare.setShareDate(new Date());
                loShare.setSpec(quoteChk.get(i));
                getSession().save(loShare);
            }
            getContext().setCommit(new Boolean(true));
            if (chkEmailNotify != null && chkEmailNotify.equals("Y")) {
                quoteShareNotifyEmail(list.get(0), quoteChk); //Existing User
            }
            if (chkCopyToMyself != null && chkCopyToMyself.equals("Y")) {
                quoteShareNotifyEmail((User) getContext().getRequest().getSession().getAttribute("user"), quoteChk); //Existing User
            }
        }
        return new RedirectResolution("/share/Sharing.action?populateQuoteShareBox").addParameter("quoteChk", quoteChk);
    }

    public Resolution editShareAccess() {
        try {
            String lsAccess = getContext().getRequest().getParameter("access").toString();
            String lsmode = getContext().getRequest().getParameter("mode").toString();
            if (lsmode != null && lsmode.equals("q")) {
                if (quoteChk.size() == 1) {
                    specShare.setAccessLevel(Double.parseDouble(lsAccess));
                    persist(specShare);
                } else {
                    Query query = HibernateUtil.getSessionFactory().getCurrentSession().createQuery("from Specification_Share share where share.spec in (:specList) and user = (select user from share where share = (:selectedSpec))");
                    query.setParameterList("specList", quoteChk);
                    query.setParameter("selectedSpec", specShare);
                    share_quote = query.list();

                    for (int i = 0; i < share_quote.size(); i++) {
                        specShare = share_quote.get(i);
                        specShare.setAccessLevel(Double.parseDouble(lsAccess));
                        getSession().saveOrUpdate(specShare);
                    }
                    getContext().setCommit(new Boolean(true));
                }
            } else if (lsmode != null && lsmode.equals("o")) {
                if (orderChk.size() == 1) {
                    orderShare.setAccessLevel(Double.parseDouble(lsAccess));
                    persist(orderShare);
                } else {
                    Query query = HibernateUtil.getSessionFactory().getCurrentSession().createQuery("from AzitechOrder_Share share where share.order in (:orderList) and user = (select user from share where share = (:selectedOrder))");
                    query.setParameterList("orderList", orderChk);
                    query.setParameter("selectedOrder", orderShare);
                    share_order = query.list();

                    for (int i = 0; i < share_order.size(); i++) {
                        orderShare = share_order.get(i);
                        orderShare.setAccessLevel(Double.parseDouble(lsAccess));
                        getSession().saveOrUpdate(orderShare);
                    }
                    getContext().setCommit(new Boolean(true));
                }
            } else return new StreamingResolution("text", new StringReader("0"));
            return new StreamingResolution("text", new StringReader("1"));
        }
        catch (Exception e) {
            return new StreamingResolution("text", new StringReader("0"));
        }
    }

    public Resolution deleteShareAccess() {
        try {
            String lsmode = getContext().getRequest().getParameter("mode").toString();
            if (lsmode != null && lsmode.equals("q")) {
                if (quoteChk.size() == 1) {
                    specShare.setStatus("0");
                    persist(specShare);
                } else {
                    Query query = HibernateUtil.getSessionFactory().getCurrentSession().createQuery("from Specification_Share share where share.spec in (:specList) and user = (select user from share where share = (:selectedSpec))");
                    query.setParameterList("specList", quoteChk);
                    query.setParameter("selectedSpec", specShare);
                    share_quote = query.list();

                    for (int i = 0; i < share_quote.size(); i++) {
                        specShare = share_quote.get(i);
                        specShare.setStatus("0");
                        getSession().saveOrUpdate(specShare);
                    }
                    getContext().setCommit(new Boolean(true));
                }
            } else if (lsmode != null && lsmode.equals("o")) {
                if (orderChk.size() == 1) {
                    orderShare.setStatus("0");
                    persist(orderShare);
                } else {
                    Query query = HibernateUtil.getSessionFactory().getCurrentSession().createQuery("from AzitechOrder_Share share where share.order in (:orderList) and user = (select user from share where share = (:selectedOrder))");
                    query.setParameterList("orderList", orderChk);
                    query.setParameter("selectedOrder", orderShare);
                    share_order = query.list();
                    for (int i = 0; i < share_order.size(); i++) {
                        orderShare = share_order.get(i);
                        orderShare.setStatus("0");
                        getSession().saveOrUpdate(orderShare);
                    }
                    getContext().setCommit(new Boolean(true));
                }
            } else return new StreamingResolution("text", new StringReader("0"));
            return new StreamingResolution("text", new StringReader("1"));
        }
        catch (Exception e) {
            return new StreamingResolution("text", new StringReader("0"));
        }
    }

    /**
     * @return 1: Found, 2:Not Found, 3: already Shared, 0:Incorrect
     */
    public Resolution validateUser() {
        try {
            List<User> list = HibernateUtil.getSessionFactory().getCurrentSession().createCriteria(User.class).add(Expression.eq("email", invUser.split(",")[0])).list();
            if (list.isEmpty())
                return new StreamingResolution("text", new StringReader("2"));
            else {
                String mode = getContext().getRequest().getParameter("mode");
                if (mode != null && mode.equals("q")) {

                    Query query = HibernateUtil.getSessionFactory().getCurrentSession().createQuery("select spec.user from Specification spec where spec in (:specList)");
                    query.setParameterList("specList", quoteChk);
                    List owners = query.list();

                    if (share_quote != null && !share_quote.isEmpty()) {
                        boolean lbFound = false;
                        for (int i = 0; i < share_quote.size(); i++) {
                            if (invUser.equals(share_quote.get(i).getUser().getEmail())) {
                                lbFound = true;
                                break;
                            }
                        }
                        for (int i = 0; i < owners.size(); i++) {
                            if (invUser.equals(((User) owners.get(i)).getEmail())) {
                                lbFound = true;
                                break;
                            }
                        }
                        if (lbFound) return new StreamingResolution("text", new StringReader("3"));
                        else return new StreamingResolution("text", new StringReader("1"));
                    } else return new StreamingResolution("text", new StringReader("1"));
                } else {
                    Query query = HibernateUtil.getSessionFactory().getCurrentSession().createQuery("select order.specification.user from AzitechOrder order where order in (:orderList)");
                    query.setParameterList("orderList", orderChk);
                    List owners = query.list();
                    
                    if (share_order != null && !share_order.isEmpty()) {
                        boolean lbFound = false;
                        for (int i = 0; i < share_order.size(); i++) {
                            if (invUser.equals(share_order.get(i).getUser().getEmail())) {
                                lbFound = true;
                                break;
                            }
                        }
                        for (int i = 0; i < owners.size(); i++) {
                            if (invUser.equals(((User) owners.get(i)).getEmail())) {
                                lbFound = true;
                                break;
                            }
                        }
                        if (lbFound) return new StreamingResolution("text", new StringReader("3"));
                        else return new StreamingResolution("text", new StringReader("1"));
                    } else return new StreamingResolution("text", new StringReader("1"));
                }
            }
        }
        catch (Exception e) {
            return new StreamingResolution("text", new StringReader("0"));
        }
    }

    public Resolution doShareOrder() {
        List<User> list = HibernateUtil.getSessionFactory().getCurrentSession().createCriteria(User.class).add(Expression.eq("email", invUser)).list();
        Share_Invitation loinv;
        if (list.isEmpty()) {
            long token = System.currentTimeMillis();
            for (int i = 0; i < orderChk.size(); i++) {
                loinv = new Share_Invitation();
                loinv.setInvEmail(invUser);
                loinv.setUserFrom((User) getContext().getRequest().getSession().getAttribute("user"));
                loinv.setInvitationCode(token);
                loinv.setType("1"); //Indicates Orders
                loinv.setDocId(orderChk.get(i).getId());
                loinv.setActive("1");
                loinv.setInvDate(new Date());
                loinv.setAccessLevel(Double.parseDouble(invAccess));
                loinv.setInvComments(invDesc);
                getSession().save(loinv);
            }
            getContext().setCommit(new Boolean(true));
            shareToUnmappedUser(invUser, invDesc, token);
        } else {
            AzitechOrder_Share loShare;
            for (int i = 0; i < orderChk.size(); i++) {
                loShare = new AzitechOrder_Share();
                loShare.setUser(list.get(0));
                loShare.setAccessLevel(Double.parseDouble(invAccess));
                loShare.setStatus("1");
                loShare.setShareComments(invDesc);
                loShare.setShareDate(new Date());
                loShare.setOrder(orderChk.get(i));
                getSession().save(loShare);
            }
            getContext().setCommit(new Boolean(true));
            System.out.println("Send order share email");
            if (chkEmailNotify != null && chkEmailNotify.equals("Y")) {
                System.out.println("chkEmailNotify != null && Y - sending mail to new user");
                orderShareNotifyEmail(list.get(0), orderChk); //Existing User
            }
            if (chkCopyToMyself != null && chkCopyToMyself.equals("Y")) {
                System.out.println("chkEmailNotify != null && Y - sending mail to self");
                orderShareNotifyEmail((User) getContext().getRequest().getSession().getAttribute("user"), orderChk); //Existing User
            }
        }
        return new RedirectResolution("/share/Sharing.action?populateOrderShareBox").addParameter("orderChk", orderChk);
    }

    private void shareToUnmappedUser(String unMappedEmail, String fsMsgBody, long fsToken) {
        Email email = new Email();
        email.setTemplateName("ShareToUnmappedEmail");
        User fromUser = (User) getContext().getRequest().getSession().getAttribute("user");

        User unMappedUser = new User();
        unMappedUser.setEmail(unMappedEmail);
        unMappedUser.setToken(String.valueOf(fsToken));

        email.setProperty("user", unMappedUser);
        email.setProperty("fromuser", fromUser);
        email.setProperty("body", fsMsgBody);

        email.setTo(unMappedEmail);
        email.setFrom("sales@azitech.dk"); 
        email.setSubject("PCB-direct share notification");
        //System.out.print("TokenGenerated:" + unMappedUser.getToken());
        email.send();
    }

    private void quoteShareNotifyEmail(User invUser, List specs) {
        ShareQuoteRequestEmail emailQuote = new ShareQuoteRequestEmail();
        String to = invUser.getEmail();
        User fromUser = (User) getContext().getRequest().getSession().getAttribute("user");

        emailQuote.setProperty("user", invUser);
        emailQuote.setProperty("fromuser", fromUser);
        emailQuote.setProperty("specs", specs);

        emailQuote.setTo(to);
        emailQuote.setFrom("sales@azitech.dk");
        emailQuote.setSubject("PCB-direct share notification");
        emailQuote.send();
    }

    private void orderShareNotifyEmail(User toUser, List orders) {
        Email emailQuote = new Email();
        emailQuote.setTemplateName("ShareOrdrRequestEmail");
        String to = toUser.getEmail();
        User fromUser = (User) getContext().getRequest().getSession().getAttribute("user");

        emailQuote.setProperty("user", toUser);
        emailQuote.setProperty("fromuser", fromUser);
        emailQuote.setProperty("orders", orders);

        emailQuote.setTo(to);
        emailQuote.setFrom("sales@azitech.dk");
        emailQuote.setSubject("PCB-direct share notification");
        System.out.println("Sending email"+emailQuote.getTemplatePath());
        emailQuote.send();
    }

    private static String formatDate(Date foDate) {
        if (foDate != null) {
            DateFormat loDateFormat = new SimpleDateFormat("dd MMM");
            return loDateFormat.format(foDate);
        } else {
            return "";
        }
    }

    public Resolution loadRegistration() {
        String token = getContext().getRequest().getParameter("tkn");
        if (token != null) {
            List<Object[]> list = HibernateUtil.getSessionFactory().getCurrentSession().createQuery("SELECT distinct(s.invEmail),s.isActive FROM Share_Invitation s where s.invitationCode=" + token).list();
            if (list == null || list.isEmpty() || list.size() > 1) {

            } else {
                try {
                    Object[] lo = list.get(0);
                    if (lo != null && lo[1] != null && lo[1] != "0") {
                        user = new User();
                        user.setEmail((String) lo[0]);
                        user.setToken(token);
                    } else {
                        //Expired
                        return new ForwardResolution("/startup/Startup.action?home");
                    }
                }
                catch (Exception e) {
                    return new ForwardResolution("/startup/Startup.action?home");
                }
            }
        } else {
            return new ForwardResolution("/startup/Startup.action?home");
        }

        return new ForwardResolution("/user/invRegister.jsp").addParameter("user.email", user.getEmail()).addParameter("user.token", user.getToken());
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List getSpecList() {
        return specList;
    }

    public void setSpecList(List<Specification> specList) {
        this.specList = specList;
    }

    public List getOrderList() {
        return orderList;
    }

    public void setOrderList(List<AzitechOrder> orderList) {
        this.orderList = orderList;
    }

    public List<Specification> getQuoteChk() {
        return quoteChk;
    }

    public void setQuoteChk(List<Specification> quoteChk) {
        this.quoteChk = quoteChk;
    }

    public List<Specification_Share> getShare_quote() {
        return share_quote;
    }

    public void setShare_quote(List<Specification_Share> share_quote) {
        this.share_quote = share_quote;
    }

    public List<AzitechOrder_Share> getShare_order() {
        return share_order;
    }

    public void setShare_order(List<AzitechOrder_Share> share_order) {
        this.share_order = share_order;
    }

    public List<AzitechOrder> getOrderChk() {
        return orderChk;
    }

    public void setOrderChk(List<AzitechOrder> orderChk) {
        this.orderChk = orderChk;
    }

    public String getInvUser() {
        return invUser;
    }

    public void setInvUser(String invUser) {
        this.invUser = invUser;
    }

    public String getInvDesc() {
        return invDesc;
    }

    public void setInvDesc(String invDesc) {
        this.invDesc = invDesc;
    }

    public String getInvAccess() {
        return invAccess;
    }

    public void setInvAccess(String invAccess) {
        this.invAccess = invAccess;
    }

    public String getChkEmailNotify() {
        return chkEmailNotify;
    }

    public void setChkEmailNotify(String chkEmailNotify) {
        this.chkEmailNotify = chkEmailNotify;
    }

    public String getChkCopyToMyself() {
        return chkCopyToMyself;
    }

    public void setChkCopyToMyself(String chkCopyToMyself) {
        this.chkCopyToMyself = chkCopyToMyself;
    }

    public Specification_Share getSpecShare() {
        return specShare;
    }

    public void setSpecShare(Specification_Share specShare) {
        this.specShare = specShare;
    }

    public AzitechOrder_Share getOrderShare() {
        return orderShare;
    }

    public void setOrderShare(AzitechOrder_Share orderShare) {
        this.orderShare = orderShare;
    }

    public List getPermissionQuoteList() {
        return permissionQuoteList;
    }

    public void setPermissionQuoteList(List permissionQuoteList) {
        this.permissionQuoteList = permissionQuoteList;
    }
}
