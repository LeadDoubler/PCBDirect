/*
 * JxcellPosition.java
 *
 * Created on 22. oktober 2007, 22:24
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package jxcell;

/**
 * @author jro
 */

public interface JxcellPosition {

    public Position REFERENCE = new Position(1, 18);
    public Position PCBREFERENCE = new Position(2, 18);
    public Position NOOFLAYERS = new Position(3, 18);
    public Position STSPSPEC = new Position(4, 18);

    public Position FINISH = new Position(7, 18);
    public Position MATERIAL = new Position(8, 18);
    public Position COBBERTHICKNESS = new Position(9, 18);
    public Position PCBTHICKNESS = new Position(10, 18);
    public Position MINHOLEDIAMETER = new Position(11, 18);
    public Position MINTRACKGAP = new Position(12, 18);
    public Position COLORSOLDERMASK = new Position(13, 18);
    public Position OTHERMASK = new Position(14, 18);
    public Position GOLDFINGER = new Position(15, 18);
    //   public Position NOOFHOLES = new Position(16,18);
    public Position EDGEPLATING = new Position(16, 18);  //todo:added later
    public Position IMPEDANCE = new Position(17, 18);
    public Position PRESSFITREQ = new Position(18, 18); //todo:added later
    public Position BUILDUPCHOICE = new Position(19, 18);  //todo:added later

    public Position SINGLEORPANELLAYOUT = new Position(23, 18);    //Modified later
    public Position PANELIZATION = new Position(24, 18);   //Modified later

    public Position AZPCBDIMX = new Position(26, 18);
    public Position AZPCBDIMY = new Position(27, 18);
    public Position AZNOPCBX = new Position(28, 18);
    public Position AZNOPCBY = new Position(29, 18);
    public Position AZPCBDISTANCE = new Position(30, 18);
    public Position AZSIZEPANELBORDER = new Position(31, 18);
    public Position AZTOTSIZEX = new Position(32, 18);
    public Position AZTOTSIZEY = new Position(33, 18);
    public Position AZNROFPCB = new Position(34, 18);
    public Position AZPANELQUANTITY = new Position(51, 18);   //modiefied gaurav
    public Position AZPANELPRODDAYS = new Position(50, 18); //specification.azproddays

    public Position OWNPANELDIMX = new Position(37, 18);   //Modified later
    public Position OWNPANELDIMY = new Position(38, 18);   //Modified later
    public Position PCBPERPANEL = new Position(39, 18);   //Modified later
    public Position Xoutallowed = new Position(40, 18);   //Modified later
    public Position OWNPANELQUANTITY = new Position(51, 18);   //modiefied gaurav
    public Position OWNPANELQUANTITYb = new Position(51, 18); //modiefied gaurav
    public Position OWNPRODDAYS = new Position(50, 18);  //specification.ownproddays
    //public Position OWNPRODDAYSb = new Position(44,22); //

    public Position SINGLEPCBDIMX = new Position(42, 18);  //Modified later
    public Position SINGLEPCBDIMY = new Position(43, 18);  //Modified later
    public Position SINGLEQUANTITY = new Position(51, 18); //Modified later   //gaurav
    public Position SINGLEQUANTITYb = new Position(51, 18);  //modiefied gaurav
    public Position SINGLEPRODDAYS = new Position(50, 18); //specification.sgproddays    //gaurav
    //public Position SINGLEPRODDAYSb = new Position(51,22);

    public Position COUNTRY = new Position(45, 18);    //Modified later     //gaurav
    public Position TRANSPORTMODE = new Position(46, 18);  //Modified later
    public Position CURRENCY = new Position(48, 18); //Modified later

    public Position RESQUANTITY = new Position(9, 22);
    public Position RESPANELORSINGLE = new Position(9, 23);
    public Position RESPRICEPERUNIT = new Position(9, 24);
    public Position RESFREIGHT = new Position(9, 25);
    public Position RESTESTANDTOOLING = new Position(9, 26);
    public Position RESTOTAL = new Position(9, 27);
    public Position RESTOTAL_REORDER = new Position(10, 27);
    public Position RESCURRENCY = new Position(9, 28);
    public Position RESWORKINGDAYS = new Position(9, 29);
    public Position RESFREIGHTDAYS = new Position(9, 30);
    public Position RESTOTALDAYS = new Position(9, 31);
    public Position RESWEIGHT = new Position(9, 32);

    public Position RESAREA = new Position(7, 37);
    public Position EXCHANGERATE_USD = new Position(141, 14);   //USD
    public Position EXCHANGERATE_EURO = new Position(142, 14);   //EURO
    public Position EXCHANGERATE_DKK = new Position(143, 14);   //DKK

    public Position DISCOUNT = new Position(0, 11);

    public Position SCHEME_VERSION = new Position(0, 0);
}
