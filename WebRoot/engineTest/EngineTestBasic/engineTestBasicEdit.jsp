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
	<form action="${pageContext.request.contextPath }/engine/engineBasicUpdateSubmit.action"  method="post" class="form form-horizontal"  onSubmit="return closeWindow()">
		<input type="text" class="hidden"  id="engineId" name="engineId" value="${engineTestBasic.engineId}">
		<input type="text" class="hidden"  id="locationId" name="locationId" value="${engineTestBasic.locationId}">
		<input type="text" class="hidden"  id="addByUser" name="addByUser" value="${username}">
		<input type="text" class="hidden"  id="time" name="time" value="">
		<input type="text" class="hidden"  id="id" name="id" value="${engineTestBasic.id}">
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>岗数：</label>
			<div class="formControls col-2"> <span class="select-box">
				<select name="cylinderQuantity" class="select" value="${engineTestBasic.cylinderQuantity}">
					<option value="3" <c:if test="${engineTestBasic.cylinderQuantity == 3}"> selected="selected"</c:if>>3</option>
					<option value="4" <c:if test="${engineTestBasic.cylinderQuantity == 4}"> selected="selected"</c:if>>4</option>
					<option value="5" <c:if test="${engineTestBasic.cylinderQuantity == 5}"> selected="selected"</c:if>>5</option>
					<option value="6" <c:if test="${engineTestBasic.cylinderQuantity == 6}"> selected="selected"</c:if>>6</option>
				</select>
				</span> </div>
			<label class="form-label col-3">SENT盒编号：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${engineTestBasic.sentBoxNum}" placeholder="" id="sentBoxNum" name="sentBoxNum" value="${engineTestBasic.sentBoxNum}">
			</div>
			
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>排量：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text" value="${engineTestBasic.cylinderVolume}" placeholder="" id="cylinderVolume" name="cylinderVolume">
			</div>
			<label class="form-label col-3">SENT线束号：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${engineTestBasic.sentCableNum}" placeholder="" id="sentCableNum" name="sentCableNum">
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
					<option value="Agilent"<c:if test="${engineTestBasic.powerSupply == Agilent}"> selected="selected"</c:if>>Agilent</option>
					<option value="EEC" <c:if test="${engineTestBasic.powerSupply == EEC}"> selected="selected"</c:if>>EEC</option>
				</select>
				</span> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>机油类型：</label>
			<div class="formControls col-2"> <span class="select-box">
				<select name="oilType1" class="select">
					<option value="5W40" <c:if test="${engineTestBasic.oilType1 == '5W40'}"> selected="selected"</c:if>>5W40</option>
					<option value="0W20" <c:if test="${engineTestBasic.oilType1 == '0W20'}"> selected="selected"</c:if>>0W20</option>
					<option value="0W30" <c:if test="${engineTestBasic.oilType1 == '0W30'}"> selected="selected"</c:if>>0W30</option>
				</select>
				</span> </div>
			<label class="form-label col-3">VECTOR编号：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${engineTestBasic.vectorNum}" placeholder="" id="vectorNum" name="vectorNum">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>机油类型：</label>
			<div class="formControls col-2"> <span class="select-box">
				<select name="oilType2" class="select">
					<option value="G13" <c:if test="${engineTestBasic.oilType2 == 'G13'}"> selected="selected"</c:if>>G13</option>
					<option value="G12 EVO" <c:if test="${engineTestBasic.oilType2 == 'G12 EVO'}"> selected="selected"</c:if>>G12 EVO</option>
				</select>
				</span> </div>
			<label class="form-label col-3">台架线束编号：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${engineTestBasic.testbedCableNum}" placeholder="" id="testbedCableNum" name="testbedCableNum">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>排气被压要求值：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text" value="${engineTestBasic.exhaustBackPress}" placeholder="" id="exhaustBackPress" name="exhaustBackPress">
		    </div>
			<label class="form-label col-3">发动机启动类型：</label>
			<div class="formControls col-2">
				<span class="select-box">
				<select name="engineStartType" class="select">
					<option value="Starter motor" <c:if test="${engineTestBasic.engineStartType == 'Starter motor'}"> selected="selected"</c:if>>Starter motor</option>
					<option value="Active Dyno" <c:if test="${engineTestBasic.engineStartType == 'Active Dyno'}"> selected="selected"</c:if>>Active Dyno</option>
				</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>变速箱数量：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text" value="${engineTestBasic.gearboxQuantity}" placeholder="" id="gearboxQuantity" name="gearboxQuantity">
		    </div>
			<label class="form-label col-3">Distance before transmission(mm)：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${engineTestBasic.distanceBeforeTransmission}"  id="distanceBeforeTransmission" name="distanceBeforeTransmission">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>ECU数据版本：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text" value="${engineTestBasic.ecuDateVersion}" placeholder="" id="ecuDateVersion" name="ecuDateVersion">
			</div>
			<label class="form-label col-3">径向对中数据：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${engineTestBasic.alignmentRadialDirecttion}" placeholder="" id="alignmentRadialDirecttion" name="alignmentRadialDirecttion">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>小车号：</label>
			<div class="formControls col-2"> <span class="select-box">
				<select name="trolleyNum" class="select">
					<option value="1" <c:if test="${engineTestBasic.trolleyNum == 1}"> selected="selected"</c:if>>1</option>
					<option value="2" <c:if test="${engineTestBasic.trolleyNum == 2}"> selected="selected"</c:if>>2</option>
					<option value="3" <c:if test="${engineTestBasic.trolleyNum == 3}"> selected="selected"</c:if>>3</option>
					<option value="4" <c:if test="${engineTestBasic.trolleyNum == 4}"> selected="selected"</c:if>>4</option>
					<option value="5" <c:if test="${engineTestBasic.trolleyNum == 5}"> selected="selected"</c:if>>5</option>
					<option value="6" <c:if test="${engineTestBasic.trolleyNum == 6}"> selected="selected"</c:if>>6</option>
					<option value="7" <c:if test="${engineTestBasic.trolleyNum == 7}"> selected="selected"</c:if>>7</option>
					<option value="8" <c:if test="${engineTestBasic.trolleyNum == 8}"> selected="selected"</c:if>>8</option>
					<option value="9" <c:if test="${engineTestBasic.trolleyNum == 9}"> selected="selected"</c:if>>9</option>
					<option value="10" <c:if test="${engineTestBasic.trolleyNum == 10}"> selected="selected"</c:if>>10</option>
					<option value="11" <c:if test="${engineTestBasic.trolleyNum == 11}"> selected="selected"</c:if>>11</option>
					<option value="12" <c:if test="${engineTestBasic.trolleyNum == 12}"> selected="selected"</c:if>>12</option>
					<option value="13" <c:if test="${engineTestBasic.trolleyNum == 13}"> selected="selected"</c:if>>13</option>
					<option value="14" <c:if test="${engineTestBasic.trolleyNum == 14}"> selected="selected"</c:if>>14</option>
					<option value="15" <c:if test="${engineTestBasic.trolleyNum == 15}"> selected="selected"</c:if>>15</option>
					<option value="16" <c:if test="${engineTestBasic.trolleyNum == 16}"> selected="selected"</c:if>>16</option>
					<option value="17" <c:if test="${engineTestBasic.trolleyNum == 17}"> selected="selected"</c:if>>17</option>
					<option value="18" <c:if test="${engineTestBasic.trolleyNum == 18}"> selected="selected"</c:if>>18</option>
					<option value="19" <c:if test="${engineTestBasic.trolleyNum == 19}"> selected="selected"</c:if>>19</option>
					<option value="20" <c:if test="${engineTestBasic.trolleyNum == 20}"> selected="selected"</c:if>>20</option>
					<option value="21" <c:if test="${engineTestBasic.trolleyNum == 21}"> selected="selected"</c:if>>21</option>
					<option value="22" <c:if test="${engineTestBasic.trolleyNum == 22}"> selected="selected"</c:if>>22</option>
					<option value="23" <c:if test="${engineTestBasic.trolleyNum == 23}"> selected="selected"</c:if>>23</option>
					<option value="24" <c:if test="${engineTestBasic.trolleyNum == 24}"> selected="selected"</c:if>>24</option>
					<option value="25" <c:if test="${engineTestBasic.trolleyNum == 25}"> selected="selected"</c:if>>25</option>
				</select>
				</span> </div>
			<label class="form-label col-3">Alignment Axial(mm)：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text" value="${engineTestBasic.alignmentAxial}" placeholder="" id="alignmentAxial" name="alignmentAxial">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>中冷器小车编号：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text" value="${engineTestBasic.cacNum}" placeholder="" id="cacNum" name="cacNum">
			</div>
			<label class="form-label col-3">AVL553热交换器：</label>
			<div class="formControls col-2"><span class="select-box">
				<select name="avl553HeatExchanger" class="select">
					<option value="1" <c:if test="${engineTestBasic.avl553HeatExchanger == 1}"> selected="selected"</c:if>>1</option>
					<option value="2" <c:if test="${engineTestBasic.avl553HeatExchanger == 2}"> selected="selected"</c:if>>2</option>
					<option value="3" <c:if test="${engineTestBasic.avl553HeatExchanger == 3}"> selected="selected"</c:if>>3</option>
					<option value="4" <c:if test="${engineTestBasic.avl553HeatExchanger == 4}"> selected="selected"</c:if>>4</option>
					<option value="5" <c:if test="${engineTestBasic.avl553HeatExchanger == 5}"> selected="selected"</c:if>>5</option>
					<option value="6" <c:if test="${engineTestBasic.avl553HeatExchanger == 6}"> selected="selected"</c:if>>6</option>
					<option value="7" <c:if test="${engineTestBasic.avl553HeatExchanger == 7}"> selected="selected"</c:if>>7</option>
					<option value="8" <c:if test="${engineTestBasic.avl553HeatExchanger == 8}"> selected="selected"</c:if>>8</option>
					<option value="9" <c:if test="${engineTestBasic.avl553HeatExchanger == 9}"> selected="selected"</c:if>>9</option>
					<option value="10" <c:if test="${engineTestBasic.avl553HeatExchanger == 10}"> selected="selected"</c:if>>10</option>
					<option value="11" <c:if test="${engineTestBasic.avl553HeatExchanger == 11}"> selected="selected"</c:if>>11</option>
					<option value="12" <c:if test="${engineTestBasic.avl553HeatExchanger == 12}"> selected="selected"</c:if>>12</option>
					<option value="13" <c:if test="${engineTestBasic.avl553HeatExchanger == 13}"> selected="selected"</c:if>>13</option>
					<option value="14" <c:if test="${engineTestBasic.avl553HeatExchanger == 14}"> selected="selected"</c:if>>14</option>
					<option value="14" <c:if test="${engineTestBasic.avl553HeatExchanger == 15}"> selected="selected"</c:if>>15</option>
				</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-3"><span class="c-red">*</span>中冷器热交换器编号：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text" value="${engineTestBasic.cacHeatExchangeNum}" placeholder="" id="cacHeatExchangeNum" name="cacHeatExchangeNum">
			</div>
			<label class="form-label col-3"><span class="c-red">*</span>防盗盒信息：</label>
			<div class="formControls col-2"> 
				<input type="text" class="input-text" value="${engineTestBasic.preventTheftBox}" placeholder="" id="preventTheftBox" name="preventTheftBox">
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-3">备注：</label>
			<div class="formControls col-7">
				<textarea name="remark" cols="" rows="" class="textarea" value="${engineTestBasic.remark}" placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" onKeyUp="textarealength(this,200)"></textarea>
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