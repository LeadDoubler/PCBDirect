<%@ include file="/taglibs.jsp"%>

<stripes:layout-render name="/layout/standard.jsp" title="Quote" home="Y" homelinkinfo="Y">

    <stripes:layout-component name="head">

        <script type="text/javascript">

            function calculate(form, name, position) {
                $('#right_qoute').text('Please wait..');
                $('#qouten').value = '';
                voke(form, name, position);

            }

        </script>

        <style>
            #specMenu hr {
                border-color: #dbdbdb;
            }

            #specMenu {
                text-align: center;
                margin: 10px 0;
            }
            .specMenuItem > div:first-child {
                border-radius: 100%;
                background: #DBDBDB;
                width: 50px;
                height: 50px;
                line-height: 48px;
                font-weight: bold;
                font-size: 1.2em;
                margin: 0 auto 10px;
                color: white;
            }

            .specMenuItem.selected > div:first-child {
                background: #4F9FEA;
            }
        </style>

    </stripes:layout-component>

    <stripes:layout-component name="contents">
        <div id="specMenu" class="row">
            <div class="col-sm-1 col-xs-1">
                <div class="specMenuItem">
                    <div>1</div>
                    <div>PCB specification</div>
                </div>
            </div>
            <div class="col-sm-1 col-xs-1">
                <hr>
            </div>
            <div class="col-sm-1 col-xs-1">
                <div class="specMenuItem">
                    <div>2</div>
                    <div>Layout</div>
                </div>
            </div>
            <div class="col-sm-1 col-xs-1">
                <hr>
            </div>
            <div class="col-sm-2 col-xs-1">
                <div class="specMenuItem selected">
                    <div>3</div>
                    <div>Calculate price</div>
                </div>
            </div>
            <div class="col-sm-1 col-xs-1">
                <hr>
            </div>
            <div class="col-sm-1 col-xs-1">
                <div class="specMenuItem">
                    <div>4</div>
                    <div>Upload</div>
                </div>
            </div>
            <div class="col-sm-1 col-xs-1">
                <hr>
            </div>
            <div class="col-sm-1 col-xs-1">
                <div class="specMenuItem">
                    <div>5</div>
                    <div>Verify PCB</div>
                </div>
            </div>
            <div class="col-sm-1 col-xs-1">
                <hr>
            </div>
            <div class="col-sm-1 col-xs-1">
                <div class="specMenuItem">
                    <div>6</div>
                    <div>Order & delivery</div>
                </div>
            </div>
        </div>
        <div class="marginleft">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td align="left" valign="top" width="100%">
                        <table border="0" cellpadding="0">
                            <tr>
                                <td colspan="2" align="left" valign="top">
                                    <%-- <div id="ddtabs4" class="ddcolortabs">
                                         <ul>
                                             <li><a id="link_ct1" onclick="window.location = '${pageContext.request.contextPath}/qoute/Qoute.action?backToSpecification&specification=${actionBean.specification.id}';"><span>PCB specification</span></a></li>
                                             <li><a id="link_ct2" onclick="window.location = '${pageContext.request.contextPath}/qoute/Qoute.action?backToSpecification&specification=${actionBean.specification.id}&tab=layout';"><span>Layout</span></a></li>
                                             <li><a id="link_ct4" class="current"><span>Calculate Price</span></a></li>
                                             <li><a id="link_ct3" class="disabled"><span>Upload</span></a></li>
                                             <li><a id="link_ct5" class="disabled"><span>Verify PCB</span></a></li>
                                             <li><a id="link_ct6" class="disabled"><span>Order & delivery</span></a></li>
                                         </ul>
                                     </div>--%>
                                    <div class="panel panel-default">
                                        <div id="ct4" class="tabcontent">
                                            <div style="margin: 5px 0 0 6px;">
                                                <stripes:form action="/qoute/Qoute.action" focus="" method="post" id="form">
                                                    <stripes:hidden name="productTemplate"/>
                                                    <stripes:hidden name="qoute" id="qouten" value=""/>
                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td valign="top">
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td align="left" valign="top" width="100%">
                                                                            <span class="title">Specification :</span><br/>
                                                                            <span class="content10px">${actionBean.specification.reference}
                                                                                <stripes:hidden name="specification" value="${actionBean.specification}" onchange="window.location='${pageContext.request.contextPath}/qoute/Qoute.action?specification='+this.value" onmouseover="showToolTip(this,'Your personal reference')" onmouseout="hideToolTip()"/>
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr><td height="8"></td></tr>
                                                                    <tr>
                                                                        <td>
                                                                            <span class="title">Transport mode :</span><br/>
                                                                            <span class="form_right">
                                                                                <select name="transport">
                                                                                    <option value="Express" selected="selected">Express</option>
                                                                                    <option value="Economy">Economy</option>
                                                                                    <option value="By Ship">By Ship</option>
                                                                                </select><img class="info" src="../images/info.png" data-html="true" data-toggle="tooltip" data-placement="right" title="<u>Economy</u>: Economy 5 working days.<br/><br/><u>Express</u>: Express 3 working days.<br/><br/><u>By Ship</u>: By ship 30 working days, large cargo.<br/><br/>* Delivery in Sweden, one aditional working day will be added.<br/>* Delivery in Norway, three aditional working day will be added." />
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr><td height="8"></td></tr>
                                                                    <tr>
                                                                        <td>
                                                                            <span class="title">Quantity (pcs.) :
                                                                                <%--<c:choose>
                                                                                    <c:when test="${actionBean.specification.layout eq 'Single'}">
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        (no of panels)
                                                                                    </c:otherwise>
                                                                                </c:choose>--%>
                                                                            </span><br/>
                                                                            <span class="form_right" >
                                                                                <stripes:text class="textwidthadjust" id="quantity" name="quantity" onblur="integerCheck($('#quantity'))"/><img class="info" src="../images/info.png" data-html="true" data-toggle="tooltip" data-placement="right" title="Please enter the number of PCB\'s you would like to be quoted (Not panels)">
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr><td height="8"></td></tr>
                                                                    <tr>
                                                                        <td>
                                                                            <span class="title">Production days :</span><br/>    <%--Working days = Production days--%>
                                                                            <span class="form_right">
                                                                                <stripes:select name="days">
                                                                                    <c:forEach var="i" begin="1" end="20" step="1">
                                                                                        <c:choose>
                                                                                            <c:when test="${i == '7'}">
                                                                                                <option selected="selected" value="7">7</option>
                                                                                            </c:when>
                                                                                            <c:otherwise>
                                                                                                <stripes:option value="${i}" label="${i}"/>
                                                                                            </c:otherwise>
                                                                                        </c:choose>
                                                                                    </c:forEach>
                                                                                    <%--<c:forEach var="i" begin="12" end="20" step="2">
                                                                                        <stripes:option value="${i}" label="${i}"/>
                                                                                    </c:forEach>--%>
                                                                                </stripes:select><img class="info" src="../images/info.png" data-html="true" data-toggle="tooltip" data-placement="right" title="Select numbers of working days"/>
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr><td height="8"></td></tr>
                                                                    <tr>
                                                                        <td valign="top">
                                                                            <%--<span class="title" onmouseover="showToolTip(this,'Press "Calculate" to obtain quotation');" onmouseout="hideToolTip();">Get results</span><br/>--%>
                                                                            <span class="form_right">
                                                                                <stripes:button  class="login" style="cursor:pointer" id="update" name="update" value="Calculate"
                                                                                                 onclick="calculate($('#form'),'update','right_qoute');"/>
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td valign="top" id="right_qoute">&nbsp;</td>
                                                        </tr>
                                                        <tr><td height="32px">&nbsp;</td></tr>
                                                    </table>
                                                </div>

                                                <div id="cart" style="margin: 5px 0 0 6px;">
                                                    <table border="0" cellpadding="0" cellspacing="0" class="table table-striped">



                                                        <tr>
                                                            <td class="rounded_leftrightborder">

                                                                <div class="table-responsive">
                                                                    <table class="table table-striped">
                                                                        <thead>
                                                                            <tr>
                                                                                <%--<td width="86" style="border-left:none">ID</td>--%>
                                                                                <td width="100" style="border-left:none">PCB name</td>
                                                                                <td width="50">Quantity</td>
                                                                                <td width="55">Lead Time</td>
                                                                                <td width="60">Tooling</td>
                                                                                <td width="55">Unit Price</td>
                                                                                <td width="55">Freight</td>
                                                                                <td width="75">Total</td>
                                                                                <td width="40">Delete</td>
                                                                                <td width="25">Buy</td>
                                                                            </tr>
                                                                        </thead>
                                                                    </table>
                                                                </div>
                                                                <div class="roundedtable" style="height:200px;overflow:scroll;overflow-x:hidden;width:819px;">
                                                                    <table width="803" border="0" cellpadding="0" cellspacing="0" class="round-table">
                                                                        <tbody>
                                                                            <c:forEach var="qoute" items="${actionBean.qoutes}" varStatus="loopid">
                                                                                <c:if test="${qoute.specification.id == actionBean.specification.id}">
                                                                                    <tr class="gray${loopid.index%2}">
                                                                                        <%--<td width="62">Q${qoute.qouteId}</td>--%>
                                                                                        <td width="100" align="left" title="${qoute.specification.reference}"><cat:str value="${qoute.specification.reference}" length="20"/></td>
                                                                                        <td width="50" align="center"><fmt:formatNumber value="${qoute.quantity}" maxFractionDigits="0"/></td>
                                                                                        <td width="55" align="center"><fmt:formatNumber value="${qoute.days}" maxFractionDigits="0"/></td>
                                                                                        <td width="60" align="center"><fmt:formatNumber value="${qoute.tooling}" minFractionDigits="2" maxFractionDigits="2"/></td>
                                                                                        <td width="55" align="center"><fmt:formatNumber value="${qoute.unitPrice}" minFractionDigits="2" maxFractionDigits="2"/></td>
                                                                                        <td width="55" align="center"><fmt:formatNumber value="${qoute.freight}" minFractionDigits="2" maxFractionDigits="2"/></td>

                                                                                        <td width="75" align="right"><fmt:formatNumber value="${qoute.total}" maxFractionDigits="2" minFractionDigits="2"/></td>
                                                                                        <td width="40" align="center"><img style="cursor: pointer" title="Delete" src="${pageContext.request.contextPath}/images/del1.png" width="16" height="16" onclick="if (confirm('Delete: Are you sure?'))
                                                                                                    window.location = '${pageContext.request.contextPath}/qoute/Qoute.action?delete&qoute=${qoute.id}&specification=${qoute.specification.id}';"></td>
                                                                                        <td width="15" align="center">
                                                                                            <c:choose>
                                                                                                <c:when test="${user.approved == 1}">
                                                                                                    <img style="cursor: pointer" title="Buy" src="${pageContext.request.contextPath}/images/basket.gif" width="22" height="22" onclick="window.location = '${pageContext.request.contextPath}/qoute/Qoute.action?setUploads&specification=${actionBean.specification.id}&qoute=${qoute.id}';"><%--window.location='${pageContext.request.contextPath}/azitechorder/Order.action?newOrder';--%>
                                                                                                </c:when>
                                                                                                <c:otherwise><img style="cursor: default" title="Not Approved by Azitech" src="${pageContext.request.contextPath}/images/basket_gray.gif"></c:otherwise>
                                                                                            </c:choose>
                                                                                        </td>
                                                                                    </tr>
                                                                                </c:if>
                                                                            </c:forEach>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </td>
                                                        </tr>

                                                    </table>
                                                </div>

                                                **Please press the buy icon to order.
                                                <c:choose>
                                                    <c:when test="${actionBean.specification.user.currency == 'USD' or actionBean.specification.user.currency == 'DKK'}">
                                                        *Exchange Rate: 1 USD = <fmt:formatNumber value="${actionBean.specification.exchngrate}" minFractionDigits="2" maxFractionDigits="2"/>&nbsp;DKK
                                                    </c:when>
                                                    <c:when test="${actionBean.specification.user.currency == 'Euro'}">
                                                        *Exchange Rate: 1 EUR = <fmt:formatNumber value="${actionBean.specification.exchngrate}" minFractionDigits="2" maxFractionDigits="2"/>&nbsp;DKK
                                                    </c:when>
                                                </c:choose>
                                                <div style="margin: 5px 0 0 6px;"><span class="title">All prices are in ${actionBean.specification.user.currency}</span></div>

                                                <div style="margin: 5px 0 0 6px;">
                                                    <c:set var="tempQuote" value=""></c:set>
                                                    <c:forEach var="qoute" items="${actionBean.qoutes}">
                                                        <c:if test="${qoute.createdFromTemplate}">
                                                            <c:set var="tempQuote" value="${qoute.id}"></c:set>
                                                        </c:if>
                                                    </c:forEach>
                                                    <span><input type="button" class="login" style="cursor:pointer" value="Back" onclick="window.location = '${pageContext.request.contextPath}/qoute/Qoute.action?backToSpecification&specification=${actionBean.specification.id}&tab=layout<c:if test="${not empty tempQuote}">&fromTemplate=true&qoute=${tempQuote}&productTemplate=${actionBean.productTemplate}</c:if>';"/></span>

                                                    <c:choose>
                                                        <c:when test="${actionBean.sentEmail}"><span style="color:red;font-size: 11px;font-family:Verdana,arial,serif;">An email with your quotes has been sent to you</span></c:when>
                                                        <c:otherwise>
                                                            <c:choose>
                                                                <c:when test="${!empty actionBean.qoutes}">
                                                                    <span><input class="login" type="button" style="cursor:pointer" value="Email to inbox" onclick="window.location = '${pageContext.request.contextPath}/qoute/Qoute.action?sendToAzitech&specification=${actionBean.specification.id}';"/></span>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                    <span><input class="login" type="button" style="cursor:pointer" value="Email to inbox" onclick="alert('Please make a calculation and press \'Add to quote\', in order to receive the quote on email. You are welcome to add more than one quote, if you would like to receive prices for comparison');"/></span>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </stripes:form>
                                                <br/>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td height="8"></td>
                </tr>
            </table>
            <%--<a name="end"/>--%>
        </div>
    </stripes:layout-component>
</stripes:layout-render>