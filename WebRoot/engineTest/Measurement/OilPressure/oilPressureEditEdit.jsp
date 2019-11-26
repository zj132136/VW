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
	<form action="${pageContext.request.contextPath }/engine/oilPressureUpdate.action"  method="post" class="form form-horizontal" onSubmit="return closeWindow()"  >
		<input type="text" class="hidden"  id="id" name="id" value="${oilPressure.id}">
		
		
		<h3>About</h3>
		<div class="hr-line-dashed"></div>
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>Olsumpf-Temperatur：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text" value="${oilPressure.olsumpfTempratur}" id="olsumpfTempratur" name="olsumpfTempratur" >
			</div>
			<label class="form-label col-3">Kuhlmittel-Temperatur：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${oilPressure.kuhlmittelTempratur}" id="kuhlmittelTempratur" name="kuhlmittelTempratur" >
			</div>
			
			
		</div>
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>Steuerventil drucksfen：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text" value="${oilPressure.steuerventilDruckstufen}"  id="steuerventilDruckstufen" name="steuerventilDruckstufen" >
			</div>
			<label class="form-label col-3">schaltventil kolbenkhul_dusen：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${oilPressure.schaltventilKolbenkhul}" id="schaltventilKolbenkhul" name="schaltventilKolbenkhul" >
			</div>
			
			
		</div>
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>POELF：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text" value="${oilPressure.oldruckBeimPoelf}"  id="oldruckBeimPoelf" name="oldruckBeimPoelf" >
			</div>
			<label class="form-label col-3">Oldruck in kobenkhulgalerie：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${oilPressure.oldruckInKobenPkokue}" id="oldruckInKobenPkokue" name="oldruckInKobenPkokue" >
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