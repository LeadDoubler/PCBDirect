/*
 * Specification.java
 *
 * Created on 21. oktober 2007, 18:07
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package com.asap.catalog.dao;

import com.jxcell.CellException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jxcell.JxcellPosition;
import jxcell.Spreadsheet;

import javax.persistence.*;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import jxcell.Position;

import util.HibernateUtil;

/**
 * @author JRO
 */
@Entity
@Table(name = "specification")
public class Specification extends Component {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne
    private User user;

    private String reference;
    private String pcbreference;
    private double layers;
    private String stspspec;

    private String finish;
    private String material;
    private double copperthickness;
    private Double pcbthickness;
    private String minholedia;
    private Double mintrackgap;
    private String colorsoldermask;
    private String othermask;
    private String goldfinger;
    private String edgplating;
    private String pressfitreq;
    private String buildupchoice;
    private String impedance;

    @Column(length = 500)
    private String comments;

    private String xoutallowed;
    private String layout;

    // panel
    private String azpanelization;

    // azitech
    private Double azpcbdimx;
    private Double azpcbdimy;
    private double aznrofpcbx;
    private double aznrofpcby;
    private Double azdistancepcb;
    private Double azsizeborderpanel;
    private Double aztotdimx;
    private Double aztotdimy;
    private double aznrofpcb;
    private double azquantity;
    private double azproddays;

    @Column(length = 500)
    private String azcomments;

    // own panel
    private Double ownpaneldimx;
    private Double ownpaneldimy;
    private double ownpanelquantity;
    //    private double ownpanelquantityb;
    private double ownproddays;
//    private double ownproddaysb;

    // Single layout
    private double sgpcbdimx;
    private Double sgpcbdimy;
    private double sgquantity;
    //    private double sgquantityb;
    private double sgproddays;
//    private double sgproddaysb;

    private String country;
    private String transport;

    private String currency;
    private String exchngrate;
    private double restotal;
    @Transient
    private double restotalreorder;
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
    private String gerberdata1;
    private String gerberdata;
    private Double azprintperpanel;//pcb per panel

    @Transient
    private String isorderplaced;

    @Transient
    private double specAccess = 9;
    @Transient
    private String lastAction;
    @Transient
    private String shareToCount;

    @Lob
    @Column(name = "file_binary", length = 2097152)
    private byte[] file_file;

    public static final String filename = "/scheme.xls";

    @Temporal(value = TemporalType.TIMESTAMP)
    private Date createdOn;

    @Column(length = 20)
    private Long lastUpdateBy;

    @Temporal(value = TemporalType.TIMESTAMP)
    private Date lastUpdateOn;
    @OneToMany(mappedBy = "specification")
    private List<ProductTemplate> productTemplates;
    @OneToMany(mappedBy = "specification")
    private List<AzitechOrder> azitechOrders;

    public Specification() {

    }

    public static double getSchemeVersion(String file) {
        Spreadsheet jx = Spreadsheet.getInstance(file);
        return jx.getNumber(JxcellPosition.SCHEME_VERSION);
    }

    /**
     * Initialize the Specification by fetching default values from the
     * spreadsheet
     *
     * @param file
     */
    public void init(String file) {

        Spreadsheet jx = Spreadsheet.getInstance(file, true);  // todo: make 2nd param true

        reference = jx.getString(JxcellPosition.REFERENCE);
        pcbreference = jx.getString(JxcellPosition.PCBREFERENCE);
        layers = jx.getNumber(JxcellPosition.NOOFLAYERS);
        stspspec = jx.getString(JxcellPosition.STSPSPEC);

        // Special
        finish = jx.getString(JxcellPosition.FINISH);
        material = jx.getString(JxcellPosition.MATERIAL);
        copperthickness = jx.getNumber(JxcellPosition.COBBERTHICKNESS);
        pcbthickness = jx.getNumber(JxcellPosition.PCBTHICKNESS);
        minholedia = jx.getString(JxcellPosition.MINHOLEDIAMETER);
        mintrackgap = jx.getNumber(JxcellPosition.MINTRACKGAP);
        colorsoldermask = jx.getString(JxcellPosition.COLORSOLDERMASK);
        othermask = jx.getString(JxcellPosition.OTHERMASK);
        goldfinger = jx.getString(JxcellPosition.GOLDFINGER);
        edgplating = jx.getString(JxcellPosition.EDGEPLATING);
        pressfitreq = jx.getString(JxcellPosition.PRESSFITREQ);
        buildupchoice = jx.getString(JxcellPosition.BUILDUPCHOICE);
        impedance = jx.getString(JxcellPosition.IMPEDANCE);

        azprintperpanel = jx.getNumber(JxcellPosition.PCBPERPANEL);

        xoutallowed = jx.getString(JxcellPosition.Xoutallowed);
        // Single cut or panel layout
        layout = jx.getString(JxcellPosition.SINGLEORPANELLAYOUT);

        // azitech panel
        azpanelization = jx.getString(JxcellPosition.PANELIZATION);
        azpcbdimx = jx.getNumber(JxcellPosition.AZPCBDIMX);
        azpcbdimy = jx.getNumber(JxcellPosition.AZPCBDIMY);
        aznrofpcbx = jx.getNumber(JxcellPosition.AZNOPCBX);
        aznrofpcby = jx.getNumber(JxcellPosition.AZNOPCBY);
        azdistancepcb = jx.getNumber(JxcellPosition.AZPCBDISTANCE);
        azsizeborderpanel = jx.getNumber(JxcellPosition.AZSIZEPANELBORDER);
        aztotdimx = jx.getNumber(JxcellPosition.AZTOTSIZEX);
        aztotdimy = jx.getNumber(JxcellPosition.AZTOTSIZEY);
        aznrofpcb = jx.getNumber(JxcellPosition.AZNROFPCB);
        azquantity = jx.getNumber(JxcellPosition.AZPANELQUANTITY);
        azproddays = jx.getNumber(JxcellPosition.AZPANELPRODDAYS);

        // own panel
        ownpaneldimx = jx.getNumber(JxcellPosition.OWNPANELDIMX);
        ownpaneldimy = jx.getNumber(JxcellPosition.OWNPANELDIMY);
        ownpanelquantity = jx.getNumber(JxcellPosition.OWNPANELQUANTITY);
        //ownpanelquantityb = jx.getNumber(JxcellPosition.OWNPANELQUANTITYb);
        ownproddays = jx.getNumber(JxcellPosition.OWNPRODDAYS);
        //ownproddaysb = jx.getNumber(JxcellPosition.OWNPRODDAYSb);

        // Single
        sgpcbdimx = jx.getNumber(JxcellPosition.SINGLEPCBDIMX);
        sgpcbdimy = jx.getNumber(JxcellPosition.SINGLEPCBDIMY);
        sgquantity = jx.getNumber(JxcellPosition.SINGLEQUANTITY);
        //sgquantityb = jx.getNumber(JxcellPosition.SINGLEQUANTITYb);
        sgproddays = jx.getNumber(JxcellPosition.SINGLEPRODDAYS);
        //sgproddaysb = jx.getNumber(JxcellPosition.SINGLEPRODDAYSb);

        country = jx.getString(JxcellPosition.COUNTRY);
        transport = jx.getString(JxcellPosition.TRANSPORTMODE);
        currency = jx.getString(JxcellPosition.CURRENCY);

        // Result
        resquantity = jx.getNumber(JxcellPosition.RESQUANTITY);
        respanelorsingleunit = jx.getString(JxcellPosition.RESPANELORSINGLE);
        respriceperunit = jx.getNumber(JxcellPosition.RESPRICEPERUNIT);
        resfreightcost = jx.getNumber(JxcellPosition.RESFREIGHT);
        restestandtooling = jx.getNumber(JxcellPosition.RESTESTANDTOOLING);
        restotal = jx.getNumber(JxcellPosition.RESTOTAL);
        rescurrency = jx.getString(JxcellPosition.RESCURRENCY);
        resworkingdays = jx.getNumber(JxcellPosition.RESWORKINGDAYS);
        resfreightdays = jx.getNumber(JxcellPosition.RESFREIGHTDAYS);
        restotaldays = jx.getNumber(JxcellPosition.RESTOTALDAYS);
        resweight = jx.getNumber(JxcellPosition.RESWEIGHT);
        System.gc();
    }

    /**
     * A function to process the data from page/form and put it into the
     * spreadsheet, fetch the result values from new processed spreadsheet.
     *
     * @param file
     */
    public void processxls(String file) {
        Spreadsheet jx = Spreadsheet.getInstance(file);

        jx.setString(JxcellPosition.REFERENCE, reference);
        jx.setString(JxcellPosition.PCBREFERENCE, pcbreference);
        jx.setNumber(JxcellPosition.NOOFLAYERS, layers);
        jx.setString(JxcellPosition.STSPSPEC, stspspec);

        if (stspspec.equals("Standard specification")) {
            Spreadsheet def_jx = Spreadsheet.getInstance(file);
            // Special
            othermask = def_jx.getString(JxcellPosition.OTHERMASK);
            goldfinger = def_jx.getString(JxcellPosition.GOLDFINGER);
            edgplating = def_jx.getString(JxcellPosition.EDGEPLATING);
            pressfitreq = def_jx.getString(JxcellPosition.PRESSFITREQ);
            buildupchoice = def_jx.getString(JxcellPosition.BUILDUPCHOICE);
            impedance = def_jx.getString(JxcellPosition.IMPEDANCE);
        }

        jx.setString(JxcellPosition.FINISH, finish);
        jx.setString(JxcellPosition.MATERIAL, material);
        jx.setNumber(JxcellPosition.COBBERTHICKNESS, copperthickness);
        jx.setNumber(JxcellPosition.PCBTHICKNESS, pcbthickness);
        jx.setString(JxcellPosition.MINHOLEDIAMETER, minholedia);
        jx.setNumber(JxcellPosition.MINTRACKGAP, mintrackgap);
        jx.setString(JxcellPosition.COLORSOLDERMASK, colorsoldermask);
        jx.setString(JxcellPosition.OTHERMASK, othermask);
        jx.setString(JxcellPosition.GOLDFINGER, goldfinger);
        jx.setString(JxcellPosition.EDGEPLATING, edgplating);
        jx.setString(JxcellPosition.BUILDUPCHOICE, buildupchoice);
        jx.setString(JxcellPosition.PRESSFITREQ, pressfitreq);
        jx.setString(JxcellPosition.IMPEDANCE, impedance);

        // Single cut or panel layout
        jx.setString(JxcellPosition.SINGLEORPANELLAYOUT, layout);

        // azitech panel
        jx.setString(JxcellPosition.PANELIZATION, azpanelization);
        jx.setNumber(JxcellPosition.AZPCBDIMX, azpcbdimx);
        jx.setNumber(JxcellPosition.AZPCBDIMY, azpcbdimy);
        jx.setNumber(JxcellPosition.AZNOPCBX, aznrofpcbx);
        jx.setNumber(JxcellPosition.AZNOPCBY, aznrofpcby);
        jx.setNumber(JxcellPosition.AZPCBDISTANCE, azdistancepcb);
        jx.setNumber(JxcellPosition.AZSIZEPANELBORDER, azsizeborderpanel);
        //jx.setNumber(JxcellPosition.AZTOTSIZEX,aztotdimx);
        //jx.setNumber(JxcellPosition.AZTOTSIZEY,aztotdimy);
        //jx.setNumber(JxcellPosition.AZNROFPCB,aznrofpcb);
        jx.setNumber(JxcellPosition.AZPANELQUANTITY, azquantity);
        jx.setNumber(JxcellPosition.AZPANELPRODDAYS, azproddays);

        // own panel
        jx.setNumber(JxcellPosition.OWNPANELDIMX, ownpaneldimx);
        jx.setNumber(JxcellPosition.OWNPANELDIMY, ownpaneldimy);
        jx.setNumber(JxcellPosition.OWNPANELQUANTITY, ownpanelquantity);
        //jx.setNumber(JxcellPosition.OWNPANELQUANTITYb,ownpanelquantityb);
        jx.setNumber(JxcellPosition.OWNPRODDAYS, ownproddays);
        //jx.setNumber(JxcellPosition.OWNPRODDAYSb,ownproddaysb);

        jx.setNumber(JxcellPosition.PCBPERPANEL, azprintperpanel);
        jx.setString(JxcellPosition.Xoutallowed, xoutallowed);

        // Single layout
        jx.setNumber(JxcellPosition.SINGLEPCBDIMX, sgpcbdimx);
        jx.setNumber(JxcellPosition.SINGLEPCBDIMY, sgpcbdimy);
        jx.setNumber(JxcellPosition.SINGLEQUANTITY, sgquantity);
        //jx.setNumber(JxcellPosition.SINGLEQUANTITYb,sgquantityb);
        jx.setNumber(JxcellPosition.SINGLEPRODDAYS, sgproddays);
        //jx.setNumber(JxcellPosition.SINGLEPRODDAYSb,sgproddaysb);

        jx.setString(JxcellPosition.COUNTRY, user.getCountry());
        jx.setString(JxcellPosition.TRANSPORTMODE, transport);
        jx.setString(JxcellPosition.CURRENCY, user.getCurrency());
        jx.setString(JxcellPosition.DISCOUNT, String.valueOf(user.getDiscount().doubleValue()) + "%");
        try {
            jx.getView().recalc();
        } catch (CellException ex) {
            Logger.getLogger(Specification.class.getName()).log(Level.SEVERE, null, ex);
        }
        // Values
        aztotdimx = jx.getNumber(JxcellPosition.AZTOTSIZEX);
        aztotdimy = jx.getNumber(JxcellPosition.AZTOTSIZEY);
        aznrofpcb = jx.getNumber(JxcellPosition.AZNROFPCB);

        // Result
        resquantity = jx.getNumber(JxcellPosition.RESQUANTITY);
        respanelorsingleunit = jx.getString(JxcellPosition.RESPANELORSINGLE);
        respriceperunit = jx.getNumber(JxcellPosition.RESPRICEPERUNIT);
        resfreightcost = jx.getNumber(JxcellPosition.RESFREIGHT);
        restestandtooling = jx.getNumber(JxcellPosition.RESTESTANDTOOLING);
        restotal = jx.getNumber(JxcellPosition.RESTOTAL);
        restotalreorder = jx.getNumber(JxcellPosition.RESTOTAL_REORDER);
        rescurrency = jx.getString(JxcellPosition.RESCURRENCY);
        resworkingdays = jx.getNumber(JxcellPosition.RESWORKINGDAYS);
        resfreightdays = jx.getNumber(JxcellPosition.RESFREIGHTDAYS);
        restotaldays = jx.getNumber(JxcellPosition.RESTOTALDAYS);
        resweight = jx.getNumber(JxcellPosition.RESWEIGHT);

        resarea = jx.getNumber(JxcellPosition.RESAREA);
        if (rescurrency.equals("USD")) {
            exchngrate = String.valueOf(jx.getNumber(JxcellPosition.EXCHANGERATE_USD));
        } else if (rescurrency.equals("EURO")) {
            exchngrate = String.valueOf(jx.getNumber(JxcellPosition.EXCHANGERATE_EURO));
        } else {
            exchngrate = String.valueOf(jx.getNumber(JxcellPosition.EXCHANGERATE_USD));
        }

        System.gc();
    }

    public static double roundDouble(double d, int places) {
        return Math.round((d) * Math.pow(10, (double) places)) / Math.pow(10, (double) places);
    }

    private static String formatDate(Date foDate) {
        if (foDate != null) {
            DateFormat loDateFormat = new SimpleDateFormat("dd MMM");
            return loDateFormat.format(foDate);
        } else {
            return "";
        }
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

    public Double getPcbthickness() {
        return pcbthickness;
    }

    public void setPcbthickness(Double pcbthickness) {
        this.pcbthickness = pcbthickness;
    }

    public String getMinholedia() {
        return minholedia;
    }

    public void setMinholedia(String minholedia) {
        this.minholedia = minholedia;
    }

    public Double getMintrackgap() {
        return mintrackgap;
    }

    public void setMintrackgap(Double mintrackgap) {
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
        return comments == null ? "" : comments;
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

    public Double getAzpcbdimx() {
        return azpcbdimx;
    }

    public void setAzpcbdimx(Double azpcbdimx) {
        this.azpcbdimx = azpcbdimx;
    }

    public Double getAzpcbdimy() {
        return azpcbdimy;
    }

    public void setAzpcbdimy(Double azpcbdimy) {
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

    public Double getAzdistancepcb() {
        return azdistancepcb;
    }

    public void setAzdistancepcb(Double azdistancepcb) {
        this.azdistancepcb = azdistancepcb;
    }

    public Double getAzsizeborderpanel() {
        return azsizeborderpanel;
    }

    public void setAzsizeborderpanel(Double azsizeborderpanel) {
        this.azsizeborderpanel = azsizeborderpanel;
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
        return azcomments == null ? "" : azcomments;
    }

    public void setAzcomments(String azcomments) {
        this.azcomments = azcomments;
    }

    public Double getOwnpaneldimx() {
        return ownpaneldimx;
    }

    public void setOwnpaneldimx(Double ownpaneldimx) {
        this.ownpaneldimx = ownpaneldimx;
    }

    public Double getOwnpaneldimy() {
        return ownpaneldimy;
    }

    public void setOwnpaneldimy(Double ownpaneldimy) {
        this.ownpaneldimy = ownpaneldimy;
    }

    public double getOwnpanelquantity() {
        return ownpanelquantity;
    }

    public void setOwnpanelquantity(double ownpanelquantity) {
        this.ownpanelquantity = ownpanelquantity;
    }

    public double getOwnproddays() {
        return ownproddays;
    }

    public void setOwnproddays(double ownproddays) {
        this.ownproddays = ownproddays;
    }

    public double getSgpcbdimx() {
        return sgpcbdimx;
    }

    public void setSgpcbdimx(double sgpcbdimx) {
        this.sgpcbdimx = sgpcbdimx;
    }

    public Double getSgpcbdimy() {
        return sgpcbdimy;
    }

    public void setSgpcbdimy(Double sgpcbdimy) {
        this.sgpcbdimy = sgpcbdimy;
    }

    public double getSgquantity() {
        return sgquantity;
    }

    public void setSgquantity(double sgquantity) {
        this.sgquantity = sgquantity;
    }

    public double getSgproddays() {
        return sgproddays;
    }

    public void setSgproddays(double sgproddays) {
        this.sgproddays = sgproddays;
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
        return roundDouble(restotal, 2);
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
        return roundDouble(respriceperunit, 2);
    }

    public void setRespriceperunit(double respriceperunit) {
        this.respriceperunit = respriceperunit;
    }

    public double getResfreightcost() {
        return roundDouble(resfreightcost, 2);
    }

    public void setResfreightcost(double resfreightcost) {
        this.resfreightcost = resfreightcost;
    }

    public double getRestestandtooling() {
        return roundDouble(restestandtooling, 2);
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
        return roundDouble(resweight, 2);
    }

    public void setResweight(double resweight) {
        this.resweight = resweight;
    }

    public Double getAztotdimx() {
        return roundDouble(aztotdimx, 1);
    }

    public void setAztotdimx(Double aztotdimx) {
        this.aztotdimx = aztotdimx;
    }

    public Double getAztotdimy() {
        return roundDouble(aztotdimy, 1);
    }

    public void setAztotdimy(Double aztotdimy) {
        this.aztotdimy = aztotdimy;
    }

    public double getAznrofpcb() {
        return aznrofpcb;
    }

    public void setAznrofpcb(double aznrofpcb) {
        this.aznrofpcb = aznrofpcb;
    }

    public double getResarea() {
        return resarea;
    }

    public void setResarea(double resarea) {
        this.resarea = resarea;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public byte[] getFile_file() {
        return file_file;
    }

    public void setFile_file(byte[] file_file) {
        this.file_file = file_file;
    }

    public String getGerberdata() {
        return gerberdata;
    }

    public void setGerberdata(String gerberdata) {
        this.gerberdata = gerberdata;
    }

    public String getGerberdata1() {
        return gerberdata1;
    }

    public void setGerberdata1(String gerberdata) {
        this.gerberdata1 = gerberdata;
    }

    public Double getAzprintperpanel() {
        return azprintperpanel;
    }

    public void setAzprintperpanel(Double fAzprintperpanel) {
        azprintperpanel = fAzprintperpanel;
    }

    public String getXoutallowed() {
        return xoutallowed;
    }

    public void setXoutallowed(String fXoutallowed) {
        xoutallowed = fXoutallowed;
    }

    public String getIsorderplaced() {
        return isorderplaced;
    }

    public void setIsorderplaced(String fIsorderplaced) {
        isorderplaced = fIsorderplaced;
    }

    public String getExchngrate() {
        return exchngrate;
    }

    public void setExchngrate(String exchngrate) {
        this.exchngrate = exchngrate;
    }

    public double getRestotalreorder() {
        return restotalreorder;
    }

    public void setRestotalreorder(double restotalreorder) {
        this.restotalreorder = restotalreorder;
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

    public double getSpecAccess() {
        return specAccess;
    }

    public void setSpecAccess(double specAccess) {
        this.specAccess = specAccess;
    }

    public String getLastAction() {
        try {
            User user = new User();
            //user.setId(lastUpdateBy);
            return ((User) HibernateUtil.getSessionFactory().getCurrentSession().get(User.class, lastUpdateBy)).getFirstName() + ", " + formatDate(lastUpdateOn);
        } catch (Exception e) {
            return formatDate(lastUpdateOn);
        }
    }

    public void setLastAction(String lastAction) {
        this.lastAction = lastAction;
    }

    public Date getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(Date createdOn) {
        this.createdOn = createdOn;
    }

    public String getShareToCount() {
        return shareToCount;
    }

    public void setShareToCount(String shareToCount) {
        this.shareToCount = shareToCount;
    }

    /**
     * @return the productTemplates
     */
    public List<ProductTemplate> getProductTemplates() {
        if (productTemplates == null) {
            productTemplates = new ArrayList<ProductTemplate>();
        }
        return productTemplates;
    }

    /**
     * @param productTemplates the productTemplates to set
     */
    public void setProductTemplates(List<ProductTemplate> productTemplates) {
        this.productTemplates = productTemplates;
    }

    /**
     * @return the azitechOrders
     */
    public List<AzitechOrder> getAzitechOrders() {
        return azitechOrders;
    }

    /**
     * @param azitechOrders the azitechOrders to set
     */
    public void setAzitechOrders(List<AzitechOrder> azitechOrders) {
        this.azitechOrders = azitechOrders;
    }
}
