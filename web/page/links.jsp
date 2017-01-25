<%@ taglib prefix="cat" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld"%>
<div class="marginleft">
<cat:userAccess role="3">
    <stripes:link href="${pageContext.request.contextPath}/page/Page.action?edit&page=${actionBean.page.id}">Rediger</stripes:link>
    <c:if test="${actionBean.page.childless}">
          <a href="#" onclick="if(confirm('Er du sikker på at du vil slette denne side?'))
       window.location='${pageContext.request.contextPath}/page/Page.action?delete&page=${actionBean.page}';">Slet</a>
    </c:if>
    <stripes:link href="${pageContext.request.contextPath}/page/Page.action?edit&page.parent=${actionBean.page}">Ny side</stripes:link>
    <stripes:link href="${pageContext.request.contextPath}/page/Page.action?moveUp&page=${actionBean.page}">Op</stripes:link>
    
    <stripes:link href="${pageContext.request.contextPath}/page/Page.action?moveDown&page=${actionBean.page}">Ned</stripes:link>
    
    <c:choose>
        <c:when test="${actionBean.page.deactivated eq 'yes'}">
            <stripes:link href="${pageContext.request.contextPath}/page/Page.action?deactivate&page=${actionBean.page}">Aktiver</stripes:link>

        </c:when>
        <c:otherwise>
            <stripes:link href="${pageContext.request.contextPath}/page/Page.action?activate&page=${actionBean.page}">Deaktiver</stripes:link>

        </c:otherwise>
    </c:choose>
    
</cat:userAccess>
</div>
<cat:userAccess role="5">
    <stripes:link href="${pageContext.request.contextPath}/page/Page.action" event="editMetaTags"><stripes:param name="page" value="${actionBean.page}" />Metatags</stripes:link>
</cat:userAccess>
    