<%@ include file="/taglibs.jsp"%>
<jsp:useBean id="specificationManager" scope="page" class="com.asap.catalog.dao.manager.SpecManager" />
<stripes:layout-render name="/layout/standard.jsp" title="Specifications by user" home="Y">
    <stripes:layout-component name="contents">
        <br/>
        <div class="table-responsive">
            <table width="819px" border="0" cellpadding="0" cellspacing="0" class="table table-striped round-table">
                <thead>
                    <tr>
                        <th>User</th>
                        <th>Company</th>
                        <th>Reference</th>
                        <th>PCB Name</th>
                        <th>Layers</th>
                        <c:if test="${actionBean.context.user.role.value == 5}"><th></th></c:if>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="spec" items="${specificationManager.allSpecs}" varStatus="loopid">
                        <tr class="gray${loopid.index%2}" style="cursor:pointer" onclick="showSpecification(${spec.id}, event);">
                            <td>${spec.user.fullname} (${spec.user.username})</td>
                            <td>${spec.user.company}</td>
                            <td><cat:str value="${spec.reference}" length="25"/></td>
                            <td><cat:str value="${spec.pcbreference}" length="15"/></td>
                            <td><fmt:formatNumber value="${spec.layers}" maxFractionDigits="0"/></td>
                            <c:if test="${actionBean.context.user.role.value == 5}"><td align="right"><input type="button" value="Save as template" class="btn btn-primary"/></td></c:if>
                            </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <script>

            function showSpecification(id, event) {
                var url;
                if (event.target.nodeName == "INPUT") {
                    url = '${pageContext.request.contextPath}/productTemplate/ProductTemplate.action?showProductTemplate&specification=' + id;
                } else {
                    url = '${pageContext.request.contextPath}/specification/Specification.action?specification=' + id;
                }

                window.location = url;
            }
        </script>
    </stripes:layout-component>
</stripes:layout-render>