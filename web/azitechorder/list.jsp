<%@ include file="/taglibs.jsp"%>
<jsp:useBean id="orderManager" scope="page" class="com.asap.catalog.dao.manager.OrderManager" />
<stripes:layout-render name="/layout/standard.jsp" title="Orders by date" home="Y">
    <stripes:layout-component name="contents">
         <div class="table-responsive">
              <table class="table table-striped">   <thead>
                                    <tr>
                                        <td width="65" style="border-left:none;">ID</td>
                                        <td width="60">Date</td>
                                        <td width="74">Status</td>
                                        <td width="74">User</td>
                                        <td width="74">Company</td>
                                        <td width="74">Reference</td>
                                        <td width="74">PCB<br/>Name</td>
                                        <td width="51" align="right">Quantity</td>
                                        <td width="30" align="right">Total<br/>Days</td>
                                        <td width="74" align="right">Total<br/>Price</td>
                                        <td width="30">&nbsp;</td>
                                    </tr>
                                </thead>
                                 <tbody>
                                <c:forEach var="order" items="${orderManager.orders}" varStatus="loopid">
                                    <tr class="gray${loopid.index%2}" style="cursor:pointer" onclick="window.location='${pageContext.request.contextPath}/azitechorder/Order.action?order=${order.id}'">
                                        <td width="65">PO${order.quoteid}</td>
                                        <td width="58" title="<fmt:formatDate pattern="HH:mm dd/MM-yyyy" value="${order.date}"/>"><fmt:formatDate pattern="dd/MM-yyyy" value="${order.date}"/></td>
                                        <td width="74">${order.status}</td>
                                        <td width="74" title="${order.user.fullname} - (${order.user.username})">${order.user.fullname}</td>
                                        <td width="74">${order.user.company}</td>
                                        <td width="74" title="${order.specification.reference}"><cat:str value="${order.specification.reference}" length="12"/></td>
                                        <td width="74" title="${order.specification.pcbreference}"><cat:str value="${order.specification.pcbreference}" length="12"/></td>
                                        <td width="51" align="right">${order.resquantity}</td>
                                        <td width="30" align="right">${order.restotaldays}</td>
                                        <td width="74" align="right">${order.restotal} ${order.currency}</td>
                                        <td width="16" onmousedown="if(confirm('Are you sure you want to delete this order?')) {window.location='${pageContext.request.contextPath}/azitechorder/Order.action?delete&order=${order.id}'; return false;}else return false;"><img src="${pageContext.request.contextPath}/images/del0.png" onmouseover="this.src='${pageContext.request.contextPath}/images/del1.png';" onmouseout="this.src='${pageContext.request.contextPath}/images/del0.png';" alt="delete"></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
         
    </stripes:layout-component>
</stripes:layout-render>