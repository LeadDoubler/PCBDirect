<%@tag description="Checks for user access to resource" pageEncoding="UTF-8"%>

<%-- Taglib directives can be specified here: --%>
<%--
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
--%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%--
<%@attribute name="title" required="true"%>
<%@attribute name="author"%>
<%@attribute name="price_info" fragment="true"%>
--%>

<%-- Use expression language to work with normal attributes or use --%>
<%-- the <jsp:invoke> or <jsp:doBody> actions to invoke JSP fragments or tag body: --%>

   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

   <%@attribute name="role" required="true"%>
   <%@attribute name="user_id" required="false"%>
       <c:choose>
           <c:when test="${user_id != null}">
               <c:if test="${sessionScope.user.role.value >= role or sessionScope.user.id == user_id}">	       

                        <jsp:doBody/>

                </c:if>
           </c:when>
           <c:otherwise>
               <c:if test="${sessionScope.user.role.value >= role}">	       

                        <jsp:doBody/>

                </c:if>
            </c:otherwise>
       </c:choose>
           
	   
	   
