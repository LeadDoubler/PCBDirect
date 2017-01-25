<%@ include file="/taglibs.jsp"%>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td width="50%" valign="top">
            <table width="90%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="title">Panel dimension</td>
                    <td class="content">${actionBean.order.ownpaneldimx} mm (X - direction)</td>
                </tr>
            </table>
        </td>
        <td>
            <table width="90%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="title">Panel Dimension</td>
                    <td class="content">${actionBean.order.ownpaneldimy} mm (Y - direction)</td>
                </tr>
            </table>
        </td>
    </tr>
    <tr><td height="4"></td></tr>
    <tr>
        <td width="50%" valign="top">
            <table width="90%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="50%" class="title">PCB's per panel</td>
                    <td valign="top" class="content">${actionBean.order.specification.azprintperpanel}</td>
                </tr>
            </table>
        </td>
        <td width="50%" valign="top">
            <table width="90%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="50%" class="title">X-out allowed</td>
                    <td valign="top" class="content">${actionBean.order.specification.xoutallowed}</td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<%--<div>
    <span class="form_left">Panel Quantity</span>
    <span class="form_right">
        <fmt:formatNumber value="${actionBean.order.ownpanelquantity}" maxFractionDigits="0"/> panels. Production days ${actionBean.order.ownproddays} working days
    </span>
</div>

<div>
    <span class="form_left">Panel Quantity</span>
    <span class="form_right">
        <fmt:formatNumber value="${actionBean.order.ownpanelquantityb}" maxFractionDigits="0"/> panels. Production days ${actionBean.order.ownproddaysb} working days
    </span>
</div>--%>