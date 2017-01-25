<%@ include file="/taglibs.jsp"%>

<jsp:useBean id="pageManager" scope="page" class="com.asap.catalog.dao.manager.PageManager" />


<stripes:layout-render name="/layout/standard.jsp" title="Deaktiverede sider">
    <stripes:layout-component name="contents">
        
         <ul>
         <c:forEach items="${pageManager.deactivatedPages}" var="result">
         
                     <li>
                     <a href="${pageContext.request.contextPath}/page/${result}">${result.title}</a>
                     </li> 
         </c:forEach>
         </ul>
         
 
         
    </stripes:layout-component>
</stripes:layout-render>
