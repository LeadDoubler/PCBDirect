<%@ include file="/taglibs.jsp"%>

<stripes:form action="/user/passwordReminder.action" onsubmit="return false;" name="ForgotPassForm" id="ForgotPassForm" method="post">
    <stripes:hidden name="send"/>
    <span class="title"><stripes:label for="insertEmail"/>:</span>
    <span class="form_left">
        <stripes:text name="email" class="textwidthadjust"/>
        <c:if test="${not empty actionBean.context.validationErrors['email']}">
            <span class="contenterror">
                <stripes:errors field="email">
                    <stripes:individual-error/>
                </stripes:errors>
            </span>
        </c:if>
    </span><br/>
    <span class="form_left" style="width:100px">
        <stripes:button class="login" name="send" value="Send" onclick="invoke($('#ForgotPassForm'), null, 'forgotWindow');"/>
    </span>
</stripes:form>

