<%@ include file="/taglibs.jsp"%>
<fmt:setLocale value="${pageContext.request.locale}"/>

<stripes:layout-render name="/layout/standard.jsp" title="Sitemap" keywords="sitemap" description="sitemap" language="${page.language.value}">
    <stripes:layout-component name="contents">
        <x:parse var="pages" xml="${page.root.xml}"/>
        <c:import var="pagesToList" url="/xsl/sitemap.xsl"/>
        <x:transform xml="${pages}" xslt="${pagesToList}">
            <x:param name="ctx" value="${pageContext.request.contextPath}"/>
        </x:transform>
    </stripes:layout-component>
</stripes:layout-render>