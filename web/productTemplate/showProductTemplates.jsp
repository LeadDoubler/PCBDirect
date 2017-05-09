<%@ include file="/taglibs.jsp"%>

<stripes:layout-render class="form-control" name="/layout/standard.jsp" title="Product templates" home="Y" homelinkAction="saveSpec()">
    <stripes:layout-component name="head">

        <script type="text/javascript" src="${pageContext.request.contextPath}/scripts/specification.js"></script>

    </stripes:layout-component>
    <stripes:layout-component name="contents">
        <br/>

        <%@ include file="/productTemplate/productTemplatesHome.jsp"%>
    </stripes:layout-component> 
</stripes:layout-render>
<script>
    $(function () {
        sortTemplates("name");
    });
</script>
