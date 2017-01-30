<%@ include file="/taglibs.jsp" %>
<stripes:layout-definition>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <!-- META SECTION -->
            <title>PCB-Direct.dk</title>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1" />

            <link rel="icon" href="favicon.ico" type="image/x-icon" />
            <!-- END META SECTION -->



            <!-- CSS INCLUDE -->
            <link rel="stylesheet" type="text/css" id="theme" href="${pageContext.request.contextPath}/template/css/theme-default.css"/>
            <link rel="stylesheet" type="text/css" id="custom" href="${pageContext.request.contextPath}/css/bootstrapstyle.css"/>
            <!-- EOF CSS INCLUDE -->
            <script type="text/javascript" src="${pageContext.request.contextPath}/scripts/scripts.js"></script>


        </head>
        <body>
            <stripes:layout-component name="topMenu">
               
            </stripes:layout-component>
            <!-- START PAGE CONTAINER -->
            <div class="page-container">
             

                <!-- START PAGE SIDEBAR -->
                <stripes:layout-component name="menubar">
                    <div class="page-sidebar">
                        <!-- START X-NAVIGATION -->
                        <ul class="x-navigation">
                            <li class="xn-logo">
                                <stripes:link href="/startup/Startup.action?home">PCB-Direct.dk</stripes:link>
                                    <a href="#" class="x-navigation-control"></a>
                                </li>
                                <li class="xn-title">Navigation</li>
                                <li>
                                <stripes:link href="/startup/Startup.action?home"><span class="fa fa-desktop"></span> <span class="xn-text">Dashboard</span></stripes:link>
                                </li>

                            <stripes:layout-component name="menu"/>
                            <li>
                                <!-- Nedenstående skal ændres, da det ikke virker med mange af menupunkterne-->
                                <stripes:link href="${pageContext.request.contextPath}/productTemplate/ProductTemplate.action" ><span class="fa fa-list"></span> <span class="xn-text">Templates</span></stripes:link>
                                </li>
                                <li>
                                <stripes:link href="/documentation/pcbdirectDoc.jsp"><span class="fa fa-question-circle"></span> <span class="xn-text">About</span></stripes:link>
                                </li>

                                <li>
                                <stripes:link href="/documentation/capabilityDoc.jsp"><span class="fa fa-random"></span> <span class="xn-text">Capability</span></stripes:link>
                                </li>
                                <li>
                                <stripes:link href="/documentation/qualityDoc.jsp"><span class="fa fa-dedent"></span> <span class="xn-text">Quality</span></stripes:link>
                                </li>
                                <li>
                                <stripes:link href="/documentation/pcbdirectdocs.jsp"><span class="fa fa-download"></span> <span class="xn-text">Download</span></stripes:link>
                                </li>


                            </ul>
                            <!-- END X-NAVIGATION -->
                        </div>
                        <!-- END PAGE SIDEBAR -->
                </stripes:layout-component>

                <stripes:layout-component name="topMenuWithNav">
                    <!-- PAGE CONTENT -->
                    <div class="page-content">
                        <!-- START X-NAVIGATION VERTICAL -->
                        <ul class="x-navigation x-navigation-horizontal x-navigation-panel">
                            <!-- TOGGLE NAVIGATION -->
                            <li class="xn-icon-button">
                                <a href="#" class="x-navigation-minimize"><span class="fa fa-dedent"></span></a>
                            </li>
                            <!-- POWER OFF -->
                            <li class="xn-icon-button pull-right last">
                                <stripes:link href="/user/Logout.action"><span class="fa fa-power-off"></span></stripes:link>
                                    <!-- END TOGGLE NAVIGATION -->
                            </ul>
                            <!-- END X-NAVIGATION VERTICAL -->

                            <!-- START BREADCRUMB -->
                            <ul class="breadcrumb">
                                <li><stripes:link href="/startup/Startup.action?Home">Dashboard</stripes:link></li>
                            </ul>
                            <!-- END BREADCRUMB -->

                            <div class="page-title">
                                <h2><span style="cursor: pointer;" onclick="window.history.back();" class="fa fa-arrow-circle-o-left"></span> ${title}</h2>
                        </div>
                    </stripes:layout-component>
                    <!-- PAGE CONTENT WRAPPER -->
                    <div class="page-content-wrap">

                        <stripes:layout-component name="complete">

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <div class="panel-title-box">
                                                <h3>${title}</h3>
                                                <span></span>
                                            </div>
                                            <div class="panel-body panel-body-table">
                                                <stripes:layout-component name="contents"/>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </stripes:layout-component>


                    </div>


                    <!-- END PAGE CONTENT WRAPPER -->
                </div>
                <!-- END PAGE CONTENT -->
            </div>
            <!-- END PAGE CONTAINER -->

            <!-- MESSAGE BOX-->
            <div class="message-box animated fadeIn" data-sound="alert" id="mb-signout">
                <div class="mb-container">
                    <div class="mb-middle">
                        <div class="mb-title"><span class="fa fa-sign-out"></span> Log <strong>Out</strong> ?</div>
                        <div class="mb-content">
                            <p>Are you sure you want to log out?</p>
                            <p>Press No if youwant to continue work. Press Yes to logout current user.</p>
                        </div>
                        <div class="mb-footer">
                            <div class="pull-right">
                                <a href="pages-login.html" class="btn btn-success btn-lg">Yes</a>
                                <button class="btn btn-default btn-lg mb-control-close">No</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END MESSAGE BOX-->

            <!-- START PRELOADS -->
            <audio id="audio-alert" src="${pageContext.request.contextPath}/template/audio/alert.mp3" preload="auto"></audio>
            <audio id="audio-fail" src="${pageContext.request.contextPath}/template/audio/fail.mp3" preload="auto"></audio>
            <!-- END PRELOADS -->

            <!-- START SCRIPTS -->
            <!-- START PLUGINS -->
            <script type="text/javascript" src="${pageContext.request.contextPath}/template/js/plugins/jquery/jquery.min.js"></script>
            <script type="text/javascript" src="${pageContext.request.contextPath}/template/js/plugins/jquery/jquery-ui.min.js"></script>
            <script type="text/javascript" src="${pageContext.request.contextPath}/template/js/plugins/bootstrap/bootstrap.min.js"></script>

            <stripes:layout-component name="head"/>
            <!-- END PLUGINS -->

            <!-- THIS PAGE PLUGINS -->

            <!-- END PAGE PLUGINS -->

            <!-- START TEMPLATE -->
            <script type="text/javascript" src="${pageContext.request.contextPath}/template/js/plugins.js"></script>
            <script type="text/javascript" src="${pageContext.request.contextPath}/template/js/actions.js"></script>
            <!-- END TEMPLATE -->
            <!-- END SCRIPTS -->
            <div id="ToolTip">
                <div id="ToolTipContent"></div>
            </div>
        </body>
    </html>

</stripes:layout-definition>
