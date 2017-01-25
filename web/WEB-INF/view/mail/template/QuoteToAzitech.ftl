<#include "Header.ftl">

<h2>Quotation created by <font style="color:red;"><b>${user.username}</b></font>, an order has not been placed.</h2>
<br/>

<table border="0" cellpadding="0" cellspacing="0">
    <tr><td colspan="3"><b>User:</b> <font style="color:red;"><b>${user.username}, ${user.email}</b></font>, <a href="http://www.PCB-direct.dk/specification/Specification.action?specification=${specification.id}">Se specifikation</a></td></tr>
	<tr><td height="16" colspan="3"></td></tr>
    <tr>
        <td style="font-weight: bold;">Exchange Rate</td><td>:</td><td><#if specification.user.currency == 'USD'>1 USD = </#if><#if specification.user.currency == 'DKK'>1 USD = </#if><#if specification.user.currency == 'Euro'>1 EUR = </#if>${specification.exchngrate}&nbsp;DKK</td>
    </tr>
	<tr>
        <td colspan="3">
            <table border="1" style="text-align:right">
                <tr>
                    <th style="text-align:left; width: 10%">ID</th>
                    <th align="left" style="width: 18%">Specification</th>
                    <th align="right" style="width: 10%">Tooling cost</th>
                    <th align="right" style="width: 10%">Price pr. unit</th>
                    <th align="right" style="width: 10%">Freight cost</th>
                    <th align="right" style="width: 7%">Qty</th>
                    <th align="left" style="width: 13%">Transport</th>
                    <th align="right" style="width: 7%">Days</th>
                    <th align="right" style="width: 15%">Total Price</th>
                </tr>

                <#list qoutes as qoute>
                    <tr style="text-align:right">
                        <td style="text-align:left">Q${qoute.qouteId}</td>
                        <td align="left">${qoute.specification.reference}</td>
                        <td align="right">${qoute.tooling}</td>
                        <td align="right">${qoute.unitPrice}</td>
                        <td align="right">${qoute.freight}</td>
                        <td align="right">${qoute.quantity}</td>
                        <td align="left">${qoute.transport}</td>
                        <td align="right">${qoute.days}</td>
                        <td align="right">${qoute.total}</td>
                    </tr>
                </#list>
            </table><br/>

            <font style="font-style:italic;">All prices are in ${user.currency}</font><br><br>

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
                        <th align="left">Panel dimension</th><td>:</td>
                        <td>${specification.sgpcbdimx} mm (X-direction)</td>
                    </tr>

                    <tr>
                        <th align="left">Panel dimension</th><td>:</td>
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