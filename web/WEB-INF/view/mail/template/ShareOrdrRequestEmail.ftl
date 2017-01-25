<#include "Header.ftl">

<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td>Dear ${user.fullname!""}</td>
    </tr>
    <tr><td height="8"></td></tr>
    <tr><td><font style="color:red"><b>${fromuser.fullname!""}</b></font> from ${fromuser.company!""} has shared orders with you on <a href="http://pcb-direct.dk">http://pcb-direct.dk</a></td></tr>
    <tr><td height="8"></td></tr>

    <#--<#list orders as order>-->
        <#--<tr>-->
            <#--<td><a href="http://www.PCB-direct.dk/specification/Specification.action?specification=${spec.id}">a document</a></td>-->
        <#--</tr>-->
    <#--</#list>-->
        
    <tr>
        <td>If you do not have a PCB-direct user account you can easily create one for free by following this link.</td>
    </tr>
    <tr>
        <td>Please be aware that you must register with the e-mail address that this e-mail has been sent to.</td>
    </tr>
    <tr>
        <td>The PCB-direct sharing feature makes it easy for engineers, purchasers, EMS etc. to share quotations and orders among multiple users.</td>
    </tr>
</table>

<#include "Footer.ftl">

</body>
</html>