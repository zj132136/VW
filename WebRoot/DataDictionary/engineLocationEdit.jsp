<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%> 

<%
String path = request.getContextPath()+"/"+"engine/engineLocationlist.action";

%>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>

<![endif]-->
<link href="../Hui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="../Hui/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="../Hui/lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
<link href="../Hui/lib/Hui-iconfont/1.0.6/iconfont.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../Hui/lib/Validform/5.3.2/Validform.min.js"></script>
<script type="text/javascript" src="../Hui/lib/icheck/jquery.icheck.min.js"></script> 


	<link href="../css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
	<link href="../css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="../css/animate.css" rel="stylesheet">
    <link href="../css/animate.css" rel="stylesheet">
    <link href="../css/style.css?v=4.1.0" rel="stylesheet">   
    <script src="../js/jquery.min.js?v=2.1.4"></script>
    <script src="../js/bootstrap.min.js?v=3.3.6"></script>
    <script src="../js/content.js?v=1.0.0"></script>
    <script src="../js/plugins/layer/laydate/laydate.js"></script>
<title>台架编辑</title>
<script type="text/javascript">
 function closeWindow(){
	 if(confirm("确认要提交本表单吗？")==true){
		 
		 window.parent.location.reload();
	 }else{
		  return false;
	 }
 }
 </script> 
</head>
<body>
<div class="pd-20">
	<form action="${pageContext.request.contextPath }/engine/engineLocationEditSubmit.action"  method="post" class="form form-horizontal" id="form-admin-add" onSubmit="return closeWindow()" >
		<input type="hidden" name="location_id" value="${engine.location_id}">
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>位置名称：</label>
			<div class="formControls col-5">
				<input type="text" class="input-text"  placeholder="" id="location" name="location" datatype="*2-16" nullmsg="位置名称不能为空" value="${engine.location}"  >
			</div>
			<div class="col-4"> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>创建用户：</label>
			<div class="formControls col-5">
				<input type="text" class="input-text"  id="add_by" name="add_by"   value="${engine.add_by}"  >
			</div>
			<!-- <span class="c-red">*</span>自动填充当前登录人 -->
			<div class="col-4"> </div>
		</div>
		
		<div class="row cl">   
            <label class="form-label col-3"><span class="c-red">*</span>创建时间：</label>
			<div class="formControls col-5">       
               <input class="input-text" id="add_datetime" name="add_datetime" placeholder="YYYY-MM-DD hh:mm:ss" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"  value="${time}">
               <!-- <label class="laydate-icon"></label> -->
            </div>
        </div>
		<div class="row cl">
			<div class="col-9 col-offset-3">
			<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
          </div>
		</div> 
	</form>
</div> 
<script type="text/javascript" src="../Hui/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="../Hui/lib/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="../Hui/lib/Validform/5.3.2/Validform.min.js"></script> 
<script type="text/javascript" src="../Hui/lib/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="../Hui/js/H-ui.js"></script> 
<script type="text/javascript" src="../Hui/js/H-ui.admin.js"></script> 
<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#form-admin-add").Validform({
		tiptype:2,
		
		callback:function(form){
			form[0].submit();
			if(1==1){
				window.parent.location.replace("<%=path%>");
			}
			/* var index = parent.layer.getFrameIndex(window.name);
			 parent.layer.close(index);  */
			 
		}
	});
});


</script>
</body>
</html>