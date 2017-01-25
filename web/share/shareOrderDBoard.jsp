<%@ include file="/taglibs.jsp"%>
<stripes:layout-render name="/layout/standard.jsp" language="${page.language.value}">
    <stripes:layout-component name="contents">
        <div id="fckeditorWindow"> </div>
         <div id="ToolTip" class="ToolTip"><table border="0" cellpadding="0" cellspacing="0"><tr><td class='ToolTipTD' id="ToolTipContent">&nbsp;</td></tr></table></div>
            <div class="container">
                <div style="margin: 0 0 0 25px;">
                    <%--<cat:part part="mysite.top" site="yes"/>--%>
                    <c:choose>
                        <c:when test="${user.approved == '1' && user.deactivated != 'yes'}">
                            <stripes:form action="/share/Sharing.action" name="shareOrderForm" id="shareOrderForm" onsubmit="return false">
                            <stripes:hidden name="orderList"/>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="25%" align="left" valign="top" class="title">
                                        <table border="0" cellpadding="0" cellspacing="0">
                                            <tr><td height="15"></td></tr>
                                            <tr><td class="header" style="margin:0;">Share orders</td></tr>
                                            <tr><td height="12"></td></tr>
                                            <%--<tr><td><a class="bulink" href="${pageContext.request.contextPath}/share/Sharing.action?act=o">All orders</a></td></tr>--%>
                                            <tr><td style="margin-top:10px;"><a class="bulink" href="${pageContext.request.contextPath}/share/Sharing.action?orderFilterDashboard&fltr=owned">Owned by me</a></td></tr>
                                            <tr><td><a class="bulink" href="${pageContext.request.contextPath}/share/Sharing.action?orderFilterDashboard&fltr=shared">Shared with me</a></td></tr>
                                            <tr><td><table style="margin-left:26px;border-bottom: 1px dotted #000;" width="170px;" height="5px"><tr><td></td></tr></table></td></tr>
                                            <tr><td style="margin-top:10px;"><a class="bulink" href="${pageContext.request.contextPath}/startup/Startup.action?home">Frontpage</a></td></tr>
                                        </table>
                                    </td>
                                    <td align="left" valign="top" width="80%">
                                         <div class="table-responsive">
                                        <table class="table table-striped">

                                            <tr><td class="title" align="left" style="font-weight: bold;">Orders:</td></tr>
                                            <tr>
                                                <td class="rounded_leftrightborder" style="max-width:621px;">
                                                    <div style="width:602px;">
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="round-table">
                                                            <thead>
                                                                <tr>
                                                                    <td width="5%" style="border-left:none;">
                                                                        <c:choose>
                                                                            <c:when test="${!empty actionBean.orderList}">
                                                                                <input title="Select All/None" type="checkbox" onclick="checkall('orderChk', this.checked)"/>
                                                                            </c:when>
                                                                            <c:otherwise>&nbsp;</c:otherwise>
                                                                        </c:choose>
                                                                    </td>
                                                                    <td width="25%" style="border-left:none;">Reference</td>
                                                                    <td width="20%">PCB Name</td>
                                                                    <td width="35%">Shared</td>
                                                                    <td width="15%">Date</td>
                                                                </tr>
                                                            </thead>
                                                        </table>
                                                    </div>
                                                    <div class="roundedtable" style="width:621px;height:210px;overflow-x:hidden;">
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="round-table">
                                                            <tbody>
                                                                <c:forEach var="order" items="${actionBean.orderList}" varStatus="loopid">
	                                                              <tr class="gray${loopid.index%2}" style="cursor:default">
	                                                              <c:choose>
	                                                                  <c:when test="${order.orderAccess eq 0}"><td width="5%"><stripes:checkbox name="orderChk" value="${order.id}"/></td></c:when>
	                                                                  <c:when test="${order.orderAccess eq 1}"><td width="5%"><stripes:checkbox name="orderChk" value="${order.id}" disabled="disabled" title="You have view only access"/></td></c:when>
	                                                                  <c:otherwise><td width="5%">&nbsp;</td></c:otherwise>
	                                                              </c:choose>
	                                                                  <td width="25%"><cat:str value="${order.reference}" length="30"/></td>
	                                                                  <td width="20%"><cat:str value="${order.pcbreference}" length="30"/></td>
	                                                                  <td width="35%">${order.shareToCount}</td>
	                                                                  <td width="15%">${order.lastAction}</td>
	                                                             </tr>
	                                                          </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </td>
                                            </tr>
                                           
                                        </table>
                                         </div>
                                    </td>
                                  </tr>
                                <tr><td height="15"></td></tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${!empty actionBean.orderList}">
                                                <stripes:submit name="doShareOrder" value="Share" class="login" onclick="Util.prepareOrderShareBox()"/>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                </tr>
                            </table>
                            </stripes:form>
                        </c:when>
                        <c:otherwise>
                            <table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="40%" align="left" valign="top" class="title">
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                            <tr><td height="12"></td></tr>
                                            <tr><td class="header" style="margin:0 30px 0 0;">PCB-direct frontpage</td></tr>
                                            <tr><td height="20"></td></tr>
                                            <tr><td class="contenterror" style="font-size:14px;font-weight:bold;">You have yet not been approved by Azitech</td></tr>
                                            <tr><td height="20"></td></tr>
                                            <tr><td><a class="bulink" href="${pageContext.request.contextPath}/user/Logout.action">Logout</a></td></tr>
                                        </table>
                                    </td>
                                <tr>
                            </table>
                        </c:otherwise>
                    </c:choose>
                   <%-- <cat:part part="mysite.bottom" site="yes"/>--%>
                </div>
        </div><!-- container -->
        <div id="temp" class="message-box animated fadeIn" style="background:white">
    <div>
        <div id="shadow-container">
            <div class="shadow1">
                <div class="shadow2">
                    <div class="shadow3">
                        <div class="container">
                            <div id="shareBoxDIV" class="padding" style="background-color:#F5F8FF;">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--        <div id="temp" style="z-index:10;visibility:hidden;position:absolute;width:600px;">
    <div>
        <div id="shadow-container">
            <div class="shadow1">
                <div class="shadow2">
                    <div class="shadow3">
                        <div class="container">
                            <div id="shareBoxDIV" class="padding" style="background-color:#F5F8FF;">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>--%>
    </stripes:layout-component>
</stripes:layout-render>


