<%@ include file="/taglibs.jsp"%>
<table width="100%" border="0" cellpadding="0">
    <tr>
        <td height="8"></td>
    </tr>
    <tr>
        <td valign="top">
            <div>
                <span class="title">Panelization options :</span><br/>
                <span class="form_right">
                    <stripes:select id="panelchoice" name="specification.azpanelization" onchange="changePanelization(this.value);if(this.value=='Azitech'){updateDim();iserrorOwnpanel = false;}else{updateOwnPanel();iserror=false;}">
                        <stripes:option value="Your own panel" label="Your own panel"/>
                        <stripes:option value="Azitech" label="New panel"/>
                    </stripes:select><img class="info" src="../images/info.png" onmouseover="showToolTip(this,'Select \'Your Own Layout\' if you provide a panel drawing otherwise select \'New panel\' and define the desired panel.');" onmouseout="hideToolTip();"/>
                </span>
            </div>
        </td>
        <td></td>
    </tr>
    <tr><td height="8"></td></tr>
    <tr>
        <td>
            <span class="title">X-out allowed :</span><br/>
            <span class="form_right">
                <stripes:select name="specification.xoutallowed">
                    <stripes:option value="No" label="No"/>
                    <stripes:option value="Yes" label="Yes"/>
                </stripes:select><img class="info" src="../images/info.png" onmouseover="showToolTip(this,'Select if x-out (crossed PCB\'s) are allowed in the panel.');" onmouseout="hideToolTip();"/>
                <span class="content10px" style="white-space:nowrap;"></span>
            </span>
        </td>
        <td></td>
    </tr>
    <tr>
        <td colspan="2" id="azitech">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <jsp:include page="azitech.jsp"/>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="2" id="own" style="display: none">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <jsp:include page="own.jsp"/>
            </table>
        </td>
    </tr>
</table>
