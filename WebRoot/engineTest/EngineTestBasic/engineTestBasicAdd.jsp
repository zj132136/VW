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
	<form action="${pageContext.request.contextPath }/engine/engineBasicAddSubmit.action"  method="post" class="form form-horizontal"  onSubmit="return closeWindow()">
		<input type="text" class="hidden"  id="engineId" name="engineId" value="${engineRecordInfo.engineId}">
		<input type="text" class="hidden"  id="locationId" name="locationId" value="${engineRecordInfo.engineLoaction}">
		<input type="text" class="hidden"  id="addByUser" name="addByUser" value="${username}">
		
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>岗数：</label>
			<div class="formControls col-2"> <span class="select-box">
				<select name="cylinderQuantity" class="select">
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
				</select>
				</span> </div>
			<label class="form-label col-3">SENT盒编号：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text"  placeholder="" id="sentBoxNum" name="sentBoxNum">
			</div>
			
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>排量：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text"  placeholder="" id="cylinderVolume" name="cylinderVolume">
			</div>
			<label class="form-label col-3">SENT线束号：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text"  placeholder="" id="sentCableNum" name="sentCableNum">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>汽油类型：</label>
			<div class="formControls col-2"> <span class="select-box">
				<select name="gasolineType" class="select">
					<option value="Local 95">Local 95</option>
					
				</select>
				</span> </div>
			<label class="form-label col-3">电源供电：</label>
			<div class="formControls col-2">
				<span class="select-box">
				<select name="powerSupply" class="select">
					<option value="Agilent">Agilent</option>
					<option value="EEC">EEC</option>
				</select>
				</span> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>机油类型：</label>
			<div class="formControls col-2"> <span class="select-box">
				<select name="oilType1" class="select">
					<option value="5W40">5W40</option>
					<option value="5W40">0W20</option>
					<option value="5W40">0W30</option>
				</select>
				</span> </div>
			<label class="form-label col-3">VECTOR编号：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text"  placeholder="" id="vectorNum" name="vectorNum">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>机油类型：</label>
			<div class="formControls col-2"> <span class="select-box">
				<select name="oilType2" class="select">
					<option value="G13">G13</option>
					<option value="G13">G12 EVO</option>
					
				</select>
				</span> </div>
			<label class="form-label col-3">台架线束编号：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text"  placeholder="" id="testbedCableNum" name="testbedCableNum">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>排气被压要求值：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text"  placeholder="" id="exhaustBackPress" name="exhaustBackPress">
		    </div>
			<label class="form-label col-3">发动机启动类型：</label>
			<div class="formControls col-2">
				<span class="select-box">
				<select name="engineStartType" class="select">
					<option value="Starter motor">Starter motor</option>
					<option value="Active Dyno">Active Dyno</option>
				</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>变速箱数量：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text"   id="gearboxQuantity" name="gearboxQuantity">
		    </div>
			<label class="form-label col-3">Distance before transmission(mm)：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text"   id="distanceBeforeTransmission" name="distanceBeforeTransmission">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>ECU数据版本：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text"   id="ecuDateVersion" name="ecuDateVersion">
			</div>
			<label class="form-label col-3">径向对中数据：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text"  id="alignmentRadialDirecttion" name="alignmentRadialDirecttion">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>小车号：</label>
			<div class="formControls col-2"> <span class="select-box">
				<select name="trolleyNum" class="select">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
				</select>
				</span> </div>
			<label class="form-label col-3">Alignment Axial(mm)：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text"  placeholder="" id="alignmentAxial" name="alignmentAxial">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>中冷器小车编号：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text"  placeholder="" id="cacNum" name="cacNum">
			</div>
			<label class="form-label col-3">AVL553热交换器：</label>
			<div class="formControls col-2"><span class="select-box">
				<select name="avl553HeatExchanger" class="select">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="14">15</option>
				</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>中冷器热交换器编号：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text"  placeholder="" id="cacHeatExchangeNum" name="cacHeatExchangeNum">
			</div>
			<label class="form-label col-3"><span class="c-red">*</span>防盗盒信息：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text"  placeholder="" id="preventTheftBox" name="preventTheftBox">
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-3">备注：</label>
			<div class="formControls col-7">
				<textarea name="" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" onKeyUp="textarealength(this,200)"></textarea>
				<p class="textarea-numberbar"><em class="textarea-length">0</em>/200</p>
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