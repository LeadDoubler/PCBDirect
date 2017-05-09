<%@ include file="/taglibs.jsp"%>

<%--$(panx).innerHTML = parseInt($(borderpcb).value) + (((parseInt($(pcbdimx).value) + parseInt($(distancepcb).value)) * parseInt($(pcbx).value))-parseInt($(distancepcb).value))+parseInt($(borderpcb).value) + ' mm (Maximum recommended dimension is 350 mm)'--%>
<tr><td height="8"></td></tr>
<tr>
    <td valign="top">
        <span class="title">PCB Dimension :</span><br/>
        <span class="form_right">
            <stripes:text id="pcbdimx" class="textwidthadjust" name="specification.azpcbdimx" onchange="if(!danishDecimalCheck(this))this.value=0;updateDim();"/><img class="info" src="../images/info.png" onmouseover="showToolTip(this, 'Type PCB dimension in mm');" onmouseout="hideToolTip();"/>
            <br/><span class="content10px" style="white-space:nowrap;">mm(X-direction)</span><br/>
            <span id="xdimerror" class="contenterror"></span>
        </span>
    </td>
    <td valign="top">
        <span class="title">PCB Dimension :</span><br/>
        <span class="form_right">
            <stripes:text id="pcbdimy" class="textwidthadjust" name="specification.azpcbdimy" onchange="if(!danishDecimalCheck(this))this.value=0;updateDim();"/><img class="info" src="../images/info.png" onmouseover="showToolTip(this, 'Type PCB dimension in mm');" onmouseout="hideToolTip();"/>
            <br/><span class="content10px" style="white-space:nowrap;">mm(Y-direction)</span><br/>
            <span id="ydimerror" class="contenterror"></span>
        </span>
    </td>
</tr>
<tr><td height="8"></td></tr>
<tr>
    <td valign="top">
        <span class="title">No. Of PCB's :</span><br/>
        <span class="form_right">
            <stripes:select id="pcbx" name="specification.aznrofpcbx" onchange="updateDim();">
                <c:forEach var="i" begin="1" end="20" step="1">
                    <stripes:option value="${i}" label="${i}"/>
                </c:forEach>
            </stripes:select><img class="info" src="../images/info.png" onmouseover="showToolTip(this, 'Numbers of PCB\'s (x-direction)');" onmouseout="hideToolTip();"/>
            <br/><span class="content10px" style="white-space:nowrap;">pcs.(X-direction)</span><br/>
            <span id="xtotalerror" class="contenterror"></span>
        </span>
    </td>
    <td valign="top">
        <span class="title">No. Of PCB's :</span><br/>
        <span class="form_right">
            <stripes:select id="pcby" name="specification.aznrofpcby" onchange="updateDim();">
                <c:forEach var="j" begin="1" end="20" step="1">
                    <stripes:option value="${j}" label="${j}"/>
                </c:forEach>
            </stripes:select><img class="info" src="../images/info.png" onmouseover="showToolTip(this, 'Numbers of PCB\'s (y-direction)');" onmouseout="hideToolTip();"/>
            <br/><span class="content10px" style="white-space:nowrap;">pcs.(Y-direction)</span><br/>
            <span id="ytotalerror" class="contenterror"></span>
        </span>
    </td>
</tr>
<tr><td height="8"></td></tr>
<tr>
    <td valign="top">
        <span class="title">Distance between two PCB's :</span><br/>
        <span class="form_right">
            <stripes:select id="distancepcb" name="specification.azdistancepcb" onchange="updateDim();">
                <stripes:option value="0" label="0"/>
                <stripes:option value="2,4" label="2.4"/>
                <stripes:option value="10" label="10"/>
            </stripes:select><img class="info" src="../images/info.png" onmouseover="showToolTip(this, 'Select distance between PCBs');" onmouseout="hideToolTip();"/><span class="content10px">mm</span>
        </span>
    </td>
    <td valign="top">
        <span class="title">Size of panel border?</span><br/>
        <span class="form_right">
            <stripes:select id="borderpcb" name="specification.azsizeborderpanel" onchange="updateDim();">
                <stripes:option value="20" label="20"/>
                <stripes:option value="13" label="13"/>
                <stripes:option value="10" label="10"/>
                <stripes:option value="7,4" label="7.4"/>
            </stripes:select><img class="info" src="../images/info.png" onmouseover="showToolTip(this, 'Select size of panel border')" onmouseout="hideToolTip()"/>
            <span class="content10px">mm</span>
        </span>
    </td>
</tr>
<tr><td height="16"></td></tr>
<tr>
    <td colspan="2">
        <table width="100%" cellpadding="2" cellspacing="2" border="0" style="border:1px dashed #0d507a">
            <tr><td height="4"></td></tr>
            <tr>
                <td>
                    <span class="title">Panel dimension (X) (total size)</span><br/>
                    <span id="panx" class="content10px"><span id="xtotal">${actionBean.specification.aztotdimx}</span></span><br><br>
                </td>
            </tr>
            <tr>
                <td>
                    <span class="title">Panel dimension (Y) (total size)</span><br/>
                    <span id="pany" class="content10px"><span id="ytotal" >${actionBean.specification.aztotdimy}</span></span><br><br>
                </td>
            </tr>
            <tr>
                <td>
                    <span class="title">Numbers of PCB's in the panel</span><br/>
                    <span id="pcbs" class="content10px"><span id="totalPCB">${actionBean.specification.aznrofpcb}</span> pcs.</span>
                </td>
            </tr>
            <tr><td height="4"></td></tr>
        </table>
    </td>
</tr>
<tr><td height="16"></td></tr>
<tr>
    <td colspan="2"><cat:sheet x="62" y="18"/></td>
</tr>

<script>

    (function () {
        updateDim();
    })();

</script>

<%--<script type="text/javascript">
    updateDim();
</script>--%>
<%-- <div>
     <span class="title">Panel Quantity</span>
     <span class="form_right">
        <stripes:text name="specification.azquantity" onchange="integerCheck($('specification.azquantity'))"/>
         pcs.
     </span>
 </div>
 <div>
    <span class="title">Production days</span>
    <span class="form_right">
        <stripes:select name="specification.azproddays">
            <c:forEach var="i" begin="2" end="10" step="1">
                <stripes:option value="${i}" label="${i}"/>
            </c:forEach>
            <c:forEach var="i" begin="12" end="20" step="2">
                <stripes:option value="${i}" label="${i}"/>
            </c:forEach>
        </stripes:select> working days
    </span>
</div>--%>

<!--<br/><br/>-->


<!--<div>-->

<%--<cat:part part="specification.comment" site="yes"/>--%>

<!--</div>-->
