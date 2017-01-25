<%@ include file="/taglibs.jsp"%>
<table width="100%" border="0" cellpadding="0">
    <tr><td height="8"></td></tr>
    <tr>
        <td valign="top">
            <span class="title">PCB-dimension :</span><br/>
            <span class="form_right">
                <stripes:text id="spcbdimx" name="specification.sgpcbdimx" class="textwidthadjust" onchange="if(!danishDecimalCheck(this))this.value=0;updateSingleDim();"/>
                <br/><span class="content10px" style="white-space:nowrap;">mm (X-direction)</span><br/>
             <span id="xdimspcberror" class="contenterror"></span>
            </span>
        </td>
        <td valign="top">
            <span class="title">PCB-dimension :</span><br/>
            <span class="form_right">
                <stripes:text id="spcbdimy" name="specification.sgpcbdimy" class="textwidthadjust" onchange="if(!danishDecimalCheck(this))this.value=0;updateSingleDim();"/>
                <br/><span class="content10px" style="white-space:nowrap;">mm (Y-direction)</span><br/>
             <span id="ydimspcberror" class="contenterror"></span>
            </span>
        </td>
    </tr>
</table>