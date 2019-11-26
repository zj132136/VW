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

    <link href="${baseurl}css/style.css?v=4.1.0" rel="stylesheet">   
    <script src="${baseurl}js/jquery.min.js?v=2.1.4"></script>
    <script src="${baseurl}js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${baseurl}js/content.js?v=1.0.0"></script>
    <script src="${baseurl}js/plugins/layer/laydate/laydate.js"></script>
     <link href="${baseurl}css/plugins/switchery/switchery.css" rel="stylesheet">
     <script src="${baseurl}js/plugins/switchery/switchery.js"></script>
     
    <link href="${baseurl}css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">

     
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
		<input type="text" class="hidden"  id="engineId" name="engineId" value="${nitrogenLeakage.engineId}">
		<input type="text" class="hidden"  id="engineName" name="engineName" value="${nitrogenLeakage.engineName}">
		<input type="text" class="hidden"  id="locationName" name="locationName" value="${nitrogenLeakage.locationName}">
		<input type="text" class="hidden"  id="id" name="id" value="${nitrogenLeakage.id}">
		<h4>About</h4>
		<div class="hr-line-dashed"></div>
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>日期：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text" value="${nitrogenLeakage.nitrogenLeakageTime}" id="nitrogenLeakageTime" name="nitrogenLeakageTime" >
			</div>
			<label class="form-label col-2">试验：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${nitrogenLeakage.testName}" placeholder="" id="testName" name="testName" >
			</div>
			<label class="form-label col-2">操作人员：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${nitrogenLeakage.operator}" placeholder="" id="operator" name="operator" >
			</div>
			
		</div>
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>循环时间：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text" value="${nitrogenLeakage.cycleTime}" placeholder="" id="cycleTime" name="cycleTime" >
			</div>
			<label class="form-label col-2">总时间：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${nitrogenLeakage.totalTime}" placeholder="" id="totalTime" name="totalTime" >
			</div>
			<label class="form-label col-2">维修类型：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${nitrogenLeakage.maintenanceTpye}" placeholder="" id="maintenanceTpye" name="maintenanceTpye" >
			</div>
			
		</div>
		<div class="hr-line-dashed"></div>
		<h4>PRSSURE</h4>
		
		<div class="row cl">
			<label class="form-label col-2">Cylinder1</label>
			<div class="formControls col-2">
				<div class="checkbox checkbox-info">
                      <input id="checkbox4" type="checkbox" <c:if test="${nitrogenLeakage.cylinder1Status == 'on'}"> checked</c:if>>
                      <label for="checkbox4">OK</label>
                </div>
                <div class="formControls col-0">
				<input type="text" class="input-text" value="${nitrogenLeakage.cylinder1Pressure}"  id="cylinder1Pressure" name="cylinder1Pressure" >
				<label for="checkbox4">Pressure (bar)</label>
			</div>
			</div>
			<label class="form-label col-2">Cylinder2</label>
			<div class="formControls col-2">
				<div class="checkbox checkbox-info">
                      <input id="checkbox4" type="checkbox" <c:if test="${nitrogenLeakage.cylinder2Status == 'on'}"> checked</c:if>>
                      <label for="checkbox4">OK</label>
                </div>
                <div class="formControls col-0">
				<input type="text" class="input-text" value="${nitrogenLeakage.cylinder2Pressure}"  id="cylinder2Pressure" name="cylinder2Pressure" >
				<label for="checkbox4">Pressure (bar)</label>
			</div>
			</div>		
		</div>
		<div class="row cl">
			<label class="form-label col-2">Cylinder3</label>
			<div class="formControls col-2">
				<div class="checkbox checkbox-info">
                      <input id="checkbox4" type="checkbox" <c:if test="${nitrogenLeakage.cylinder3Status == 'on'}"> checked</c:if>>
                      <label for="checkbox4">OK</label>
                </div>
                <div class="formControls col-0">
				<input type="text" class="input-text" value="${nitrogenLeakage.cylinder3Pressure}"  id="cylinder3Pressure" name="cylinder3Pressure" >
				<label for="checkbox4">Pressure (bar)</label>
			</div>
			</div>
			<label class="form-label col-2">Cylinder4</label>
			<div class="formControls col-2">
				<div class="checkbox checkbox-info">
                      <input id="checkbox4" type="checkbox" <c:if test="${nitrogenLeakage.cylinder4Status == 'on'}"> checked</c:if>>
                      <label for="checkbox4">OK</label>
                </div>
                <div class="formControls col-0">
				<input type="text" class="input-text" value="${nitrogenLeakage.cylinder4Pressure}"  id="cylinder4Pressure" name="cylinder4Pressure" >
				<label for="checkbox4">Pressure (bar)</label>
			</div>
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
<!-- iCheck -->
    <script src="${baseurl}js/plugins/iCheck/icheck.min.js"></script>
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