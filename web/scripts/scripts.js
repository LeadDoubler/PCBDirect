function inlineSavePart(form, event, container) {
    var content = FCKeditorAPI.GetInstance('part.content').GetXHTML();
    $('#part.content').value = content;
    voke(form, name, container);
    $('#fckeditorWindow').innerHTML = '';
    FCKeditorAPI = null;
    __FCKeditorNS = null;
}

function voke(form, event, container) {
    var params = form.serialize();
    if (event != null) {
        params = event + '&' + params;
    }
    $.ajax({
        type: "POST",
        url: form.attr('action'),
        data: params,
        success: function(data){
            $('#'+container).html(data);
            }
        });
    }

function vokePart(form, event, container) {
    var params = Form.serialize(form);
    if (event != null) {
        params = event + '&' + params;
    }
    $('#'+container).load(form.action, {method:'post', postBody:params});
    $('#fckeditorWindow').innerHTML = '';
}

function doSwitch(elm) {
    if ($(elm).hasClassName('boxtop')) {
        $(elm).toggleClassName('boxtop2');
    }
    else {
        $(elm).toggleClassName('boxtop');
    }
}

function invoke(form, event, container) {
    document.body.style.cursor = "wait";
    //              alert('invoke started');
    var params = form.serialize();
    if (event != null) params = event + '&amp;' + params;
    $.ajax({
        type: "POST",
        url: form.attr('action'),
        data: params,
        success: function(data){
            $('#'+container).html(data);
        }
    });
    //              alert('invoke finished');
}

function submitAndReplace(form, event, id, prefix) {
    if (prefix == undefined) {
        prefix = '';
    }
    var container = prefix + 'title_' + id;
    var formContainer = prefix + 'form_' + id;
    var params = Form.serialize(form);
    if (event != null) params = event + '&amp;' + params;
    new Ajax.Updater(container, form.action,
    {
        method:'post',
        postBody:params,
        onComplete:function() {
            $(formContainer).innerHTML = '';
        }
    }
            );
}

function invokeAndPrepend(form, event, container) {
    var params = Form.serialize(form);
    if (event != null) params = event + '&amp;' + params;
    new Ajax.Updater(container, form.action, {method:'post', postBody:params,insertion: Insertion.Top,evalScripts: true});
}


function invokeAndInsert(form, event, container) {
    var params = Form.serialize(form);
    if (event != null) params = event + '&amp;' + params;
    new Ajax.Updater(container, form.action, {method:'post', postBody:params,insertion: Insertion.Bottom , evalScripts: true});
}

function ajax(place, url) {
    var newurl = url + '&' + 'randomnumber=' + Math.random();
    new Ajax.Updater(place, newurl);
    return false;
}

function ajax(place, url, parameters) {
    var newurl = url + '&' + 'randomnumber=' + Math.random();
    new Ajax.Updater(place, newurl, parameters);
    return false;
}

var Util = {
    screenW:1440,
    screenH:900,
    restrictDelete:false,
    getScreenWidth: function() {
        if (parseInt(navigator.appVersion) > 3) {
            this.screenW = screen.width;
        }
        else if (navigator.appName == "Netscape" && parseInt(navigator.appVersion) == 3 && navigator.javaEnabled()) {
            var jToolkit = java.awt.Toolkit.getDefaultToolkit();
            var jScreenSize = jToolkit.getScreenSize();
            this.screenW = jScreenSize.width;
        }
        return this.screenW;
    },

    getScreenHeight: function() {
        if (parseInt(navigator.appVersion) > 3) {
            this.screenH = screen.height;
        }
        else if (navigator.appName == "Netscape" && parseInt(navigator.appVersion) == 3 && navigator.javaEnabled()) {
            var jToolkit = java.awt.Toolkit.getDefaultToolkit();
            var jScreenSize = jToolkit.getScreenSize();
            this.screenH = jScreenSize.height;
        }
        return this.screenH;
    },

    getScreenDim: function() {
        if (parseInt(navigator.appVersion) > 3) {
            this.screenW = screen.width;
            this.screenH = screen.height;
        }
        else if (navigator.appName == "Netscape" && parseInt(navigator.appVersion) == 3 && navigator.javaEnabled()) {
            var jToolkit = java.awt.Toolkit.getDefaultToolkit();
            var jScreenSize = jToolkit.getScreenSize();
            this.screenW = jScreenSize.width;
            this.screenH = jScreenSize.height;
        }
        return [this.screenW,this.screenH];
    },

    trim: function(str){
        return str.replace(/^\s+/, '').replace(/\s+$/, '');
    },
    
    show: function(divID) {
        document.getElementById(divID).style.display = 'block';
    },

    hide: function(divID) {
        fadeOut('ToolTip', 2, 94);
        document.getElementById(divID).style.display = 'none';
    },

    showShareBox: function(sbDiv) {
        Util.show('maskDIV');
        var ele = document.getElementById(sbDiv);
        ele.style.left = (Util.getScreenWidth() / 2 - 300) + "px";
        ele.style.top = "110px";
        ele.style.visibility = 'visible';
    },

    hideShareBox: function(sbDiv) {
        Util.hide('maskDIV');
        document.getElementById(sbDiv).style.visibility = 'hidden';
    },

    prepareQuoteShareBox: function() {
        console.log('prepareQuoteShareBox');
        var locollection = document.getElementsByName("quoteChk");
        var flag = false;
        for (var lic = 0; lic < locollection.length; lic++) {
            if (locollection[lic].checked) {
                flag = true;
                break;
            }
        }
        if (flag) {
            var form = $('#shareQuoteForm');
            var params = form.serialize();
            params = 'populateQuoteShareBox&' + params;
            $.ajax({
                type: "POST",
                url: form.attr('action'),
                data: params,
                success: function(data){
                    $('#temp').html(data);
                    $('#temp').show();
                }
            });
            /*new Ajax.Updater('shareBoxDIV', form.action,
            {
                method:'post',
                postBody:params,
                onComplete:function() {
                    Util.showShareBox('temp');
                }
            }
                    );*/
        }
        else {
            alert('Select atleast one row');
        }
    },

    prepareOrderShareBox: function() {
        console.log('prepareOrderShareBox');
        var locollection = document.getElementsByName("orderChk");
        var flag = false;
        for (var lic = 0; lic < locollection.length; lic++) {
            if (locollection[lic].checked) {
                flag = true;
                break;
            }
        }
        if (flag) {
            console.log('flag is true');
            var form = $('#shareOrderForm');
            var params = form.serialize();
            params = 'populateOrderShareBox&' + params;
            $.ajax({
                type: "POST",
                url: form.attr('action'),
                data: params,
                success: function(data){
                    console.log('ajax success');
                    $('#temp').html(data);
                    $('#temp').show();
                    console.log('temp shown');
                    console.log($('#temp'));
                }
            });
            /*var form = document.forms['shareOrderForm'];
            var params = Form.serialize(form);
            params = 'populateOrderShareBox&' + params;
            new Ajax.Updater('shareBoxDIV', form.action,
            {
                method:'post',
                postBody:params,
                onComplete:function() {
                    Util.showShareBox('temp');
                }
            }
                    );*/
        }
        else {
            alert('Select atleast one row');
        }
    },

    shareQuote: function() {
        console.log('shareQuote'+$('#invUser').val());
        if (isEmail($('#invUser').val())){
        var form = $('#shareBoxForm');
        var params = form.serialize();
        params = 'doShareQuote&' + params;
        $.ajax({
                type: "POST",
                url: form.attr('action'),
                data: params,
                success: function(data){
                   // $('#shareBoxDIV').html(data);
                    $('#invUser').val('');
                    $('#invDesc').val('');
                    $('#temp').hide();
                    console.log('done sharing');
                }
            });
            /*
        new Ajax.Updater('shareBoxDIV', form.action,
        {
            method:'post',
            postBody:params,
            onComplete:function() {
                $('#invUser').value = "";
                $('#invDesc').value = "";
            }
        }
        );*/
        }
        else {alert('Invalid/Empty fields')}
    },

    shareOrder: function() {
        //console.log('shareorder'+$('#invUser').val());
        if (isEmail($('#invUser').val())){
            var form = $('#shareBoxForm');
        var params = form.serialize();
        /*var form = document.forms['shareBoxForm'];
        var params = Form.serialize(form);*/
        params = 'doShareOrder&' + params;
        //console.log(params);
        $.ajax({
                type: "POST",
                url: form.attr('action'),
                data: params,
                success: function(data){
                    $('#shareBoxDIV').html(data);
                    $('#invUser').val('');
                    $('#invDesc').val('');
                    $('#temp').hide();
                    //console.log('done sharing');
                }
            });
        /*new Ajax.Updater('shareBoxDIV', form.action,
        {
            method:'post',
            postBody:params
        }
        );*/
        }
        else {alert('Invalid/Empty fields')}
    },

    editShareAccess: function(shareid, id, mode) {
        var form = document.forms['shareBoxForm'];
//        $('temp').setStyle({zIndex:1});
        document.body.style.cursor = "wait";
        var formParams = Form.serializeElements(Form.getInputs("shareBoxForm","hidden", "quoteChk"), "");
        var loBody = 'editShareAccess=Share&mode='+mode+'&specShare=' + shareid + '&access=' + $(id).options[$(id).selectedIndex].value;
        if(mode == 'o'){
            formParams = Form.serializeElements(Form.getInputs("shareBoxForm","hidden", "orderChk"), "");
            loBody = 'editShareAccess=Share&mode='+mode+'&orderShare=' + shareid + '&access=' + $(id).options[$(id).selectedIndex].value;
        }
        new Ajax.Request(form.action,
        {
            method:'post',
            postBody:loBody + '&' + formParams,
            onComplete:function(response) {
                document.body.style.cursor = "default";
                if (response.responseText == 0) alert("Could not Update!");
            }
        }
        );
    },

    deleteShareAccess: function(shareid, rowIndex, mode) {
        var form = document.forms['shareBoxForm'];
        document.body.style.cursor = "wait";
        var formParams = Form.serializeElements(Form.getInputs("shareBoxForm","hidden", "quoteChk"), "");
        var loBody = 'deleteShareAccess&mode='+mode+'&specShare=' + shareid;
        if(mode == 'o'){
            formParams = Form.serializeElements(Form.getInputs("shareBoxForm","hidden", "orderChk"), "");
            loBody = 'deleteShareAccess&mode='+mode+'&orderShare=' + shareid;
        }
        new Ajax.Request(form.action,
        {
            method:'post',
            postBody:loBody + '&' + formParams,
            onComplete:function(response) {
                document.body.style.cursor = "default";
                if (response.responseText == 0) alert("Could not Delete!");
                else Element.remove($('#shareEntry' + rowIndex));
            }
        }
        );
    },

    validateUserAccess: function(user,mode) {
        if (isEmail(user)) {
            var form = $('#shareBoxForm');
            document.body.style.cursor = "wait";
            var params = form.serialize();
            params = 'validateUser&mode='+mode+params;
            $.ajax({
                type: "POST",
                url: form.attr('action'),
                data: params,
                success: function(data){
                    console.log('data = '+data);
                    if (data == '0'){
                        console.log('0 returned');
                    }
                    if (data == '1'){
                        alert('user identified');
                        console.log('1 returned');
                    }
                    if (data == '2'){
                        alert('PCB-Direct user not found. Click share to invite;');
                    }
                    if (data == '3'){
                        $('#invUser').val('');
                        $('#invUser').focus();
                        alert('The quote is already shared with the selected user');
                    }
                    /*$('#'+container).html(data);*/
                    }
                });
            /*new Ajax.Request(form.action,
            {
                method:'post',
                postBody:'validateUser&mode=' + mode + '&' + Form.serialize(form),
                onComplete:function(response) {
                    if (response.responseText == 1) {
                        Element.removeClassName($('#invUserValidStatus'),'contenterror');
                        $('#invUserValidStatus').innerHTML = '<table border="0"><tr><td valign="top" title="User Identified!"><img src="../images/valid.png"/></td><td>&nbsp;</td></tr></table>';
                    }
                    else if (response.responseText == 2) {
                        Element.addClassName($('#invUserValidStatus'),'contenterror');
                        $('#invUserValidStatus').innerHTML = '<table border="0"><tr><td valign="top"><img src="../images/notes.png"/></td><td class="contenterror">The email you entered does not match any PCB-direct accounts.If you wish to invite the person to PCB-direct, please press the "Share" button.</td></tr></table>';
                    }
                    else if (response.responseText == 3) {
                        Element.addClassName($('#invUserValidStatus'),'contenterror');
                        $('#invUser').value = '';
                            $('#invUser').focus();
                        $('#invUserValidStatus').innerHTML = '<table border="0"><tr><td valign="top"><img src="../images/clear.png"/></td><td>Already shared!</td></tr></table>';
                    }
                    else {
                        Element.addClassName($('#invUserValidStatus'),'contenterror');
                        $('#invUserValidStatus').innerHTML = '<table border="0"><tr><td valign="top"><img src="../images/clear.png"/></td><td class="contenterror">Internal server Error</td></tr></table>';
                    }
                    document.body.style.cursor = "default";
                }
            }
            );*/
        }
        else {
            $('#invUserValidStatus').innerHTML = '<table border="0"><tr><td valign="top"><img src="../images/clear.png"/></td><td class="contenterror">Invalid Email!</td></tr></table>';
//            $('#invUser').focus();
            $('#invUser').value = '';
        }
    }
};

var currentTAB;
function changeSpecial(value) {
    console.log('changeSpecial - '+value);
    if (value == 'Standard specification')
    {
        $('#special').hide();
    }
    if (value == 'Special specification')
    {
        console.log('show special');
        console.log($('#special'));
        $('#special').toggle();
        console.log('special toggled');
    }
}

function changeLayout(value) {
    console.log('changeLayout('+value);
    if (value == 'Single')
    {
        $('#panel').hide();
        $('#single').show();
        updateSingleDim();
        iserror = false;
        iserrorOwnpanel = false;
    }
    if (value == 'Panel')
    {
        $('#panel').show();
        $('#single').hide();
        isSingleError = false;
        if ($('#panelchoice').val('Azitech'))
        {
            updateDim();
            iserrorOwnpanel = false;
        }
        else
        {
            updateOwnPanel();
            iserror = false;
        }
    }
}

function changePanelization(value) {
    if (value == 'Azitech')
    {
        $('#own').hide();
        $('#azitech').show();
    }
    if (value == 'Your own panel')
    {
        $('#azitech').hide();
        $('#own').show();
    }
}

function integerCheck(s)
{
    if (s)
    {
        var i,value,c;
        value = s.val();
        for (i = 0; i < value.length; i++)
        {
            // Check that current character is number.
            c = value.charAt(i);
            if (((c < "0") || (c > "9")))
            {
                s.value = "0";
                alert(value + " is not a valid number");
                break;
            }
        }
    }
    // All characters are numbers.
}

/**
 * Function to check whether the value is a Number or not.
 * @param t
 */
function danishDecimalCheck(t)
{
    var value = t.value;
    t.value = t.value.replace('.', ',');
    var lstestresult;
    var lsregX = /(^\d+$)|(^\d+\.\d+$)|(^\d+\,\d+$)/;
    lstestresult = lsregX.test(value);
    return lstestresult;
}

function isInteger(value)
{
    var lsregX = /(^\d+$)/;
    return lsregX.test(value);
}

function replaceDanishLetter(value)
{
    value = value.replace("�", "%E5");
    value = value.replace("�", "%C5");
    value = value.replace("�", "%F8");
    value = value.replace("�", "%D8");
    value = value.replace("�", "%E6");
    value = value.replace("�", "%C6");
    return value;
}

function contactPCB(t, v1, v2, v3, v4, v5, v6, v7, v8)
{
    var mailtoString = "mailto:pcb-direct@azitech.dk?subject=User%20message&body=Att.%20PCB-direct%20staff,%0A%0A%0A%0ARegards,%0A%0A";
    mailtoString += replaceDanishLetter(v1) + "%0A";
    mailtoString += replaceDanishLetter(v2) + "%20";
    mailtoString += replaceDanishLetter(v3) + "%0A";
    mailtoString += replaceDanishLetter(v4) + "%0A";
    mailtoString += replaceDanishLetter(v5) + "%0A";
    mailtoString += replaceDanishLetter(v6) + "%0A";
    mailtoString += replaceDanishLetter(v7) + "%0A";
    mailtoString += replaceDanishLetter(v8);
    window.location = mailtoString;
}

function showToolTip(t, text) {
    if (text && text.length > 0)
    {
        document.getElementById('ToolTipContent').innerHTML = text;

        //        var msgheight = document.getElementById('ToolTip').offsetHeight;
        //        var targetheight = t.offsetHeight;              `
        var targetwidth = t.offsetWidth;

        var topposition = topPosition(t);
        var leftposition = leftPosition(t) + targetwidth + 3;

        document.getElementById('ToolTip').style.left = leftposition + "px";
        document.getElementById('ToolTip').style.top = topposition + "px";
        document.getElementById('ToolTip').style.visibility = "visible";
        if (browser == undefined || browser == null)check();
        fadeIn('ToolTip', 5, 24);
    }
}

// calculate the position of the element in relation to the left of the browser //
function leftPosition(target)
{
    var left = 0;
    if (target.offsetParent)
    {
        while (1)
        {
            left += target.offsetLeft;
            if (!target.offsetParent)
            {
                break;
            }
            target = target.offsetParent;
        }
    }
    else if (target.x)
    {
        left += target.x;
    }
    return left;
}

// calculate the position of the element in relation to the top of the browser window //
function topPosition(target)
{
    var top = 0;
    if (target.offsetParent)
    {
        while (1)
        {
            top += target.offsetTop;
            if (!target.offsetParent)
            {
                break;
            }
            target = target.offsetParent;
        }
    }
    else if (target.y)
    {
        top += target.y;
    }
    return top;
}

var fadeInObj = null;
var fadeOutObj = null;
var browser;

function check()
{
    var loUserAgent = navigator.userAgent.toLowerCase();
    
    if (loUserAgent.indexOf('opera') != -1)
    { // Opera (check first in case of spoof)
        browser = 0;
    }
    else if (loUserAgent.indexOf('msie 7') != -1)
    { // IE7
        browser = 1;
    }
    else if (loUserAgent.indexOf('msie 8') != -1)
    { // IE8
        browser = 2;
    }
    else if (loUserAgent.indexOf('msie') != -1)
        { // IE
            browser = 1;
        }
        else if (loUserAgent.indexOf('safari') != -1)
            { // Safari (check before Gecko because it includes "like Gecko")
                browser = 0;
            }
            else if (loUserAgent.indexOf('gecko') != -1)
                { // Gecko
                    browser = 0;
                }
                else
                {
                    browser = 0;
                }
}

function fadeIn(obyek, step, delay)
{
    clearTimeout(fadeOutObj);
    var opacity;

    if (browser == 1)
        opacity = document.getElementById(obyek).filters.alpha.opacity;
    else if(browser == 2)
        opacity = document.getElementById(obyek).filters[0].opacity;
    else
    {
        opacity = document.getElementById(obyek).style.opacity;
        opacity = opacity * 100;
    }

    opacity = opacity + step;

    if (opacity > 100)
        opacity = 100;

    if (browser == 1)
        document.getElementById(obyek).filters.alpha.opacity = opacity;
    else if(browser == 2)
        document.getElementById(obyek).filters[0].opacity = opacity;
    else
        document.getElementById(obyek).style.opacity = opacity / 100;

    if (opacity < 100)
    {
        fadeInObj = setTimeout('fadeIn("' + obyek + '",' + step + ',' + delay + ')', delay);
    }
    else
    {
        clearTimeout(fadeInObj);
    }
}

function fadeOut(obyek, step, delay)
{
    clearTimeout(fadeInObj);

    var opacity;
    if (browser == 1)
        opacity = document.getElementById(obyek).filters.alpha.opacity;
    else if(browser == 2)
        opacity = document.getElementById(obyek).filters[0].opacity;
    else
    {
        opacity = document.getElementById(obyek).style.opacity;
        opacity = opacity * 100;
    }

    opacity = opacity - step;

    if (opacity < 0)
        opacity = 0;

    if (browser == 1)
        document.getElementById(obyek).filters.alpha.opacity = opacity;
     else if(browser == 2)
        document.getElementById(obyek).filters[0].opacity = opacity;
    else
        document.getElementById(obyek).style.opacity = opacity / 100;

    if (opacity > 0)
    {
        fadeOutObj = setTimeout('fadeOut("' + obyek + '",' + step + ',' + delay + ')', delay);
    }
    else
    {
        clearTimeout(fadeOutObj);
        document.getElementById(obyek).style.visibility = 'hidden';
    }
}

function hideToolTip() {
    fadeOut('ToolTip', 5, 14);
}

function mouseCoords(ev)
{
    if (ev.pageX || ev.pageY)
    {
        return {x:ev.pageX, y:ev.pageY};
    }
    var de = document.documentElement;
    var b = document.body;
    return {
        x:ev.clientX + (de.scrollLeft || b.scrollLeft) - (de.clientLeft || 0),
        y:ev.clientY + (de.scrollTop || b.scrollTop) - (de.clientTop || 0)
    };
}

function resetTabs()
{
    if (document.getElementById("ct1")) {
        document.getElementById("ct1").style.display = "none";
        document.getElementById("link_ct1").className = "";
    }
    if (document.getElementById("ct2")) {
        document.getElementById("ct2").style.display = "none";
        document.getElementById("link_ct2").className = "";
    }
    if (document.getElementById("ct5")) {
        document.getElementById("ct5").style.display = "none";
        document.getElementById("link_ct5").className = "";
    }
    if (document.getElementById("ct6")) {
        document.getElementById("ct6").style.display = "none";
        document.getElementById("link_ct6").className = "";
    }
}

function show(id)
{
    resetTabs();
    if (document.getElementById(id)) {
        document.getElementById("link_" + id).className = "current";
        document.getElementById(id).style.display = 'block';
    }
}

function setDocTag(id, pg) {
    window.location = '../documentation/' + pg + '.jsp';
}

function textCounter(field, counter, maxlimit) {
    document.getElementById(counter).style.visibility = 'visible';
    var fieldWidth = parseInt(field.offsetWidth);
    var charcnt = field.value.length;
    if (charcnt > 1) {
        if (charcnt > maxlimit) {
            field.value = field.value.replace(/\n/g, '').substring(0, maxlimit)
        }
        else {
//            var percentage = parseInt(100 - (( maxlimit - charcnt) * 100) / maxlimit);
//            document.getElementById(counter).style.width = parseInt((fieldWidth * percentage) / 100) + "px";
            document.getElementById(counter).innerHTML = (maxlimit - charcnt)+ " characters left";
//            else document.getElementById(counter).innerHTML = "";
        }
    }
    else
        document.getElementById(counter).style.visibility = 'hidden';
}

function hideCounter(counter) {
    document.getElementById(counter).style.visibility = 'hidden';
}

function checkall(checkname, thestate)
{
    var locollection = document.getElementsByName(checkname);
    for (var lic = 0; lic < locollection.length; lic++)
        if (!locollection[lic].disabled)locollection[lic].checked = thestate;
}

/* Validate Email*/
function isEmail(email)
{
    return (email.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) != -1);
}
