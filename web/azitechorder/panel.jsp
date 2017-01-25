<%@ include file="/taglibs.jsp"%>

<tr>
    <td colspan="2">
        <c:choose>
            <c:when test="${actionBean.order.azpanelization == 'Azitech'}">
                <jsp:include page="azitech.jsp"/>
            </c:when>
            <c:when test="${actionBean.order.azpanelization == 'Your own panel'}">
                <jsp:include page="own.jsp"/>
            </c:when>
        </c:choose>
    </td>
</tr>
<%--<tr>
    <td></td>
    <td width="50%" valign="top">
        <table width="90%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="50%" class="title">X-out allowed</td>
                <td valign="top" class="content">${actionBean.order.specification.xoutallowed}</td>
            </tr>
        </table>
    </td>
</tr>--%>
