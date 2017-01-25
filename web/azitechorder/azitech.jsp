<%@ include file="/taglibs.jsp"%>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td width="50%" valign="top">
            <table width="90%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="title" width="45%">PCB Dimension</td>
                    <td class="content">${actionBean.order.azpcbdimx} mm (X - direction)</td>
                </tr>
            </table>
        </td>
        <td valign="top">
            <table width="90%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="title" width="45%">Panel Dimension</td>
                    <td class="content">${actionBean.order.specification.aztotdimx} mm (X - direction)</td>
                </tr>
            </table>
        </td>
    </tr>
    <tr><td height="4"></td></tr>
    <tr>
        <td width="50%" valign="top">
            <table width="90%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="title">PCB Dimension</td>
                    <td class="content">${actionBean.order.azpcbdimy} mm (Y - direction)</td>
                </tr>
            </table>
        </td>
        <td valign="top">
            <table width="90%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="title" width="45%">Panel Dimension</td>
                    <td class="content">${actionBean.order.specification.aztotdimy} mm (Y - direction)</td>
                </tr>
            </table>
        </td>
    </tr>
    <tr><td height="24"></td></tr>
    <tr>
        <td width="50%" valign="top">
            <table width="90%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="title">Size of panel border?</td>
                    <td class="content">${actionBean.order.azsizeborderpanel} mm</td>
                </tr>
            </table>
        </td>
        <td valign="top">
            <table width="90%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="title">No. Of PCB's</td>
                    <td class="content"><fmt:formatNumber value="${actionBean.order.aznrofpcbx}" maxFractionDigits="0"/> pcs. (X - direction)</td>
                </tr>
            </table>
        </td>
    </tr>
    <tr><td height="4"></td></tr>
    <tr>
        <td width="50%" valign="top">
            <table width="90%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="60%" class="title">Distance between two PCB's</td>
                    <td valign="top" class="content">${actionBean.order.azdistancepcb} mm</td>
                </tr>
            </table>
        </td>
        <td valign="top">
            <table width="90%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="title">No. Of PCB's</td>
                    <td class="content"><fmt:formatNumber value="${actionBean.order.aznrofpcby}" maxFractionDigits="0"/> pcs. (Y - direction)</td>
                </tr>
            </table>

        </td>
    </tr>
    <tr><td height="4"></td></tr>
    <tr>
        <td width="50%" valign="top">
            <table width="90%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="50%" class="title">X-out allowed</td>
                    <td valign="top" class="content">${actionBean.order.specification.xoutallowed}</td>
                </tr>
            </table>
        </td>
        <td width="50%" valign="top">
            <table width="90%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="50%" class="title">PCB's per panel</td>
                    <td valign="top" class="content"><fmt:formatNumber value="${actionBean.order.specification.aznrofpcb}" maxFractionDigits="0"/></td>
                </tr>
            </table>
        </td>
    </tr>
    <%--<tr><td height="4"></td></tr>
    <tr>
        <td width="50%" valign="top">
            <table width="90%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="title">Comments</td>
                    <td class="content">${actionBean.order.azcomments}</td>
                </tr>
            </table>
        </td>
        <td>
        </td>
    </tr>--%>
</table>

<%-- <div>
     <span class="form_left">Panel Quantity</span>
     <span class="form_right">
         <fmt:formatNumber value="${actionBean.order.azquantity}" maxFractionDigits="0"/> pcs.
     </span>
 </div>
 
 <div>
    <span class="form_left">Production days</span>
    <span class="form_right">
        <fmt:formatNumber value="${actionBean.order.azproddays}" maxFractionDigits="0"/> working days
    </span>
</div>--%>