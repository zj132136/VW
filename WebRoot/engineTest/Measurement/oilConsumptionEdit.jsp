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
		<input type="text" class="hidden"  id="engineId" name="engineId" value="${oilConsumption.engineId}">
		<input type="text" class="hidden"  id="locationId" name="locationId" value="${oilConsumption.locationId}">
		<input type="text" class="hidden"  id="addByUser" name="addByUser" value="${username}">
		<input type="text" class="hidden"  id="time" name="time" value="">
		<input type="text" class="hidden"  id="id" name="id" value="${oilConsumption.id}">
		<h4>About</h4>
		<div class="hr-line-dashed"></div>
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>日期：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text" value="${oilConsumption.oilConsumptionTime}" id="oilConsumptionTime" name="oilConsumptionTime" >
			</div>
			<label class="form-label col-2">试验：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${oilConsumption.testName}" placeholder="" id="testName" name="testName" >
			</div>
			<label class="form-label col-2">操作人员：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${oilConsumption.operator}" placeholder="" id="operator" name="operator" >
			</div>
			
		</div>
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>循环时间：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text" value="${oilConsumption.cycleTime}" placeholder="" id="cycleTime" name="cycleTime" >
			</div>
			<label class="form-label col-2">总时间：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${oilConsumption.totalTime}" placeholder="" id="totalTime" name="totalTime" >
			</div>
			<label class="form-label col-2">维修类型：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${oilConsumption.maintenanceTpye}" placeholder="" id="maintenanceTpye" name="maintenanceTpye" >
			</div>
			
		</div>
		<div class="hr-line-dashed"></div>
		<h4>油耗</h4>
		<div class="hr-line-dashed"></div>
			<div class="row cl">
				<label class="form-label col-2">Before</label>
				<div class="formControls col-2"> 
					<input type="hidden" class="input-text" >
				</div>
				<label class="form-label col-2">After</label>
				<div class="formControls col-2">
					<input type="hidden" class="input-text" >
				</div>
				<label class="form-label col-2">Runtime</label>
				<div class="formControls col-2">
					<input type="hidden" class="input-text" >
				</div>	
			</div>
		<div class="row cl">
			<label class="form-label col-2">A1:Something</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text" value="${oilConsumption.something}" placeholder="" id="something" name="something" >
			</div>
			<label class="form-label col-2">H:Oil Added during test</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${oilConsumption.oilAddedDuring}" placeholder="" id="oilAddedDuring" name="oilAddedDuring" >
			</div>
			<label class="form-label col-2">Engine Run Time(h)</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${oilConsumption.engineRunTime}" placeholder="" id="engineRunTime" name="engineRunTime" >
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2">A2:Funnel Weight</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text" value="${oilConsumption.funnelWeight}" placeholder="" id="funnelWeight" name="funnelWeight" >
			</div>
			<label class="form-label col-2">E:Pot</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${oilConsumption.potAfter}" placeholder="" id="potAfter" name="potAfter" >
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2">B:Oil+Pot</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text" value="${oilConsumption.oilPot}" placeholder="" id="oilPot" name="oilPot" >
			</div>
			<label class="form-label col-2">F:Oil Weight</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${oilConsumption.oilWeight}" placeholder="" id="oilWeight" name="oilWeight" >
			</div>
		</div>
		<div class="row cl">
		<label class="form-label col-2">C1:Pot</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text" value="${oilConsumption.potBefore}" placeholder="" id="potBefore" name="potBefore" >
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2">C2:Funnel after filling</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text" value="${oilConsumption.funnelAfterFilling}" placeholder="" id="funnelAfterFilling" name="funnelAfterFilling" >
			</div>
			
		</div>
	<div class="hr-line-dashed"></div><h4>结果</h4>
	<div class="hr-line-dashed"></div>
			<div class="row cl">
				<label class="form-label col-2">D:Gross Weight before
				(D=B+A2-C1-C2)
				</label>
				<div class="formControls col-2"> 
					<input type="text" class="input-text" value="${oilConsumption.grossWeightBefore}" placeholder="" id="grossWeightBefore" name="grossWeightBefore" >
				</div>
				<label class="form-label col-2">G:Drain oil gross weight
				(G=F-E)</label>
				<div class="formControls col-2">
					<input type="text" class="input-text" value="${oilConsumption.drainOilGrossWeight}" placeholder="" id="drainOilGrossWeight" name="drainOilGrossWeight" >
				</div>
				<label class="form-label col-2">K:Gross Oil Consumption
				(K=D+H-G)</label>
				<div class="formControls col-2">
					<input type="text" class="input-text" value="${oilConsumption.grossOilConsumption}" placeholder="" id="grossOilConsumption" name="grossOilConsumption" >
				</div>	
			</div>	
			<div class="row cl">
				<label class="form-label col-2">Oil consumption</label>
				<div class="formControls col-2"> 
					<input type="text" class="input-text" value="${oilConsumption.oilConsumption}" placeholder="" id="oilConsumption" name="oilConsumption" >
				</div>
				<label class="form-label col-2">Oil type</label>
				<div class="formControls col-2">
					<input type="text" class="input-text" value="${oilConsumption.oilType}" placeholder="" id="oilType" name="oilType" >
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