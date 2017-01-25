<%@ include file="/taglibs.jsp"%>

<stripes:layout-render name="/layout/standard.jsp" language="${page.language.value}">
    <stripes:layout-component name="head">
        <style type="text/css">
            form div {
                border-top: 1px white solid;
                border-bottom: 1px white solid;
                width: 400px;
            }
        </style>
    </stripes:layout-component>
    <stripes:layout-component name="contents">
        <div id="fckeditorWindow"></div>
             <div id="ToolTip" class="ToolTip"><table border="0" cellpadding="0" cellspacing="0"><tr><td class='ToolTipTD' id="ToolTipContent">&nbsp;</td></tr></table></div>
                <div class="container">
                    <div class="header" style="padding-bottom: 0pt; margin-bottom: 10px;">
                        <div style="float:right;"><a class="bulink" href="${pageContext.request.contextPath}/startup/Startup.action?home">Back To Home</a></div>
                        <span id="pageHead">
                            <c:choose>
                                <c:when test="${sessionScope.user.role.value >= 4}">Order PO${actionBean.order.quoteid}</c:when>
                                <c:otherwise>Order & delivery</c:otherwise>
                            </c:choose>
                        </span>
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
                                                    <li><a id="link_ct1" class="disabled"><span>PCB specification</span></a></li>
                                                    <li><a id="link_ct2" class="disabled"><span>Layout</span></a></li>
                                                    <li><a id="link_ct4" class="disabled"><span>Calculate Price</span></a></li>
                                                    <li><a id="link_ct3" class="disabled"><span>Upload</span></a></li>
                                                    <li><a id="link_ct5" class="disabled"><span>Verify PCB</span></a></li>
                                                    <li><a id="link_ct6" class="disabled"><span>Order & delivery</span></a></li>
                                                </ul>
                                            </div>
                                            <div class="tabcontainer">
                                                <div id="ct4" class="tabcontent" style="width:790px">
                                                    <stripes:form action="/azitechorder/Order.action" method="post" >
                                                    <stripes:hidden name="order"/>

                                                        <%--<div style="width:100%;">--%>
                                                            <%--<table width="95%" border="0" cellpadding="0" cellspacing="0">--%>
                                                                <%--<tr>--%>
                                                                    <%--<td colspan="2" class="contentBigBlue" align="center">Receipt</td>--%>
                                                                <%--</tr>--%>
                                                                <%--<tr><td height="32px"></td></tr>--%>
                                                            <%--</table>--%>
                                                        <%--</div>--%>
                                                        <div style="width:100%;margin: 5px 0 0 6px;">
                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td>
                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <td width="50%">
                                                                                <table width="90%" border="0" cellpadding="0" cellspacing="0">
                                                                                    <tr>
                                                                                        <td class="title">User</td>
                                                                                        <td class="content">${actionBean.order.user.username}</td>
                                                                                    </tr>
                                                                                    <tr><td height="4"></td></tr>
                                                                                    <cat:view label="Name" value="${actionBean.order.user.fullname}"/>
                                                                                    <tr><td height="4"></td></tr>
                                                                                    <cat:view label="Phone" value="${actionBean.order.user.phone}"/>
                                                                                    <tr><td height="4"></td></tr>
                                                                                    <cat:view label="Email" value="${actionBean.order.user.email}"/>
                                                                                </table>
                                                                            </td>
                                                                            <td>
                                                                                <table width="90%" border="0" cellpadding="0" cellspacing="0">
                                                                                    <cat:view label="Company" value="${actionBean.order.user.company}"/>
                                                                                    <tr><td height="4"></td></tr>
                                                                                    <cat:view label="Address" value="${actionBean.order.user.street}"/>
                                                                                    <tr><td height="4"></td></tr>
                                                                                    <tr>
                                                                                        <td class="title">Postal Code</td>
                                                                                        <td class="content">${actionBean.order.user.postalCode} ${actionBean.order.user.city}</td>
                                                                                    </tr>
                                                                                    <tr><td height="4"></td></tr>
                                                                                    <cat:view label="Country" value="${actionBean.order.user.country}"/>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr><td height="32"></td></tr>
                                                            <tr>
                                                                <td>
                                                                    <div>
                                                                        <table width="95%" border="0" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td class="contentBigBlue">PCB</td>
                                                                                <td></td>
                                                                            </tr>
                                                                        </table>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr><td height="8"></td></tr>
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
                                                            <tr>
                                                                <td>
                                                                    <div>
                                                                        <table width="95%" border="0" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td class="contentBigBlue">Layout</td>
                                                                                <td></td>
                                                                            </tr>
                                                                        </table>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr><td height="8"></td></tr>
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
                                                                            <td>&nbsp;</td>
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
                                                            <tr>
                                                                <td>
                                                                    <div>
                                                                        <table width="95%" border="0" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td class="contentBigBlue">Order & delivery</td>
                                                                                <td></td>
                                                                            </tr>
                                                                        </table>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr><td height="8"></td></tr>
                                                            <tr>
                                                                <td>
                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
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
                                                                                            <c:when test="${actionBean.order.date == null}">
                                                                                                <td class="title" align="right"><stripes:text name="order.ponumber" class="textwidthadjust"/></td>
                                                                                            </c:when>
                                                                                            <c:otherwise>
                                                                                                <c:choose>
                                                                                                    <c:when test="${actionBean.order.ponumber != null}"><td class="content">${actionBean.order.ponumber}</td></c:when>
                                                                                                    <c:otherwise><td class="content">-</td></c:otherwise>
                                                                                                </c:choose>
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
                                                                                        <td class="title">Price pr. unit</td>
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
                                                                                            <%--<c:choose>--%>
                                                                                                <%--<c:when test="${user.role.value > 3}">--%>
                                                                                                    <%--<stripes:text style="text-align:right;" name="order.restotal"/>&nbsp;${actionBean.order.currency}<br>--%>
                                                                                                    <%--<stripes:submit class="login" name="verify" value="Save"/><br>--%>
                                                                                                <%--</c:when>--%>
                                                                                                <%--<c:otherwise>--%>
                                                                                                    <fmt:formatNumber value="${actionBean.order.restotal}" maxFractionDigits="2" minFractionDigits="2"/>&nbsp;${actionBean.order.currency}
                                                                                                <%--</c:otherwise>--%>
                                                                                            <%--</c:choose>--%>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr><td height="32"></td></tr>
                                                            <tr>
                                                                <td>
                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                                    <c:choose>
                                                                        <c:when test="${actionBean.order.status == 'Incomplete' && actionBean.order.date == null}">
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
                                                                                        <tr><td><cat:in name="order.ordercomments" label="Comments" type="textarea" rows="8" style="width:315px;"/></td></tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <tr>
                                                                                <td width="50%" valign="top">
                                                                                    <table width="90%" border="0" cellpadding="0" cellspacing="0">
                                                                                        <tr>
                                                                                            <td colspan="2" class="title">Alternative Delivery address</td>
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
                                                            <tr><td height="8"></td></tr>
                                                            <tr>
                                                                <td>
                                                                    <c:choose>
                                                                        <c:when test="${user.role.value > 3}"></c:when>
                                                                        <c:otherwise>
                                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                                                <tr><td height="8px"></td></tr>
                                                                                <tr><td class="contenterror" style="font-size:13px">Your order has been delivered successfully.</td></tr>
                                                                                <tr><td height="2px"></td></tr>
                                                                                <tr><td class="contenterror" style="font-size:13px">PCB-direct staff will review it and confirm the delivery date as soon as possible.</td></tr>
                                                                            </table>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </td>
                                                            </tr>
                                                            <tr><td height="8"></td></tr>
                                                            <tr>
                                                                <td>
                                                                    <table border="0" cellpadding="0">
                                                                        <tr>
                                                                            <td><input type="button" class="login" style="cursor:pointer" value="Back to home" onclick="window.location='${pageContext.request.contextPath}/startup/Startup.action?home';"/></td>
                                                                            <td><input type="button" class="login" style="cursor:pointer" value="Print receipt" onclick="window.print();"/></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    </stripes:form>
                                                </div>
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