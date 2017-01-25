<%@ include file="/taglibs.jsp"%>


<jsp:useBean id="ps" class="com.asap.web.productTemplate.ProductTemplateActionBean"/>
<c:forEach items="${ps.productTemplates}" var="productTemplate">
    <c:if test="${productTemplate.published || actionBean.context.user.role.value == 5}">
        <div class="productTemplate">
            <img alt="[NO IMG]" src="${pageContext.request.contextPath}/productTemplate/ProductTemplate.action?getImage&productTemplate=${productTemplate}"/>
            <div>
                <h2>${productTemplate.title}</h2>
                <h5><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${productTemplate.totalPrintSize}"/> m²</h5>
            </div>
            <h5 style="font-weight: normal">${productTemplate.description}</h5>
            <div>
                <h4>DKK <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${productTemplate.price}" /></h4>
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
                        <h5><a href="${pageContext.request.contextPath}/productTemplate/ProductTemplate.action?showProductTemplate&productTemplate=${productTemplate}">Edit template</a></h5>
                    </c:if>
                </div>
            </c:if>
        </div>
    </c:if>
</c:forEach>    
<style>

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
    }

    .productTemplate:hover {
        background: #FFF;
    }

    .productTemplate img {
        width: 100%;
        max-width: 275px;
    }

    .productTemplate h1, .productTemplate h2, .productTemplate h3, .productTemplate h4, .productTemplate h5 {
        padding: 10px 0 !important;
        font-weight: bold;
        margin: 0 !important;
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