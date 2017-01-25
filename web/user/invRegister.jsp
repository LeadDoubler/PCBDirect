<%@ include file="/taglibs.jsp"%>
<%@page pageEncoding="UTF-8" contentType="text/html"%>

<stripes:layout-render name="/layout/standard.jsp" title="Register" home="Y">
    <stripes:layout-component name="contents">
        <stripes:form action="/user/AzitechRegister.action">
            <stripes:hidden name="targetUrl" value="/user/notifyRegistration.jsp" />
            <stripes:hidden name="user.token"/>
                <div class="floatLeft box">
                    <span class="title">Username :</span><br />
                    <span class="form_left">
                        <stripes:text name="user.username" class="textwidthadjust"/><img class="info" src="../images/info.png" onmouseover="showToolTip(this,'Please enter a desired username');" onmouseout="hideToolTip();"/>
                        <c:if test="${not empty actionBean.context.validationErrors['user.username']}">
                            <span class="contenterror">
                                <stripes:errors field="user.username">
                                  <stripes:individual-error/>
                                </stripes:errors>
                            </span>
                        </c:if>
                    </span>
                </div>

                <div class="floatright box">
                    <span class="title">Email :</span><br />
                    <span class="form_left">
                        <stripes:text name="user.email" class="textwidthadjust" readonly="readonly"/><img class="info" src="../images/info.png" onmouseover="showToolTip(this,'Please enter your email address');" onmouseout="hideToolTip(); "/>
                        <c:if test="${not empty actionBean.context.validationErrors['user.email']}">
                            <span class="contenterror">
                                <stripes:errors field="user.email">
                                  <stripes:individual-error/>
                                </stripes:errors>
                            </span>
                        </c:if>
                    </span>
                </div>
                <c:if test="${actionBean.user.id == null or actionBean.user.id == user.id}">
                    <div class="floatLeft box">
                        <span class="title">Password :</span><br/>
                        <span class="form_left">
                        <stripes:password name="password1" class="textwidthadjust"/><img class="info" src="../images/info.png" onmouseover="showToolTip(this,'Please enter a desired password');" onmouseout="hideToolTip();"/>
                        <c:if test="${not empty actionBean.context.validationErrors['password1']}">
                            <span class="contenterror">
                                <stripes:errors field="password1">
                                  <stripes:individual-error/>
                                </stripes:errors>
                            </span>
                        </c:if>
                        </span>
                    </div>

                    <div class="floatright box">
                        <span class="title">Repeat Password :</span><br/>
                        <span class="form_left">
                            <stripes:password name="password2" class="textwidthadjust"/><img class="info" src="../images/info.png" onmouseover="showToolTip(this,'Please enter password again');" onmouseout="hideToolTip();"/>
                            <c:if test="${not empty actionBean.context.validationErrors['password2']}">
                                <span class="contenterror">
                                    <stripes:errors field="password2">
                                      <stripes:individual-error/>
                                    </stripes:errors>
                                </span>
                            </c:if>
                        </span>
                    </div>
                </c:if>

                <div class="floatLeft box">
                    <span class="title">First name :</span><br/>
                    <span class="form_left">
                        <stripes:text name="user.firstName" class="textwidthadjust"/><img class="info" src="../images/info.png" onmouseover="showToolTip(this,'Please enter your first name');" onmouseout="hideToolTip();"/>
                        <c:if test="${not empty actionBean.context.validationErrors['user.firstName']}">
                            <span class="contenterror">
                                <stripes:errors field="user.firstName">
                                  <stripes:individual-error/>
                                </stripes:errors>
                            </span>
                        </c:if>
                    </span>
                </div>
                <div class="floatright box">
                    <span class="title">Last name :</span><br/>
                    <span class="form_left">
                        <stripes:text name="user.lastName" class="textwidthadjust"/><img class="info" src="../images/info.png" onmouseover="showToolTip(this,'Please enter your last name');" onmouseout="hideToolTip();"/>
                        <c:if test="${not empty actionBean.context.validationErrors['user.lastName']}">
                            <span class="contenterror">
                                <stripes:errors field="user.lastName">
                                  <stripes:individual-error/>
                                </stripes:errors>
                            </span>
                        </c:if>
                    </span>
                </div>

                <div class="floatLeft box">
                    <span class="title">CVR/VAT number :</span><br/>
                    <span class="form_left">
                        <stripes:text name="user.cvr" class="textwidthadjust"/><img class="info" src="../images/info.png" onmouseover="showToolTip(this,'Please enter the CVR/VAT number of the company you represent');" onmouseout="hideToolTip();"/>
                        <c:if test="${not empty actionBean.context.validationErrors['user.cvr']}">
                            <span class="contenterror">Please Enter CVR/VAT number</span>
                        </c:if>
                    </span>
                </div>

                <div class="floatright box">
                    <cat:in info="Please enter the name of the company you represent" classname="textwidthadjust" name="user.company" label="Company :" type="text"/>
                </div>
                <div class="floatLeft box">
                    <span class="title">Phone :</span><br/>
                    <span class="form_left">
                        <stripes:text name="user.phone" class="textwidthadjust"/><img class="info" src="../images/info.png" onmouseover="showToolTip(this,'Please enter your phone number');" onmouseout="hideToolTip();"/>
                        <c:if test="${not empty actionBean.context.validationErrors['user.phone']}">
                            <span class="contenterror">
                                <stripes:errors field="user.phone">
                                  <stripes:individual-error/>
                                </stripes:errors>
                            </span>
                        </c:if>
                    </span>
                </div>

                <div class="floatright box">
                    <span class="title">Mobile :</span><br/>
                    <span class="form_left">
                        <stripes:text name="user.mobile" class="textwidthadjust"/><img class="info" src="../images/info.png" onmouseover="showToolTip(this,'Please enter your mobile phone number');" onmouseout="hideToolTip();"/>
                        <c:if test="${not empty actionBean.context.validationErrors['user.mobile']}">
                            <span class="contenterror">
                                <stripes:errors field="user.mobile">
                                  <stripes:individual-error/>
                                </stripes:errors>
                            </span>
                        </c:if>
                    </span>
                </div>

                <div class="floatLeft box">
                    <span class="title">Street :</span><br/>
                    <span class="form_left">
                        <stripes:text name="user.street"  class="textwidthadjust"/><img class="info" src="../images/info.png" onmouseover="showToolTip(this,'Please enter the street name, where the company you represent is located');" onmouseout="hideToolTip();"/>
                        <c:if test="${not empty actionBean.context.validationErrors['user.street']}">
                            <span class="contenterror">
                                <stripes:errors field="user.street">
                                  <stripes:individual-error/>
                                </stripes:errors>
                            </span>
                        </c:if>
                    </span>
                </div>

                <div class="floatright box">
                    <span class="title">City :</span><br/>
                    <span class="form_left">
                        <stripes:text name="user.city"  class="textwidthadjust"/><img class="info" src="../images/info.png" onmouseover="showToolTip(this,'Please enter the name of the city, where the company you represent is located');" onmouseout="hideToolTip();"/>
                        <c:if test="${not empty actionBean.context.validationErrors['user.city']}">
                            <span class="contenterror">
                                <stripes:errors field="user.city">
                                  <stripes:individual-error/>
                                </stripes:errors>
                            </span>
                        </c:if>
                    </span>
                </div>

                <div class="floatLeft box">
                    <span class="title">Postalcode :</span><br/>
                    <span class="form_left">
                        <stripes:text name="user.postalCode" class="textwidthadjust"/><img class="info" src="../images/info.png" onmouseover="showToolTip(this,'Please enter the postalcode, where the company you represent is located');" onmouseout="hideToolTip();"/>
                        <c:if test="${not empty actionBean.context.validationErrors['user.postalCode']}">
                            <span class="contenterror" onmouseover="hideToolTip();">
                                <stripes:errors field="user.postalCode">
                                  <stripes:individual-error/>
                                </stripes:errors>
                            </span>
                        </c:if>

                    </span>
                </div>

                <div class="floatright box">
                    <span class="title">Country for delivery :</span><br/>
                    <span class="form_left">
                        <stripes:select name="user.country" class="textwidthadjust">
                            <stripes:option value="Denmark" label="Denmark"/>
                            <stripes:option value="Sweden" label="Sweden"/>
                            <stripes:option value="Norway" label="Norway"/>
                            <stripes:option value="Great Brittain" label="Great Brittain"/>
                            <stripes:option value="Belgium" label="Belgium"/>
                            <stripes:option value="Holland" label="Holland"/>
                            <stripes:option value="Luxemburg" label="Luxemburg"/>
                            <stripes:option value="Germany" label="Germany"/>
                            <stripes:option value="France" label="France"/>
                            <stripes:option value="Spain" label="Spain"/>
                            <stripes:option value="Italy" label="Italy"/>
                            <stripes:option value="Poland" label="Poland"/>
                            <stripes:option value="Hungary" label="Hungary"/>
                            <stripes:option value="Slovakia" label="Slovakia"/>
                            <stripes:option value="Turkey" label="Turkey"/>
                            <stripes:option value="Macedonia" label="Macedonia"/>
                            <stripes:option value="Taiwan" label="Taiwan"/>
                            <stripes:option value="Israel" label="Israel"/>
                            <stripes:option value="Thailland" label="Thailland"/>
                            <stripes:option value="China" label="China"/>
                        </stripes:select><img class="info" src="../images/info.png" onmouseover="showToolTip(this,'Please select the country, where the PCB\'s must be delivered');" onmouseout="hideToolTip();"/>
                        <c:if test="${not empty actionBean.context.validationErrors['user.country']}">
                            <span class="contenterror"> </span>
                        </c:if>
                    </span>
                </div>

                <div class="floatLeft box">
                    <span class="title">Currency :</span><br/>
                    <span class="form_left">
                        <stripes:select name="user.currency" class="textwidthadjust">
                            <stripes:option value="USD" label="USD"/>
                            <stripes:option value="Euro" label="EUR"/>
                            <stripes:option selected="selected" value="DKK" label="DKK"/>
                        </stripes:select><img class="info" src="../images/info.png" onmouseover="showToolTip(this,'Please select the currency which you would like to have displayed');" onmouseout="hideToolTip();"/>
                        <c:if test="${not empty actionBean.context.validationErrors['user.currency']}">
                            <span class="contenterror"> </span>
                        </c:if>
                    </span>
                </div>

                <cat:userAccess role="4">
                    <div class="floatLeft box">
                        <span class="title">Discount :</span><br/>
                        <span class="form_left">
                            <stripes:select name="user.discount" class="textwidthadjust">
                                <c:forEach var="i" begin="1" end="100" step="1">
                                    <stripes:option value="-${i}" label="-${i}"/>
                                </c:forEach>
                                <c:forEach var="i" begin="0" end="30" step="1">
                                    <stripes:option value="${i}" label="${i}"/>
                                </c:forEach>
                            </stripes:select><img class="info" src="../images/info.png" onmouseover="showToolTip(this,'Please select discount');" onmouseout="hideToolTip();"/>
                            <c:if test="${not empty actionBean.context.validationErrors['user.discount']}">
                                <span class="contenterror"> </span>
                            </c:if>
                        </span>
                    </div>
                    <div class="floatLeft box">
                        <span class="title">&nbsp;</span><br/>
                        <span class="form_left" style="visibility:hidden;">
                            <select disabled="disabled"></select>
                        </span>
                    </div>
                </cat:userAccess>

                <div class="floatLeft box">
                    <span class="title">Send invoice to :</span><br />
                    <span class="form_left">
                        <stripes:text name="user.sentinvoiceto" class="textwidthadjust"/><img class="info" src="../images/info.png" onmouseover="showToolTip(this,'Please enter the email address, which you would like the onvoice to be send to');" onmouseout="hideToolTip();"/>
                        <c:if test="${not empty actionBean.context.validationErrors['user.sentinvoiceto']}">
                            <span class="contenterror">
                                <stripes:errors field="user.sentinvoiceto">
                                  <stripes:individual-error/>
                                </stripes:errors>
                            </span>
                        </c:if>
                    </span>
                </div>

                <div class="floatright box">
                    <span class="title"><br/></span>
                    <span class="form_left"></span>
                </div>

                <c:if test="${user == null}">
                <div class="float_Left"  style="width:90%;">
                    <span class="form_left">
                        <iframe frameborder="0" scrolling="auto" height="300px" width="615px;" src="${pageContext.request.contextPath}/azidocs/PCB%20Direct%20Basic%20Agreement.pdf"></iframe>
                    </span>
                </div>

                <div class="float_Left">
                    <span>
                        <input type="checkbox" checked="checked" id="agree_check" onclick="if(this.checked){$('submitdiv').show();$('nosubmitdiv').hide();}else{$('submitdiv').hide();$('nosubmitdiv').show();}">&nbsp;&nbsp;<span class="title">I accept the user agreements.</span>
                    </span>
                </div>
                </c:if>
                <div class="float_Left" id="submitdiv" width="100%"><span><stripes:submit class="login" name="processInvReg" value="Confirm"/></span></div>
                <div class="float_Left" id="nosubmitdiv" style="display:none;" width="100%"><span><input style="background:#AAA left top;width:60px;cursor:default;" class="login" value="Confirm"/></span></div>
        </stripes:form>
    </stripes:layout-component>
</stripes:layout-render>

