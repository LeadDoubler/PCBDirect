<%@ include file="/taglibs.jsp"%>
<jsp:useBean id="pageManager" scope="page" class="com.asap.catalog.dao.manager.PageManager" />
<jsp:useBean id="helperManager" scope="page" class="com.asap.catalog.dao.manager.UserHelper" />

<div class="marginleft">
<%--<cat:part part="mysite.top" site="yes"/>--%>
<h3>Users</h3>
<ul>
    <li><a class="bulink" href="${pageContext.request.contextPath}/user/AzitechRegister.action?list">Show all users</a>

    </li>
    <li>
         <a class="bulink" href="${pageContext.request.contextPath}/user/AzitechRegister.action?init">Register new user</a>
    </li>
</ul>
         <c:if test="${not empty helperManager.unapprovedUsers}">
    <table border="0" cellpadding="0" cellspacing="0">
        <tr><td class="title">New users to be approved:</td></tr>
        <c:forEach items="${helperManager.unapprovedUsers}" var="uu">
            <tr>
                <td>
                    <a class="bulink" href="${pageContext.request.contextPath}/user/AzitechRegister.action?view&user=${uu.id}">${uu.fullname}</a> <a style="color:green" href="${pageContext.request.contextPath}/user/AzitechRegister.action?approve&user=${uu.id}">APPROVE</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <br/><br/>
    </c:if>
    <h3>Specifications, orders and requests</h3>
    <ul>
        <li><a class="bulink" style="color:green" href="${pageContext.request.contextPath}/azitechorder/Order.action?list">List orders</a>

        </li>
        <li>
            <a class="bulink" style="color:green" href="${pageContext.request.contextPath}/qoute/Qoute.action?listAllQoutes">List all quotation strings</a>
        </li>
        <li><a class="bulink" style="color:green" href="${pageContext.request.contextPath}/specification/Specification.action?list">List all specifications</a>

        </li>
    </ul>

    <h3>Administration</h3>
    <ul>
        <li>
        <a class="bulink" style="color:green" href="${pageContext.request.contextPath}/upload/Upload.action">Upload new xls template</a>
        </li>
        <li>
            <a class="bulink" href="${pageContext.request.contextPath}/user/AzitechRegister.action?view&user=${user}">Show personal information</a>
        </li>
        <li>
            <a class="bulink" href="${pageContext.request.contextPath}/user/Logout.action">Logout</a>
        </li>
    </ul>

<%--<cat:part part="mysite.bottom" site="yes"/>--%>
</div>