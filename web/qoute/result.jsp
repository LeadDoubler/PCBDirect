<%@ include file="/taglibs.jsp"%>
<stripes:form action="/qoute/Qoute.action" method="post" >
  <stripes:hidden name="qoute"/>
  <c:choose>
        <%--<c:when test="${actionBean.total < 1000 && actionBean.specification.user.currency == 'DKK'}">--%>
            <%--<table width="75%" border="0" cellpadding="0" cellspacing="0"><tr><td align="center">--%>
            <%--<span class="title">The requested quantity is too low. Please increase your quantity. </span></td></tr></table>--%>
        <%--</c:when>--%>
        <%--<c:when test="${actionBean.total < 173.91 && actionBean.specification.user.currency == 'USD'}">--%>
            <%--<table width="75%" border="0" cellpadding="0" cellspacing="0"><tr><td align="center">--%>
            <%--<span class="title">The requested quantity is too low. Please increase your quantity. </span></td></tr></table>--%>
        <%--</c:when>--%>
        <%--<c:when test="${actionBean.total < 134.23 && actionBean.specification.user.currency == 'Euro'}">--%>
            <%--<table width="75%" border="0" cellpadding="0" cellspacing="0"><tr><td align="center">--%>
            <%--<span class="title">The requested quantity is too low. Please increase your quantity. </span></td></tr></table>--%>
        <%--</c:when>--%>
        <%--<c:when test="${actionBean.total == 0}">--%>
            <%--<table width="75%" border="0" cellpadding="0" cellspacing="0"><tr><td align="center">--%>
            <%--<span class="title">The requested qoutation could not be calculated. <br>Please use special request form.</span></td></tr></table>--%>
        <%--</c:when>--%>
        <c:when test="${actionBean.total > 17100000}">
            <table width="75%" border="0" cellpadding="0" cellspacing="0"><tr><td align="center">
            <span class="title">The requested quantity is too high. Please use special request form.</span></td></tr></table>
        </c:when>
        <c:otherwise>
            <table width="75%" height="200px" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="title">${qoute.id}Price pr. unit
                    <%--<c:choose>
                        <c:when test="${actionBean.specification.layout eq 'Single'}">item</c:when>
                        <c:otherwise>panel</c:otherwise>
                    </c:choose>--%>
                    </td>
                    <td class="content10px" style="text-align: right"><fmt:formatNumber value="${actionBean.priceprunit}" minFractionDigits="2" maxFractionDigits="2"/>&nbsp;${actionBean.specification.user.currency}</td>
                </tr>
                <%--<tr><td height="12"></td></tr>
                <tr>
                    <td class="title">${qoute.id}Price pr.
                    <c:choose>
                        <c:when test="${actionBean.specification.layout eq 'Single'}">item</c:when>
                        <c:otherwise>panel</c:otherwise>
                    </c:choose>
                    </td>
                    <td class="content10px" style="text-align: right"><fmt:formatNumber value="${actionBean.priceprunit}" minFractionDigits="2" maxFractionDigits="2"/>&nbsp;${actionBean.specification.user.currency}</td>
                </tr>--%>
                <tr><td height="10"></td></tr>
                <tr>
                    <td class="title">Sub-total</td>
                    <td class="content10px" style="text-align: right"><fmt:formatNumber value="${actionBean.subtotal}" minFractionDigits="2" maxFractionDigits="2"/>&nbsp;${actionBean.specification.user.currency}</td>
                </tr>
                <tr><td height="10"></td></tr>
                <tr>
                    <td class="title">Tooling cost</td>
                    <td class="content10px" style="text-align: right"><fmt:formatNumber value="${actionBean.tooling}" minFractionDigits="2" maxFractionDigits="2"/>&nbsp;${actionBean.specification.user.currency}</td>
                </tr>
                <tr><td height="10"></td></tr>
                <tr>
                    <td class="title">Freight cost</td>
                    <td class="content10px" style="text-align: right"><fmt:formatNumber value="${actionBean.freight}" minFractionDigits="2" maxFractionDigits="2"/>&nbsp;${actionBean.specification.user.currency}</td>
                </tr>
                <tr><td height="10"></td></tr>
                <tr>
                    <td class="title">Total</td>
                    <td class="content10px" style="text-align: right"><fmt:formatNumber value="${actionBean.total}" minFractionDigits="2" maxFractionDigits="2"/>&nbsp;${actionBean.specification.user.currency}</td>
                </tr>
                <tr><td height="10"></td></tr>
                <tr>
                    <td class="title">Days</td>
                    <td class="content10px" style="text-align: right"><fmt:formatNumber value="${actionBean.days}" maxFractionDigits="0"/></td>
                </tr>
                <tr><td height="10"></td></tr>
                <tr>
                    <td class="title">Weight</td>
                    <td class="content10px" style="text-align: right"><fmt:formatNumber value="${actionBean.specification.resweight}" minFractionDigits="2" maxFractionDigits="2"/>&nbsp;Kg.</td>
                </tr>
                <tr><td height="10"></td></tr>
                <tr>
                    <%
                        if(request.getParameter("sp")!=null && request.getParameter("sp").equals("r")){
                    %>
                    <td colspan="2"><input class="login" type="button" style="cursor:pointer;" value="Add to Quote" onclick="window.location='${pageContext.request.contextPath}/qoute/Qoute.action?addToCart&sp=r&specification=${actionBean.specification.id}&productTemplate=${actionBean.productTemplate}'"/></td>
                    <%
                        }
                        else{
                    %>
                    <td colspan="2"><input class="login" type="button" style="cursor:pointer;" value="Add to Quote" onclick="window.location='${pageContext.request.contextPath}/qoute/Qoute.action?addToCart&specification=${actionBean.specification.id}&productTemplate=${actionBean.productTemplate}'"/></td>
                    <%
                        }
                    %>
                </tr>
            </table>
     </c:otherwise>
    </c:choose>
</stripes:form>
        

