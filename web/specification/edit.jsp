<%@ include file="/taglibs.jsp"%>

<stripes:layout-render class="form-control" name="/layout/standard.jsp" title="Printet circuit board" home="Y" homelinkAction="saveSpec()">
    <stripes:layout-component name="head">

        <script type="text/javascript" src="${pageContext.request.contextPath}/scripts/specification.js"></script>
        <script>

            if (${actionBean.tab == "layout"}) {
                $('#referencepart').hide();
                /*
                 $('#link_ct2').addClass('current');
                 $('#link_ct1').removeClass('current');
                 */
                $('#specMenu .selected').removeClass('selected');
                $('#specMenu > div:nth-child(3) .specMenuItem').addClass('selected');

                $('#topnext').hide();
                $('#layouttopnext').show();
                $('#ct2').show();
            }
        </script>
    </stripes:layout-component>
    <stripes:layout-component name="contents">
        <stripes:form action="/specification/Specification.action" method="post" id="specForm">
            <stripes:hidden class="form-control" name="specification" id="specific"/>
            <stripes:hidden class="form-control" name="specification.user"/>

            <div id="notused" class="marginleft" style="display:none;">
                <%--<stripes:text class="form-control" name="specification.azproddays"/>
                <stripes:text class="form-control" name="specification.ownproddays"/>
                <stripes:text class="form-control" name="specification.sgproddays"/> --%>
                <stripes:text class="form-control" name="specification.country"/>
                <stripes:text class="form-control" name="specification.sgquantity"/>
                <stripes:text class="form-control" name="specification.azquantity"/>
                <stripes:text class="form-control" name="specification.ownpanelquantity"/>
                <stripes:text class="form-control" name="specification.transport"/>
                <stripes:text class="form-control" name="specification.currency"/>
                <stripes:text class="form-control" name="specification.restotal"/>
                <stripes:text class="form-control" name="specification.resquantity"/>
                <stripes:text class="form-control" name="specification.respanelorsingleunit"/>
                <stripes:text class="form-control" name="specification.respriceperunit"/>
                <stripes:text class="form-control" name="specification.resfreightcost"/>
                <stripes:text class="form-control" name="specification.restestandtooling"/>
                <stripes:text class="form-control" name="specification.rescurrency"/>
                <stripes:text class="form-control" name="specification.resworkingdays"/>
                <stripes:text class="form-control" name="specification.resfreightdays"/>
                <stripes:text class="form-control" name="specification.restotaldays"/>
                <stripes:text class="form-control" name="specification.resweight"/>
                <stripes:text class="form-control" name="specification.resarea"/>
            </div>

            <div class="marginleft">
                <%
                    String lsBlockGeneral = "display:block;", lsgeneralclass = "current", lsLayoutClass = "", lsBlockLayout = "display:none;";
                    if (request.getParameter("tab") != null && "layout".equals(request.getParameter("tab"))) {
                        lsBlockGeneral = "display:none;";
                        lsgeneralclass = "";
                        lsLayoutClass = "current";
                        lsBlockLayout = "display:block;";
                    }
                %>


                <div id="specMenu" class="row">
                    <div class="col-sm-1 col-xs-1">
                        <div class="specMenuItem selected">
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
                    <div class="col-sm-1 col-xs-1">
                        <div class="specMenuItem">
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
                    <div class="col-sm-1 col-xs-1">
                        <div style="margin-top: 45px;" class="specMenuItem">
                            <a class="btn btn-default pull-right" id="topnext" onclick="updateGeneralspe();
                                    if (!iserrorGeneralSpec) {
                                        $('#referencepart').hide();
                                        /*
                                         $('#link_ct2').addClass('current');
                                         $('#link_ct1').removeClass('current');
                                         */
                                        $('#specMenu .selected').removeClass('selected');
                                        $('#specMenu > div:nth-child(3) .specMenuItem').addClass('selected');

                                        $('#topnext').hide();
                                        $('#layouttopnext').show();
                                        $('#ct2').show();
                                        return false;
                                    } else {
                                    }" href="#ct2">Next</a>
                            <a style="display:none;" id="layouttopnext" class="btn btn-default pull-right" onclick="if (!iserror && !iserrorOwnpanel && !isSingleError) {
                                        saveAndCreateQuote();
                                    }">Next</a>
                        </div>
                    </div>

                </div>

                <div id="ddtabs4" class="ddcolortabs">
                    <ul>
                        <li><a id="link_ct1" href="#" oldhref="javascript:show('ct1')" class="<%=lsgeneralclass%>"><span>PCB specification and layout</span></a></li>
                        <li><a id="link_ct2" href="#" oldhref="javascript:updateGeneralspe();if(!iserrorGeneralSpec)$('#ct2').show();" class="<%=lsLayoutClass%>"><span>Layout</span></a></li>
                        <li><a id="link_ct4" href="#" oldhref="javascript:updateGeneralspe();if(!iserror && !iserrorOwnpanel && !iserrorGeneralSpec && !isSingleError){document.forms['specForm'].action = '${pageContext.request.contextPath}/specification/Specification.action?next=';document.forms['specForm'].submit();}"><span>Calculate Price</span></a></li>
                        <li><a id="link_ct3" class="disabled"><span>Upload</span></a></li>
                        <li><a id="link_ct5" class="disabled"><span>Verify PCB</span></a></li>
                        <li><a id="link_ct6" class="disabled"><span>Order & delivery</span></a></li>
                    </ul>
                </div>
                <div class="panel panel-default">

                    <div class="panel-body">  




                        <div class="row">

                            <div class="row" id="referencepart">

                                <div class="col-md-4">
                                    <div class="form-group">

                                        <label class="col-md-3 control-label">Your reference</label>
                                        <div class="col-md-9 inputfield">
                                            <span class="help-block">Type in personal reference</span>
                                            <c:if test="${actionBean.fromTemplate}"><c:set var="disabled" value="true"></c:set></c:if>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><span class="fa fa-pencil"></span></span><stripes:text id="reference" class="form-control" name="specification.reference" onchange="updateGenPersonalREF()" tabindex="1" readonly="${disabled}"/>
                                            </div>
                                            <span id="referror" style="display:none;" class="contenterror">Please enter personal reference</span>

                                        </div>

                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Layers</label>
                                        <div class="col-md-9 inputfield">
                                            <span class="help-block">Select number of layers</span>
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                    <stripes:select class="form-control" name="specification.layers">
                                                        <stripes:option value="1" label="1"/>
                                                        <stripes:option value="2" label="2"/>
                                                        <stripes:option value="4" label="4"/>
                                                        <stripes:option value="6" label="6"/>
                                                        <stripes:option value="8" label="8"/>
                                                    </stripes:select>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Surface finish</label>
                                        <div class="col-md-9 inputfield">
                                            <span class="help-block">Select surface finish - Standard is "LF HASL"</span>
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                    <stripes:select class="form-control" name="specification.finish">
                                                        <stripes:option value="OSP" label="OSP"/>
                                                        <stripes:option value="HASL Tin/Lead" label="HASL Tin/Lead"/>
                                                        <stripes:option selected="selected" value="LF HASL" label="LF HASL"/>
                                                        <stripes:option value="Immersion Tin" label="Immersion Tin"/>
                                                        <stripes:option value="Immersion Silver" label="Immersion Silver"/>
                                                        <stripes:option value="ENIG" label="ENIG"/>
                                                    </stripes:select></div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Copper thickness</label>
                                        <div class="col-md-9 inputfield">
                                            <span class="help-block">Select copper thickness - Standard is 35 um</span>
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                    <stripes:select class="form-control" name="specification.copperthickness">
                                                        <stripes:option value="0" label="0 um"/>
                                                        <stripes:option value="18" label="18 um"/>
                                                        <stripes:option value="35" label="35 um"/>
                                                        <stripes:option value="70" label="70 um"/>
                                                        <stripes:option value="110" label="110 um"/>
                                                        <stripes:option value="140" label="140 um"/>
                                                        <stripes:option value="200" label="200 um"/>
                                                    </stripes:select></div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Min. hole diameter</label>
                                        <div class="col-md-9 inputfield">
                                            <span class="help-block">Select min. hole diameter - Standard is "0.5 mm."</span>
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                    <stripes:select class="form-control" name="specification.minholedia">
                                                        <stripes:option selected="selected" value=">= 0.5" label=">= 0.5 mm"/>
                                                        <stripes:option value="0.45" label="0.45 mm"/>
                                                        <stripes:option value="0.4" label="0.4 mm"/>
                                                        <stripes:option value="0.35" label="0.35 mm"/>
                                                        <stripes:option value="0.3" label="0.3 mm"/>
                                                        <stripes:option value="0.25" label="0.25 mm"/>
                                                        <stripes:option value="0.2" label="0.2 mm"/>
                                                    </stripes:select></div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Special options</label>
                                        <div class="col-md-9 inputfield">
                                            <span class="help-block">Please select "Special options" if you would like to define:  Other type of mask, Gold finger, Edge plating, Impedance or Pressfit requirements.</span>
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                    <stripes:select class="form-control" id="standardorspecial" name="specification.stspspec" onchange="changeSpecial(this.value);">
                                                        <stripes:option value="Standard specification" selected="selected">Standard specification</stripes:option>
                                                    <stripes:option value="Special specification">Special specification</stripes:option>
                                                </stripes:select></div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Comment</label>
                                        <div class="col-md-9 inputfield">
                                            <span class="help-block">Please feel free to make a comment regarding special requirements, stackup etc.</span>
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                <stripes:textarea class="form-control" name="specification.comments" onblur="textCounter(this,'pgBar',500);hideCounter('pgBar');" onkeyup="textCounter(this,'pgBar',500)" rows="6" cols="20"></stripes:textarea></div>

                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <label class="col-md-3 control-label"></label>

                                        <cat:sheet x="60" y="18"/></div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">
                                            PCB name</label>
                                        <div class="col-md-9 inputfield">  
                                            <span class="help-block">Type PCB reference</span>
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="fa fa-pencil"></span></span><stripes:text id="pcbreference" class="form-control" name="specification.pcbreference" onchange="updateGenPcbREF()" tabindex="2" />
                                            </div>
                                            <span id="pcbreferror" style="display:none;" class="contenterror">Please enter PCB reference</span>  </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Material</label>
                                        <div class="col-md-9 inputfield">   
                                            <span class="help-block">Select material - Standard is "FR4"</span>
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                    <stripes:select class="form-control" name="specification.material">
                                                        <stripes:option value="FR4 Std." label="FR4 Std."/>
                                                        <stripes:option value="FR4 TG 135" label="FR4 TG 135"/>
                                                        <stripes:option value="FR4 TG 150" label="FR4 TG 150"/>
                                                        <stripes:option value="FR4 TG 170" label="FR4 TG 170"/>
                                                    </stripes:select></div>
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label class="col-md-3 control-label">PCB thickness</label>
                                        <div class="col-md-9 inputfield">     
                                            <span class="help-block">Select "PCB thickness"</span>
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                    <stripes:select class="form-control" name="specification.pcbthickness">
                                                        <stripes:option value="1,6" label="1.6 mm"/>
                                                        <stripes:option value="1" label="1.0 mm"/>
                                                        <stripes:option value="0,8" label="0.8 mm"/>
                                                        <stripes:option value="" disabled="disabled"/>
                                                        <stripes:option value="0,3" label="0.3 mm"/>
                                                        <stripes:option value="0,4" label="0.4 mm"/>
                                                        <stripes:option value="0,5" label="0.5 mm"/>
                                                        <stripes:option value="0,6" label="0.6 mm"/>
                                                        <stripes:option value="0,7" label="0.7 mm"/>
                                                        <stripes:option value="0,9" label="0.9 mm"/>
                                                        <stripes:option value="1,1" label="1.1 mm"/>
                                                        <stripes:option value="1,2" label="1.2 mm"/>
                                                        <stripes:option value="1,3" label="1.3 mm"/>
                                                        <stripes:option value="1,4" label="1.4 mm"/>
                                                        <stripes:option value="1,5" label="1.5 mm"/>
                                                        <stripes:option value="1,7" label="1.7 mm"/>
                                                        <stripes:option value="1,8" label="1.8 mm"/>
                                                        <stripes:option value="1,9" label="1.9 mm"/>
                                                        <stripes:option value="2" label="2.0 mm"/>
                                                        <stripes:option value="2,1" label="2.1 mm"/>
                                                        <stripes:option value="2,2" label="2.2 mm"/>
                                                        <stripes:option value="2,4" label="2.4 mm"/>
                                                        <stripes:option value="2,6" label="2.6 mm"/>
                                                        <stripes:option value="2,8" label="2.8 mm"/>
                                                        <%--<stripes:option value="3" label="3.0"/>--%>
                                                    </stripes:select></div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Color of soldermask</label>
                                        <div class="col-md-9 inputfield">    
                                            <span class="help-block">Select soldermask color - Standard is "Green"</span>
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                    <stripes:select class="form-control" name="specification.colorsoldermask">
                                                        <stripes:option value="Green" label="Green"/>
                                                        <stripes:option value="Blue" label="Blue"/>
                                                        <stripes:option value="Dark blue" label="Dark blue"/>
                                                        <stripes:option value="Red" label="Red"/>
                                                        <stripes:option value="Black" label="Black"/>
                                                        <stripes:option value="White" label="White"/>
                                                        <stripes:option value="Yellow" label="Yellow"/>
                                                        <stripes:option value="Other Color" label="Other Color"/>
                                                    </stripes:select></div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Min. track/gap</label>
                                        <div class="col-md-9 inputfield"> 
                                            <span class="help-block">Select min. track/gap - Standard is "0.2 mm."</span>
                                            <div class="input-group">
                                                <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                                    <stripes:select class="form-control" name="specification.mintrackgap">
                                                        <stripes:option value="2" label=">=0.2 mm"/>
                                                        <stripes:option value="175" label="0.175 mm"/>
                                                        <stripes:option value="15" label="0.15 mm"/>
                                                        <stripes:option value="125" label="0.125 mm"/>
                                                        <stripes:option value="1" label="0.10 mm"/>
                                                    </stripes:select></div>
                                        </div>
                                    </div>

                                </div>
                                <div id="spaceFiller" class="col-md-4">
                                    <br/>
                                    <img src="https://s3-eu-west-1.amazonaws.com/leaddoubler/customerfiles/PCB-Direct/pcb.jpg" width="100%"/>
                                    <br/>
                                    <br/>
                                    <img src="https://s3-eu-west-1.amazonaws.com/leaddoubler/customerfiles/PCB-Direct/pcb-pile.jpg" width="100%"/>
                                </div>

                                <div class="row">
                                    <div id="special" class="col-md-12" style="display: none">
                                        <jsp:include page="special.jsp"/>
                                    </div>
                                </div>
                                <div id="pgBar" class="progress" style="visibility:hidden"></div>
             
                            </div>
                            <div id="ct2" class="tabcontent" style="<%=lsBlockLayout%>">

                                <div class="form-group">
                                    <label class="col-md-3 control-label">Single or panel?</label>
                                    <stripes:select class="form-control" name="specification.layout" id="singleorpanel" onchange="changeLayout(this.value)">
                                        <stripes:option value="Single" label="Single"/>
                                        <stripes:option value="Panel" label="Panel"/>
                                    </stripes:select></div>
                                <span class="help-block">Select "Panel" if penalization is required otherwise choose "single"</span>



                                <div class="form-group">
                                    <cat:sheet x="61" y="18"/>
                                </div>

                                <div class="form-group" id="panel" style="display: none">
                                    <%@include file="panel.jsp"  %>
                                </div>
                                <div class="form-group" id="single" style="display: none">
                                    <jsp:include page="single.jsp"/>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">Comments regarding fiducials, tooling holes etc.?</label>
                                    <span>
                                        <div> <stripes:textarea class="form-control" name="specification.azcomments" onblur="textCounter(this,'pgBar1',500);hideCounter('pgBar1');" onkeyup="textCounter(this,'pgBar1',500)" rows="6" cols="20"></stripes:textarea>
                                            </div><span class="help-block">Insert requirements regarding tooling holes, fiducials etc.</span>
                                        </span>
                                        <br/>
                                        <div id="pgBar1" class="progress" style="visibility:hidden"></div>
                                    </div>

                                    <div class="actionBar">
                                        <a class="btn btn-default pull-left" onclick="$('#ct2').hide();
                                                $('#referencepart').show();
                                                $('#link_ct2').removeClass('current');
                                                $('#link_ct1').addClass('current');
                                                $('#topnext').show();

                                                $('#specMenu .selected').removeClass('selected');
                                                $('#specMenu > div:nth-child(1) .specMenuItem').addClass('selected');

                                                $('#layouttopnext').hide();">Back</a>
                                        <a class="btn btn-default pull-right" onclick="javascript:if (!iserror && !iserrorOwnpanel && !isSingleError) {
                                                    saveAndCreateQuote();
                                                }">Next</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <%--<a class="form-control" name="end"/>--%>
        </stripes:form>
        <style>
            #ddtabs4 {
                display: none;
            }

            #specMenu hr {
                border-color: #dbdbdb;
            }

            #specMenu {
                text-align: center;
                margin: 10px 0;
            }
            .specMenuItem > div:first-child{
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

            @media screen and (max-width: 800px) {
                #spaceFiller img {
                    display: none;
                }

            }
            .help-block {
                margin-top: 0;
            }
            .input-group {
                margin-bottom: 10px;
            }

        </style>
    </stripes:layout-component>
</stripes:layout-render>

