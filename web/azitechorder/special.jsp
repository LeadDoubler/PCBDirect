<%@ include file="/taglibs.jsp"%>

<tr>
    <td>
        <table width="90%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="title">Surface finish</td>
                <td class="content">${actionBean.order.finish}</td>
            </tr>
        </table>
    </td>
    <td>
        <table width="90%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="title">Material</td>
                <td class="content">${actionBean.order.material}</td>
            </tr>
        </table>
    </td>
</tr>
<tr><td height="4" colspan="2"></td></tr>
<tr>
    <td>
        <table width="90%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="title">Cobber thickness</td>
                <td class="content">${actionBean.order.copperthickness} my</td>
            </tr>
        </table>
    </td>
    <td>
        <table width="90%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="title">PCB thickness</td>
                <td class="content"><fmt:formatNumber value="${actionBean.order.pcbthickness}" maxFractionDigits="2"/> mm</td>
            </tr>
        </table>
    </td>
</tr>
<tr><td height="4" colspan="2"></td></tr>
<tr>
    <td>
        <table width="90%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="title">Min. hole diameter</td>
                <td class="content">${actionBean.order.minholedia} mm</td>
            </tr>
        </table>
    </td>
    <td>
        <table width="90%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="title">Min. track/gap</td>
                <td class="content">${actionBean.order.mintrackgap} mm</td>
            </tr>
        </table>
    </td>
</tr>
<tr><td height="4" colspan="2"></td></tr>
<tr>
    <td>
        <table width="90%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="title">Color of soldermask</td>
                <td class="content">${actionBean.order.colorsoldermask} color</td>
            </tr>
        </table>
    </td>
    <td>
        <table width="90%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="title">Other type of mask</td>
                <td class="content">${actionBean.order.othermask}</td>
            </tr>
        </table>
    </td>
</tr>
<tr><td height="4" colspan="2"></td></tr>
<tr>
    <td>
        <table width="90%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="title">Gold finger</td>
                <td class="content">${actionBean.order.goldfinger}</td>
            </tr>
        </table>
    </td>
    <td>
        <table width="90%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="title">Edge plating</td>
                <td class="content">${actionBean.order.edgplating}</td>
            </tr>
        </table>
    </td>
</tr>
<tr><td height="4" colspan="2"></td></tr>
<tr>
    <td>
        <table width="90%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="title">Impedance</td>
                <td class="content">${actionBean.order.impedance}</td>
            </tr>
        </table>
    </td>
    <td></td>
</tr>
<tr><td height="4" colspan="2"></td></tr>
<tr>
    <td>
        <table width="90%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="title">Pressfit requirements</td>
                <td class="content">${actionBean.order.pressfitreq}</td>
            </tr>
        </table>
    </td>
    <td>
        <table width="90%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="title">Choice of Build-up</td>
                <td class="content">${actionBean.order.buildupchoice}</td>
            </tr>
        </table>
    </td>
</tr>