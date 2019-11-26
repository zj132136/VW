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
	<form action="${pageContext.request.contextPath }/engine/turboChargerVoltageSubmit.action"  method="post" class="form form-horizontal"  onSubmit="return closeWindow()">
		<input type="text" class="hidden"  id="engineId" name="engineId" value="${engineRecordInfo.engineId}">
		<input type="text" class="hidden"  id="engineName" name="engineName" value="${engineRecordInfo.engineName}">
		<input type="text" class="hidden"  id="locationName" name="locationName" value="${engineRecordInfo.engineLoaction}">
		<input type="text" class="hidden"  id="engineRecordInfoId" name="engineRecordInfoId" value="${engineRecordInfo.id}">
		<h4>About</h4>
		<div class="hr-line-dashed"></div>
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>日期：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text" value="${time}" id="turboChargerVoltageTime" name="turboChargerVoltageTime" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
			</div>
			<label class="form-label col-2">试验：</label>
			<div class="formControls col-2">
				<span class="select-box" style="width:150px;">
				<select class="select" name="testName" size="1">
					
					<c:forEach items="${engineTestList }" var="itemtype">
						<option value="${itemtype.testName }"<c:if test="${itemtype.testName == engineParts.testName}"> selected="selected"</c:if> >
						${itemtype.testName}</option>		
					</c:forEach>
					
 				</select>
				</span>
			</div>
			<label class="form-label col-2">操作人员：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${username}"  id="operator" name="operator" >
			</div>
			
		</div>
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>循环时间：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text"  id="cycleTime" name="cycleTime" >
			</div>
			<label class="form-label col-2">总时间：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text"  id="totalTime" name="totalTime" >
			</div>
			<label class="form-label col-2">维修类型：</label>
			<div class="formControls col-2">
				<span class="select-box">
				<select name="maintenanceTpye" class="select" >
					<option value="Standard" >Standard</option>
					<option value="TroubleShooting">TroubleShooting</option>
				</select>
				</span> 
			</div>
			
		</div>
		<div class="hr-line-dashed"></div>
		<h4>TUTBO & ACTUATOR</h4>
		<div class="row cl">
			<label class="form-label col-2">Turbo Part Number</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text" value="${turboChargerVoltage.turboPartNumber}"  id="turboPartNumber" name="turboPartNumber" >
			</div>
			<label class="form-label col-2">Turbo Serial Number</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${turboChargerVoltage.turboSerialNumber}"  id="turboSerialNumber" name="turboSerialNumber" >
			</div>
			<label class="form-label col-2">Turbo Manufacturer</label>
			<div class="formControls col-2">
				<span class="select-box">
				<select name="turboManufacturer" class="select" >
					<option value="Mahle" >Mahle</option>
					<option value="TroubleShooting">TroubleShooting</option>
				</select>
				</span> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2">Actuator Part Number</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text" value="${turboChargerVoltage.actuatorPartNumber}" id="actuatorPartNumber" name="actuatorPartNumber" >
			</div>
			<label class="form-label col-2">Actuator Serial Number</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${turboChargerVoltage.actuaorSerialNumber}"  id="actuaorSerialNumber" name="actuaorSerialNumber" >
			</div>
			<label class="form-label col-2">Actuator Manufacturer</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${turboChargerVoltage.actuatorManufacturer}"  id="actuatorManufacturer" name="actuatorManufacturer" >
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2">Senor Voltage</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text" value="${turboChargerVoltage.sensorVoltage}"  id="sensorVoltage" name="sensorVoltage" >
			</div>
			<label class="form-label col-2">TOELW1</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${turboChargerVoltage.toelw1}"  id="toelw1" name="toelw1" >
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2">备注：</label>
			<div class="formControls col-8">
				<textarea name="remark" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" onKeyUp="textarealength(this,200)">${turboChargerVoltage.remark}</textarea>
				<p class="textarea-numberbar"><em class="textarea-length">0</em>/200</p>
			</div>
		</div>
			
		<div class="row cl">
			<div class="col-9 col-offset-9">
			<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
          </div>
		</div> 
		
		
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