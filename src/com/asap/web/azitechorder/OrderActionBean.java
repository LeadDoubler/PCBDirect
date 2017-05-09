/*
 * OrderActionBean.java
 *
 * Created on 15. november 2007, 20:35
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package com.asap.web.azitechorder;

import com.asap.catalog.dao.AzitechOrder;
import com.asap.catalog.dao.Qoute;
import com.asap.catalog.dao.Specification;
import com.asap.catalog.dao.AzitechOrder_Share;
import com.asap.catalog.dao.User;
import com.asap.configuration.ConfigurationManager;
import com.asap.security.Role;
import com.asap.security.Secure;
import com.asap.web.CatalogActionBean;
import net.sourceforge.stripes.action.*;
import net.sourceforge.stripes.validation.SimpleError;
import net.sourceforge.stripes.validation.ValidationErrors;
import org.hibernate.HibernateException;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Expression;
import org.mortena.mail.Email;
import util.HibernateUtil;

import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * @author jro
 */
public class OrderActionBean extends CatalogActionBean {

    private AzitechOrder order;

    private Qoute qoute;
    private Specification specification;
    private FileBean file;
    private FileBean file1;
    private String orderMode = "";
    private String tabSelection = "";

    public String getTabSelection() {
        return tabSelection;
    }

    public void setTabSelection(String tabSelection) {
        this.tabSelection = tabSelection;
    }

    public String getOrderMode() {
        return orderMode;
    }

    public void setOrderMode(String orderMode) {
        this.orderMode = orderMode;
    }

    /**
     * Creates a new instance of OrderActionBean
     */
    public OrderActionBean() {
    }

    @DefaultHandler
    @Secure(role = Role.USER)
    public Resolution view() {
        System.out.println("Order: " + this.getOrder());
        System.out.println("Specification: " + this.getSpecification());

        //System.out.println("User = " + getContext().getUser() + " Speci = " + this.order.getSpecification() + " Spec.user = " + this.order.getSpecification().getUser());
        if (getContext().getUser().getRole().equals(Role.USER) && order != null && !order.getSpecification().getUser().getId().equals(getContext().getUser().getId())) {
            return new ForwardResolution("/startup/Startup.action");
        }
        return new ForwardResolution("view.jsp");
    }

    public Resolution file() {
        return new RedirectResolution("/gerberdata/" + order.getSpecification().getId());
    }

    public Resolution newOrder() {
        order = new AzitechOrder();
        order.setQuoteid(String.valueOf(qoute.getQouteId()));
        order.setUsername(getContext().getUser().getUsername());
        order.setEmail(getContext().getUser().getEmail());
        order.setSpecification(qoute.getSpecification());
        order.setUser(getContext().getUser());

        order.setReference(qoute.getSpecification().getReference());
        order.setPcbreference(qoute.getSpecification().getPcbreference());
        order.setLayers(qoute.getSpecification().getLayers());
        order.setStspspec(qoute.getSpecification().getStspspec());

        order.setFinish(qoute.getSpecification().getFinish());
        order.setMaterial(qoute.getSpecification().getMaterial());
        order.setCopperthickness(qoute.getSpecification().getCopperthickness());
        order.setPcbthickness(qoute.getSpecification().getPcbthickness());
        order.setMinholedia(qoute.getSpecification().getMinholedia());
        //Inserting "0" in front of value, because excel uses whole numbers instead of decimal
        order.setMintrackgap(Double.parseDouble("0." + qoute.getSpecification().getMintrackgap().intValue()));
        System.out.println("mintrackgap set to: " + order.getMintrackgap());
        order.setColorsoldermask(qoute.getSpecification().getColorsoldermask());
        order.setOthermask(qoute.getSpecification().getOthermask());
        order.setGoldfinger(qoute.getSpecification().getGoldfinger());
        order.setEdgplating(qoute.getSpecification().getEdgplating());
        order.setPressfitreq(qoute.getSpecification().getPressfitreq());
        order.setBuildupchoice(qoute.getSpecification().getBuildupchoice());
        order.setImpedance(qoute.getSpecification().getImpedance());
        order.setComments(qoute.getSpecification().getComments());

        order.setLayout(qoute.getSpecification().getLayout());
        order.setOrdercomments("General comment:" + qoute.getSpecification().getComments() + "\nLayout comment: " + qoute.getSpecification().getAzcomments());
        // panel
        order.setAzpanelization(qoute.getSpecification().getAzpanelization());

        // azitech
        order.setAzpcbdimx(qoute.getSpecification().getAzpcbdimx());
        order.setAzpcbdimy(qoute.getSpecification().getAzpcbdimy());
        order.setAznrofpcbx(qoute.getSpecification().getAznrofpcbx());
        order.setAznrofpcby(qoute.getSpecification().getAznrofpcby());
        order.setAzdistancepcb(qoute.getSpecification().getAzdistancepcb());
        order.setAzsizeborderpanel(qoute.getSpecification().getAzsizeborderpanel());
        order.setAztotdimx(qoute.getSpecification().getAztotdimx());
        order.setAztotdimy(qoute.getSpecification().getAztotdimy());
        order.setAzproddays(qoute.getSpecification().getAzproddays());
        order.setAzcomments(qoute.getSpecification().getAzcomments());

        // own panel
        order.setOwnpaneldimx(qoute.getSpecification().getOwnpaneldimx());
        order.setOwnpaneldimy(qoute.getSpecification().getOwnpaneldimy());
        order.setOwnpanelquantity(qoute.getSpecification().getOwnpanelquantity());
        //order.setOwnpanelquantityb(qoute.getSpecification().getOwnpanelquantityb());
        order.setOwnproddays(qoute.getSpecification().getOwnproddays());
        //order.setOwnproddaysb(qoute.getSpecification().getOwnproddaysb());

        // Single layout
        order.setSgpcbdimx(qoute.getSpecification().getSgpcbdimx());
        order.setSgpcbdimy(qoute.getSpecification().getSgpcbdimy());
        order.setSgquantity(qoute.getSpecification().getSgquantity());
        //order.setSgquantityb(qoute.getSpecification().getSgquantityb());
        order.setSgproddays(qoute.getSpecification().getSgproddays());
        //order.setSgproddaysb(qoute.getSpecification().getSgproddaysb());

        order.setCountry(qoute.getUser().getCountry());
        order.setTransport(qoute.getTransport());

        order.setCurrency(qoute.getUser().getCurrency());

        order.setRestotal(qoute.getTotal());
        order.setResquantity(qoute.getQuantity());
        order.setRespanelorsingleunit(qoute.getSpecification().getRespanelorsingleunit());
        order.setRespriceperunit(qoute.getUnitPrice());
        order.setResfreightcost(qoute.getFreight());
        order.setRestestandtooling(qoute.getTooling());
        order.setRescurrency(qoute.getSpecification().getRescurrency());
        order.setResworkingdays(qoute.getWorkingDays());
        order.setResfreightdays(qoute.getSpecification().getResfreightdays());
        order.setRestotaldays(qoute.getDays());
        order.setResweight(qoute.getWeight());
        order.setResarea(qoute.getSpecification().getResarea());

        order.setStatus("Incomplete");

        order.setSpecification(qoute.getSpecification());
        specification = qoute.getSpecification();
        order.setFilefile(qoute.getSpecification().getFile_file());
        System.out.println("order set on session");
        this.getContext().getRequest().getSession().setAttribute("order", order);
        if ((this.getContext().getRequest().getParameter("sp") != null && this.getContext().getRequest().getParameter("sp").equals("r") || true)) {
            order.setRestestandtooling(0.0);
            order.setRestotal(qoute.getTotal() - qoute.getTooling());
            orderMode = "repeat";
            tabSelection = "";
            return new ForwardResolution("view.jsp");
        } else {
            orderMode = "";
            tabSelection = "";
            return new ForwardResolution("view.jsp");
        }
    }

    public Resolution verify() {
        ValidationErrors error = new ValidationErrors();
        if (order == null) {
            error.addGlobalError(new SimpleError("Session Expired!"));
            getContext().setValidationErrors(error);
            return new ForwardResolution("/startup/Startup.action");
        }
        String comment = order.getOrdercomments();
        String ponumber = order.getPonumber();
        String street = order.getStreet();
        String zip = order.getZip();
        String city = order.getCity();
        String receiver = order.getReceiver();
        String company = order.getCompany();
        String country = order.getCountry();

        if (order.getId() == null) {
            order = (AzitechOrder) this.getContext().getRequest().getSession().getAttribute("order");
        }
        if (ponumber == null || ponumber.length() == 0) {
            error.add("ponumber", new SimpleError("PO-number is required"));
            getContext().setValidationErrors(error);
            if (this.getContext().getRequest().getParameter("sp") != null && this.getContext().getRequest().getParameter("sp").equals("r")) {
                orderMode = "repeat";
                tabSelection = "order";
                return new ForwardResolution("view.jsp");
            } else {
                orderMode = "";
                tabSelection = "order";
                return new ForwardResolution("view.jsp");
            }
        }
        System.out.println(getHasFile() + " 1: " + getHasFile1());
        if (!getHasFile() && !getHasFile1()) {
            error.add("file", new SimpleError("Minimum one file upload is required"));
            getContext().setValidationErrors(error);
            if (this.getContext().getRequest().getParameter("sp") != null && this.getContext().getRequest().getParameter("sp").equals("r")) {
                orderMode = "repeat";
                tabSelection = "";
                return new ForwardResolution("view.jsp");
            } else {
                orderMode = "";
                tabSelection = "";
                return new ForwardResolution("view.jsp");
            }
        }
        if (order.getOrdercomments() != null && order.getOrdercomments().length() > 1000) {
            error.add("ordercomments", new SimpleError("Comment must not be longer than 1000 characters!"));
            getContext().setValidationErrors(error);
            if (this.getContext().getRequest().getParameter("sp") != null && this.getContext().getRequest().getParameter("sp").equals("r")) {
                orderMode = "repeat";
                tabSelection = "order";
                return new ForwardResolution("view.jsp");
            } else {
                orderMode = "";
                tabSelection = "order";
                return new ForwardResolution("view.jsp");
            }
        }
        if (order.getStatus() == null) {
            order.setStatus("Order to be confirmed");
        }

        order.setOrdercomments(comment);
        order.setPonumber(ponumber);
        order.setStreet(street);
        order.setZip(zip);
        order.setCity(city);
        order.setCompany(company);
        order.setCountry(country);
        order.setReceiver(receiver);

        if (this.getContext().getRequest().getParameter("sp") != null && this.getContext().getRequest().getParameter("sp").equals("r")) {
            String lsQuoteID = order.getQuoteid();
            if (lsQuoteID != null && lsQuoteID.length() > 0 && order.getSpecification() != null) {
                List list = HibernateUtil.getSessionFactory().getCurrentSession().createQuery("select count(*), quoteid from AzitechOrder a where specification.id='" + String.valueOf(order.getSpecification().getId()) + "' group by specification order by id").list();
                if (list != null && list.size() > 0 && list.get(0) != null) {
                    Object[] s = (Object[]) list.get(0);
                    if (s.length == 2 && s[1] != null && s[0] != null) {
                        lsQuoteID = s[1] + "-" + (Integer.parseInt(s[0].toString()));
                        order.setQuoteid(lsQuoteID);
                    }
                }
            }
        }
        persist(order);
        this.getContext().getRequest().getSession().setAttribute("order", order);

        if (!getContext().getUser().getUsername().equals("admin")) //mail from useremailid to pcb-direct@azitech.dk; if normal user
        {
            Calendar c = Calendar.getInstance(TimeZone.getTimeZone("Europe/Copenhagen"));
            order.setDate(c.getTime());
            AzitechOrderEmail email = new AzitechOrderEmail();
            email.setProperty("order", order);
            email.setProperty("specification", order.getSpecification());
            email.setTo("pcb-direct@azitech.dk");
            email.setFrom("pcb-direct@azitech.dk");
            email.setSubject("Order");
            email.send();
            System.out.println("Sending email to: " + email.getTo());
            System.out.println(email.getContent());
        } else if (order.getStatus().equals("Order confirmed")) //If user is admin; mail is sent to user from pcb-direct@azitech.dk
        {
            Email mail = new Email();
            mail.setTemplateName("Receipt");
            mail.setSubject("Order confirmation from PCB-direct");
            mail.setProperty("order", order);
            mail.setProperty("specification", order.getSpecification());
            mail.setTo(this.getContext().getUser().getEmail()); //order.getSpecification().getUser().getEmail()
            mail.setFrom("pcb-direct@azitech.dk");
            mail.send();
            System.out.println("Email.send ran");
        }

        if (!getContext().getUser().getUsername().equals("admin")) //mail from useremailid to pcb-direct@azitech.dk; if normal user
        {
            System.out.println("Sending another email");
            AzitechOrderReceive emailR = new AzitechOrderReceive();
            emailR.setProperty("order", order);
            User user = this.getContext().getUser();
            if (user != null) {
                emailR.setTo(user.getEmail());
                order.setOwner(user);

            } else {
                emailR.setTo(order.getSpecification().getUser().getEmail());
                order.setOwner(order.getSpecification().getUser());

            }
            emailR.setFrom("pcb-direct@azitech.dk");
            emailR.setSubject("Order received");
            emailR.send();
            System.out.println("Email sent.");
        }
        System.out.println("returning receipt");
        return new ForwardResolution("receipt.jsp");
    }

    public Resolution updateTotal() {
        if (order.getStatus().equals("Order confirmed")) //If user is admin; mail is sent to user from pcb-direct@azitech.dk
        {
            Email mail = new Email();
            mail.setTemplateName("Receipt");
            mail.setSubject("Order confirmation from PCB-direct");
            mail.setProperty("order", order);
            mail.setProperty("specification", order.getSpecification());
            if (order.getOwner() != null) {
                mail.setTo(order.getOwner().getEmail());

            } else {
                mail.setTo(order.getSpecification().getUser().getEmail());
            }
            mail.setFrom("pcb-direct@azitech.dk");
            mail.send();
        }
        if (order.getResquantity() > 0) {
            order.setRespriceperunit((order.getRestotal() - order.getResfreightcost() - order.getRestestandtooling()) / order.getResquantity());
        }
        persist(order);
        this.getContext().getRequest().getSession().setAttribute("order", order);
        return new ForwardResolution("receipt.jsp");
    }

    public Resolution backToQuote() {
        return new RedirectResolution("/qoute/Qoute.action?specification=" + ((AzitechOrder) this.getContext().getRequest().getSession().getAttribute("order")).getSpecification());
    }

    @DontValidate
    public Resolution viewReceipt() {
        return new ForwardResolution("receiptOLD.jsp");
    }

    @DontValidate
    public Resolution delete() {
        List<AzitechOrder_Share> list = null;
        try {
            list = HibernateUtil.getSessionFactory().getCurrentSession().createCriteria(AzitechOrder_Share.class).add(Expression.eq("order", order)).list();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        for (AzitechOrder_Share obj : list) {
            delete(obj);
        }
        delete(order);
        if (getContext().getUser().getUsername().equals("admin")) {
            return new ForwardResolution("list.jsp");
        } else {
            return new ForwardResolution("/startup/Startup.action?home");
        }
    }

    public void saveGerberFile(int liUploadIndex) {
        File parentDir = new File(getContext().getServletContext().getRealPath("/azitechData/" + specification.getId()));
        parentDir.mkdirs();
        try {
            if (order.getId() == null) {
                order = (AzitechOrder) this.getContext().getRequest().getSession().getAttribute("order");
            }
            if (liUploadIndex == 1) {
                if (file != null) {
                    File fileToSaveIn = new File(getContext().getServletContext().getRealPath("/azitechData/" + specification.getId() + "/" + file.getFileName()));
                    file.save(fileToSaveIn);
                    specification.setGerberdata(file.getFileName());
                }
            } else if (liUploadIndex == 2) {
                if (file1 != null) {
                    File fileToSaveIn = new File(getContext().getServletContext().getRealPath("/azitechData/" + specification.getId() + "/" + file1.getFileName()));
                    file1.save(fileToSaveIn);
                    specification.setGerberdata1(file1.getFileName());
                }
            }
            persist(specification);
            order.setSpecification(specification);
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    public Resolution upload() {
        saveGerberFile(1);
        return new ForwardResolution("view.jsp");
    }

    public Resolution upload2() {
        saveGerberFile(2);
        return new ForwardResolution("view.jsp");
    }

    public Resolution list() {
        return new ForwardResolution("list.jsp");
    }

    public boolean getHasFile() {
        return (order.getSpecification().getGerberdata() != null);
    }

    public boolean getHasFile1() {
        return (order.getSpecification().getGerberdata1() != null);
    }

    public List getAllOrders() {
        return getSession().createCriteria(AzitechOrder.class).addOrder(Order.desc("date")).list();
    }

    public AzitechOrder getOrder() {
        return order;
    }

    public void setOrder(AzitechOrder order) {
        this.order = order;
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

    public FileBean getFile() {
        return file;
    }

    public void setFile(FileBean file) {
        this.file = file;
    }

    public FileBean getFile1() {
        return file1;
    }

    public void setFile1(FileBean fFile1) {
        file1 = fFile1;
    }

}
