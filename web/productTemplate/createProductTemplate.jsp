<%@ include file="/taglibs.jsp"%>

<stripes:layout-render class="form-control" name="/layout/standard.jsp" title="Product templates" home="Y" homelinkAction="saveSpec()">
    <stripes:layout-component name="head">

        <script type="text/javascript" src="${pageContext.request.contextPath}/scripts/specification.js"></script>

    </stripes:layout-component>
    <stripes:layout-component name="contents">
        <br/>
        <stripes:form beanclass="${actionBean.class}" method="post" class="">
            <stripes:hidden name="specification"></stripes:hidden>
            <stripes:hidden name="productTemplate"></stripes:hidden>
                <div class="form-group">
                    <label>Title</label><br/>
                <stripes:text name="productTemplate.title" class="form-control"></stripes:text>
                </div>
                <div class="form-group">
                    <label>Total print size in m²</label><br/>
                <stripes:text name="productTemplate.totalPrintSize" class="form-control"></stripes:text>
                </div>
                <div class="form-group">
                    <label>Price</label><br/>
                <stripes:text name="productTemplate.price" class="form-control"></stripes:text>
                </div>

                <div class="form-group">
                    <label>Production days</label><br/>
                <stripes:select name="productTemplate.productionDays" class="form-control">
                    <c:forEach var="i" begin="1" end="20" step="1">
                        <stripes:option value="${i}" label="${i}"/>
                    </c:forEach>
                </stripes:select>
            </div>
            <div class="form-group">
                <label>Transport</label><br/>
                <stripes:select name="productTemplate.transport" class="form-control">
                    <stripes:option value="Express">Express</stripes:option>
                    <stripes:option value="Economy">Economy</stripes:option>
                    <stripes:option value="By Ship">By Ship</stripes:option>
                </stripes:select>
            </div>
            <div class="form-group">
                <label>Image</label><br/>
                <stripes:file name="fileBean" accept=".jpeg, .jpg, .png, .gif"/>
            </div>
            <div class="form-group">
                <label>Description</label><br/>
                <stripes:textarea name="productTemplate.description" class="form-control"></stripes:textarea>
                </div>
                <div class="form-group">
                    <label>Specification</label><br/>
                <stripes:text disabled="true" name="specification.pcbreference" class="form-control"></stripes:text>
                </div>
                <div class="form-group">
                    <label>Publish your template</label><br/>
                    <div class="checkbox">
                        <label><stripes:checkbox name="productTemplate.published"></stripes:checkbox>Published</label>
                    </div>
                </div>
                <br/><br/>
                <stripes:submit class="btn btn-success" name="saveProductTemplate">Save template</stripes:submit>
                    <div style="clear:both"></div>
        </stripes:form>

        <style>
            form .form-group {
                margin-right: 15px;
                width: 300px;
                float: left;
            }

            form .form-group:nth-child(3n+3), .btn-success {
                clear: both;
            }

            .btn-success {
                float: left;
            }

            input[type="file"] {
                width: 100%;
            }


        </style>
    </stripes:layout-component> 
</stripes:layout-render>

