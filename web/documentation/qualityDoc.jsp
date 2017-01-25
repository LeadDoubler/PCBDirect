<%--
  Created by IntelliJ IDEA.
  User: Gaurav Gharat
  Time: 6:11:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/taglibs.jsp"%>
<stripes:layout-render name="/layout/standard.jsp" title="Quality Policy" home="Y">
    <stripes:layout-component name="contents">
        <div class="marginleft">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="content12px">
                <tr>
                    <td >
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="content12px">
                            <tr>
                                <td valign="top" colspan="2">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr><td valign="top">At PCB-direct quality is more than you think, quality is something we are passionate about! We constantly strive to become the most reliable PCB sourcing agency.</td></tr>
                                        <tr><td height="8"></td></tr>
                                        <tr><td valign="top">PCB-direct offers security for those customers, who do not have the resources to visit their foreing suppliers and keep track of stastictis, material stock, capability, capacity etc. Through PCB-direct's experience and procedures, you can achieve greater security and save time and money when initiating PCB's.  </td></tr>
                                        <tr><td height="8"></td></tr>
                                        <tr><td valign="top">Based on our experience and close communication with our suppliers, we have created a setup to ensure quality and delivery at the agreed time, every time!
Our quality system operates in the following way:
</td></tr>
                                        <tr><td height="8"></td></tr>
                                        <tr><td valign="top">All production data are reviewed by PCB-direct staff, before any production may begin. If any questions are raised during the production data review, you will imidiately be informed. If you like, PCB-direct offers to make agreements regarding predefined production setup in order to secure a smooth production.</td></tr>
                                        <tr><td height="8"></td></tr>
                                        <tr><td valign="top">PCB-direct ensure that our suppliers deliver a completed COC-document, which is attached the goods. The COC-documentation guarantees, that your order has been electrically tested, visual reviewed etc.
Microsections are provided and attached the goods on request.
</td></tr>
                                        <tr><td height="8"></td></tr>
                                        <tr><td valign="top">All PCB's are vacumpacked and provided with a track and trace number, so you can follow the shipment.</td></tr>
                                    </table>
                                </td>
                            </tr>
                            <tr><td height="16px"></td></tr>
                            <tr>
                                <td valign="top" colspan="2" id="qualityREF">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td valign="top"><strong class="title1">PCB-direct guarantees:</strong></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr><td height="8px"></td></tr>
                            <tr>
                                <td >
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="content12px">
                                        <tr><td valign="top">1.</td><td>All suppliers are certified for ISO9000.</td></tr>
                                        <tr><td valign="top">2.</td><td>Dedicated employees carry out the ISO concept on a day to day business.</td></tr>
                                        <tr><td valign="top">3.</td><td>Caring for the employees, by using intelligent ventilation system must be fulfilled by the supplier.</td></tr>
                                        <tr><td valign="top">4.</td><td>Approval according to UL 796 is a must.</td>
                                        <tr><td valign="top">5.</td><td>Production audit approval.</td></tr>
                                        <tr><td valign="top">6.</td><td>Approvals are made on each supplier according to procedures, capability and capacity.</td></tr>
                                        <tr><td height="12"></td></tr><tr><td colspan="2" valign="top"><img src="${pageContext.request.contextPath}/images/quality.jpg"/></td></tr>
                                    </table>
                                </td>
                            </tr>
                            <tr><td height="16px"></td></tr>
                            <tr>
                                <td valign="top" colspan="2">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td valign="top"><strong class="title1">Handling of complaints</strong></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr><td height="8px"></td></tr>
                            <tr>
                                <td >
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="content12px">
                                        <tr><td valign="top">1.</td><td>Please don't hesitate to contact PCB-direct, on e-mail: pcb-direct@azitech.dk or telephone: +4566130768, if you have quality questions or complaints.</td></tr>
                                        <tr><td valign="top">2.</td><td>PCB-direct are handling complaints according to the management procedures of the 8 Disciplines (8D) process.</td></tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr><td height="12px"></td></tr>
            </table>
        </div>
    </stripes:layout-component>
</stripes:layout-render>
<script type="text/javascript">
    document.getElementById('qualityDocLink').className = "current";
</script>