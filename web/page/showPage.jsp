<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld"%>
<%@ taglib prefix="cat" tagdir="/WEB-INF/tags" %>




<stripes:layout-render name="/layout/standard.jsp" title="${actionBean.page.heading}" method="showPage" keywords="${actionBean.page.keywords}" description="${actionBean.page.description}" language="${actionBean.page.language.value}">
    <stripes:layout-component name="contents">
        <jsp:include page="links.jsp"/>
        <c:choose>
            <c:when test="${page.contentforward != null and page.contentforward != ''}">
                <script type="text/javascript">
                    Event.observe(window, 'load', page_insert, false);

                    function page_insert(evt) {
                        var url = '${pageContext.request.contextPath}${page.contentforward}';
                        new Ajax.Updater('insertBlock',url,{method:'get'});	    
                    }
                </script>
                <span id="insertBlock"></span>
                
            </c:when>
            <c:otherwise>    
                <%@ include file="topOfContent.jsp" %>                
                ${actionBean.page.content}
                <jsp:include page="bottomOfContent.jsp"/>
            </c:otherwise>
        </c:choose>
    </stripes:layout-component>
</stripes:layout-render>