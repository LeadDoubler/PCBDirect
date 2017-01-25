<%@tag description="put the tag description here" pageEncoding="UTF-8"%>

<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld"%>
<%@ taglib prefix="cat" tagdir="/WEB-INF/tags" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
   <%@attribute name="label" required="false"%>
   <%@attribute name="value" required="false" %>
   <%@ attribute name="layout" required="false" %>
   <%@ attribute name="styleClass" required="false" %>



<c:if test="${not empty value}">
    
<c:choose>
<c:when test="${layout eq 'row'}">
    <tr class="${styleClass}">
        <td>${label}
        </td>
        <td>${value}
        </td>
    </tr>
</c:when>
<c:otherwise>
    <tr class="gray0">
        <td class="title">${label}
        </td>
        <td class="content">${value}
        </td>
    </tr>
</c:otherwise>
</c:choose>


</c:if>

