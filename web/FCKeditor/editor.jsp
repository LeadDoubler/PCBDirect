<%@ include file="/taglibs.jsp"%>

<script type="text/javascript" src="fckeditor.js"></script>

<script type="text/javascript">
  	var oFCKeditor = new FCKeditor('FCKeditor');
	oFCKeditor.BasePath = "";
	oFCKeditor.ToolbarSet = 'Catalog';
	oFCKeditor.Create();
</script>



<h1>FCKeditor manager</h1>

<ul>
    <li>
            <a href="#" onclick="new Ajax.Updater('editorWindow','${pageContext.request.contextPath}/book/Book.action?list',{method:'get'});">Get All Pages</a>                            
    </li>    
</ul>

<span id="editorWindow"></span>