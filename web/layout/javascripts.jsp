<%--<script type="text/javascript" src="${pageContext.request.contextPath}/jsCalendar/calendar.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsCalendar/lang/calendar-en.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jsCalendar/calendar-setup.js"></script>
--%>
<script src="${pageContext.request.contextPath}/FCKeditor/fckeditor.js" type="text/javascript"></script>
<script type="text/javascript"
    src="http://ajax.googleapis.com/ajax/libs/prototype/1.6.0.2/prototype.js"></script>

<%--<script src="${pageContext.request.contextPath}/ajax/prototype.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/ajax/effects.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/ajax/dragdrop.js" type="text/javascript"></script>
--%>
<script type="text/javascript">
    
    function changeSpecial(value){
        if(value == 'Standard specification')
        {
            $('special').hide();
        }
        if(value == 'Special specification')
        {
            $('special').show();
        }
    }
    
    function changeLayout(value){
        if(value == 'Single')
        {
            $('panel').hide();
            $('single').show();
        }
        if(value == 'Panel')
        {
            $('panel').show();
            $('single').hide();
        }
    }
    
    function changePanelization(value){
        if(value == 'Azitech')
        {
            $('own').hide();
            $('azitech').show();
        }
        if(value == 'Your own panel')
        {
            $('azitech').hide();
            $('own').show();
        }
    }
    function integerCheck(s)
    {
        if(s)
        {
            var i,value;
            value = s.value;
            for (i = 0; i < value.length; i++)
            {
                // Check that current character is number.
                var c = value.charAt(i);
                if (((c < "0") || (c > "9")))
                {
                    s.value = "0";
                    alert(value + " is not a valid number");
                }
            }
        }
        // All characters are numbers.
    }
    
    function inlineSavePart(form, event, container) {
        var content = FCKeditorAPI.GetInstance('part.content').GetXHTML();
        $('part.content').value=content;
        voke(form, name, container);
        $('fckeditorWindow').innerHTML = '';
        FCKeditorAPI = null;
        __FCKeditorNS = null;    
    }
    
    function voke(form, event, container) {           
          var params = Form.serialize(form);
          if (event != null) {
            params = event + '&' + params;
          }
          new Ajax.Updater(container, form.action, {method:'post', postBody:params});    

    }
       
    function vokePart(form, event, container) {           
          var params = Form.serialize(form);
          if (event != null) {
            params = event + '&' + params;
          }
          new Ajax.Updater(container, form.action, {method:'post', postBody:params}); 
          $('fckeditorWindow').innerHTML = '';
   }
    
    function doSwitch(elm){
        if ($(elm).hasClassName('boxtop')){
            $(elm).toggleClassName('boxtop2');
        }
        else{
            $(elm).toggleClassName('boxtop');
        }
     }
    
      function invoke(form, event, container) {
//              alert('invoke started');
              var params = Form.serialize(form);
              if (event != null) params = event + '&amp;' + params;
              new Ajax.Updater(container, form.action, {method:'post', postBody:params,evalScripts: true});
//              alert('invoke finished');
       }
       
    function submitAndReplace(form,event,id,prefix){
    if(prefix == undefined){
    prefix = '';
    }
    var container = prefix+'title_'+id;
    var formContainer = prefix+'form_'+id;
        var params = Form.serialize(form);
        if (event != null) params = event + '&amp;' + params;
        new Ajax.Updater(container, form.action, 
            {
                method:'post', 
                postBody:params,
                onComplete:function(){
                    $(formContainer).innerHTML = '';
                }
            }
        );
    }
    
      
       function invokeAndPrepend(form,event,container) {
              var params = Form.serialize(form);
              if (event != null) params = event + '&amp;' + params;
              new Ajax.Updater(container, form.action, {method:'post', postBody:params,insertion: Insertion.Top,evalScripts: true});
       }
       
              
       function invokeAndInsert(form, event, container) {              
              var params = Form.serialize(form);
              if (event != null) params = event + '&amp;' + params;
              new Ajax.Updater(container, form.action, {method:'post', postBody:params,insertion: Insertion.Bottom , evalScripts: true});
       }
       
	    function ajax(place,url){
            var newurl = url+'&'+'randomnumber='+Math.random();
            new Ajax.Updater(place,newurl);
            return false;
       }
       
       function ajax(place,url,parameters){
            var newurl = url+'&'+'randomnumber='+Math.random();
            new Ajax.Updater(place,newurl,parameters);
            return false;
       }
</script>