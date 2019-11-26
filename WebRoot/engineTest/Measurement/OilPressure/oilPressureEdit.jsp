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
		<input type="text" class="hidden"  id="engineId" name="engineId" value="${oilPressure.engineId}">
		<input type="text" class="hidden"  id="locationName" name="locationName" value="${oilPressure.locationName}">
		<input type="text" class="hidden"  id="engineName" name="engineName" value="${oilPressure.engineName}">
		<h4>About</h4>
		<div class="hr-line-dashed"></div>
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>日期：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text" value="${oilPressure.oilPressureTime}" id="oilPressureTime" name="oilPressureTime" >
			</div>
			<label class="form-label col-2">试验：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${oilPressure.testName}" placeholder="" id="testName" name="testName" >
			</div>
			<label class="form-label col-2">操作人员：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${oilPressure.operator}" placeholder="" id="operator" name="operator" >
			</div>
			
		</div>
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>循环时间：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text" value="${oilPressure.cycleTime}" placeholder="" id="cycleTime" name="cycleTime" >
			</div>
			<label class="form-label col-2">总时间：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${oilPressure.totalTime}" placeholder="" id="totalTime" name="totalTime" >
			</div>
			<label class="form-label col-2">维修类型：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${oilPressure.maintenanceTpye}" placeholder="" id="maintenanceTpye" name="maintenanceTpye" >
			</div>
			
		</div>
		<div class="hr-line-dashed"></div>
		<h4>TUTBO & ACTUATOR</h4>
		
					<div class="mt-20">
					 <nav class="breadcrumb">
						<a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" >
						<i class="Hui-iconfont">&#xe68f;</i>
						</a>
					</nav>
					<table class="table table-border table-bordered table-hover table-bg table-sort">
						<thead>
						<tr>
							<th scope="col" colspan="6" class="text-c">基础信息</th>
							<th scope="col" colspan="3" class="text-c">Oldruck beim oldrukschalteer</th>
							<th scope="col" colspan="3" class="text-c">Oldruck in kobenkhulgalerie</th>
							<th scope="col" colspan="1" class="text-c">操作</th>
						</tr>
							<tr class="text-c">
								<!-- <th width="25"><input type="checkbox" name="" value=""></th> -->
								
								<th width="10">Olsumpf-Tempratur
								100+/-5 TORLW(jæ))</th>
								<th width="10">Kuhlmittel-Temperatur
								95+/-5 TKWEIN(jæ)</th>
								<th width="10">Motor-Drehzahl 
								+/- 50 DRZ(rpm)</th>
								<th width="10">Drosselklapp enstellung/Last
								+/- 5 DKLST(%)</th>
								<th width="10">Steuerventil druckstfen Olpumpe
								geschaltet uber PUMA</th>
								<th width="10">schaltventil kolbenkhul_dusen geschaltet uberpuma</th>
								<th width="10">POELF</th>
								<th width="10">MIN</th>
								<th width="10">MAX</th> 
								<th width="10">Oldruck in kobenkhulgalerie</th>
								<th width="10">MIN</th>
								<th width="10">MAX</th>   
								<th width="10">操作</th>
							</tr>
						</thead>
						<c:forEach items="${oilPressureList}" var="item">
							<tr class="text-c">
						
							<td>${item.olsumpfTempratur}</td>
						    <td>${item.kuhlmittelTempratur}</td>
						    <td>${item.motorDrehzahl}</td>
						    <td>${item.drosselklapp}</td>
						    <td>${item.steuerventilDruckstufen}</td>
						    <td>${item.schaltventilKolbenkhul}</td>
						    <td>${item.oldruckBeimPoelf}</td>
						    <td>${item.oldruckBeimMin}</td>
						    <td>${item.oldruckBeimMax}</td>
						    <td>${item.oldruckInKobenPkokue}</td>
						    <td>${item.oldruckInKobenMin}</td>
						    <td>${item.oldruckInKobenMax}</td>
						    <%-- <td>${item.engineName}</td>
						    <td>${item.locationName}</td>	 --%>	   
							<td class="td-manage">
							 <a title="编辑" href="javascript:;" onclick="admin_edit('油压信息','${baseurl}engine/oilPressureEditEditById.action?id=${item.id}','2','1200','600')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
							 
							  </td>
							</tr>
						</c:forEach>	
					</table>
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
function admin_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}

function admin_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		$.ajax({
        type: "POST",
        url : "delOilPressure.action",
        data: "id="+id ,   
    });
		
		$(obj).parents("tr").remove();
		layer.msg('已删除!',{icon:1,time:1000});
		
		<%-- if(1==1){
				location.replace("<%=path%>");
		} --%>
	});
}

</script>
</body>
</html>