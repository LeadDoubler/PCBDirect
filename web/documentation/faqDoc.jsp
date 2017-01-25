<%--
  Created by IntelliJ IDEA.
  User: Gaurav
  Time: 5:44:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/taglibs.jsp"%>
<stripes:layout-render name="/layout/standard.jsp" title="FAQ" home="Y">
    <stripes:layout-component name="contents">
        <div class="marginleft">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="content12px">
                <tr><td >
                    <table border="0" cellpadding="0" cellspacing="0" class="content12px">
                        <tr><td style="font-weight: bold;">Guided Tour</td></tr>
                        <tr><td>The guided tour "From registration to ordering"</td></tr>
                        <tr><td><img src="${pageContext.request.contextPath}/images/pdf.png" width="14" height="16"/>&nbsp;<a target="_blank" href="${pageContext.request.contextPath}/azidocs/Guided%20Tour.pdf">View/Download</a></td></tr>
                    </table>
                </td></tr>
                <tr><td height="16px"></td></tr>
                <tr><td >
                    <table border="0" cellpadding="0" cellspacing="0" class="content12px">
                        <tr><td style="font-weight: bold;">PCB-direct Presentation</td></tr>
                        <tr><td>Brief presentation of PCB-direct and its benefits</td></tr>
                        <tr><td><img src="${pageContext.request.contextPath}/images/pdf.png" width="14" height="16"/>&nbsp;<a target="_blank" href="${pageContext.request.contextPath}/azidocs/PCB-direct%20presentation.pdf">View/Download</a></td></tr>
                    </table>
                </td></tr>
                <tr><td height="16px"></td></tr>
                <tr><td >
                    <table border="0" cellpadding="0" cellspacing="0" class="content12px">
                        <tr><td style="font-weight: bold;">Azitech Presentation</td></tr>
                        <tr><td>Brief presentation of Azitech ApS</td></tr>
                        <tr><td><img src="${pageContext.request.contextPath}/images/pdf.png" width="14" height="16"/>&nbsp;<a target="_blank" href="${pageContext.request.contextPath}/azidocs/Brief%20Azitech%20presentation%202009.pdf">View/Download</a></td></tr>
                    </table>
                </td></tr>

                <tr><td height="16px"></td></tr>
                <tr><td ><table style="border-bottom: 1px dashed #000;" width="170px;" height="5px"><tr><td></td></tr></table></td></tr>
                <tr><td height="16px"></td></tr>

                <tr><td >
                    <table border="0" cellpadding="0" cellspacing="0" class="content12px">
                        <tr><td style="font-weight: bold;">User Agreement</td></tr>
                        <tr><td>The user agreement all users must comply</td></tr>
                        <tr><td><img src="${pageContext.request.contextPath}/images/pdf.png" width="14" height="16"/>&nbsp;<a target="_blank" href="${pageContext.request.contextPath}/azidocs/PCB%20Direct%20Basic%20Agreement.pdf">View/Download</a></td></tr>
                    </table>
                </td></tr>
                <tr><td height="16px"></td></tr>
                <tr><td >
                    <table border="0" cellpadding="0" cellspacing="0" class="content12px">
                        <tr><td style="font-weight: bold;">Quality</td></tr>
                        <tr><td>How the right quality is assured</td></tr>
                        <tr><td><a href="#qualityREF">Read more...</a></td></tr>
                    </table>
                </td></tr>
                <tr><td height="16px"></td></tr>
                <tr><td >
                    <table border="0" cellpadding="0" cellspacing="0" class="content12px">
                        <tr><td style="font-weight: bold;">CoC-document</td></tr>
                        <tr><td>"The certificate of compliance document"</td></tr>
                        <tr><td><img src="${pageContext.request.contextPath}/images/pdf.png" width="14" height="16"/>&nbsp;<a target="_blank" href="${pageContext.request.contextPath}/azidocs/Azitech CoC.pdf">View/Download</a></td></tr>
                    </table>
                </td></tr>

                <tr><td height="16px"></td></tr>
                <tr><td ><table style="border-bottom: 1px dashed #000;" width="170px;" height="5px"><tr><td></td></tr></table></td></tr>
                <tr><td height="16px"></td></tr>

                <tr><td >
                    <table border="0" cellpadding="0" cellspacing="0" class="content12px">
                        <tr><td style="font-weight: bold;">About PCB-direct</td></tr>
                        <tr><td>Ideas and people behind PCB-direct</td></tr>
                        <tr><td><a href="#aboutREF">Read more...</a></td></tr>
                    </table>
                </td></tr>
                <tr><td height="16px"></td></tr>
                <tr><td >
                    <table border="0" cellpadding="0" cellspacing="0" class="content12px">
                        <tr><td style="font-weight: bold;">Change Log</td></tr>
                        <tr><td>View the changes PCB-direct has gone through </td></tr>
                        <tr><td><a href="#changelogREF">Read more...</a></td></tr>
                    </table>
                </td></tr>
                <tr><td height="32px"></td></tr>
                <tr>
                    <td >
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="content12px">
                            <tr>
                                <td valign="top" colspan="2" id="qualityREF">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td valign="top"><strong class="title1">Quality</strong></td>
                                            <td align="right" valign="top"><a href="#top">Back to top</a></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr><td height="8px"></td></tr>
                            <tr>
                                <td >
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="content12px">
                                        <tr><td valign="top">1.</td><td>All suppliers must be certified for ISO9000.</td></tr>
                                        <tr><td valign="top">2.</td><td>Dedicated employees carry out the ISO concept on a day to day business</td></tr>
                                        <tr><td valign="top">3.</td><td>Caring for the employees, by using intelligent ventilation system must be fulfilled by the supplier</td></tr>
                                        <tr>
                                            <td valign="top" colspan="2">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="content12px">
                                                    <tr>
                                                        <td align="top">4.</td><td>Approval according to UL 796 is a must</td>
                                                        <td width="57%" rowspan="3" valign="top"><img src="${pageContext.request.contextPath}/images/quality.jpg"/></td>
                                                    </tr>
                                                    <tr><td valign="top">5.</td><td>Lead Free production is a must</td></tr>
                                                    <tr><td valign="top">6.</td><td>Production audit approval</td></tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr><td valign="top">7.</td><td>Approvals are made on each supplier according to procedures, capability and capacity</td></tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr><td height="12px"></td></tr>
                <tr><td valign="top" ><strong>Handling of complaints</strong></td></tr>
                <tr>
                    <td >
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="content12px">
                            <tr>
                                <td >
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="content12px">
                                        <tr><td valign="top">1.</td><td>Please don't hesitate to contact Azitech ApS, on e-mail: <a href="mailto:pcb-direct@azitech.dk">pcb-direct@azitech.dk</a> or telephone: +4566130768, if you have quality questions or complaints.</td></tr>
                                        <tr><td valign="top">2.</td><td>Azitech are handling complaints according to the management procedures of the 8 Disciplines (8D) process.</td></tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr><td height="32px"></td></tr>
                <tr>
                    <td >
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="content12px">
                            <tr>
                                <td valign="top" colspan="2" id="aboutREF">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td valign="top"><strong class="title1">About PCB-direct</strong></td>
                                            <td align="right" valign="top"><a href="#top">Back to top</a></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr><td height="8px"></td></tr>
                            <tr>
                                <td>
                                    The development of PCB-Direct began in the end of 2007. The idea was to develop a PCB-management software system, where you could calculate and eventually initiate an order for any type of PCB from 1-8 layers. At the same time the idea were that it should be completely secure and easy to use. This functionality is today a reality along with a few other timesaving services such as monitoring and logistic control. In fact on PCB-direct, it only takes 2 minutes to calculate your own liable world market PCB price and it takes only 1 minute to initiate the order.
                                </td>
                            </tr>
                            <tr><td height="12px"></td></tr>
                            <tr><td valign="top"><strong>Current service</strong></td></tr>
                            <tr>
                                <td style="padding-left:15px;">
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="content12px">
                                        <tr>
                                            <td valign="top">
                                                <ul>
                                                    <li>Quotation system</li>
                                                    <li>Order system</li>
                                                    <li>One system to view all orders and quotations</li>
                                                    <li>Monitoring status on each delivery</li>
                                                    <li>Repeat ordering</li>
                                                    <li>Full logistic service</li>
                                                </ul>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr><td height="8px"></td></tr>
                            <tr>
                                <td>
                                    "Your" PCB-Direct is only the top of the Iceberg. Meaning that behind the interface of PCB-direct, Azitech guarantees approved suppliers and approved quality. Azitech has developed and redeveloped quality procedures, such as preproduction data approval, quality check, securing panelization according to your requirements. In case there are any mismatch between the PCB-direct specification and your gerberdata, Azitech will immediately contact you directly to solve any mismatch.<br/>
                                    You can still contact Azitech directly by e-mail or by telephone, where we will be pleased to give you our service. However when you are using PCB-direct, Azitech is also saving time. This means that we are able to use our resources more effectively on order management and value chain optimization, which will enable us to offer you more competitive world market prices.<br/>
                                    In the future PCB-direct will continue the development of new functionalities, such as graphical user interface for your panelization, track and trace, monitoring of your order in the production, online payment and as an option to share a part no. inside PCB-direct with your chosen EMS supplier.<br/>
                                    In order for Azitech to do so, and since it is you who should benefit from this software, we would really like to get to know all the ideas you may have for improving the software.
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr><td height="32px"></td></tr>
                <tr>
                    <td >
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="content12px">
                            <tr>
                                <td valign="top" colspan="2" id="changelogREF">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td valign="top"><strong class="title1">PCB-direct changes log</strong></td>
                                            <td align="right" valign="top"><a href="#top">Back to top</a></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr><td height="8px"></td></tr>
                            <tr><td valign="top"><strong>PCB-direct software v. 1.0</strong></td></tr>
                            <tr>
                                <td style="padding-left:15px;">
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="content12px">
                                        <tr>
                                            <td valign="top">
                                                <ul>
                                                    <li>Repeat order</li>
                                                    <li>Manage orders</li>
                                                    <li>Online ordering</li>
                                                    <li>Alternative delivery address</li>
                                                    <li>Insert personal PO-number</li>
                                                    <li>Verify order</li>
                                                    <li>Delete old quotes</li>
                                                    <li>Receive quote on email</li>
                                                    <li>Save quotes</li>
                                                    <li>Calculate prices</li>
                                                    <li>Upload data</li>
                                                    <li>Create panel</li>
                                                    <li>Create quotations 1-8 layers</li>
                                                    <li>Edit user settings</li>
                                                    <li>Forgot password function</li>
                                                    <li>Register user</li>
                                                </ul>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr><td height="16"></td></tr>
                        </table>
                    </td>
                </tr>
            </table>

                                                    


        </div>
    </stripes:layout-component>
</stripes:layout-render>
<script type="text/javascript">
    document.getElementById('faqDocLink').className = "current";
</script>