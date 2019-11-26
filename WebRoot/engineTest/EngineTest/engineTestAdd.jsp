<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%> 

<%
String path = request.getContextPath()+"/"+"engineTest/engineTest-test.jsp";

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
	<form action="${pageContext.request.contextPath }/engine/engineTestAddSubmit.action"  method="post" class="form form-horizontal"  onSubmit="return closeWindow()">
		<input type="text" class="hidden"  id="engineId" name="engineId" value="${engineRecordInfo.engineId}">
		<%-- <input type="text" class="hidden"  id="locationId" name="locationId" value="${engineRecordInfo.engineLoaction}">
		 --%>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>试验名称：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text"  placeholder="" id="testName" name="testName">
			</div>
			
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>发动机名称：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text" value="${engineRecordInfo.engineName }"  id="engineName" name="engineName">
			</div>
			<label class="form-label col-3">位置信息：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${engineRecordInfo.engineLoaction }"  id="locationName" name="locationName">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>创建人：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text" value="${username}"  id="addByUser" name="addByUser">
			</div>
			<label class="form-label col-3">时间：</label>
			<div class="formControls col-2">
				<input class="input-text" id="time" name="time"  onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"  value="${time}">
            </div>
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>计划开始：</label>
			<div class="formControls col-2"> 
				<input class="input-text" id="planStartTime" name="planStartTime"  onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"  >
            </div>
			<label class="form-label col-3">计划结束：</label>
			<div class="formControls col-2">
				<input class="input-text" id="planEndTime" name="planEndTime"  onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"  >
            </div>
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>实际开始：</label>
			<div class="formControls col-2"> 
				<input class="input-text" id="actualStartTime" name="actualStartTime"  onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"  >
            </div>
			<label class="form-label col-3">实际结束：</label>
			<div class="formControls col-2">
				<input class="input-text" id="actualEndTime" name="actualEndTime"  onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"  >
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