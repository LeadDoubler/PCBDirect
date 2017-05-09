<%@ include file="/taglibs.jsp"%>
<jsp:useBean id="pageManager" scope="page" class="com.asap.catalog.dao.manager.PageManager"/>
<jsp:useBean id="specificationManager" scope="page" class="com.asap.catalog.dao.manager.SpecManager">
    <jsp:setProperty name="specificationManager" property="user" value="${user}"/>
</jsp:useBean>
<jsp:useBean id="orderManager" scope="page" class="com.asap.catalog.dao.manager.OrderManager">
    <jsp:setProperty name="orderManager" property="user" value="${user}"/>
</jsp:useBean>

<div style="margin: 0 0 0 25px;">
    <%--<cat:part part="mysite.top" site="yes"/>--%>
    <c:choose>
        <c:when test="${user.approved == '1' && user.deactivated != 'yes'}">
            <div class="col-md-12">
                <div class="col-md-3">
                    <table width="300px" border="0" cellpadding="0" cellspacing="0">
                        <tr><td height="12"></td></tr>
                        <tr><td class="header" style="margin:0;">PCB-direct frontpage</td></tr>
                        <tr><td height="12"></td></tr>
                        <tr><td><a class="btn btn-success" href="${pageContext.request.contextPath}/specification/Specification.action">Start quotation</a></td></tr>
                        <tr><td><a class="btn btn-default" href="${pageContext.request.contextPath}/share/Sharing.action?act=q">Share quotations</a></td></tr>
                        <tr><td><a class="btn btn-default" href="${pageContext.request.contextPath}/share/Sharing.action?act=o">Share orders</a></td></tr>
                        <tr><td><a class="btn btn-default" href="${pageContext.request.contextPath}/documentation/pcbdirectdocs.jsp">Documentation</a></td></tr>
                        <tr><td><a class="btn btn-default" href="${pageContext.request.contextPath}/user/AzitechRegister.action?view&user=${user}">Personal settings</a></td></tr>
                        <tr><td><a class="btn btn-default" onclick="javascript:contactPCB(this, '${user.username}', '${user.firstName}', '${user.lastName}', '${user.company}', '${user.street}', '${user.city}', '${user.postalCode}', '${user.phone}');">Contact PCB-direct</a></td></tr>
                        <tr><td><a class="btn btn-default" href="${pageContext.request.contextPath}/user/Logout.action">Logout</a></td></tr>
                    </table>
                </div>

                <div class="col-md-8">
                    <div class="table-responsive" style="max-height: 380px;">
                        <table class="table table-striped">

                            <thead>
                                <tr>
                                    <td width="5%" style="border-left:none;">&nbsp;</td>
                                    <td width="30%" style="border-left:none;">Reference</td>
                                    <td width="35%">PCB Name</td>
                                    <td width="10%">Layers</td>
                                    <td width="10%">Delete</td>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="spec" items="${specificationManager.userSpecs}" varStatus="loopid">
                                    <c:choose>
                                        <c:when test="${spec.specAccess eq 9}">
                                            <c:choose>
                                                <c:when test="${spec.isorderplaced eq 'Y'}"><tr class="gray${loopid.index%2}" onclick="window.location = '${pageContext.request.contextPath}/qoute/Qoute.action?initializeReorder=&specification=${spec.id}';" style="font-style:italic;cursor:pointer;color:#9F9F9F"></c:when>
                                                <c:otherwise><tr class="gray${loopid.index%2}" style="cursor:pointer" onclick="window.location = '${pageContext.request.contextPath}/specification/Specification.action?specification=${spec.id}';"></c:otherwise>
                                                </c:choose>
                                            </c:when>
                                            <c:otherwise>
                                                <c:choose>
                                                    <c:when test="${spec.specAccess eq 0}"><tr class="gray${loopid.index%2}" style="cursor:pointer" onclick="window.location = '${pageContext.request.contextPath}/specification/Specification.action?specification=${spec.id}';"></c:when>
                                                <c:when test="${spec.specAccess eq 1}"><tr class="gray${loopid.index%2}" style="cursor:pointer" onclick="window.location = '${pageContext.request.contextPath}/specification/Specification.action?viewAndOrder&specification=${spec.id}';"></c:when>
                                                <c:when test="${spec.specAccess eq 2}"><tr class="gray${loopid.index%2}" style="cursor:pointer" onclick="window.location = '${pageContext.request.contextPath}/specification/Specification.action?viewOnly&specification=${spec.id}';"></c:when>
                                                    <c:otherwise></c:otherwise>
                                                </c:choose>
                                            </c:otherwise>
                                        </c:choose>
                                        <td width="5%">
                                            <c:choose>
                                                <c:when test="${spec.specAccess eq 9}"><img src="${pageContext.request.contextPath}/images/gr1.png" width="12px" height="12px" title="Owned"/></c:when>
                                                <c:when test="${spec.specAccess eq 0}"><img src="${pageContext.request.contextPath}/images/yl1.png" width="12px" height="12px" title="Shared (Full Access)"/></c:when>
                                                <c:when test="${spec.specAccess eq 1}"><img src="${pageContext.request.contextPath}/images/yl1.png" width="12px" height="12px" title="Shared (View And Order Access)"/></c:when>
                                                <c:when test="${spec.specAccess eq 2}"><img src="${pageContext.request.contextPath}/images/yl1.png" width="12px" height="12px" title="Shared (View Only)"/></c:when>
                                                <c:otherwise>&nbsp;</c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td width="40%"><cat:str value="${spec.reference}" length="25"/></td>
                                        <td width="35%"><cat:str value="${spec.pcbreference}" length="22"/></td>
                                        <td width="10%" align="center"><fmt:formatNumber value="${spec.layers}" maxFractionDigits="0"/></td>
                                        <c:choose>
                                            <c:when test="${spec.specAccess eq 9}">
                                                <c:choose>
                                                    <c:when test="${spec.isorderplaced == 'Y' || not empty spec.productTemplates || not empty spec.azitechOrders}"><td width="10%" align="center"><img src="${pageContext.request.contextPath}/images/del0.png" alt="locked"></td></c:when>
                                                    <c:otherwise><td width="10%" align="center" onmousedown="if (confirm('Are you sure you want to delete this specification?')) {
                                                                window.location = '${pageContext.request.contextPath}/specification/Specification.action?delete&specification=${spec.id}';
                                                                            return false;
                                                                        } else
                                                                            return false;"><img src="${pageContext.request.contextPath}/images/del0.png" onmouseover="this.src = '${pageContext.request.contextPath}/images/del1.png';" onmouseout="this.src = '${pageContext.request.contextPath}/images/del0.png';" alt="delete"></td></c:otherwise>
                                                    </c:choose>
                                                </c:when>
                                                <c:otherwise><td width="10%" align="center">&nbsp;</td></c:otherwise>
                                        </c:choose>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                </div>

            </div>

            <%--  </td>
              <td align="right" valign="top" width="504px">
                  <table width="96%" align="right" border="0" cellpadding="0" cellspacing="0">
                      <tr><td height="15"></td></tr>--%>
            <%--<tr><td align="right">--%>
            <%--<img height="55" width="150" src="${pageContext.request.contextPath}/images/logo.png"/>--%>
            <%--</td></tr>--%>
            <%--
            <tr><td class="title" align="left" style="font-weight: bold;">Quotations:</td></tr>
            <tr><td height="8"></td></tr>
            
            <tr>
                <td class="rounded_leftrightborder">
                    
                </td>
            </tr>
            
        </table>
    </td>
  </tr>--%>
            <tr>
                <td colspan="2" align="right" valign="top">
                    <table width="839px" border="0" cellspacing="0" cellpadding="0" align="left">
                        <tr>
                            <td height="16"></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="right" valign="top">

                                <table width="825px" border="0" cellpadding="0" cellspacing="0">
                                    <tr><td class="title" align="left" style="font-weight: bold;">Orders:</td></tr>
                                    <tr><td height="8"></td></tr>

                                    <tr>
                                        <td class="rounded_leftrightborder">

                                            <div class="table-responsive">
                                                <table class="table table-striped">
                                                    <thead>
                                                        <tr>
                                                            <td width="3%" style="border-left:none;">&nbsp;</td>
                                                            <td width="12%" style="border-left:none;">ID</td>
                                                            <td width="13%">Your PO-nr.</td>
                                                            <td width="10%">Status</td>
                                                            <td width="10%">Order date</td>
                                                            <td width="10%">Delivery date</td>
                                                            <td width="15%">PCB name</td>
                                                            <td width="5%">Quantity</td>
                                                            <td width="15%">Total</td>
                                                            <td width="7%">Repeat<br/>order</td>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="order" items="${orderManager.orders}" varStatus="loopid">
                                                            <tr class="gray${loopid.index%2}" style="cursor:pointer">
                                                                <td width="1%">
                                                                    <c:choose>
                                                                        <c:when test="${order.orderAccess eq 9}"><img src="${pageContext.request.contextPath}/images/gr1.png" width="12px" height="12px" title="Owned"/></c:when>
                                                                        <c:when test="${order.orderAccess eq 0}"><img src="${pageContext.request.contextPath}/images/yl1.png" width="12px" height="12px" title="Shared"/></c:when>
                                                                        <c:when test="${order.orderAccess eq 1}"><img src="${pageContext.request.contextPath}/images/yl1.png" width="12px" height="12px" title="Shared"/></c:when>
                                                                        <c:otherwise>&nbsp;</c:otherwise>
                                                                    </c:choose>
                                                                </td>
                                                                <td width="12%" onclick="window.location = '${pageContext.request.contextPath}/azitechorder/Order.action?viewReceipt&order=${order.id}';">PO${order.quoteid}</td>
                                                                <td width="13%" onclick="window.location = '${pageContext.request.contextPath}/azitechorder/Order.action?viewReceipt&order=${order.id}';"><cat:str value="${order.ponumber}" length="15"/></td>
                                                                <td width="10%" align="center" onclick="window.location = '${pageContext.request.contextPath}/azitechorder/Order.action?viewReceipt&order=${order.id}';"><cat:str value="${order.status}" length="12"/></td>
                                                                <td width="10%" align="center" onclick="window.location = '${pageContext.request.contextPath}/azitechorder/Order.action?viewReceipt&order=${order.id}';" title="<fmt:formatDate pattern="HH:mm dd/MM-yy" value="${order.date}"/>"><fmt:formatDate pattern="dd-MM-yy" value="${order.date}"/></td>
                                                                <td width="10%" align="center" onclick="window.location = '${pageContext.request.contextPath}/azitechorder/Order.action?viewReceipt&order=${order.id}';"><fmt:formatDate pattern="dd/MM-yy" value="${order.deliverydate}"/></td>
                                                                <td width="15%" align="center" onclick="window.location = '${pageContext.request.contextPath}/azitechorder/Order.action?viewReceipt&order=${order.id}';"><cat:str value="${order.pcbreference}" length="15"/></td>
                                                                <td width="5%" align="center" onclick="window.location = '${pageContext.request.contextPath}/azitechorder/Order.action?viewReceipt&order=${order.id}';"><fmt:formatNumber value="${order.resquantity}" maxFractionDigits="0"/></td>
                                                                <%--<td width="53"><fmt:formatNumber value="${order.restotaldays}" maxFractionDigits="0"/></td>--%>
                                                                <td width="15%" align="right" onclick="window.location = '${pageContext.request.contextPath}/azitechorder/Order.action?viewReceipt&order=${order.id}';"><fmt:formatNumber value="${order.restotal}" minFractionDigits="2"/> ${order.currency}</td>
                                                                <c:choose>
                                                                    <c:when test="${order.orderAccess ne 1}">
                                                                        <td width="8%" align="center"><img src="${pageContext.request.contextPath}/images/repeat.png" onmousedown="window.location = '${pageContext.request.contextPath}/qoute/Qoute.action?initializeReorder=&specification=${order.specification.id}';" onmouseover="this.src = '${pageContext.request.contextPath}/images/repeat_green.png';" onmouseout="this.src = '${pageContext.request.contextPath}/images/repeat.png';" alt="Repeat order"></td>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                        <td width="8%" align="center"><img title="Insufficient access for repeat order" src="${pageContext.request.contextPath}/images/repeat.png" alt="Insufficient Access"></td>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>

                                </table>
                            </td>
                        </tr>
                        <tr><td height="16"></td></tr>
                    </table>
                </td>
            </tr>
        </table>
    </c:when>
    <c:otherwise>
        <table border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="40%" align="left" valign="top" class="title">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr><td height="12"></td></tr>
                        <tr><td class="header" style="margin:0 30px 0 0;">PCB-direct frontpage</td></tr>
                        <tr><td height="20"></td></tr>
                        <tr><td class="contenterror" style="font-size:14px;font-weight:bold;">You have yet not been approved by Azitech</td></tr>
                        <tr><td height="20"></td></tr>
                        <tr><td><a class="bulink" href="${pageContext.request.contextPath}/user/Logout.action">Logout</a></td></tr>
                    </table>
                </td>
            <tr>
        </table>
    </div>
</c:otherwise>
</c:choose>

<%--<cat:part part="mysite.bottom" site="yes"/>--%>
</div>