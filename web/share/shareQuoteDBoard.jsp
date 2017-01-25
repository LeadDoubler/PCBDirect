<%@ include file="/taglibs.jsp"%>
<stripes:layout-render name="/layout/standard.jsp" title="Share Quotations" language="${page.language.value}">
    <stripes:layout-component name="contents">

        <div id="fckeditorWindow"> </div>
        <div id="ToolTip" class="ToolTip"><table border="0" cellpadding="0" cellspacing="0"><tr><td class='ToolTipTD' id="ToolTipContent">&nbsp;</td></tr></table></div>
        <div class="container">
            <div style="margin: 0 0 0 25px;">
                <%--<cat:part part="mysite.top" site="yes"/>--%>
                <c:choose>
                    <c:when test="${user.approved == '1' && user.deactivated != 'yes'}">
                        <stripes:form action="/share/Sharing.action" name="shareQuoteForm" id="shareQuoteForm" onsubmit="return false">
                            <stripes:hidden name="specList"/>

                            <div class="row">
                                <div class="col-md-3">
                                    <table border="0" cellpadding="0" cellspacing="0">
                                            <tr><td height="15"></td></tr>
                                            <tr><td class="header" style="margin:0;">Share Quotations</td></tr>
                                            <tr><td height="12"></td></tr>
                                            <%--<tr><td><a class="bulink" href="${pageContext.request.contextPath}/share/Sharing.action?act=q">All quotations</a></td></tr>--%>
                                            <tr><td style="margin-top:10px;"><a class="bulink" href="${pageContext.request.contextPath}/share/Sharing.action?quoteFilterDashboard&fltr=owned">Owned by me</a></td></tr>
                                            <tr><td><a class="bulink" href="${pageContext.request.contextPath}/share/Sharing.action?quoteFilterDashboard&fltr=shared">Shared with me</a></td></tr>
                                            <tr><td><table style="margin-left:26px;border-bottom: 1px dotted #000;" width="170px;" height="5px"><tr><td></td></tr></table></td></tr>
                                            <tr><td style="margin-top:10px;"><a class="bulink" href="${pageContext.request.contextPath}/startup/Startup.action?home">Frontpage</a></td></tr>
                                        </table>
                                </div>
                                <div class="col-md-8">
                                    <c:choose>
                                        <c:when test="${!empty actionBean.specList}">
                                            <stripes:submit name="shareQuote" value="Share" class="login" onclick="Util.prepareQuoteShareBox()"/>
                                        </c:when>
                                    </c:choose>
                                    <div class="table-responsive">
                                        <table class="table table-striped">
                                            <thead>
                                                              <tr>
                                                                <th width="5%" style="border-left:none;">
                                                                    <c:choose>
                                                                        <c:when test="${!empty actionBean.specList}">
                                                                            <input title="Select All/None" type="checkbox" onclick="checkall('quoteChk', this.checked)"/>
                                                                        </c:when>
                                                                        <c:otherwise>&nbsp;</c:otherwise>
                                                                    </c:choose>
                                                                </th>
                                                                <th width="25%" style="border-left:none;">Reference</th>
                                                                <th width="20%">PCB Name</th>
                                                                <th width="35%">Shared</th>
                                                                <th width="15%">Date</th>
                                                              </tr>
                                                          </thead><tbody>
                                                              <c:forEach var="spec" items="${actionBean.specList}" varStatus="loopid">
                                                                  <c:choose>
                                                                      <c:when test="${spec.isorderplaced eq 'Y'}"><tr class="gray${loopid.index%2}" style="font-style:italic;cursor:default;color:#9F9F9F"></c:when>
                                                                      <c:otherwise><tr class="gray${loopid.index%2}" style="cursor:default"></c:otherwise>
                                                                  </c:choose>
                                                                  <c:choose>
                                                                      <c:when test="${spec.specAccess eq 0}"><td width="5%"><stripes:checkbox name="quoteChk" value="${spec.id}"/></td></c:when>
                                                                      <c:when test="${spec.specAccess eq 1}"><td width="5%"><stripes:checkbox name="quoteChk" value="${spec.id}" disabled="disabled" title="You have view & order only access"/></td></c:when>
                                                                      <c:when test="${spec.specAccess eq 2}"><td width="5%"><stripes:checkbox name="quoteChk" value="${spec.id}" disabled="disabled" title="You have view only access"/></td></c:when>
                                                                      <c:otherwise><td width="5%">&nbsp;</td></c:otherwise>
                                                                  </c:choose>
                                                                      <td width="25%"><cat:str value="${spec.reference}" length="30"/></td>
                                                                      <td width="20%"><cat:str value="${spec.pcbreference}" length="30"/></td>
                                                                      <td width="35%">${spec.shareToCount}</td>
                                                                      <td width="15%">${spec.lastAction}</td>
                                                                 </tr>
                                                              </c:forEach>
                                                          </tbody>
                                                        </table>
                                                    </div>
                                </div>
                            </div>

                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="25%" align="left" valign="top" class="title">
                                        
                                    </td>
                                    
                                </tr>
                            <tr><td height="15"></td></tr>
                            <tr>
                                <td></td>
                                <td>
                                    <c:choose>
                                        <c:when test="${!empty actionBean.specList}">
                                            <stripes:submit name="shareQuote" value="Share" class="login" onclick="Util.prepareQuoteShareBox()"/>
                                        </c:when>
                                    </c:choose>
                                </td>
                            </tr>
                        </table>
                            </div>
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
                <%--<cat:part part="mysite.bottom" site="yes"/>--%>
            </div>
        </div><!-- container -->
    </stripes:layout-component>
</stripes:layout-render>
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

