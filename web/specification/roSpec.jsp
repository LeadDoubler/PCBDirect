<%--
  Created by IntelliJ IDEA.
  User: Gaurav
  Time: 1:26:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/taglibs.jsp"%>

<stripes:layout-render name="/layout/standard.jsp" title="Printed circuit board" home="Y">
    <stripes:layout-component name="contents">
        <stripes:form action="/specification/Specification.action" method="post" id="rospecForm">
            <stripes:hidden name="specification" id="specific"/>
            <stripes:hidden name="specification.user"/>

            <div id="notused" class="marginleft" style="display:none;">
                <stripes:text name="specification.country"/>
                <stripes:text name="specification.sgquantity"/>
                <stripes:text name="specification.azquantity"/>
                <stripes:text name="specification.ownpanelquantity"/>
                <stripes:text name="specification.transport"/>
                <stripes:text name="specification.currency"/>
                <stripes:text name="specification.restotal"/>
                <stripes:text name="specification.resquantity"/>
                <stripes:text name="specification.respanelorsingleunit"/>
                <stripes:text name="specification.respriceperunit"/>
                <stripes:text name="specification.resfreightcost"/>
                <stripes:text name="specification.restestandtooling"/>
                <stripes:text name="specification.rescurrency"/>
                <stripes:text name="specification.resworkingdays"/>
                <stripes:text name="specification.resfreightdays"/>
                <stripes:text name="specification.restotaldays"/>
                <stripes:text name="specification.resweight"/>
                <stripes:text name="specification.resarea"/>
            </div>

            <div class="marginleft">
            <table width="85%" border="0" cellspacing="0" cellpadding="0">
            <%
                String lsBlockGeneral = "display:block;", lsgeneralclass = "current", lsLayoutClass = "", lsBlockLayout = "display:none;";
                if (request.getParameter("tab") != null && "layout".equals(request.getParameter("tab")))
                {
                    lsBlockGeneral = "display:none;";
                    lsgeneralclass = "";
                    lsLayoutClass = "current";
                    lsBlockLayout = "display:block;";
                }
            %>
                <tr>
                    <td align="left" valign="top" width="100%">
                        <table border="0" cellpadding="0">
                          <tr>
                            <td colspan="2" align="left" valign="top">
                                <div id="ddtabs4" class="ddcolortabs">
                                    <ul>
                                        <li><a id="link_ct1" onclick="javascript:show('ct1')" class="<%=lsgeneralclass%>"><span>PCB specification</span></a></li>
                                        <li><a id="link_ct2" onclick="javascript:show('ct2');" class="<%=lsLayoutClass%>"><span>Layout</span></a></li>
                                        <li><a id="link_ct4" onclick="window.location = '${pageContext.request.contextPath}/qoute/Qoute.action?initializeReorder=&specification=${actionBean.specification.id}'"><span>Calculate Price</span></a></li>
                                        <li><a id="link_ct3" class="disabled"><span>Upload</span></a></li>
                                        <li><a id="link_ct5" class="disabled"><span>Verify PCB</span></a></li>
                                        <li><a id="link_ct6" class="disabled"><span>Order & delivery</span></a></li>
                                    </ul>
                                </div>
                                <div class="tabcontainer">
                                    <div id="ct1" class="tabcontent" style="<%=lsBlockGeneral%>">
                                        <table width="600" border="0" cellpadding="0">
                                            <tr><td height="8"></td></tr>
                                            <tr>
                                                <td>
                                                    <table width="100%" border="0" cellpadding="0">
                                                        <tr>
                                                            <td style="width:295px" valign="top">
                                                                <span class="title">Your reference :</span><br/>
                                                                <span>${actionBean.specification.reference}</span><br/>
                                                            </td>
                                                            <td valign="top">
                                                                <span class="title">PCB name :</span><br/>
                                                                <span>${actionBean.specification.pcbreference}</span><br/>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr><td height="8"></td></tr>
                                            <tr>
                                                <td>
                                                    <table width="100%" border="0" cellpadding="0">
                                                        <tr>
                                                            <td style="width:295px" valign="top">
                                                                <div>
                                                                    <span class="title">Layers :</span><br/>
                                                                    <span>
                                                                        ${actionBean.specification.layers}
                                                                    </span>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div>
                                                                    <span class="title">Material :</span><br/>
                                                                    <span>${actionBean.specification.material}</span>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr><td height="8px"></td></tr>
                                            <tr>
                                                <td>
                                                    <table width="100%" border="0" cellpadding="0">
                                                        <tr>
                                                            <td style="width:295px">
                                                                <div>
                                                                    <span class="title">Surface finish :</span><br/>
                                                                    <span>${actionBean.specification.finish}</span>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div>
                                                                    <span class="title">PCB thickness :</span><br/>
                                                                    <span>${actionBean.specification.pcbthickness}</span>
                                                                    <span class="content10px">mm</span>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr><td height="8"></td></tr>
                                            <tr>
                                                <td>
                                                    <table width="100%" border="0" cellpadding="0">
                                                        <tr>
                                                            <td style="width:295px">
                                                                <div>
                                                                    <span class="title">Copper thickness :</span><br/>
                                                                    <span>${actionBean.specification.copperthickness}</span>
                                                                    <span class="content10px">um</span>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div>
                                                                    <span class="title">Color of soldermask :</span><br/>
                                                                    <span>${actionBean.specification.colorsoldermask}</span>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr><td height="8"></td></tr>
                                            <tr>
                                                <td>
                                                    <table width="100%" border="0" cellpadding="0">
                                                        <tr>
                                                            <td style="width:295px">
                                                                <div>
                                                                    <span class="title">Min. hole diameter :</span><br/>
                                                                    <span>${actionBean.specification.minholedia}</span>
                                                                    <span class="content10px">mm</span>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div>
                                                                    <span class="title">Min. track/gap :</span><br/>
                                                                    <span>${actionBean.specification.mintrackgap}</span>
                                                                    <span class="content10px">mm</span>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr><td height="8"></td></tr>
                                            <tr>
                                                <td>
                                                    <table width="100%" border="0" cellpadding="0">
                                                        <tr>
                                                            <td style="width:295px" valign="top">
                                                                <div>
                                                                    <span class="title">Special options :</span><br/>
                                                                    <span>${actionBean.specification.stspspec}</span>
                                                                </div>
                                                            </td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr><td height="8px"></td></tr>
                                            <tr><td><div><cat:sheet x="60" y="18"/></div></td></tr>
                                            <tr>
                                                <td>
                                                    <div id="special" style="display: none">
                                                        <table width="100%" border="0" cellpadding="0">
                                                            <tr>
                                                                <td valign="top">
                                                                    <div>
                                                                        <span class="title">Other type of mask :</span><br/>
                                                                        <span>${actionBean.specification.othermask}</span>
                                                                    </div>
                                                                </td>
                                                                <td valign="top">
                                                                    <div>
                                                                        <span class="title">Impedance :</span><br/>
                                                                        <span>${actionBean.specification.impedance}</span>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr><td height="8"></td></tr>
                                                            <tr>
                                                                <td valign="top">
                                                                    <div>
                                                                        <span class="title">Gold finger :</span><br/>
                                                                        <span>${actionBean.specification.goldfinger}</span>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div>
                                                                        <span class="title">Edge plating :</span><br/>
                                                                        <span>${actionBean.specification.edgplating}</span>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr><td height="8"></td></tr>
                                                            <tr>
                                                                <td valign="top">
                                                                    <div>
                                                                        <span class="title">Pressfit requirements :</span><br/>
                                                                        <span>${actionBean.specification.edgplating}</span>
                                                                    </div>
                                                                </td>
                                                                <td valign="top">
                                                                    <div>
                                                                        <span class="title">Choice of Build-up :</span><br/>
                                                                        <span>${actionBean.specification.buildupchoice}</span>
                                                                    </div>
                                                                </td>
                                                                <td></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr><td height="8"></td></tr>
                                            <tr>
                                                <td>
                                                    <table width="100%" border="0" cellpadding="0">
                                                        <tr>
                                                            <td style="width:295px" valign="top">
                                                                <div>
                                                                    <span class="title">Comments :</span><br/>
                                                                    <span>
                                                                    <c:choose>
                                                                        <c:when test="${actionBean.specification.comments eq null or actionBean.specification.comments eq ''}">-</c:when>
                                                                        <c:otherwise>${actionBean.specification.comments}</c:otherwise>
                                                                    </c:choose>
                                                                    </span>
                                                                </div>
                                                            </td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table border="0" cellpadding="0">
                                                        <tr>
                                                            <td class="login"><a onclick="javascript:window.location = '#link_ct2';show('ct2');">Next</a></td>
                                                            <td></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr><td height="16"></td></tr>
                                        </table>
                                    </div>
                                    <div id="ct2" class="tabcontent" style="<%=lsBlockLayout%>">
                                        <table width="550" border="0" cellpadding="0" cellspacing="0">
                                            <tr><td height="8"></td></tr>
                                            <tr>
                                                <td>
                                                    <div>
                                                        <span class="title">Single or panel?</span><br/>
                                                        <span>${actionBean.specification.layout}</span>
                                                        <span class="content10px">&nbsp;</span>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <div>
                                                        <cat:sheet x="61" y="18"/>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td id="panel" style="display: none">
                                                    <table width="100%" border="0" cellpadding="0">
                                                        <tr>
                                                            <td height="8"></td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top">
                                                                <div>
                                                                    <span class="title">Panelization options :</span><br/>
                                                                    <span class="form_right">${actionBean.specification.azpanelization}</span>
                                                                </div>
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                        <tr><td height="8"></td></tr>
                                                        <tr>
                                                            <td>
                                                                <span class="title">X-out allowed :</span><br/>
                                                                <span class="form_right">${actionBean.specification.xoutallowed}</span>
                                                            </td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" id="azitech" style="display: none">
                                                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                                    <tr><td height="8"></td></tr>
                                                                    <tr>
                                                                        <td valign="top">
                                                                            <span class="title">PCB Dimension :</span><br/>
                                                                            <span class="form_right">${actionBean.specification.xoutallowed}&nbsp;mm(X-direction)
                                                                            </span>
                                                                        </td>
                                                                        <td valign="top">
                                                                            <span class="title">PCB Dimension :</span><br/>
                                                                            <span class="form_right">${actionBean.specification.azpcbdimy}&nbsp;mm(Y-direction)
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr><td height="8"></td></tr>
                                                                    <tr>
                                                                        <td valign="top">
                                                                            <span class="title">No. Of PCB's :</span><br/>
                                                                            <span class="form_right">${actionBean.specification.aznrofpcbx}&nbsp;pcs.(X-direction)
                                                                            </span>
                                                                        </td>
                                                                        <td valign="top">
                                                                            <span class="title">No. Of PCB's :</span><br/>
                                                                            <span class="form_right">${actionBean.specification.aznrofpcby}&nbsp;pcs.(Y-direction)
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr><td height="8"></td></tr>
                                                                    <tr>
                                                                        <td valign="top">
                                                                            <span class="title">Distance between two PCB's :</span><br/>
                                                                            <span class="form_right">${actionBean.specification.azdistancepcb}&nbsp;mm
                                                                            </span>
                                                                        </td>
                                                                        <td valign="top">
                                                                            <span class="title">Size of panel border?</span><br/>
                                                                            <span class="form_right">${actionBean.specification.azsizeborderpanel}&nbsp;mm
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr><td height="16"></td></tr>
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            <table width="100%" cellpadding="2" cellspacing="2" border="0" style="border:1px dashed #0d507a">
                                                                                <tr><td height="4"></td></tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <span class="title">Panel dimension (X) (total size)</span><br/>
                                                                                        <span id="panx" class="content10px"><span id="xtotal">${actionBean.specification.aztotdimx}</span></span><br><br>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <span class="title">Panel dimension (Y) (total size)</span><br/>
                                                                                        <span id="pany" class="content10px"><span id="ytotal" >${actionBean.specification.aztotdimy}</span></span><br><br>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <span class="title">Numbers of PCB's in the panel</span><br/>
                                                                                        <span id="pcbs" class="content10px"><span id="totalPCB">${actionBean.specification.aznrofpcb}</span> pcs.</span>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr><td height="4"></td></tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    <tr><td height="16"></td></tr>
                                                                    <tr>
                                                                        <td colspan="2"><cat:sheet x="62" y="18"/></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" id="own" style="display: none">
                                                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                                    <tr><td height="8"></td></tr>
                                                                        <tr>
                                                                            <td valign="top">
                                                                                <span class="title">PCB's per panel :</span><br/>
                                                                                <span class="form_right">${actionBean.specification.azprintperpanel}</span>
                                                                            </td>
                                                                            <td valign="top"></td>
                                                                        </tr>
                                                                        <tr><td height="8"></td></tr>
                                                                        <tr>
                                                                            <td valign="top">
                                                                                <span class="title">Panel-dimension :</span><br/>
                                                                                <span class="form_right">${actionBean.specification.ownpaneldimx}&nbsp;mm(X-direction)
                                                                                </span>
                                                                            </td>
                                                                            <td valign="top">
                                                                                <span class="title">Panel-dimension :</span><br/>
                                                                                <span class="form_right">${actionBean.specification.ownpaneldimx}&nbsp;mm(Y-direction)</span>
                                                                            </td>
                                                                        </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td id="single" style="display: none">
                                                    <table width="100%" border="0" cellpadding="0">
                                                        <tr><td height="8"></td></tr>
                                                        <tr>
                                                            <td valign="top">
                                                                <span class="title">PCB-dimension :</span><br/>
                                                                <span class="form_right">${actionBean.specification.sgpcbdimx}&nbsp;mm (X-direction)
                                                                </span>
                                                            </td>
                                                            <td valign="top">
                                                                <span class="title">PCB-dimension :</span><br/>
                                                                <span class="form_right">${actionBean.specification.sgpcbdimy}&nbsp;mm (Y-direction)
                                                                </span>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>

                                            <tr><td height="8"></td></tr>
                                            <tr>
                                                <td>
                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td><span class="title">Comments :</span><br/>
                                                                <span class="form_right">
                                                                    <c:choose>
                                                                        <c:when test="${actionBean.specification.azcomments eq null or actionBean.specification.azcomments eq ''}">-</c:when>
                                                                        <c:otherwise>${actionBean.specification.azcomments}</c:otherwise>
                                                                    </c:choose>
                                                                </span>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>

                                            <tr><td height="16"></td></tr>
                                            <tr>
                                                <td>
                                                    <table border="0" cellpadding="0">
                                                        <tr>
                                                            <td class="login"><a onclick="javascript:window.location = '#link_ct1';show('ct1');">Back</a></td>
                                                            <td class="login"><a onclick="window.location = '${pageContext.request.contextPath}/qoute/Qoute.action?initializeReorder=&specification=${actionBean.specification.id}'">Next</a></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr><td height="16"></td></tr>
                                        </table>
                                    </div>
                                </div>
                            </td>
                          </tr>
                        </table>
                    </td>
                  </tr>
                  <tr><td height="8"></td></tr>
            </table>
        </div>
        </stripes:form>

    </stripes:layout-component>
</stripes:layout-render>

<script type="text/javascript">
    Event.observe(window, 'load',
            function() {
                changeSpecial('${actionBean.specification.stspspec}');
                if ('${actionBean.specification.layout}' == 'Single')
                {
                    $('panel').hide();
                    $('single').show();
                }
                if ('${actionBean.specification.layout}' == 'Panel')
                {
                    $('panel').show();
                    $('single').hide();
                }
                changePanelization('${actionBean.specification.azpanelization}');
            }
            );
</script>