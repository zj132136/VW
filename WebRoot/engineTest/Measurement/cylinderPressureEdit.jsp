<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%> 
<%@ include file="/WEB-INF/jsp/tag.jsp"%>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="${baseurl}Hui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="${baseurl}Hui/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="${baseurl}Hui/lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
<link href="${baseurl}Hui/lib/Hui-iconfont/1.0.6/iconfont.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${baseurl}Hui/lib/Validform/5.3.2/Validform.min.js"></script>
<script type="text/javascript" src="${baseurl}Hui/lib/icheck/jquery.icheck.min.js"></script> 


	<link href="${baseurl}css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
	<link href="${baseurl}css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${baseurl}css/animate.css" rel="stylesheet">
    <link href="${baseurl}css/animate.css" rel="stylesheet">
    <link href="${baseurl}css/style.css?v=4.1.0" rel="stylesheet">   
    <script src="${baseurl}js/jquery.min.js?v=2.1.4"></script>
    <script src="${baseurl}js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${baseurl}js/content.js?v=1.0.0"></script>
    <script src="${baseurl}js/plugins/layer/laydate/laydate.js"></script>
     <link href="${baseurl}css/plugins/switchery/switchery.css" rel="stylesheet">
     <script src="${baseurl}js/plugins/switchery/switchery.js"></script>
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
	<form action="${pageContext.request.contextPath }/engine/engineBasicUpdateSubmit.action"  method="post" class="form form-horizontal"  onSubmit="return closeWindow()">
		<input type="text" class="hidden"  id="engineId" name="engineId" value="${cylinderPressure.engineId}">
		<input type="text" class="hidden"  id="locationId" name="locationId" value="${cylinderPressure.locationId}">
		<input type="text" class="hidden"  id="addByUser" name="addByUser" value="${username}">
		<input type="text" class="hidden"  id="time" name="time" value="">
		<input type="text" class="hidden"  id="id" name="id" value="${cylinderPressure.id}">
		<h3>About</h3>
		<div class="hr-line-dashed"></div>
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>日期：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text" value="${cylinderPressure.cylinderPressureTime}" id="cylinderPressureTime" name="cylinderPressureTime" >
			</div>
			<label class="form-label col-1">试验：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${cylinderPressure.testName}" placeholder="" id="testName" name="testName" >
			</div>
			<label class="form-label col-1">操作人员：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${cylinderPressure.operator}" placeholder="" id="operator" name="operator" >
			</div>
			
		</div>
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>循环时间：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text" value="${cylinderPressure.cycleTime}" placeholder="" id="cycleTime" name="cycleTime" >
			</div>
			<label class="form-label col-1">总时间：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${cylinderPressure.totalTime}" placeholder="" id="totalTime" name="totalTime" >
			</div>
			<label class="form-label col-1">维修类型：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${cylinderPressure.maintenanceTpye}" placeholder="" id="maintenanceTpye" name="maintenanceTpye" >
			</div>
			
		</div>
		<div class="hr-line-dashed"></div>
		<h4>压力</h4>
		<div class="hr-line-dashed"></div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>cylinder1：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text" value="${cylinderPressure.cylinder1}" placeholder="" id="cylinder1" name="cylinder1">
			</div>
			
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>cylinder2：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text" value="${cylinderPressure.cylinder2}" placeholder="" id="cylinder2" name="cylinder2">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>cylinder3：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text" value="${cylinderPressure.cylinder3}" placeholder="" id="cylinder3" name="cylinder3">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>cylinder4：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text" value="${cylinderPressure.cylinder4}" placeholder="" id="cylinder4" name="cylinder4">
			</div>
			
			<label class="form-label col-3"><span class="c-red">*</span>结果：</label>
			<div class="formControls col-2"> 
				<input type="checkbox" class="js-switch" <c:if test="${cylinderPressure.results == 'OK'}"> checked</c:if> />
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-3">备注：</label>
			<div class="formControls col-7">
				<textarea name="remark" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" onKeyUp="textarealength(this,200)">${cylinderPressure.remark}</textarea>
				<p class="textarea-numberbar"><em class="textarea-length">0</em>/200</p>
			</div>
		</div>
		
		<!-- <div class="row cl">
			<div class="col-9 col-offset-3">
			<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
          </div>
		</div> --> 
	</form>
</div> 
<script type="text/javascript" src="${baseurl}Hui/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${baseurl}Hui/lib/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="${baseurl}Hui/lib/Validform/5.3.2/Validform.min.js"></script> 
<script type="text/javascript" src="${baseurl}Hui/lib/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="${baseurl}Hui/js/H-ui.js"></script> 
<script type="text/javascript" src="${baseurl}Hui/js/H-ui.admin.js"></script> 
 <!-- Data picker -->
    <script src="${baseurl}js/plugins/datapicker/bootstrap-datepicker.js"></script>
    <!-- Switchery -->
    <script src="${baseurl}js/plugins/switchery/switchery.js"></script>
    <!-- Image cropper -->
    <script src="${baseurl}js/plugins/cropper/cropper.min.js"></script>

    <script src="${baseurl}js/demo/form-advanced-demo.js"></script>

<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	
});


</script>
</body>
</html>