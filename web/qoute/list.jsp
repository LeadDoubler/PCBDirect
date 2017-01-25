<%@ include file="/taglibs.jsp"%>
<stripes:layout-render name="/layout/standard.jsp" title="Quotes by user" home="Y">
    <stripes:layout-component name="contents">
         <div class="table-responsive">
                                        <table class="table table-striped">
                                <thead>
                                <tr>
                                    <td style="border-left:none;" width="60px">ID</td>
                                    <td width="130">User</td>
                                    <td width="102">Company</td>
                                    <td width="102">Reference</td>
                                    <td width="102">PCB Name</td>
                                    <td width="55" align="right">Quantity</td>
                                    <td width="30" align="right">Total<br/>days</td>
                                    <td width="102" align="right">Total price&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="qoute" items="${actionBean.allQoutesByUser}" varStatus="loopid">
                                    <tr class="gray${loopid.index%2}">
                                        <%--<td><fmt:formatDate pattern="HH:mm dd/MM-yyyy" value="${qoute.order.date}"/></td>--%>
                                        <td width="66">Q${qoute.qouteId}</td>
                                        <td width="150"><a href="${pageContext.request.contextPath}/user/AzitechRegister.action?view&user=${qoute.user.id}">${qoute.user.fullname} (${qoute.user.username})</a></td>
                                        <td width="125">${qoute.user.company}</td>
                                        <td width="120"><a href="${pageContext.request.contextPath}/specification/Specification.action?specification=${qoute.specification.id}" title="${qoute.specification.reference}"><cat:str value="${qoute.specification.reference}" length="15"/></a></td>
                                        <td width="126"><a href="${pageContext.request.contextPath}/specification/Specification.action?specification=${qoute.specification.id}" title="${qoute.specification.pcbreference}"><cat:str value="${qoute.specification.pcbreference}" length="15"/></a></td>
                                        <td width="67" align="right">${qoute.quantity}</td>
                                        <td width="33" align="right">${qoute.days}</td>
                                        <td width="95" align="right">${qoute.total} ${qoute.specification.user.currency}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
    </stripes:layout-component>
</stripes:layout-render>