<%@ include file="/taglibs.jsp"%>

<stripes:layout-render name="/layout/standard.jsp" language="${page.language.value}">
    <stripes:layout-component name="head">
        <style type="text/css">
            form div {
                width: 400px;
            }
            .content{
                width:50%;
                text-align:right;
            }
            .title{
                width:50%;
            }

            #ddtabs4 {
                display: none;
            }

            #specMenu hr {
                border-color: #dbdbdb;
            }

            #specMenu {
                text-align: center;
                margin: 10px 0;
            }
            .specMenuItem > div:first-child {
                border-radius: 100%;
                background: #DBDBDB;
                width: 50px;
                height: 50px;
                line-height: 48px;
                font-weight: bold;
                font-size: 1.2em;
                margin: 0 auto 10px;
                color: white;
            }

            .specMenuItem.selected > div:first-child {
                background: #4F9FEA;
            }
        </style>
        <script>
            function selectNewTab(index) {
                $('#specMenu .selected').removeClass("selected");
                $('#specMenu > div:nth-child(' + index + ') .specMenuItem').addClass("selected");
            }
        </script>
    </stripes:layout-component>
    <stripes:layout-component name="contents">
        <div id="specMenu" class="row">
            <div class="col-sm-1 col-xs-1">
                <div class="specMenuItem">
                    <div>1</div>
                    <div>PCB specification</div>
                </div>
            </div>
            <div class="col-sm-1 col-xs-1">
                <hr>
            </div>
            <div class="col-sm-1 col-xs-1">
                <div class="specMenuItem">
                    <div>2</div>
                    <div>Layout</div>
                </div>
            </div>
            <div class="col-sm-1 col-xs-1">
                <hr>
            </div>
            <div class="col-sm-2 col-xs-1">
                <div class="specMenuItem">
                    <div>3</div>
                    <div>Calculate price</div>
                </div>
            </div>
            <div class="col-sm-1 col-xs-1">
                <hr>
            </div>
            <div class="col-sm-1 col-xs-1">
                <div class="specMenuItem">
                    <div>4</div>
                    <div>Upload</div>
                </div>
            </div>
            <div class="col-sm-1 col-xs-1">
                <hr>
            </div>
            <div class="col-sm-1 col-xs-1">
                <div class="specMenuItem selected">
                    <div>5</div>
                    <div>Verify PCB</div>
                </div>
            </div>
            <div class="col-sm-1 col-xs-1">
                <hr>
            </div>
            <div class="col-sm-1 col-xs-1">
                <div class="specMenuItem">
                    <div>6</div>
                    <div>Order & delivery</div>
                </div>
            </div>
        </div>
        <div id="fckeditorWindow"></div>
        <div id="ToolTip" class="ToolTip"><table border="0" cellpadding="0" cellspacing="0"><tr><td class='ToolTipTD' id="ToolTipContent">&nbsp;</td></tr></table></div>
        <div class="container">
            <div class="header" style="padding-bottom: 0pt; margin-bottom: 10px;">
                <div style="float:right;"><a class="bulink" href="${pageContext.request.contextPath}/startup/Startup.action?home">Back To Home</a></div>
                <span id="pageHead"><c:choose>
                        <c:when test="${sessionScope.user.role.value >= 4}">Order PO${actionBean.order.quoteid}</c:when>
                        <c:otherwise>Verify specifications</c:otherwise>
                    </c:choose></span>
            </div>

            <div class="marginleft">
                <table width="85%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td align="left" valign="top" width="100%">
                            <table border="0" cellpadding="0">
                                <tr>
                                    <td colspan="2" align="left" valign="top">
                                        <div id="ddtabs4" class="ddcolortabs">
                                            <ul>
                                                <%String tab = "";%>
                                                <c:choose>
                                                    <c:when test="${actionBean.tabSelection eq 'order'}">
                                                        <%tab = "order";%>
                                                    </c:when>
                                                    <c:otherwise></c:otherwise>
                                                </c:choose>
                                                <%
                                                    String lsBlockGeneral = "display:block;width:790px", lsgeneralclass = "current", lsLayoutClass = "", lsBlockLayout = "display:none;width:790px";
                                                    System.out.println("TAB = " + tab);
                                                    if ("order".equals(tab))
                                                    {
                                                        lsBlockGeneral = "display:none;width:790px";
                                                        lsgeneralclass = "";
                                                        lsLayoutClass = "current";
                                                        lsBlockLayout = "display:block;width:790px";
                                                    }
                                                %>
                                                <c:choose>
                                                    <c:when test="${actionBean.orderMode eq 'repeat'}">
                                                        <li><a class="disabled"><span>PCB specification</span></a></li>
                                                        <li><a class="disabled"><span>Layout</span></a></li>
                                                        <li><a class="disabled"><span>Calculate Price</span></a></li>
                                                        <li><a class="disabled"><span>Upload</span></a></li>
                                                        </c:when>
                                                        <c:otherwise>
                                                        <li><a id="link_ct1" onclick="window.location = '${pageContext.request.contextPath}/qoute/Qoute.action?backToSpecification&specification=${actionBean.order.specification.id}';"><span>PCB specification</span></a></li>
                                                        <li><a id="link_ct2" onclick="window.location = '${pageContext.request.contextPath}/qoute/Qoute.action?backToSpecification&specification=${actionBean.order.specification.id}&tab=layout';"><span>Layout</span></a></li>
                                                        <li><a id="link_ct4" onclick="window.location = '${pageContext.request.contextPath}/qoute/Qoute.action?edit&specification=${actionBean.order.specification.id}';"><span>Calculate Price</span></a></li>
                                                        <li><a id="link_ct3" onclick="window.location = '${pageContext.request.contextPath}/qoute/Qoute.action?setUploads&specification=${actionBean.order.specification.id}&qoute=${actionBean.qoute.id}';"><span>Upload</span></a></li>
                                                        </c:otherwise>
                                                    </c:choose>
                                                <li><a id="link_ct5" onclick="javascript:<c:if test="${sessionScope.user.role.value < 4}">document.getElementById('pageHead').innerHTML = 'Verify specifications';</c:if>show('ct5')" class="<%=lsgeneralclass%>"><span>Verify PCB</span></a></li>
                                                <li><a id="link_ct6" onclick="javascript:<c:if test="${sessionScope.user.role.value < 4}">document.getElementById('pageHead').innerHTML = 'Order & delivery';</c:if>show('ct6')" class="<%=lsLayoutClass%>"><span>Order & delivery</span></a></li>
                                                </ul>
                                            </div>
                                            <div class="tabcontainer">
                                            <stripes:form action="/azitechorder/Order.action" method="post" id="orderForm">
                                                <div id="ct5" class="tabcontent" style="<%=lsBlockGeneral%>">
                                                    <stripes:hidden name="order"/>
                                                    <stripes:hidden name="qoute" id="qouten" value=""/>
                                                    <stripes:hidden name="specification" id="specific"/>
                                                    <stripes:hidden name="specification.user"/>
                                                    <div style="margin: 5px 0 0 6px; width: 100%;">
                                                        <cat:userAccess role="4">
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td width="50%" valign="top">
                                                                                    <table width="90%" border="0" cellpadding="0" cellspacing="0">
                                                                                        <tr>
                                                                                            <td class="title">Set status</td>
                                                                                            <td class="content">
                                                                                                <stripes:select name="order.status">
                                                                                                    <stripes:option value="Order to be confirmed" label="To be confirmed"/>
                                                                                                    <stripes:option value="Confirmed" label="Confirmed"/>
                                                                                                    <stripes:option value="In production" label="In production"/>
                                                                                                    <stripes:option value="Being tested" label="Being tested"/>
                                                                                                    <%--<stripes:option value="Being shipped" label="Being shipped"/>--%>
                                                                                                    <stripes:option value="Being delivered" label="Being delivered"/>
                                                                                                    <stripes:option value="Delivered" label="Delivered"/>
                                                                                                    <stripes:option value="On hold" label="On hold"/>
                                                                                                    <stripes:option value="Cancelled" label="Cancelled"/>
                                                                                                </stripes:select>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr><td colspan="2" align="right"><stripes:submit class="login" name="verify" value="Save"/></td></tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td valign="top">
                                                                                    <table width="90%" border="0" cellpadding="0" cellspacing="0">
                                                                                        <tr>
                                                                                            <td class="title">Delivery Date</td>
                                                                                            <td class="content" valign="top"><stripes:text name="order.deliverydate" class="textwidthadjust"/></td>
                                                                                        </tr>
                                                                                        <c:if test="${not empty actionBean.context.validationErrors['order.deliverydate']}">
                                                                                            <tr><td colspan="2" class="contenterror">Invalid Date Format</td></tr>
                                                                                        </c:if>
                                                                                        <tr><td/><td align="right" class="content10px">(dd-MM-yy)</td></tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </cat:userAccess>
                                                    </div>
                                                    <c:if test="${actionBean.order.status == 'Incomplete'}">
                                                        <div style="width:100%;margin: 5px 0 0 6px;">
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                                <tr><td height="16px"></td></tr>
                                                                <tr>
                                                                    <td  colspan="2" class="contentBigBlue">PCB</td>
                                                                </tr>
                                                                <tr><td height="16"></td></tr>
                                                            </table>
                                                        </div>
                                                    </c:if>
                                                    <div style="width:100%;margin: 5px 0 0 6px;">
                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table table-striped">
                                                            <tr>
                                                                <td>
                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <td width="50%">
                                                                                <table width="90%" border="0" cellpadding="0" cellspacing="0">
                                                                                    <tr>
                                                                                        <td class="title">Personal reference</td>
                                                                                        <td class="content">${actionBean.order.reference}</td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td>
                                                                                <table width="90%" border="0" cellpadding="0" cellspacing="0">
                                                                                    <tr>
                                                                                        <td class="title">PCB reference</td>
                                                                                        <td class="content">${actionBean.order.pcbreference}</td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr><td height="4"></td></tr>
                                                                        <tr>
                                                                            <td width="50%" valign="top">
                                                                                <table width="90%" border="0" cellpadding="0" cellspacing="0">
                                                                                    <tr>
                                                                                        <td class="title">No of layers</td>
                                                                                        <td class="content">&nbsp;<fmt:formatNumber value="${actionBean.order.layers}" maxFractionDigits="0"/></td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td>
                                                                                <table width="90%" border="0" cellpadding="0" cellspacing="0">
                                                                                    <tr>
                                                                                        <td class="title">Standard or special order?</td>
                                                                                        <td class="content">&nbsp;${actionBean.order.stspspec}</td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr><td height="4"></td></tr>
                                                                            <c:if test="${actionBean.order.stspspec == 'Special specification'}">
                                                                                <jsp:include page="special.jsp"/>
                                                                            </c:if>

                                                                        <c:if test="${actionBean.order.stspspec == 'Standard specification'}">
                                                                            <jsp:include page="standard.jsp"/>
                                                                        </c:if>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr><td height="32"></td></tr>
                                                            <tr><td class="contentBigBlue">Layout</td></tr>
                                                            <tr><td height="16"></td></tr>
                                                            <tr>
                                                                <td>
                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <td width="50%">
                                                                                <table width="90%" border="0" cellpadding="0" cellspacing="0">
                                                                                    <tr>
                                                                                        <td width="70%" class="title">Single cut or panel layout?</td>
                                                                                        <td class="content">${actionBean.order.layout}</td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <c:choose>
                                                                                <c:when test="${actionBean.order.layout == 'Panel'}">
                                                                                    <td>
                                                                                        <table width="90%" border="0" cellpadding="0" cellspacing="0">
                                                                                            <tr>
                                                                                                <td class="title" width="50%">Panelization by:</td>
                                                                                                <td class="content">${actionBean.order.azpanelization}</td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                </c:when>
                                                                                <c:otherwise><td>&nbsp;</td></c:otherwise>
                                                                            </c:choose>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr><td height="4"></td></tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                                        <c:choose>
                                                                            <c:when test="${actionBean.order.layout == 'Panel'}">
                                                                                <jsp:include page="panel.jsp"/>
                                                                            </c:when>
                                                                            <c:when test="${actionBean.order.layout == 'Single'}">
                                                                                <jsp:include page="single.jsp"/>
                                                                            </c:when>
                                                                        </c:choose>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr><td height="32"></td></tr>
                                                            <tr><td class="contentBigBlue">Upload</td></tr>
                                                            <tr>
                                                                <td>
                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                                        <tr><td height="16"></td></tr>
                                                                            <c:if test="${actionBean.order.specification != null}">
                                                                            <tr>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                                                        <c:if test="${not empty actionBean.context.validationErrors['file']}">
                                                                                            <tr>
                                                                                                <td colspan="2">
                                                                                                    <table width="90%" border="0" cellpadding="0" cellspacing="0">
                                                                                                        <tr>
                                                                                                            <td class="contenterror">
                                                                                                                <stripes:errors field="file">
                                                                                                                    <stripes:individual-error/>
                                                                                                                </stripes:errors>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr><td height="8"></td></tr>
                                                                                                    </table>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr><td height="8px"></td></tr>
                                                                                            </c:if>
                                                                                        <tr>
                                                                                            <td width="50%" valign="top">
                                                                                                <table width="90%" border="0" cellpadding="0" cellspacing="0">
                                                                                                    <tr>
                                                                                                        <td class="title" width="45%">Gerberdata (file 1)</td>
                                                                                                        <td valign="top" align="right" class="word-wrap">
                                                                                                            <c:choose>
                                                                                                                <c:when test="${actionBean.hasFile}">
                                                                                                                    <a style="color:green" target="_blank"
                                                                                                                       href="${pageContext.request.contextPath}/azidocs/downloadFile.jsp?file=/azitechData/${actionBean.order.specification.id}/${actionBean.order.specification.gerberdata}">${actionBean.order.specification.gerberdata}</a><br/>
                                                                                                                </c:when>
                                                                                                                <c:when test="${actionBean.order.date == null}">
                                                                                                                    <c:choose>
                                                                                                                        <c:when test="${actionBean.orderMode eq 'repeat'}">
                                                                                                                            <span>-</span>
                                                                                                                            <span></span>
                                                                                                                        </c:when>
                                                                                                                        <c:otherwise>
                                                                                                                            <span><stripes:file name="file"/></span>
                                                                                                                            <span><stripes:submit class="login" name="upload" value="Upload"/></span>
                                                                                                                        </c:otherwise>
                                                                                                                    </c:choose>
                                                                                                                </c:when>
                                                                                                                <c:otherwise><span>-</span></c:otherwise>
                                                                                                            </c:choose>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td width="50%" valign="top">
                                                                                                <table width="90%" border="0" cellpadding="0" cellspacing="0">
                                                                                                    <tr>
                                                                                                        <td class="title" width="45%">Gerberdata (file 2)</td>
                                                                                                        <td valign="top" align="right" class="word-wrap">
                                                                                                            <c:choose>
                                                                                                                <c:when test="${actionBean.hasFile1}">
                                                                                                                    <a style="color:green" target="_blank"
                                                                                                                       href="${pageContext.request.contextPath}/azidocs/downloadFile.jsp?file=/azitechData/${actionBean.order.specification.id}/${actionBean.order.specification.gerberdata1}">${actionBean.order.specification.gerberdata1}</a><br>
                                                                                                                </c:when>
                                                                                                                <c:when test="${actionBean.order.date == null}">
                                                                                                                    <c:choose>
                                                                                                                        <c:when test="${actionBean.orderMode eq 'repeat'}">
                                                                                                                            <span>-</span>
                                                                                                                            <span></span>
                                                                                                                        </c:when>
                                                                                                                        <c:otherwise>
                                                                                                                            <span><stripes:file name="file1"/></span>
                                                                                                                            <span><stripes:submit class="login" name="upload2" value="Upload"/></span>
                                                                                                                        </c:otherwise>
                                                                                                                    </c:choose>
                                                                                                                </c:when>
                                                                                                                <c:otherwise><span>-</span></c:otherwise>
                                                                                                            </c:choose>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </c:if>
                                                                        <tr><td height="16"></td></tr>
                                                                        <tr>
                                                                            <td>
<%--
                                                                                <c:choose>
                                                                                    <c:when test="${actionBean.order.status == 'Incomplete'}">
                                                                                        <c:choose>
                                                                                            <c:when test="${actionBean.order.date == null}">
                                                                                                <c:choose>
                                                                                                    <c:when test="${actionBean.orderMode eq 'repeat'}"><a class="btn btn-default pull-left" onclick="javascript:window.location = '#link_ct4';window.location = '${pageContext.request.contextPath}/qoute/Qoute.action?initializeReorder=&specification=${actionBean.order.specification.id}';">Back</a></c:when>
                                                                                                    <c:otherwise><a class="btn btn-default pull-left" onclick="javascript:window.location = '#link_ct4';window.location = '${pageContext.request.contextPath}/qoute/Qoute.action?setUploads&specification=${actionBean.order.specification.id}&qoute=${actionBean.qoute.id}';">Back</a></c:otherwise>
                                                                                                </c:choose>
                                                                                            </c:when>
                                                                                            <c:otherwise>
                                                                                                <a class="btn btn-default pull-left" onclick="javascript:window.location = '#link_ct4';" onclick="window.location = '${pageContext.request.contextPath}/qoute/Qoute.action?setUploads&specification=${actionBean.order.specification.id}&qoute=${actionBean.qoute.id}';">Back</a>
                                                                                            </c:otherwise>
                                                                                        </c:choose>
                                                                                    </c:when>
                                                                                    <c:otherwise><a class="btn btn-default pull-left" onclick="javascript:window.location = '#link_ct4';" onclick="window.location = '${pageContext.request.contextPath}/startup/Startup.action?home';">Back</a></c:otherwise>
                                                                                </c:choose>--%><a class="btn btn-default pull-right" onclick="selectNewTab(11); javascript:window.location = '#link_ct6';<c:if test="${sessionScope.user.role.value < 4}">document.getElementById('pageHead').innerHTML = 'Order & delivery';</c:if>show('ct6');">Next</a>

                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <div id="ct6" class="tabcontent" style="<%=lsBlockLayout%>">
                                                    <div style="width:100%;margin: 5px 0 0 6px;">
                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td>
                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                                        <c:if test="${actionBean.order.status != 'Incomplete'}">
                                                                            <tr>
                                                                                <td width="50%">
                                                                                    <table width="90%" border="0" cellpadding="0" cellspacing="0">
                                                                                        <tr><td height="2px"></td></tr>
                                                                                        <tr>
                                                                                            <td class="title">Date</td>
                                                                                            <td class="content"><fmt:formatDate pattern="HH:mm dd/MM-yyyy" value="${actionBean.order.date}"/></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="title">Status</td>
                                                                                            <td class="content">${actionBean.order.status}</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="title">Order id</td>
                                                                                            <td class="content">${actionBean.order.id}</td>
                                                                                        </tr>
                                                                                        <tr><td height="16px"></td></tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td>&nbsp;</td>
                                                                            </tr>
                                                                        </c:if>
                                                                        <tr><td colspan="2" class="contentBigBlue">Personal information</td></tr>
                                                                        <tr><td height="16px"></td></tr>
                                                                        <tr>
                                                                            <td width="50%">
                                                                                <table width="90%" border="0" cellpadding="0" cellspacing="0">
                                                                                    <tr>
                                                                                        <td class="title">User</td>
                                                                                        <td class="content">${actionBean.order.specification.user.username}</td>
                                                                                    </tr>
                                                                                    <tr><td height="4"></td></tr>
                                                                                        <cat:view label="Name" value="${actionBean.order.specification.user.fullname}"/>
                                                                                    <tr><td height="4"></td></tr>
                                                                                        <cat:view label="Phone" value="${actionBean.order.specification.user.phone}"/>
                                                                                    <tr><td height="4"></td></tr>
                                                                                        <cat:view label="Email" value="${actionBean.order.specification.user.email}"/>
                                                                                </table>
                                                                            </td>
                                                                            <td>
                                                                                <table width="90%" border="0" cellpadding="0" cellspacing="0">
                                                                                    <cat:view label="Company" value="${actionBean.order.specification.user.company}"/>
                                                                                    <tr><td height="4"></td></tr>
                                                                                        <cat:view label="Address" value="${actionBean.order.specification.user.street}"/>
                                                                                    <tr><td height="4"></td></tr>
                                                                                    <tr>
                                                                                        <td class="title">Postal Code</td>
                                                                                        <td class="content">${actionBean.order.specification.user.postalCode} ${actionBean.order.specification.user.city}</td>
                                                                                    </tr>
                                                                                    <tr><td height="4"></td></tr>
                                                                                        <cat:view label="Country" value="${actionBean.order.specification.user.country}"/>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr><td height="32"></td></tr>
                                                            <tr><td colspan="2" class="contentBigBlue">Price</td></tr>
                                                            <tr><td height="16px"></td></tr>
                                                            <tr>
                                                                <td>
                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                                        <c:if test="${not empty actionBean.context.validationErrors['ponumber']}">
                                                                            <tr>
                                                                                <td width="50%"></td>
                                                                                <td class="contenterror">
                                                                                    <stripes:errors field="ponumber">
                                                                                        <stripes:individual-error/>
                                                                                    </stripes:errors>
                                                                                </td>
                                                                            </tr>
                                                                        </c:if>
                                                                        <tr>
                                                                            <td width="50%" valign="top">
                                                                                <table width="90%" border="0" cellpadding="0" cellspacing="0">
                                                                                    <tr>
                                                                                        <td class="title">Quantity</td>
                                                                                        <td class="content"><fmt:formatNumber value="${actionBean.order.resquantity}" maxFractionDigits="0"/>&nbsp;Pcs.</td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td width="50%">
                                                                                <table width="90%" border="0" cellpadding="0" cellspacing="0">
                                                                                    <tr>
                                                                                        <td class="title">PO-number</td>
                                                                                        <c:choose>
                                                                                            <c:when test="${actionBean.order.ponumber == null}">
                                                                                                <td class="title" align="right"><stripes:text name="order.ponumber" class="textwidthadjust"/></td>
                                                                                            </c:when>
                                                                                            <c:otherwise>
                                                                                                <td class="content">${actionBean.order.ponumber}</td>
                                                                                            </c:otherwise>
                                                                                        </c:choose>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr><td height="4"></td></tr>
                                                                        <tr>
                                                                            <td width="50%">
                                                                                <table width="90%" border="0" cellpadding="0" cellspacing="0">
                                                                                    <tr>
                                                                                        <td class="title">Weight</td>
                                                                                        <td class="content">${actionBean.order.resweight}&nbsp;Kg.</td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td width="50%" valign="top">
                                                                                <table width="90%" border="0" cellpadding="0" cellspacing="0">
                                                                                    <tr>
                                                                                        <td class="title">Tooling</td>
                                                                                        <td class="content">
                                                                                            <fmt:formatNumber value="${actionBean.order.restestandtooling}" minFractionDigits="2" maxFractionDigits="2"/>&nbsp;${actionBean.order.currency}
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr><td height="4"></td></tr>
                                                                        <tr>
                                                                            <td width="50%">
                                                                                <table width="90%" border="0" cellpadding="0" cellspacing="0">
                                                                                    <tr>
                                                                                        <td class="title">Transport</td>
                                                                                        <td class="content">${actionBean.order.transport}&nbsp;
                                                                                            <c:choose>
                                                                                                <c:when test="${actionBean.order.transport == 'Express'}">- 3 days</c:when>
                                                                                                <c:when test="${actionBean.order.transport == 'Economy'}">- 5 days</c:when>
                                                                                                <c:when test="${actionBean.order.transport == 'By Ship'}">- 30 days</c:when>
                                                                                            </c:choose>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td width="50%">
                                                                                <table width="90%" border="0" cellpadding="0" cellspacing="0">
                                                                                    <tr>
                                                                                        <td class="title">Price pr. unit
                                                                                            <%-- <c:choose>
                                                                                                 <c:when test="${actionBean.order.specification.layout eq 'Single'}">item</c:when>
                                                                                                 <c:otherwise>panel</c:otherwise>
                                                                                             </c:choose>--%>
                                                                                        </td>
                                                                                        <td class="content">
                                                                                            <fmt:formatNumber value="${actionBean.order.respriceperunit}" maxFractionDigits="2" minFractionDigits="2"/>&nbsp;${actionBean.order.currency}
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr><td height="4"></td></tr>
                                                                        <tr>
                                                                            <td width="50%">
                                                                                <table width="90%" border="0" cellpadding="0" cellspacing="0">
                                                                                    <tr>
                                                                                        <td class="title">Production days</td>
                                                                                        <td class="content"><fmt:formatNumber value="${actionBean.order.resworkingdays}" maxFractionDigits="0"/> days</td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td width="50%">
                                                                                <table width="90%" border="0" cellpadding="0" cellspacing="0">
                                                                                    <tr>
                                                                                        <td class="title">Freight</td>
                                                                                        <td class="content"><fmt:formatNumber value="${actionBean.order.resfreightcost}"
                                                                                                          minFractionDigits="2" maxFractionDigits="2"/>&nbsp;${actionBean.order.currency}</td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr><td height="4"></td></tr>
                                                                        <tr>
                                                                            <td width="50%">
                                                                                <table width="90%" border="0" cellpadding="0" cellspacing="0">
                                                                                    <tr>
                                                                                        <td class="title">Total delivery time</td>
                                                                                        <td class="content"><fmt:formatNumber value="${actionBean.order.restotaldays}" maxFractionDigits="0"/> days</td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td width="50%">
                                                                                <table width="90%" border="0" cellpadding="0" cellspacing="0">
                                                                                    <tr>
                                                                                        <td class="title" valign="top">Total price</td>
                                                                                        <td class="content">
                                                                                            <c:choose>
                                                                                                <c:when test="${user.role.value > 3}">
                                                                                                    <stripes:text class="textwidthadjust" style="text-align:right;" name="order.restotal"/>&nbsp;${actionBean.order.currency}<br>
                                                                                                    <%--<stripes:submit class="login" name="verify" value="Save"/><br>--%>
                                                                                                    <stripes:submit class="login" name="updateTotal" value="Save"/><br>
                                                                                                </c:when>
                                                                                                <c:otherwise>
                                                                                                    <fmt:formatNumber value="${actionBean.order.restotal}" maxFractionDigits="2" minFractionDigits="2"/>&nbsp;${actionBean.order.currency}
                                                                                                </c:otherwise>
                                                                                            </c:choose>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr><td height="32"></td></tr>
                                                                        <tr><td colspan="2" class="contentBigBlue">Delivery</td></tr>
                                                                        <tr><td height="16px"></td></tr>
                                                                            <c:choose>
                                                                                <c:when test="${actionBean.order.status == 'Incomplete' && actionBean.order.date == null}">
                                                                                    <c:if test="${not empty actionBean.context.validationErrors['ordercomments']}">
                                                                                    <tr>
                                                                                        <td width="50%"></td>
                                                                                        <td class="contenterror">
                                                                                            <stripes:errors field="ordercomments">
                                                                                                <stripes:individual-error/>
                                                                                            </stripes:errors>
                                                                                        </td>
                                                                                    </tr>
                                                                                </c:if>
                                                                                <tr>
                                                                                    <td valign="top" width="50%">
                                                                                        <table width="90%" border="0" cellpadding="0" cellspacing="0">
                                                                                            <tr><td class="title" colspan="2">Alternative delivery address:</td></tr>
                                                                                            <tr>
                                                                                                <td class="title">Company</td>
                                                                                                <td align="right"><stripes:text name="order.company" class="textwidthadjust"/></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td class="title">Att.</td>
                                                                                                <td align="right"><stripes:text name="order.receiver" class="textwidthadjust"/></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td class="title">Address</td>
                                                                                                <td align="right"><stripes:text name="order.street" class="textwidthadjust"/></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td class="title">City</td>
                                                                                                <td align="right"><stripes:text name="order.city" class="textwidthadjust"/></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td class="title">Zip</td>
                                                                                                <td align="right"><stripes:text name="order.zip" class="textwidthadjust"/></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td class="title">Country</td>
                                                                                                <td align="right"><stripes:text name="order.country" class="textwidthadjust"/></td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                    <td valign="top">
                                                                                        <table width="90%" border="0" cellpadding="0" cellspacing="0">
                                                                                            <tr><td class="title" colspan="2">Comments:</td></tr>
                                                                                            <tr>
                                                                                                <td colspan="2">
                                                                                                    <stripes:textarea name="order.ordercomments" onblur="textCounter(this,'pgBar',1000);hideCounter('pgBar');" onkeyup="textCounter(this,'pgBar',1000)" rows="8" cols="20" style="width:315px;"></stripes:textarea>
                                                                                                        <div id="pgBar" class="progress" style="visibility:hidden"></div>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <tr>
                                                                                    <td width="50%" valign="top">
                                                                                        <table width="90%" border="0" cellpadding="0" cellspacing="0">
                                                                                            <tr>
                                                                                                <td colspan="2" class="title">Delivery address</td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td class="title">Company</td>
                                                                                                <td class="content">${actionBean.order.company}</td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td class="title">Att</td>
                                                                                                <td class="content">${actionBean.order.receiver}</td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td class="title">Address</td>
                                                                                                <td class="content">${actionBean.order.street}</td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td class="title">City</td>
                                                                                                <td class="content">${actionBean.order.city}</td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td class="title">Zip</td>
                                                                                                <td class="content">${actionBean.order.zip}</td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td class="title">Country</td>
                                                                                                <td class="content">${actionBean.order.country}</td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                    <td width="50%" valign="top">
                                                                                        <table width="90%" border="0" cellpadding="0" cellspacing="0">
                                                                                            <tr>
                                                                                                <td class="title">Comments</td>
                                                                                                <td rowspan="6" class="word-wrap content">${fn:replace(actionBean.order.ordercomments,"&0A","")}</td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr><td height="16"></td></tr>
                                                            <tr>
                                                                <td>
                                                                    <div class="actionBar">
                                                                        <c:choose>
                                                                            <c:when test="${actionBean.order.status == 'Incomplete'}">
                                                                                <c:choose>
                                                                                    <c:when test="${actionBean.order.date == null}">
                                                                                        <a class="btn btn-default pull-left" onclick="selectNewTab(9); javascript:window.location = '#link_ct5';<c:if test="${sessionScope.user.role.value < 4}">document.getElementById('pageHead').innerHTML = 'Verify specifications';</c:if>show('ct5');">Back</a>
                                                                                        <c:choose>
                                                                                            <c:when test="${actionBean.orderMode eq 'repeat'}"><a class="btn btn-default pull-right" onclick="$('#orderForm').attr('action', '${pageContext.request.contextPath}/azitechorder/Order.action?verify=&sp=r');$('#orderForm').submit();">Send Order</a></c:when>
                                                                                            <c:otherwise><a class="btn btn-default pull-right" onclick="$('#orderForm').attr('action', '${pageContext.request.contextPath}/azitechorder/Order.action?verify=');console.log('submitting');$('#orderForm').submit();console.log('submitted');">Send Order</a></c:otherwise>
                                                                                        </c:choose>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <a class="btn btn-default pull-left" onclick="selectNewTab(9); javascript:window.location = '#link_ct5';<c:if test="${sessionScope.user.role.value < 4}">document.getElementById('pageHead').innerHTML = 'Verify specifications';</c:if>show('ct5');">Back</a>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </c:when>
                                                                            <c:otherwise><a onclick="javascript:window.location = '#link_ct5';<c:if test="${sessionScope.user.role.value < 4}">document.getElementById('pageHead').innerHTML = 'Verify specifications';</c:if>show('ct5');">Back</a></c:otherwise>
                                                                        </c:choose>
                                                                        <%--<td class="login"><a onclick="window.print();">Print Receipt</a></td>--%>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                            </stripes:form>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="8"></td>
                    </tr>
                </table>
            </div>
        </div><!-- container -->
    </stripes:layout-component>
</stripes:layout-render>