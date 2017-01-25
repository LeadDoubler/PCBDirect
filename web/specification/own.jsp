<%@ include file="/taglibs.jsp"%>
<tr><td height="8"></td></tr>
<tr>
    <td valign="top">
        <span class="title">PCB's per panel :</span><br/>
        <span class="form_right">
             <stripes:text id="pcbperpanel" name="specification.azprintperpanel" class="textwidthadjust" onblur="updateOwnPanel();"/><img class="info" src="../images/info.png" onmouseover="showToolTip(this,'PCB\'s per panel');" onmouseout="hideToolTip();"/>
             <span class="content10px" style="white-space:nowrap;"></span><br/>
            <span id="pcbperpanelerror" class="contenterror">Please fill out Panel dimension (X direction)</span>
        </span>
    </td>
    <td valign="top"></td>
</tr>
<tr><td height="8"></td></tr>
<tr>
    <td valign="top">
        <span class="title">Panel-dimension :</span><br/>
        <span class="form_right">
             <stripes:text id="ownpaneldimx" name="specification.ownpaneldimx" class="textwidthadjust" onchange="if(!danishDecimalCheck(this))this.value=0; updateOwnPanel();"/><img class="info" src="../images/info.png" onmouseover="showToolTip(this,'Type panel dimension in mm');" onmouseout="hideToolTip();"/>
             <br/><span class="content10px" style="white-space:nowrap;">mm(X-direction)</span><br/>
            <span id="pnlxdimerror" class="contenterror">Please fill out Panel dimension (X direction)</span>
        </span>
    </td>
    <td valign="top">
        <span class="title">Panel-dimension :</span><br/>
        <span class="form_right">
            <stripes:text id="ownpaneldimy" name="specification.ownpaneldimy" class="textwidthadjust" onchange="if(!danishDecimalCheck(this))this.value=0; updateOwnPanel();"/><img class="info" src="../images/info.png" onmouseover="showToolTip(this,'Type panel dimension in mm');" onmouseout="hideToolTip();"/>
             <br/><span class="content10px" style="white-space:nowrap;">mm(Y-direction)</span><br/>
            <span id="pnlydimerror" class="contenterror">Please fill out Panel dimension (Y direction)</span>
        </span>
    </td>
</tr>
