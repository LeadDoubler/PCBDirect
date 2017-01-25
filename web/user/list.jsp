<%@ include file="/taglibs.jsp"%>
<stripes:layout-render name="/layout/standard.jsp" title="User list" home="Y">
    <stripes:layout-component name="contents">
       <jsp:useBean id="userManager" scope="page" class="com.asap.catalog.dao.manager.UserManager" />
 <div class="table-responsive">
                                        <table class="table table-striped">

               <tr>
                   <td align="right" colspan="4">
                       <%--<div class="marginleft">--%>
                        <cat:userAccess role="4">
                            <b><stripes:link class="bulink" href="${pageContext.request.contextPath}/user/AzitechRegister.action?edit">Add new user</stripes:link></b>
                        </cat:userAccess>
                        <%--</div>--%>
                    </td>
                </tr>
                <tr><td height="4"></td></tr>
               
                <tr>
                    <td class="rounded_leftrightborder">
                    <div class="roundedtable" style="overflow:hidden;">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="round-table">
                            <thead>
                                <tr>
                                    <td style="border-left:none;">User</td>
                                    <td>Company</td>
                                    <td align="right">Phone</td>
                                    <td align="right">Email</td>
                                    <td align="center">Discount</td>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${userManager.users}" var="user" varStatus="loopid">
                                <tr class="gray${loopid.index%2}">
                                    <td><a href="${pageContext.request.contextPath}/user/AzitechRegister.action?view&user=${user.id}">${user.fullname} (${user.username})</a></td>
                                    <td>${user.company}</td>
                                    <td align="right">${user.phone}</td>
                                    <td align="right">${user.email}</td>
                                    <td align="center">${user.discount}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    </td>
                </tr>
               
                <%--<tr>
                    <td>
                        <input class="login" type="button" style="cursor:pointer" value="Back to front page" onclick="window.location='${pageContext.request.contextPath}/startup/Startup.action?home'"/>
                    </td>
                </tr>--%>
            </table>
        </div>
    </stripes:layout-component>
</stripes:layout-render>
