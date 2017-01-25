<%@ include file="/taglibs.jsp"%>
<%@tag description="put the tag description here" pageEncoding="UTF-8"%>

<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld"%>
<%@ taglib prefix="cat" tagdir="/WEB-INF/tags" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

   <%@attribute name="name" required="true"%>   
   <%@attribute name="type" required="false"%>   
   <%@attribute name="label" required="false"%>
   <%@attribute name="info" required="false"%>
   <%@attribute name="value" required="false" %>
   <%@ attribute name="size" required="false" %>
   <%@ attribute name="id" required="false" %>
   <%@ attribute name="onfocus" required="false" %>
   <%@ attribute name="onchange" required="false" %>
   <%@ attribute name="classname" required="false" %>
   <%@ attribute name="cols" required="false" %>
   <%@ attribute name="rows" required="false" %>
   <%@ attribute name="style" required="false" %>

<c:if test="${rows eq null}">
    <c:set var="rows" value="6"/>
</c:if>
<c:if test="${cols eq null}">
    <c:set var="cols" value="20"/>
</c:if>

 <c:if test="${classname eq null}">
       <c:set var="classname" value="form-control"/>
   </c:if>

   <c:if test="${type eq null}">
       <c:set var="type" value="text"/>
   </c:if>

    <c:if test="${info eq null}">
        <c:set var="info" value=""/>
    </c:if>
<!--<div>-->
 <div class="form-group">
                <label class="col-md-3 col-xs-12 control-label">${label}



        </label>
        <div class="col-md-6 col-xs-12">
            <div class="input-group">
     <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
       <c:choose>
           <c:when test="${type eq 'text'}">
               <stripes:text name="${name}" size="${size}" id="${id}" onfocus="${onfocus}" class="${classname}"
                             onchange="${onchange}" style="${style}"/>
           </c:when>
           <c:when test="${type eq 'radio'}">
               <stripes:radio value="true" name="${name}" id="${id}" onfocus="${onfocus}" class="${classname}"/>
           </c:when>
           <c:when test="${type eq 'textarea'}">
               <stripes:textarea name="${name}" class="${classname}" rows="${rows}" cols="${cols}" id="${id}"
                                 onfocus="${onfocus}" onchange="${onchange}" style="${style}">${value}</stripes:textarea>
           </c:when>
           <c:when test="${type eq 'checkbox'}">
               <stripes:checkbox name="${name}" value="${value}" id="${id}" onfocus="${onfocus}"
                                 class="${classname}"/>
           </c:when>
           <c:when test="${type eq 'password'}">
               <stripes:password name="${name}" size="${size}" id="${id}" onfocus="${onfocus}"
                                 class="${classname}"/>
           </c:when>
           <%-- <c:when test="${type eq 'wysiwyg'}">
               <FCK:editor
                id="${name}"
                width="400"
                height="250"
                toolbarSet="Basic">${value}</FCK:editor>
           </c:when>--%>
           <c:when test="${type eq 'file'}">
               <stripes:file name="${name}" id="${id}" onfocus="${onfocus}" class="${classname}"/>
           </c:when>
       </c:choose>

           </div>


     <c:choose><c:when test="${info ne ''}">
               <span class="help-block">${info}</span>
       </c:when></c:choose>


        </div> 
    <span class="contenterror">
       <stripes:errors field="${name}">
           <stripes:individual-error/>
       </stripes:errors>
    </span>
          
 </div>
    <%--
    (<a href="#" onclick="$('helptext_div_${name}').style.height='40px';">?</a>)
    <div id="helptext_div_${name}" style="display:block;height:0px">
    <cat:part part="helptext_${name}" site="yes"/>
    </div>--%>
<!--</div>-->