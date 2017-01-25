<%@ include file="/taglibs.jsp"%>
<fmt:setBundle basename="StripesResources"/>
<br><center><strong>An email has been sent to: ${actionBean.user.email} with user credentials.</strong><br/><a href="${pageContext.request.contextPath}/user/Login.action">Get back to PCB-DIRECT</a></center><br>