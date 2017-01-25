<#include "Header.ftl">

Hello!

<font style="color:red"><b>${fromuser.fullname!""}</b></font> from ${fromuser.company!""} has shared something with you on <a href="http://pcb-direct.dk">http://pcb-direct.dk</a>
<br/><br/>
${body!""}
<br/><br/>
If you do not have a PCB-direct user account you can easily create one for free by following this link.
Please be aware that you must register with the e-mail address that this e-mail has been sent to.
The PCB-direct sharing feature makes it easy for engineers, purchasers, EMS etc. to share quotations and orders among multiple users.

<a href="http://www.PCB-direct.dk/share/Sharing.action?loadRegistration&tkn=${user.token!""}">Free registration link</a>

<#include "Footer.ftl">

</body>
</html>