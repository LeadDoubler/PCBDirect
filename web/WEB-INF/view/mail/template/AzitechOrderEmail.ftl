<#include "Header.ftl">

<h2>Order from: <font style="color:red; font-weight: bold;"><b>${order.username}</b></font></h2>
<br/>
<table border="0" cellpadding="0" cellspacing="0">
    <tr><td colspan="3">A new order has been registered on PCB-direct. <a href="http://pcb-direct.dk">(Click to see)</a></td></tr>
	<tr><td height="16" colspan="3"></td></tr>
	<tr>
        <td>
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="font-weight: bold;">Date</td><td>:</td><td>${order.stringDate}</td>
                </tr>
                <tr>
                    <td style="font-weight: bold;">User</td><td>:</td><td>${order.username}</td>
                </tr>
 <tr>
                    <td style="font-weight: bold;">Company</td><td>:</td><td>${order.company}</td>
                </tr>
                <tr>
                    <td style="font-weight: bold;">Specification</td><td>:</td><td>${order.reference}</td>
                </tr>
                <tr>
                    <td style="font-weight: bold;">Quantity</td><td>:</td><td>${order.resquantity}</td>
                </tr>
                <tr>
                    <td style="font-weight: bold;">Transport</td><td>:</td><td>${order.transport}</td>
                </tr>
                <tr>
                    <td style="font-weight: bold;">Days</td><td>:</td><td>${order.restotaldays}</td>
                </tr>
                <tr>
                    <td style="font-weight: bold;">Total Price</td><td>:</td><td>${order.restotal} ${order.rescurrency}</td>
                </tr>
                <tr>
                    <td style="font-weight: bold;">Exchange Rate</td><td>:</td><td><#if specification.user.currency == 'USD'>1 USD = </#if><#if specification.user.currency == 'DKK'>1 USD = </#if><#if specification.user.currency == 'Euro'>1 EUR = </#if>${specification.exchngrate}&nbsp;DKK</td>
                </tr>
            </table>

            <br/>

            <h3>Specification:</h3>
            <table style="text-align:left">
                <tr>
                    <th align="left">Personal reference</th><td>:</td>
                    <td>${specification.reference}</td>
                </tr>

                <tr>
                    <th align="left">PCB reference</th><td>:</td>
                    <td>${specification.pcbreference}</td>
                </tr>

                <tr>
                    <th align="left">No of layers</th><td>:</td>
                    <td>${specification.layers}</td>
                </tr>

                <tr>
                    <th align="left">Material</th><td>:</td>
                    <td>${specification.material}</td>
                </tr>

                <tr>
                    <th align="left">Surface finish</th><td>:</td>
                    <td>${specification.finish}</td>
                </tr>

                <tr>
                    <th align="left">PCB thickness</th><td>:</td>
                    <td>${specification.pcbthickness} mm</td>
                </tr>

                <tr>
                    <th align="left">Standard or special order?</th><td>:</td>
                    <td>${specification.stspspec}</td>
                </tr>

                <tr>
                    <th align="left">Copper thickness</th><td>:</td>
                    <td>${specification.copperthickness} my</td>
                </tr>

                <tr>
                    <th align="left">Min. hole diameter</th><td>:</td>
                    <td>${specification.minholedia} mm</td>
                </tr>

                <tr>
                    <th align="left">Min. track/gap</th><td>:</td>
                    <td>${specification.mintrackgap} mm</td>
                </tr>

                <tr>
                    <th align="left">Color of soldermask</th><td>:</td>
                    <td>${specification.colorsoldermask} color</td>
                </tr>

                <tr>
                    <th align="left">Comments</th><td>:</td>
                    <td>${specification.comments}</td>
                </tr>

                <#if specification.stspspec == 'Special specification'>
                    <tr>
                        <th align="left">Other type of mask</th><td>:</td>
                        <td>${specification.othermask}</td>
                    </tr>

                    <tr>
                        <th align="left">Gold finger</th><td>:</td>
                        <td>${specification.goldfinger}</td>
                    </tr>

                    <tr>
                        <th align="left">Edge plating</th><td>:</td>
                        <td>${specification.edgplating}</td>
                    </tr>

                    <tr>
                        <th align="left">Impedance</th><td>:</td>
                        <td>${specification.impedance}</td>
                    </tr>

                    <tr>
                        <th align="left">Pressfit requirements</th><td>:</td>
                        <td>${specification.pressfitreq}</td>
                    </tr>

                    <tr>
                        <th align="left">Choice of Build-up</th><td>:</td>
                        <td>${specification.buildupchoice}</td>
                    </tr>
                </#if>

                <#if specification.stspspec == 'Standard specification'>
                    <tr>
                        <th align="left">Other type of mask</th><td>:</td>
                        <td>None</td>
                    </tr>

                    <tr>
                        <th align="left">Gold finger</th><td>:</td>
                        <td>No</td>
                    </tr>

                    <tr>
                        <th align="left">Edge plating</th><td>:</td>
                        <td>No</td>
                    </tr>

                    <tr>
                        <th align="left">Impedance</th><td>:</td>
                        <td>No</td>
                    </tr>

                    <tr>
                        <th align="left">Pressfit requirements</th><td>:</td>
                        <td>No</td>
                    </tr>

                    <tr>
                        <th align="left">Choice of Build-up</th><td>:</td>
                        <td>None-specified build-up</td>
                    </tr>
                </#if>

                <tr>
                    <th align="left">Single cut or panel layout?</th><td>:</td>
                    <td>${specification.layout}</td>
                </tr>

                <#if specification.layout == 'Panel'>
                    <tr>
                        <th align="left">Panelization By</th><td>:</td>
                        <td><#if specification.azpanelization == 'Azitech'>New Panel</#if><#if specification.azpanelization == 'Your own panel'>Your own panel</#if></td>
                    </tr>

                    <tr>
                        <th align="left">X-out allowed</th><td>:</td>
                        <td>${specification.xoutallowed}</td>
                    </tr>

                    <#if specification.azpanelization == 'Azitech'>
                        <tr>
                            <th align="left">PCB Dimension</th><td>:</td>
                            <td>${specification.azpcbdimx} mm (X - direction)</td>
                        </tr>

                        <tr>
                            <th align="left">PCB Dimension</th><td>:</td>
                            <td>${specification.azpcbdimy} mm (Y - direction)</td>
                        </tr>

                        <tr>
                            <th align="left">Panel dimension (X) (total size)</th><td>:</td>
                            <td>${specification.aztotdimx} mm (X - direction)</td>
                        </tr>

                        <tr>
                            <th align="left">Panel dimension (Y) (total size)</th><td>:</td>
                            <td>${specification.aztotdimy} mm (Y - direction)</td>
                        </tr>

                        <tr>
                            <th align="left">No. Of PCB's</th><td>:</td>
                            <td>${specification.aznrofpcbx} pcs. (X - direction)</td>
                        </tr>

                        <tr>
                            <th align="left">No. Of PCB's</th><td>:</td>
                            <td>${specification.aznrofpcby} pcs. (Y - direction)</td>
                        </tr>

                        <tr>
                            <th align="left">Distance between two PCB's in the panel</th><td>:</td>
                            <td>${specification.azdistancepcb} mm</td>
                        </tr>

                        <tr>
                            <th align="left">Size of panel border?</th><td>:</td>
                            <td>${specification.azsizeborderpanel} mm</td>
                        </tr>

                        <tr>
                            <th align="left">Your comments</th><td>:</td>
                            <td>${specification.azcomments}</td>
                        </tr>
                    </#if>
                    <#if specification.azpanelization == 'Your own panel'>
                        <tr>
                            <th align="left">PCB Dimension</th><td>:</td>
                            <td>${specification.ownpaneldimx} mm (X - direction)</td>
                        </tr>

                        <tr>
                            <th align="left">PCB Dimension</th><td>:</td>
                            <td>${specification.ownpaneldimy} mm (Y - direction)</td>
                        </tr>
                    </#if>
                </#if>

                <#if specification.layout == 'Single'>
                    <tr>
                        <th align="left">PCB dimension</th><td>:</td>
                        <td>${specification.sgpcbdimx} mm (X-direction)</td>
                    </tr>

                    <tr>
                        <th align="left">PCB dimension</th><td>:</td>
                        <td>${specification.sgpcbdimy} mm (Y-direction)</td>
                    </tr>
                </#if>
            </table>
        </td>
    </tr>
</table>
<br/><br/>

<#include "Footer.ftl">

</body>
</html>
