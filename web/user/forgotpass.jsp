<%@ include file="/taglibs.jsp"%>

<stripes:form action="/user/ForgotPass.action" id="ForgotPassForm" method="post">
    <cat:in name="email" label="Enter email associated with your account"/>
    <stripes:submit class="btn btn-danger" name="send" value="Send"/>

</stripes:form>

