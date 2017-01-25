<%@ include file="/taglibs.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<stripes:layout-render name="/layout/standard.jsp" title="User information" home="Y">
    <stripes:layout-component name="contents">
         <div class="table-responsive">
                                        <table class="table table-striped">
                <%--<tr><td align="right" height="16"><input class="login" type="button" style="cursor:pointer" value="Back to front page" onclick="window.location='${pageContext.request.contextPath}/startup/Startup.action?home'"/></td></tr> --%>
                <tr>
                    <td valign="top" align="right" colspan="3">
                         <cat:userAccess role="4" user_id="${actionBean.user.id}">
                            <c:if test="${actionBean.user.role.value <= user.role.value}">
                                <span class="title"><a class="bulink" href="AzitechRegister.action?edit&user=${actionBean.user}">Edit</a></span>
                            </c:if>
                            <c:choose>
                                <c:when test="${actionBean.user.deactivated eq 'yes'}">
                                    <span class="title"><a class="bulink" href="${pageContext.request.contextPath}/user/AzitechRegister.action?activate&user=${actionBean.user}">Activate</a></span>
                                    <%--<span class="title"><a class="bulink" href="#" onclick="if(confirm('Are you sure you want to delete this user?')) window.location='${pageContext.request.contextPath}/user/Register.action?delete&user=${actionBean.user}';">Delete</a></span>--%>
                                </c:when>
                                <c:otherwise>
                                    <c:if test="${actionBean.user.id != user.id && actionBean.user.role.value <= user.role.value}">
                                        <span class="title"><a class="bulink" href="#" onclick="if(confirm('Are you sure you want to deactivate this user?')) window.location='${pageContext.request.contextPath}/user/AzitechRegister.action?deactivate&user=${actionBean.user}';">Deactivate</a></span>
                                        <%--<span class="title"><a class="bulink" href="#" onclick="if(confirm('Are you sure you want to delete this user?')) window.location='${pageContext.request.contextPath}/user/Register.action?delete&user=${actionBean.user}';">Delete</a></span>--%>
                                    </c:if>
                                </c:otherwise>
                            </c:choose>
                        </cat:userAccess>
                     </td>
                </tr>
                <tr><td height="4"></td></tr>
                
                <tr>
                    <td class="rounded_leftrightborder">
                    <div class="roundedtable" style="overflow:hidden;">
                        <table class="table table-striped">
                         <tr>
                            <td>
                                <table class="table table-striped">
                                   <thead>
                                       <tr>
                                           <td colspan="3" style="border-left:none;">Profile Data</td>
                                       </tr>
                                   </thead>
                                   <tbody>
                                    
                                    <tr class="gray0">
                                        <td class="nowraptd">First name</td>
                                        <td>${actionBean.user.firstName}</td>
                                    </tr>
                                    <tr class="gray0">
                                        <td class="nowraptd">Last name</td>
                                        <td class="nowraptd">${actionBean.user.lastName}</td>
                                    </tr>

                                    <cat:view layout="row" styleClass="nowraptd" label="company" value="${actionBean.user.company}"/>

                                    <tr class="gray0">
                                        <td class="nowraptd">Username</td>
                                        <td>${actionBean.user.username}</td>
                                    </tr>
                                    <tr class="gray0">
                                        <td class="nowraptd">Password</td>
                                        <c:choose>
                                            <c:when test="${actionBean.user.id != user.id && actionBean.user.role.value <= user.role.value}">
                                                <td>${actionBean.user.password}</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td><c:forEach begin="1" end="${actionBean.user.passwordLength}">*</c:forEach></td>
                                            </c:otherwise>
                                        </c:choose>
                                    </tr>
                                    <tr class="gray0">
                                        <td class="nowraptd">Email</td>
                                        <td>${actionBean.user.email}</td>
                                    </tr>
                                    <c:if test="${actionBean.user.phone != null}">
                                    <tr class="gray0">
                                        <td class="nowraptd">Phone</td>
                                        <td>${actionBean.user.phone}</td>
                                    </tr>
                                    </c:if>
                                    <tr class="gray0">
                                        <td class="nowraptd">Mobile</td>
                                        <td>${actionBean.user.mobile}</td>
                                    </tr>
                                    <tr class="gray0">
                                        <td class="nowraptd">Role</td>
                                        <td>${actionBean.user.role.name}</td>
                                    </tr>

                                    <c:if test="${actionBean.user.street != null}">
                                        <tr class="gray0">
                                            <td class="nowraptd">Address</td>
                                            <td>${actionBean.user.street}</td>
                                        </tr>
                                    </c:if>

                                    <c:if test="${actionBean.user.postalCode != null and actionBean.user.city != null}">
                                       <tr class="gray0">
                                            <td class="nowraptd">City</td>
                                            <td>
                                                <c:if test="${actionBean.user.postalCode != null}">${actionBean.user.postalCode} </c:if>
                                                <c:if test="${actionBean.user.city != null}">${actionBean.user.city}</c:if>
                                            </td>
                                        </tr>
                                    </c:if>

                                    <c:if test="${user.role.value>4}">

                                    <tr class="gray0">
                                        <td class="nowraptd">Discount</td>
                                        <td>${actionBean.user.discount}</td>
                                    </tr>
                                    </c:if>

                                    <tr class="gray0">
                                        <td class="nowraptd">Currency</td>
                                        <td>${actionBean.user.currency}</td>
                                    </tr>

                                    <c:if test="${actionBean.user.country != null}">
                                        <tr class="gray0">
                                            <td class="nowraptd">Country</td>
                                            <td>${actionBean.user.country}</td>
                                        </tr>
                                    </c:if>

                                    <c:if test="${actionBean.user.cvr != null}">
                                        <tr class="gray0">
                                            <td class="nowraptd">CVR</td>
                                            <td>${actionBean.user.cvr}</td>
                                        </tr>
                                    </c:if>

                                    <%--<c:if test="${actionBean.user.delaynotify != null}">
                                        <tr class="gray0">
                                            <td class="nowraptd">In case of delay,notify</td>
                                            <td>${actionBean.user.delaynotify}</td>
                                        </tr>
                                    </c:if>--%>

                                   <%-- <c:if test="${actionBean.user.sentinvoiceto != null}">
                                        <tr class="gray0">
                                            <td class="nowraptd">Sent invoice to</td>
                                            <td>${actionBean.user.sentinvoiceto}</td>
                                        </tr>
                                    </c:if>--%>
                                </table>
                            </td>
                         </tr>

                     </table>
                    </div>
                    </td>
                </tr>
                

        </table>
     </div>
    </stripes:layout-component>
</stripes:layout-render>



