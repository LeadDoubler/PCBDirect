<%@ include file="/taglibs.jsp"%>


<jsp:useBean id="ps" class="com.asap.web.productTemplate.ProductTemplateActionBean"/>
<div id="sortBox">
    <button onclick="sortTemplates('name')" class="btn btn-primary"><i class="fa fa-sort-alpha-asc" aria-hidden="true"></i> Sort by name</button> <button onclick="sortTemplates('price')" class="btn btn-primary"><i class="fa fa-sort-amount-asc" aria-hidden="true"></i> Sort by price</button>
</div>
<div id="templates">
    <c:forEach items="${ps.productTemplates}" var="productTemplate">
        <c:if test="${productTemplate.published || actionBean.context.user.role.value == 5}">
            <div class="productTemplate">
                <img alt="[NO IMG]" src="${pageContext.request.contextPath}/productTemplate/ProductTemplate.action?getImage&productTemplate=${productTemplate}"/>
                <div>
                    <h2 class="templateName">${productTemplate.title}</h2>
                    <h5 class="templateSize"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${productTemplate.totalPrintSize}"/> m²</h5>
                </div>
                <h5>${productTemplate.description}</h5>
                <div>
                    <h4 class="templatePrice">DKK <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${productTemplate.price}" /></h4>
                    <h4><a href="${pageContext.request.contextPath}/productTemplate/ProductTemplate.action?orderProduct&productTemplate=${productTemplate}">Buy now</a></h4>
                </div>

                <c:if test="${actionBean.context.user.role.value == 5}">
                    <div class="adminInfo">
                        <c:if test="${actionBean.context.user.role.value == 5}">
                            <c:choose>
                                <c:when test="${productTemplate.published}">
                                    <c:set var="published" value="Published"></c:set>
                                </c:when>
                                <c:otherwise>
                                    <c:set var="published" value="In draft"></c:set>
                                </c:otherwise>
                            </c:choose>
                            <h5 class="<c:if test="${empty productTemplate.published || !productTemplate.published}">draft</c:if>"><em>${published}</em></h5>
                            <h5><a href="${pageContext.request.contextPath}/productTemplate/ProductTemplate.action?showProductTemplate&productTemplate=${productTemplate}">Edit template</a> (<a onclick="if (!confirm('Are you sure you want to delete this template?'))
                                    return false;" href="${pageContext.request.contextPath}/productTemplate/ProductTemplate.action?deleteProductTemplate&productTemplate=${productTemplate}"><i style="color: red;" class="fa fa-trash-o" aria-hidden="true"></i></a>)</h5>
                                </c:if>
                    </div>
                </c:if>
            </div>
        </c:if>
    </c:forEach>  
</div>
<script>

    function sortTemplates(type) {

        var sortedList = "";

        if (type == "price") {
            sortedList = $('#templates .productTemplate').sort(function (a, b) {
                var contentA = parseInt($(a).find(".templatePrice").text().replace("DKK", "").replace(".", ""));
                var contentB = parseInt($(b).find(".templatePrice").text().replace("DKK", "").replace(".", ""));
                return (contentA < contentB) ? -1 : (contentA > contentB) ? 1 : 0;
            });
        }

        if (type == "name") {
            sortedList = $('#templates .productTemplate').sort(function (a, b) {
                var contentA = $(a).find(".templateName").text().toLowerCase();
                var contentB = $(b).find(".templateName").text().toLowerCase();
                return (contentA < contentB) ? -1 : (contentA > contentB) ? 1 : 0;
            });
        }

        $('#templates').append(sortedList);

    }
</script>
<style>

    #sortBox {
        padding: 10px;
    }
    .adminInfo {
        clear: both;
    }

    .productTemplate h5 {
        white-space: pre-wrap;
    }

    .productTemplate {
        padding: 10px 10px 0;
        border: 1px solid #D8D8D8;
        display: inline-block;
        margin: 10px;
        background: #FBFBFB;
        max-width: 350px;
    }

    .productTemplate:hover {
        background: #FFF;
    }

    .productTemplate img {
        width: 100%;
    }

    .productTemplate h1, .productTemplate h2, .productTemplate h3, .productTemplate h4, .productTemplate h5 {
        padding: 10px 0 !important;
        font-weight: bold;
        margin: 0 !important;
    }

    .productTemplate > h5 {
        font-weight: normal; 
        overflow-y: auto; 
        height: 50px;
    }

    .adminInfo {
        border-top: 1px dotted;
    }

    .adminInfo h5 {
        font-weight: normal;
    }

    .draft {
        color: #a17e1a !important;
    }

    .productTemplate > div > *{
        display: table-cell;
        vertical-align: middle;
        white-space: nowrap;
    }
    .productTemplate > div > *:first-child{
        width: 100%;
        color: #1d7527;
    }

    .productTemplate > div > *:last-child{
        text-align: right;
    }

    .productTemplate > div:first-of-type > *{
        color: #33414E;
    }

</style>