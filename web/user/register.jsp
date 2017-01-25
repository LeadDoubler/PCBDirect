<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/taglibs.jsp"%>
<%@page pageEncoding="UTF-8" contentType="text/html"%>

<%String lsTitle = "Register";%>
<c:if test="${user != null}">
    <%lsTitle = "Edit Information";%>
</c:if>
<stripes:layout-render name="/layout/standard.jsp" title="<%=lsTitle%>" home="Y">
    <stripes:layout-component name="contents">
        <stripes:form action="/user/AzitechRegister.action" class="form-horizontal">
            <stripes:hidden name="targetUrl" value="/user/notifyRegistration.jsp" />
            <stripes:hidden name="user"/>

           

            <div class="form-group">
                <label class="col-md-3 col-xs-12 control-label">Username </label>
                <div class="col-md-6 col-xs-12">
                    <div class="input-group">
                        <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                        <stripes:text name="user.username" class="form-control"/></div><span class="help-block">Please enter a desired username</span></div></div>
                        <c:if test="${not empty actionBean.context.validationErrors['user.username']}">
                <span class="contenterror">
                    <stripes:errors field="user.username">
                        <stripes:individual-error/>
                    </stripes:errors>
                </span>
            </c:if>

            <div class="form-group">
                <label class="col-md-3 col-xs-12 control-label">Email </label>
                <div class="col-md-6 col-xs-12">
                    <div class="input-group">
                        <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                        <stripes:text  name="user.email" class="form-control"/></div>
                        <span class="help-block">Please enter your email address</span>
                </div>
            </div>

            
                        <c:if test="${not empty actionBean.context.validationErrors['user.email']}">
                <span class="contenterror">
                    <stripes:errors field="user.email">
                        <stripes:individual-error/>
                    </stripes:errors>
                </span>
            </c:if>

            <c:if test="${actionBean.user.id == null or actionBean.user.id == user.id}">
                <div class="form-group">
                    <label class="col-md-3 col-xs-12 control-label">Password </label>
                    <div class="col-md-6 col-xs-12">                                             <div class="input-group">                                                 <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                            <stripes:password name="password1" class="form-control"/></div><span class="help-block">Please enter a desired password</span></div></div>
                            <c:if test="${not empty actionBean.context.validationErrors['password1']}">
                    <span class="contenterror">
                        <stripes:errors field="password1">
                            <stripes:individual-error/>
                        </stripes:errors>
                    </span>
                </c:if>

                <div class="form-group">
                    <label class="col-md-3 col-xs-12 control-label">Repeat Password </label>
                    <div class="col-md-6 col-xs-12">
                        <div class="input-group">
                            <span class="input-group-addon">
                                <span class="fa fa-pencil">
                                </span>
                            </span>
                            <stripes:password name="password2" class="form-control"/>
                        </div>
                        <span class="help-block">Please enter password again</span>
                    </div>
                </div>
                <c:if test="${not empty actionBean.context.validationErrors['password2']}">
                    <span class="contenterror">
                        <stripes:errors field="password2">
                            <stripes:individual-error/>
                        </stripes:errors>
                    </span>
                </c:if>
            </c:if>

            <div class="form-group">
                <label class="col-md-3 col-xs-12 control-label">First name </label>
                <div class="col-md-6 col-xs-12">                                             <div class="input-group">                                                 <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                        <stripes:text  name="user.firstName" class="form-control"/></div><span class="help-block">Please enter your first name</span></div></div>
                        <c:if test="${not empty actionBean.context.validationErrors['user.firstName']}">
                <span class="contenterror">
                    <stripes:errors field="user.firstName">
                        <stripes:individual-error/>
                    </stripes:errors>
                </span>
            </c:if>
            <div class="form-group">
                <label class="col-md-3 col-xs-12 control-label">Last name </label>
                <div class="col-md-6 col-xs-12">                                             <div class="input-group">                                                 <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                        <stripes:text name="user.lastName" class="form-control"/></div><span class="help-block">Please enter your last name</span></div></div>
                        <c:if test="${not empty actionBean.context.validationErrors['user.lastName']}">
                <span class="contenterror">
                    <stripes:errors field="user.lastName">
                        <stripes:individual-error/>
                    </stripes:errors>
                </span>
            </c:if>
            

            <div class="form-group">
                <label class="col-md-3 col-xs-12 control-label">CVR/VAT number </label>
                <div class="col-md-6 col-xs-12">                                             <div class="input-group">                                                 <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                        <stripes:text name="user.cvr" class="form-control"/></div><span class="help-block">Please enter the CVR/VAT number of the company you represent</span></div></div>
                        <c:if test="${not empty actionBean.context.validationErrors['user.cvr']}">
                <span class="contenterror">Please Enter CVR/VAT number</span>
            </c:if>

                <cat:in info="Please enter the name of the company you represent" classname="form-control" name="user.company" label="Company :" type="text"/>


                <div class="form-group">
                <label class="col-md-3 col-xs-12 control-label">Phone </label>
                <div class="col-md-6 col-xs-12">                                             <div class="input-group">                                                 <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                        <stripes:text  name="user.phone" class="form-control"/></div><span class="help-block">Please enter your phone number</span></div></div>
                        <c:if test="${not empty actionBean.context.validationErrors['user.phone']}">
                <span class="contenterror">
                    <stripes:errors field="user.phone">
                        <stripes:individual-error/>
                    </stripes:errors>
                </span>
            </c:if>

            <div class="form-group">
                <label class="col-md-3 col-xs-12 control-label">Mobile </label>
                <div class="col-md-6 col-xs-12">                                             <div class="input-group">                                                 <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                        <stripes:text name="user.mobile" class="form-control"/></div><span class="help-block">Please enter your mobile phone number</span></div></div>
                        <c:if test="${not empty actionBean.context.validationErrors['user.mobile']}">
                <span class="contenterror">
                    <stripes:errors field="user.mobile">
                        <stripes:individual-error/>
                    </stripes:errors>
                </span>
            </c:if>

            <div class="form-group">
                <label class="col-md-3 col-xs-12 control-label">Street </label>
                <div class="col-md-6 col-xs-12">                                             <div class="input-group">                                                 <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                        <stripes:text  name="user.street"  class="form-control"/></div><span class="help-block">Please enter the street name, where the company you represent is located</span></div></div>
                        <c:if test="${not empty actionBean.context.validationErrors['user.street']}">
                <span class="contenterror">
                    <stripes:errors field="user.street">
                        <stripes:individual-error/>
                    </stripes:errors>
                </span>
            </c:if>

            <div class="form-group">
                <label class="col-md-3 col-xs-12 control-label">City </label>
                <div class="col-md-6 col-xs-12">                                             <div class="input-group">                                                 <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                        <stripes:text name="user.city"  class="form-control"/></div><span class="help-block">Please enter the name of the city, where the company you represent is located</span></div></div>
                        <c:if test="${not empty actionBean.context.validationErrors['user.city']}">
                <span class="contenterror">
                    <stripes:errors field="user.city">
                        <stripes:individual-error/>
                    </stripes:errors>
                </span>
            </c:if>

            <div class="form-group">
                <label class="col-md-3 col-xs-12 control-label">Postalcode </label>
                <div class="col-md-6 col-xs-12">                                             <div class="input-group">                                                 <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                        <stripes:text name="user.postalCode" class="form-control"/></div><span class="help-block">Please enter the postalcode, where the company you represent is located</span></div></div>
                        <c:if test="${not empty actionBean.context.validationErrors['user.postalCode']}">
                <span class="contenterror" onmouseover="hideToolTip();">
                    <stripes:errors field="user.postalCode">
                        <stripes:individual-error/>
                    </stripes:errors>
                </span>
            </c:if>

            <div class="form-group">
                <label class="col-md-3 col-xs-12 control-label">Country for delivery </label>
                <div class="col-md-6 col-xs-12">                                             <div class="input-group">                                                 <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                        <stripes:select name="user.country" class="form-control">
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
                        </stripes:select></div><span class="help-block">Please select the country, where the PCB\'s must be delivered</span></div></div>
                        <c:if test="${not empty actionBean.context.validationErrors['user.country']}">
                <span class="contenterror"> </span>
            </c:if>

            <div class="form-group">
                <label class="col-md-3 col-xs-12 control-label">Currency </label>
                <div class="col-md-6 col-xs-12">                                             <div class="input-group">                                                 <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                        <stripes:select name="user.currency" class="form-control">
                            <stripes:option value="USD" label="USD"/>
                            <stripes:option value="Euro" label="EUR"/>
                            <stripes:option selected="selected" value="DKK" label="DKK"/>
                        </stripes:select></div><span class="help-block">Please select the currency which you would like to have displayed</span></div></div>
                        <c:if test="${not empty actionBean.context.validationErrors['user.currency']}">
                <span class="contenterror"> </span>
            </c:if>

            <cat:userAccess role="4">
                <div class="form-group">
                    <label class="col-md-3 col-xs-12 control-label">Discount </label>
                    <div class="col-md-6 col-xs-12">                                             <div class="input-group">                                                 <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                            <stripes:select name="user.discount" class="form-control">
                                <c:forEach var="i" begin="1" end="100" step="1">
                                    <stripes:option value="-${i}" label="-${i}"/>
                                </c:forEach>
                                <c:forEach var="i" begin="0" end="30" step="1">
                                    <stripes:option value="${i}" label="${i}"/>
                                </c:forEach>
                            </stripes:select></div><span class="help-block">Please select discount</span></div></div>
                            <c:if test="${not empty actionBean.context.validationErrors['user.discount']}">
                    <span class="contenterror"> </span>
                </c:if>
                <div class="form-group">
                    <label class="col-md-3 col-xs-12 control-label">&nbsp;</label>
                    <span class="form_left" style="visibility:hidden;">
                        <select disabled="disabled"></select>
                    </span>
                </div>
            </cat:userAccess>

            <div class="form-group">
                <label class="col-md-3 col-xs-12 control-label">Send invoice to </label>
                <div class="col-md-6 col-xs-12">                                             <div class="input-group">                                                 <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                        <stripes:text  name="user.sentinvoiceto" class="form-control"/></div><span class="help-block">Please enter the email address, which you would like the onvoice to be send to</span></div></div>
                        <c:if test="${not empty actionBean.context.validationErrors['user.sentinvoiceto']}">
                <span class="contenterror">
                    <stripes:errors field="user.sentinvoiceto">
                        <stripes:individual-error/>
                    </stripes:errors>
                </span>
            </c:if>
                        <c:if test="${user == null}">
         <div class="form-group">
                <label class="col-md-3 col-xs-12 control-label"></label>
                <div class="col-md-6 col-xs-12">
                    <div class="input-group">
                           <iframe frameborder="0" scrolling="auto" height="300px" width="615px;" src="${pageContext.request.contextPath}/azidocs/PCB%20Direct%20Basic%20Agreement.pdf"></iframe>
                           </div>
                        </div>
         </div>
                        </c:if>

            <div class="form-group">
                <label class="col-md-3 col-xs-12 control-label"></label>
                <div class="col-md-6 col-xs-12">                                             
                    <div class="input-group">
                        <span class="input-group-addon"></span>
                    </div>

                    <c:if test="${user == null}">
                        <div class="float_Left">
                            <span>
                                <input type="checkbox" checked="checked" id="agree_check" onclick="if(this.checked){$('submitdiv').show();$('nosubmitdiv').hide();}else{$('submitdiv').hide();$('nosubmitdiv').show();}">&nbsp;&nbsp;<label>I accept the user agreements.</label>
                            </span>
                        </div>
                    </c:if>
                </div>
            </div>
                           <div class="form-group">
                <label class="col-md-3 col-xs-12 control-label"></label>
                <div class="col-md-6 col-xs-12">
                    <div class="input-group">
                            <stripes:submit class="login" name="save" value="Confirm"/>
                    </div>
                </div>
                           </div>
                            <div class="float_Left" id="nosubmitdiv" style="display:none;" width="100%"><span><input style="background:#AAA left top;width:60px;cursor:default;" class="login" value="Confirm"/></span></div>



</stripes:form>
                            </stripes:layout-component>
                        </stripes:layout-render>

