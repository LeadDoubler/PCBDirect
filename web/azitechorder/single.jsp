<%@ include file="/taglibs.jsp" %>

<tr>
    <td>
        <table width="90%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="title">PCB dimension</td>
                <td class="content">${actionBean.order.sgpcbdimx} mm (X-direction)</td>
            </tr>
        </table>
    </td>
    <td>
        <table width="90%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="title">PCB dimension</td>
                <td class="content">${actionBean.order.sgpcbdimy} mm (Y-direction)</td>
            </tr>
        </table>
    </td>
</tr>
<!--</table>-->
<%--<div>
    <span class="form_left">Panel quantity</span>
    <span class="form_right">
        <fmt:formatNumber value="${actionBean.order.sgquantity}" maxFractionDigits="0"/> pcs. Production days ${actionBean.order.sgproddays}
    </span>
</div>

<div>
    <span class="form_left">Panel quantity</span>
    <span class="form_right">
        <fmt:formatNumber value="${actionBean.order.sgquantityb}" maxFractionDigits="0"/> pcs. Production days ${actionBean.order.sgproddaysb}
    </span>
</div>--%>