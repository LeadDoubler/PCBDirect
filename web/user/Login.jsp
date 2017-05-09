<%@ include file="/taglibs.jsp" %>
<stripes:layout-render name="/layout/standard.jsp" title="Login">
    <fmt:setBundle basename="StripesResources"/>

    <stripes:layout-component name="menubar">
    </stripes:layout-component>

    <stripes:layout-component name="topMenuWithNav">
    </stripes:layout-component>

    <stripes:layout-component name="topMenu">
        <div class="contactinfo">
            <div id="et-info">CVR: 29417717 | +45 6613 0768 | <a href="mailto:sales@azitech.dk">sales@azitech.dk</a> | <a onclick="$('#templatesBox').hide(); $('#loginBox').fadeIn();" href="#/" class="loginlink">LOGIN</a></div>

        </div>
        <div id="topMenu">
            <a href="${pageContext.request.contextPath}/startup/Startup.action?home"><img src="${pageContext.request.contextPath}/images/logo-trans-small.png"/></a>
        </div>
    </stripes:layout-component>
    <stripes:layout-component name="complete">
        <c:if test="${not empty pageContext.request.parameterMap.home}">
            <div id="templatesBox">
                <div id="templates">
                    <%@ include file="/productTemplate/productTemplatesHome.jsp"%>
                </div>
            </div>
            <script>


                function sortTemplates(type) {

                    var sortedList = "";

                    if (type == "price") {
                        sortedList = $('#templates .productTemplate').sort(function (a, b) {
                            var contentA = parseInt($(a).find(".templatePrice").text().replace("DKK", "").replace(".", ""));
                            var contentB = parseInt($(b).find(".templatePrice").text().replace("DKK", "").replace(".", ""));
                            return (contentA < contentB) ? -1 : (contentA > contentB) ? 1 : 0;
                        });
                    }

                    if (type == "name") {
                        sortedList = $('#templates .productTemplate').sort(function (a, b) {
                            var contentA = $(a).find(".templateName").text().toLowerCase();
                            var contentB = $(b).find(".templateName").text().toLowerCase();
                            return (contentA < contentB) ? -1 : (contentA > contentB) ? 1 : 0;
                        });
                    }

                    $('#templates').append(sortedList);

                }
            </script>
            <style>
                #loginBox {
                    display: none;
                }
            </style>
        </c:if>
        <div id="loginBox" class="row">
            <br/>
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="panel-title-box">
                            <h3>Welcome to PCBdirect</h3>
                            <span></span>
                        </div>
                        <div class="panel-body panel-body-table">
                            <table border="0" cellspacing="0" cellpadding="0" width="100%">
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
                        </div></div>
                </div>
            </div>

            <div class="col-md-6">


                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="panel-title-box">
                            <h3>Login</h3>
                            <span>Access your dashboard</span>
                        </div>
                        <div class="panel-body panel-body-table">
                            <stripes:form action="/user/Login.action" focus="" name="loginForm" id="loginForm">
                                <stripes:hidden name="targetUrl" value="${requestScope['javax.servlet.forward.request_uri']}"/>
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
                                        <td><stripes:submit name="login" value="Login" class="btn btn-primary login"/></td>
                                    </tr>
                                    <tr><td height="8px"></td></tr>
                                    <tr>
                                        <td><a href="${pageContext.request.contextPath}/user/Add.action?init" class="bulink">Register as new user</a></td>
                                    </tr>
                                    <tr><td height="4px"></td></tr>
                                    <tr>
                                        <td><a href="#" class="bulink" onclick="$('#forgotWindow').load('${pageContext.request.contextPath}/user/ForgotPass.action');"><fmt:message key="forgotpassword"/></a></td>
                                    </tr>
                                    <tr><td height="4px"></td></tr>
                                    <tr>
                                        <td><a href="${pageContext.request.contextPath}/azidocs/saveShortcut.jsp?username=" class="bulink">Add shortcut to desktop</a></td>
                                    </tr>
                                    <tr><td height="8px"></td></tr>

                                </table>
                            </stripes:form>
                            <%--<stripes:form action="/user/ForgotPass.action" onsubmit="return false;" name="ForgotPassForm" id="ForgotPassForm" method="post">--%>
                            <div id="forgotWindow">

                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </stripes:layout-component>
</stripes:layout-render>
<script>
    $(function () {
        sortTemplates("name");
    });
</script>