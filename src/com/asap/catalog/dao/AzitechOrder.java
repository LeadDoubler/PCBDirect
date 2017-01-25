/*
 * Specification.java
 *
 * Created on 21. oktober 2007, 18:07
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.asap.catalog.dao;

import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author JRO
 */
@Entity
@Table(name = "azitechorder")
public class AzitechOrder extends Component {


       @ManyToOne
    private User owner;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String status;
    private String username;
    private String email;

    @Temporal(value = TemporalType.TIMESTAMP)
    private Date date;

    private String reference;
    private String pcbreference;
    private double layers;
    private String stspspec;

    private String finish;
    private String material;
    private double copperthickness;
    private double pcbthickness;
    private String minholedia;
    private double mintrackgap;
    private String colorsoldermask;
    private String othermask;
    private String goldfinger;
    private String edgplating;
    private String pressfitreq;
    private String buildupchoice;
    private String impedance;

    @Column(length = 500)
    private String comments;

    @Column(length = 1000)
    private String ordercomments;

    @ManyToOne
    private Specification specification;

    @ManyToOne
    private User user;
    
    private String layout;

    // panel
    private String azpanelization;

    // azitech
    private double azpcbdimx;
    private double azpcbdimy;
    private double aznrofpcbx;
    private double aznrofpcby;
    private double azdistancepcb;
    private double azsizeborderpanel;
    private double aztotdimx;
    private double aztotdimy;
    private double aznrofpcb;
    private double azquantity;
    private double azproddays;

    @Column(length = 500)
    private String azcomments;

    // own panel
    private double ownpaneldimx;
    private double ownpaneldimy;
    private double ownpanelquantity;
    private double ownpanelquantityb;
    private double ownproddays;
    private double ownproddaysb;

    // Single layout
    private double sgpcbdimx;
    private double sgpcbdimy;
    private double sgquantity;
    private double sgquantityb;
    private double sgproddays;
    private double sgproddaysb;

    private String country;
    private String transport;

    private String currency;

    private double restotal;
    private double resquantity;
    private String respanelorsingleunit;
    private double respriceperunit;
    private double resfreightcost;
    private double restestandtooling;
    private String rescurrency;
    private double resworkingdays;
    private double resfreightdays;
    private double restotaldays;
    private double resweight;
    private double resarea;
    private String street;
    private String zip;
    private String city;
    private String receiver;
    private String company;

    @Temporal(value = TemporalType.TIMESTAMP)
    private Date deliverydate;

    private String ponumber;

    private String quoteid;

    @Temporal(value = TemporalType.TIMESTAMP)
    private Date createdOn;

    @Column(length = 20)
    private Long lastUpdateBy;

    @Temporal(value = TemporalType.TIMESTAMP)
    private Date lastUpdateOn;

    @Transient
    private double orderAccess = 9;
    @Transient
    private String lastAction;
    @Transient
    private String shareToCount;

    @Lob
    @Column(name = "file_binary", length = 2097152)
    private byte[] file_file;

    public AzitechOrder() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getReference() {
        return reference;
    }

    public void setReference(String reference) {
        this.reference = reference;
    }

    public String getPcbreference() {
        return pcbreference;
    }

    public void setPcbreference(String pcbreference) {
        this.pcbreference = pcbreference;
    }

    public double getLayers() {
        return layers;
    }

    public void setLayers(double layers) {
        this.layers = layers;
    }

    public String getStspspec() {
        return stspspec;
    }

    public void setStspspec(String stspspec) {
        this.stspspec = stspspec;
    }

    public String getFinish() {
        return finish;
    }

    public void setFinish(String finish) {
        this.finish = finish;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public double getCopperthickness() {
        return copperthickness;
    }

    public void setCopperthickness(double copperthickness) {
        this.copperthickness = copperthickness;
    }

    public double getPcbthickness() {
        return pcbthickness;
    }

    public void setPcbthickness(double pcbthickness) {
        this.pcbthickness = pcbthickness;
    }

    public String getMinholedia() {
        return minholedia;
    }

    public void setMinholedia(String minholedia) {
        this.minholedia = minholedia;
    }

    public double getMintrackgap() {
        return mintrackgap;
    }

    public void setMintrackgap(double mintrackgap) {
        this.mintrackgap = mintrackgap;
    }

    public String getColorsoldermask() {
        return colorsoldermask;
    }

    public void setColorsoldermask(String colorsoldermask) {
        this.colorsoldermask = colorsoldermask;
    }

    public String getOthermask() {
        return othermask;
    }

    public void setOthermask(String othermask) {
        this.othermask = othermask;
    }

    public String getGoldfinger() {
        return goldfinger;
    }

    public void setGoldfinger(String goldfinger) {
        this.goldfinger = goldfinger;
    }

    public String getEdgplating() {
        return edgplating;
    }

    public void setEdgplating(String edgplating) {
        this.edgplating = edgplating;
    }

    public String getPressfitreq() {
        return pressfitreq;
    }

    public void setPressfitreq(String pressfitreq) {
        this.pressfitreq = pressfitreq;
    }

    public String getBuildupchoice() {
        return buildupchoice;
    }

    public void setBuildupchoice(String buildupchoice) {
        this.buildupchoice = buildupchoice;
    }

    public String getImpedance() {
        return impedance;
    }

    public void setImpedance(String impedance) {
        this.impedance = impedance;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getLayout() {
        return layout;
    }

    public void setLayout(String layout) {
        this.layout = layout;
    }

    public String getAzpanelization() {
        return azpanelization;
    }

    public void setAzpanelization(String azpanelization) {
        this.azpanelization = azpanelization;
    }

    public double getAzpcbdimx() {
        return azpcbdimx;
    }

    public void setAzpcbdimx(double azpcbdimx) {
        this.azpcbdimx = azpcbdimx;
    }

    public double getAzpcbdimy() {
        return azpcbdimy;
    }

    public void setAzpcbdimy(double azpcbdimy) {
        this.azpcbdimy = azpcbdimy;
    }

    public double getAznrofpcbx() {
        return aznrofpcbx;
    }

    public void setAznrofpcbx(double aznrofpcbx) {
        this.aznrofpcbx = aznrofpcbx;
    }

    public double getAznrofpcby() {
        return aznrofpcby;
    }

    public void setAznrofpcby(double aznrofpcby) {
        this.aznrofpcby = aznrofpcby;
    }

    public double getAzdistancepcb() {
        return azdistancepcb;
    }

    public void setAzdistancepcb(double azdistancepcb) {
        this.azdistancepcb = azdistancepcb;
    }

    public double getAzsizeborderpanel() {
        return azsizeborderpanel;
    }

    public void setAzsizeborderpanel(double azsizeborderpanel) {
        this.azsizeborderpanel = azsizeborderpanel;
    }

    public double getAztotdimx() {
        return aztotdimx;
    }

    public void setAztotdimx(double aztotdimx) {
        this.aztotdimx = aztotdimx;
    }

    public double getAztotdimy() {
        return aztotdimy;
    }

    public void setAztotdimy(double aztotdimy) {
        this.aztotdimy = aztotdimy;
    }

    public double getAznrofpcb() {
        return aznrofpcb;
    }

    public void setAznrofpcb(double aznrofpcb) {
        this.aznrofpcb = aznrofpcb;
    }

    public double getAzquantity() {
        return azquantity;
    }

    public void setAzquantity(double azquantity) {
        this.azquantity = azquantity;
    }

    public double getAzproddays() {
        return azproddays;
    }

    public void setAzproddays(double azproddays) {
        this.azproddays = azproddays;
    }

    public String getAzcomments() {
        return azcomments;
    }

    public void setAzcomments(String azcomments) {
        this.azcomments = azcomments;
    }

    public double getOwnpaneldimx() {
        return ownpaneldimx;
    }

    public void setOwnpaneldimx(double ownpaneldimx) {
        this.ownpaneldimx = ownpaneldimx;
    }

    public double getOwnpaneldimy() {
        return ownpaneldimy;
    }

    public void setOwnpaneldimy(double ownpaneldimy) {
        this.ownpaneldimy = ownpaneldimy;
    }

    public double getOwnpanelquantity() {
        return ownpanelquantity;
    }

    public void setOwnpanelquantity(double ownpanelquantity) {
        this.ownpanelquantity = ownpanelquantity;
    }

    public double getOwnpanelquantityb() {
        return ownpanelquantityb;
    }

    public void setOwnpanelquantityb(double ownpanelquantityb) {
        this.ownpanelquantityb = ownpanelquantityb;
    }

    public double getOwnproddays() {
        return ownproddays;
    }

    public void setOwnproddays(double ownproddays) {
        this.ownproddays = ownproddays;
    }

    public double getOwnproddaysb() {
        return ownproddaysb;
    }

    public void setOwnproddaysb(double ownproddaysb) {
        this.ownproddaysb = ownproddaysb;
    }

    public double getSgpcbdimx() {
        return sgpcbdimx;
    }

    public void setSgpcbdimx(double sgpcbdimx) {
        this.sgpcbdimx = sgpcbdimx;
    }

    public double getSgpcbdimy() {
        return sgpcbdimy;
    }

    public void setSgpcbdimy(double sgpcbdimy) {
        this.sgpcbdimy = sgpcbdimy;
    }

    public double getSgquantity() {
        return sgquantity;
    }

    public void setSgquantity(double sgquantity) {
        this.sgquantity = sgquantity;
    }

    public double getSgquantityb() {
        return sgquantityb;
    }

    public void setSgquantityb(double sgquantityb) {
        this.sgquantityb = sgquantityb;
    }

    public double getSgproddays() {
        return sgproddays;
    }

    public void setSgproddays(double sgproddays) {
        this.sgproddays = sgproddays;
    }

    public double getSgproddaysb() {
        return sgproddaysb;
    }

    public void setSgproddaysb(double sgproddaysb) {
        this.sgproddaysb = sgproddaysb;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getTransport() {
        return transport;
    }

    public void setTransport(String transport) {
        this.transport = transport;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public double getRestotal() {
        return restotal;
    }

    public void setRestotal(double restotal) {
        this.restotal = restotal;
    }

    public double getResquantity() {
        return resquantity;
    }

    public void setResquantity(double resquantity) {
        this.resquantity = resquantity;
    }

    public String getRespanelorsingleunit() {
        return respanelorsingleunit;
    }

    public void setRespanelorsingleunit(String respanelorsingleunit) {
        this.respanelorsingleunit = respanelorsingleunit;
    }

    public double getRespriceperunit() {
        return respriceperunit;
    }

    public void setRespriceperunit(double respriceperunit) {
        this.respriceperunit = respriceperunit;
    }

    public double getResfreightcost() {
        return resfreightcost;
    }

    public void setResfreightcost(double resfreightcost) {
        this.resfreightcost = resfreightcost;
    }

    public double getRestestandtooling() {
        return restestandtooling;
    }

    public void setRestestandtooling(double restestandtooling) {
        this.restestandtooling = restestandtooling;
    }

    public String getRescurrency() {
        return rescurrency;
    }

    public void setRescurrency(String rescurrency) {
        this.rescurrency = rescurrency;
    }

    public double getResworkingdays() {
        return resworkingdays;
    }

    public void setResworkingdays(double resworkingdays) {
        this.resworkingdays = resworkingdays;
    }

    public double getResfreightdays() {
        return resfreightdays;
    }

    public void setResfreightdays(double resfreightdays) {
        this.resfreightdays = resfreightdays;
    }

    public double getRestotaldays() {
        return restotaldays;
    }

    public void setRestotaldays(double restotaldays) {
        this.restotaldays = restotaldays;
    }

    public double getResweight() {
        return resweight;
    }

    public void setResweight(double resweight) {
        this.resweight = resweight;
    }

    public double getResarea() {
        return resarea;
    }

    public void setResarea(double resarea) {
        this.resarea = resarea;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String string) {
        this.username = string;
    }

    public byte[] getFilefile() {
        return file_file;
    }

    public void setFilefile(byte[] file) {
        this.file_file = file;
    }

    public boolean getHasfile() {
        return file_file != null;
    }

    public void setEmail(String string) {
        this.email = string;
    }

    public String getEmail() {
        return email;
    }

    public String getStringDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm dd/MM-yyyy");
        return sdf.format(date);
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Specification getSpecification() {
        return specification;
    }

    public void setSpecification(Specification specification) {
        this.specification = specification;
    }

    public String getOrdercomments() {
        return ordercomments;
    }

    public void setOrdercomments(String ordercomments) {
        this.ordercomments = ordercomments;
    }

    /**
     * @return the street
     */
    public String getStreet() {
        return street;
    }

    /**
     * @param street the street to set
     */
    public void setStreet(String street) {
        this.street = street;
    }

    /**
     * @return the zip
     */
    public String getZip() {
        return zip;
    }

    /**
     * @param zip the zip to set
     */
    public void setZip(String zip) {
        this.zip = zip;
    }

    /**
     * @return the city
     */
    public String getCity() {
        return city;
    }

    /**
     * @param city the city to set
     */
    public void setCity(String city) {
        this.city = city;
    }

    /**
     * @return the receiver
     */
    public String getReceiver() {
        return receiver;
    }

    /**
     * @param receiver the receiver to set
     */
    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public Date getDeliverydate() {
        return deliverydate;
    }

    public void setDeliverydate(Date deliverydate) {
        this.deliverydate = deliverydate;
    }

    public String getPonumber() {
        return ponumber;
    }

    public void setPonumber(String ponumber) {
        this.ponumber = ponumber;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getQuoteid() {
        return quoteid;
    }

    public void setQuoteid(String quoteid) {
        this.quoteid = quoteid;
    }

    public double getOrderAccess() {
        return orderAccess;
    }

    public void setOrderAccess(double orderAccess) {
        this.orderAccess = orderAccess;
    }

    public String getLastAction() {
        return lastAction;
    }

    public void setLastAction(String lastAction) {
        this.lastAction = lastAction;
    }

    public String getShareToCount() {
        return shareToCount;
    }

    public void setShareToCount(String shareToCount) {
        this.shareToCount = shareToCount;
    }

    public Date getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(Date createdOn) {
        this.createdOn = createdOn;
    }

    public Long getLastUpdateBy() {
        return lastUpdateBy;
    }

    public void setLastUpdateBy(Long lastUpdateBy) {
        this.lastUpdateBy = lastUpdateBy;
    }

    public Date getLastUpdateOn() {
        return lastUpdateOn;
    }

    public void setLastUpdateOn(Date lastUpdateOn) {
        this.lastUpdateOn = lastUpdateOn;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    /**
     * @return the owner
     */
    public User getOwner() {
        return owner;
    }

    /**
     * @param owner the owner to set
     */
    public void setOwner(User owner) {
        this.owner = owner;
    }
}
