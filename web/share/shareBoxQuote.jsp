<%--
  Created by IntelliJ IDEA.
  User: Gaurav
  Date: 9 Jun, 2010
  Time: 11:21:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/taglibs.jsp"%>

<stripes:form action="/share/Sharing.action" name="shareBoxForm" id="shareBoxForm"
              onsubmit="return false" style="margin:0 17px 10px 17px">
    <stripes:hidden name="quoteChk"/>
    <stripes:hidden name="share_quote"/>
    <table border="0" cellpadding="0" cellspacing="0" width="100%" style="">
        <tr>
            <td>
                <div class="header" style="padding-bottom: 0pt; margin-left: 0;">
                    <div style="float:right;"><a class="bulink" onclick="Util.hide('invDetailBlock');Util.hideShareBox('temp');">Close</a></div>
                    Quote Sharing settings
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2" height="8"></td>
        </tr>
        <tr>
            <td colspan="2" class="title">Permissions:</td>
        </tr>
        <tr><td colspan="2" height="8"></td></tr>
        <tr>
            <td>
                <div style="border: 1px solid #96C5DF; background-color: white; padding: 5px 7px;">
                    <table class="round-table" width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr><td colspan="3" style="height: 2px; padding: 0;"></td></tr>
                        <c:forEach var="share" items="${actionBean.share_quote}" varStatus="loopid">
                           <tr class="gray1" id="shareEntry${loopid.index}">
                               <td width="50%">${share.user.fullname}</td>
                               <c:choose>
                                   <c:when test="${(share.iteration ne fn:length(actionBean.quoteChk)) or (share.iteration eq fn:length(actionBean.quoteChk) && share.accessLevel == 8)}">
                                       <td width="40%" align="right">Depends</td> <%--(${share.iteration}/${fn:length(actionBean.quoteChk)})--%>
                                       <td align="right" width="10%">&nbsp;</td>
                                   </c:when>
                                   <c:when test="${share.accessLevel == 9}">
                                       <td width="40%" align="right" style="font-weight:bold;">Owner</td>
                                       <td align="right" width="10%">&nbsp;</td>
                                   </c:when>
                                   <c:otherwise>
                                       <td width="40%" align="right">
                                           <stripes:select id="access${loopid.index}" name="share.accessLevel" value="${share.accessLevel}" style="width:auto;margin:0;" onchange="Util.editShareAccess('${share.id}',this.id, 'q')">
                                               <stripes:option value="0" label="Edit & Order"/>
                                               <stripes:option value="1" label="View & Order"/>
                                               <stripes:option value="2" label="View Only"/>
                                           </stripes:select>
                                       </td>
                                       <%--<td>${share.shareComments}</td>--%>
                                       <td align="right" width="10%"><img src="${pageContext.request.contextPath}/images/del0.png" onclick="Util.deleteShareAccess('${share.id}','${loopid.index}','q')" onmouseover="this.src='${pageContext.request.contextPath}/images/del1.png';" onmouseout="this.src='${pageContext.request.contextPath}/images/del0.png';" alt="delete"></td>
                                   </c:otherwise>
                               </c:choose>
                           </tr>
                           <tr><td colspan="3" style="height: 2px; padding: 0;"></td></tr>
                        </c:forEach>
                    </table>
                </div>
            </td>
        </tr>
        <tr><td colspan="2" height="8"></td></tr>
        <tr>
            <td colspan="2">
                <div>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr></tr>
                        <tr>
                            <td>
                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="title">Add people:</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="230px" valign="top"><stripes:text class="textwidthadjust" id="invUser" name="invUser" onblur="Util.validateUserAccess(this.value,'q');" onclick="document.getElementById('invDetailBlock').style.display = 'block'"/></td>
                                                    <td align="left" id="invUserValidStatus" class="contenterror">&nbsp;</td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td id="invDetailBlock" style="display:none">
                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td>
                                                        <input type="radio" value="0" name="invAccess" checked="checked" style="margin-left:0;"/>&nbsp;Can edit & order &nbsp;
                                                        <input type="radio" value="1" name="invAccess"/>&nbsp;Can view & order &nbsp;
                                                        <input type="radio" value="2" name="invAccess"/>&nbsp;Can view only &nbsp;&nbsp;
                                                        <a href="${pageContext.request.contextPath}/documentation/shareRights.jsp" target="_blank"><img class="info" src="${pageContext.request.contextPath}/images/info.png" title="Click to know your rights for sharing!" /></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="12"></td>
                                                </tr>
                                                <tr>
                                                    <td class="title">Add a comment for invited user:</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <stripes:textarea class="textwidthadjust" name="invDesc" onblur="textCounter(this,'pgBar',100);hideCounter('pgBar');" onkeyup="textCounter(this,'pgBar',100)"/>&nbsp;&nbsp;<div id="pgBar" class="progress" style="visibility:hidden"></div>
                                                    </td>
                                                </tr>
                                                <tr><td height="8"></td></tr>
                                                <tr><td><stripes:checkbox name="chkEmailNotify" value="Y"/>&nbsp;Send email notification</td></tr>
                                                <tr><td height="4"></td></tr>
                                                <tr><td><stripes:checkbox name="chkCopyToMyself" value="Y"/>&nbsp;Send a copy to myself</td></tr>
                                                <tr><td height="8"></td></tr>
                                                <tr>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td><stripes:submit name="doShareQuote" value="Share" class="login mb-control" onclick="Util.shareQuote();"/></td>
                                                                <td style="padding-left:5px"><stripes:submit name="cancel" value="Cancel" class="login" onclick="Util.hide('invDetailBlock');"/></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
</stripes:form>