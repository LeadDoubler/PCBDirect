<%--
  Created by IntelliJ IDEA.
  User: Gaurav
  Date: 9 Jun, 2010
  Time: 11:20:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/taglibs.jsp"%>

<stripes:layout-render name="/layout/standard.jsp" language="${page.language.value}">
    <stripes:layout-component name="contents">
        <div class="container">
            <div class="suckerfish" id="horiz-menu" style="margin:0 10px -34px 34%;width:64%;">
                <ul class="menutop">
                    <li class="parent blue item1"><a href="http://www.azitech.dk/Stencils-Standard/stencils.html"><span>Invite People</span></a></li>
                    <li class="parent blue item1" id="access"><a href="http://www.azitech.dk/Stencils-Standard/stencils.html"><span>People with access</span></a></li>
                    <li class="parent blue item1" id="permission"><a href="http://www.azitech.dk/Stencils-Standard/stencils.html"><span>Advance Permission</span></a></li>
                    <li id="contactlist"><a href="http://www.azitech.dk/Stencils-Standard/stencils.html"><span>Contact List</span></a></li>
                </ul>
            </div>
            <div class="block-surround">
                <div class="block-surround2">
                    <div class="block-surround3">
                        <div class="block-surround4" style="padding:34px 0 0;">
                            <div id="bottommodules2" class="spacer w33">
                                <div class="block" style="width:100%">
                                    <div class="module" style="overflow:visible">
                                        <div>
                                            <div>
                                                <div style="margin: 0 0 0 20px;">
                                                    <stripes:form action="/share/Sharing.action" name="inviteForm" id="inviteForm">
                                                        <table border="0" cellpadding="0" cellspacing="0"> 
                                                            <tr><td height="8"></td></tr>
                                                            <tr><td><a class="bulink" href="${pageContext.request.contextPath}/share/Sharing.action">Back to Sharing Dashboard</a></td></tr>
                                                            <tr><td height="8"></td></tr>
                                                        </table>
                                                    </stripes:form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- container -->
    </stripes:layout-component>
</stripes:layout-render>