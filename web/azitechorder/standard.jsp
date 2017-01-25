<%@ include file="/taglibs.jsp" %>

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
                <td class="title">Copper thickness</td>
                <td class="content">${actionBean.order.copperthickness}</td>
            </tr>
        </table>
    </td>
    <td>
        <table width="90%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="title">PCB thickness</td>
                <td class="content">${actionBean.order.pcbthickness}</td>
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
                <td class="content">${actionBean.order.minholedia}</td>
            </tr>
        </table>
    </td>
    <td>
        <table width="90%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="title">Min. track/gap</td>
                <td class="content">${actionBean.order.mintrackgap}</td>
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
                <td class="content">${actionBean.order.colorsoldermask}</td>
            </tr>
        </table>
    </td>
    <td></td>
</tr>