<%@ include file="/taglibs.jsp"%>
<stripes:layout-render name="/layout/standard.jsp" keywords="login" description="Login site">
    <stripes:layout-component name="contents">
            <div class="float_Left">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="62%" valign="top">
                            <div class="module-title" style="margin: 25px 25px 5px 10px; width: 90%;">
                                <div>
                                    <div>
                                        <div style="height:100%">
                                            <h3>&nbsp;</h3>
                                            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                                                <tr><td class="title" style="font-weight: bold;">Welcome to PCBdirect :</td></tr>
                                                <tr><td height="4px"></td></tr>
                                                <tr><td>PCBdirect is a free online PCB price calculator and order management tool, which makes it easy to calculate/compare prices and order PCB's from some of the largest PCB manufactures in the world. </td></tr>
                                                <tr><td height="16px"></td></tr>
                                                <tr><td class="title" style="font-weight: bold;">Get started :</td></tr>
                                                <tr><td height="4px"></td></tr>
                                                <tr><td>In order  to use PCBdirect, you have to create a user account -<a href="${pageContext.request.contextPath}/user/Add.action?init">here</a> (free). If you experience any problems or have questions please have a look at the "Guided tour" or feel free to contact <a href="mailto:PCBdirect@azitech.dk">PCB-direct staff.</a></td></tr>
                                                <tr><td height="16px"></td></tr>
                                                <tr><td class="title" style="font-weight: bold;">PCBdirect features :</td></tr>
                                                <tr><td height="4px"></td></tr>
                                                <tr><td>
                                                    <ul style="padding:0 14px;">
                                                        <li>Instant PCB prices</li>
                                                        <li>Prices from 1-8 layers</li>
                                                        <li>Panelize your PCB</li>
                                                        <li>Save your quotations</li>
                                                        <li>Keep track of your orders</li>
                                                        <li>Quick re-order</li>
                                                    </ul>
                                                </td></tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td valign="top">
                            <div class="module-title" style="margin: 25px 0px 5px 10px;">
                                <div>
                                    <div>
                                        <div style="height:100%">
                                            <h3>Login</h3>
                                            <stripes:form action="/user/Login.action" focus="" name="loginForm" id="loginForm">
                                            <stripes:hidden name="targetUrl" value="${request.parameterMap['targetUrl']}"/>
                                            <table border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td valign="top" class="title" width="227">User Name :<br/>
                                                        <stripes:text name="username" class="textwidthadjust"/>
                                                    </td>
                                                </tr>
                                                <c:if test="${not empty actionBean.context.validationErrors['username']}">
                                                <tr>
                                                    <td>
                                                      <span class="contenterror">
                                                       <stripes:errors field="username">
                                                           <stripes:individual-error/>
                                                       </stripes:errors>
                                                      </span>
                                                    </td>
                                                </tr>
                                                </c:if>
                                                <tr><td height="8px"></td></tr>
                                                <tr>
                                                    <td valign="top" class="title">Password :<br/>
                                                        <stripes:password name="password" class="textwidthadjust"/>
                                                    </td>
                                                </tr>
                                                <c:if test="${not empty actionBean.context.validationErrors['password']}">
                                                <tr>
                                                    <td>
                                                      <span class="contenterror">
                                                       <stripes:errors field="password">
                                                                <stripes:individual-error/>
                                                            </stripes:errors>
                                                      </span>
                                                    </td>
                                                </tr>
                                                </c:if>
                                                <tr><td height="8px"></td></tr>
                                                <tr>
                                                    <td><stripes:submit name="login" value="Login" class="login"/></td>
                                                </tr>
                                                <tr><td height="8px"></td></tr>
                                                <tr>
                                                    <td><a href="${pageContext.request.contextPath}/user/Add.action?init" class="bulink">Register as new user</a></td>
                                                </tr>
                                                <tr><td height="4px"></td></tr>
                                                <tr>
                                                    <td><a href="#" class="bulink" onclick="new Ajax.Updater('forgotWindow','${pageContext.request.contextPath}/user/ForgotPass.action',{method:'get'});"><fmt:message key="forgotpassword"/></a></td>
                                                </tr>
                                                <tr><td height="4px"></td></tr>
                                                <tr>
                                                    <td><a href="${pageContext.request.contextPath}/azidocs/saveShortcut.jsp?username=" class="bulink">Add shortcut to desktop</a></td>
                                                </tr>
                                                <tr><td height="8px"></td></tr>

                                            </table>
                                            </stripes:form>
                                            <%--<stripes:form action="/user/ForgotPass.action" onsubmit="return false;" name="ForgotPassForm" id="ForgotPassForm" method="post">--%>
                                                <table>
                                                    <tr>
                                                        <td id="forgotWindow"></td>
                                                    </tr>
                                                </table>
                                            <%--</stripes:form>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="module-title" style="margin: 25px 25px 5px 10px; width: 99%;">
                                <div>
                                    <div>
                                        <div style="height:100%">
                                            <h3>&nbsp;</h3>
                                            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                                                <tr><td class="title" style="font-weight: bold;">Getting started with PCB-direct :</td></tr>
                                                <tr><td height="4px"></td></tr>
                                                <tr>
                                                    <td>
                                                        <table border="0">
                                                            <tr>
                                                                <td valign="top"><a target="_blank" href="${pageContext.request.contextPath}/azidocs/flashGuide.html" style="cursor:pointer;outline:none;"><img src="${pageContext.request.contextPath}/images/flashThumb.jpg"/></a></td>
                                                                <td valign="top">This movie shows you how easy it is to calculate and place and order with PCB-direct.<br/><br/><a target="_blank" href="${pageContext.request.contextPath}/azidocs/flashGuide.html" style="cursor:pointer;outline:none;">Watch it.</a></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
    </stripes:layout-component>
</stripes:layout-render>