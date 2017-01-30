<%@ include file="/taglibs.jsp"%>

<stripes:layout-render class="form-control" name="/layout/standard.jsp" title="Product specification" home="Y" homelinkAction="saveSpec()">
    <stripes:layout-component name="head">

        <script type="text/javascript" src="${pageContext.request.contextPath}/scripts/specification.js"></script>

    </stripes:layout-component>
    <stripes:layout-component name="contents">
        <br/>
        <div class="joined" style="display: inline-block;">
            <div>
                <label>Width</label>
                <div class="input-group">
                    <span class="input-group-addon">mm</span>
                    <input id="width" class="form-control" step="0.1" type="number"/>
                </div>
            </div>
            <div>
                <label>Length</label>
                <div class="input-group">
                    <span class="input-group-addon">mm</span>
                    <input id="length" class="form-control" step="0.1" type="number"/>
                </div>
            </div>
            <div style="vertical-align: bottom;">
                <input onclick="calc();" class="btn btn-danger" type="button" value="Calculate"/>
            </div>
        </div>
        <br/>
        <br/>
        <h5>Total Print Size: <strong><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${actionBean.productTemplate.totalPrintSize}" /> m²</strong></h5>
        <h5>Price: <strong>DKK <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${actionBean.productTemplate.price}" /></strong></h5>
        <div id="result">
            <hr style="border-color: #b0b0b0;">
            <h5>Units: <span id="units"></span></h5>
            <h5>Price per unit: <strong>DKK</strong> <span id="unitPrice"></span></h5>
                <stripes:form id="quoteForm" beanclass="${actionBean.class}">
                    <stripes:hidden name="productTemplate"></stripes:hidden>
                    <stripes:hidden id="specWidth" name="width"></stripes:hidden>
                    <stripes:hidden id="specHeight" name="height"></stripes:hidden>
                    <stripes:hidden id="specQuantity" name="quantity"></stripes:hidden>
                    <stripes:hidden id="specUnitPrice" name="unitPrice"></stripes:hidden>
                    <stripes:submit name="makeQuote" class="btn btn-success">Buy specification</stripes:submit>
            </stripes:form>
            <a href="${pageContext.request.contextPath}/specification/Specification.action?specification=${actionBean.productTemplate.specification}" style="margin-left: 10px;">Create your own</a>
        </div>

        <style>

            h5 {
                padding-left: 0 !important; 
            }
            #result {
                margin-top: 20px;
                display: none;
            }

            #result span {
                font-weight: bold;
            }

            .joined > div {
                margin-right: 20px;
                display: inline-block;
                max-width: 150px;
            }

        </style>
        <script>
            function calc() {

                var width = $('#width').val();
                var length = $('#length').val();

                if (width.length > 0 && length.length > 0 && !isNaN(width) && !isNaN(length)) {

                    var total = ${actionBean.productTemplate.totalPrintSize};
                    var price = ${actionBean.productTemplate.price};
                    var m2 = (width * length) / 10000 / 100;

                    var units = parseInt(total / m2);
                    var unitPrice = parseInt((price / units) * 100) / 100;

                    $('#units').text(units);
                    $('#unitPrice').text(unitPrice);

                    $('#specQuantity').val(units);
                    $('#specWidth').val(width);
                    $('#specHeight').val(length);
                    $('#specUnitPrice').val(unitPrice);

                    $('#result').slideDown();
                } else {
                    alert("Please input a valid number in 'Width' and 'Length'")
                }
            }
        </script>

    </stripes:layout-component> 
</stripes:layout-render>

