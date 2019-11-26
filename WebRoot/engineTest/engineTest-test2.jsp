﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>团客人名单列表</title>
	
	<script type="text/javascript">
 
		$(function() {
			var vars={
				dateFrom : $.currentMonthFirstDay(),
				dateTo : $.currentMonthLastDay()
			};
			$("input[name='startTime']").val(vars.dateFrom);
			$("input[name='endTime']").val(vars.dateTo );
		});
	</script>
	<link rel="stylesheet" href="../css/plugins/jqgrid/ui.jqgrid.css" rel="stylesheet">
	<script src="../js/plugins/jqgrid/i18n/grid.locale-cn.js"></script>
	<script src="../js/plugins/jqgrid/jquery.jqGrid.min.js?0820""></script>
</head>
<body>
 
<div class="p_container">
	<form id="groupOrderGuestForm"　method="post">
		<input type="hidden" name="page" id="page"　value="${pageBean.page }"/>
		<input type="hidden" name="pageSize" id="pageSize"　value="${pageBean.pageSize }"/>
		<input type="hidden" name="userRightType" id="userRightType" value="${userRightType}"/>
		<div class="p_container_sub">
			<div class="searchRow">
				<ul>
					<li class="text"> 日期:</li>
					<li >
						<input name="startTime" id="startTime" type="text"  class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
						~
						<input name="endTime" id="endTime"  type="text"  class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
					</li>
					<li class="text">客人信息:</li>
					<li >
						<input type="text" name="receiveMode" id="receiveMode" value=""/>
					</li>
 
					<li class="text"> 团号:</li>
					<li>
						<input type="text" name="groupCode" id="groupCode" value=""/>
					</li>
					<li class="text">平台来源:</li>
					<li>
						<input name="supplierName" id="supplierName" type="text"/>
					</li>
				</ul>
				<ul>
					<li class="text" ">部门:</li>
					<li>
						<input type="text" name="orgNames" id="orgNames" stag="orgNames"readonly="readonly" οnclick="showOrg()" style="width: 185px;"/>
						<input type="hidden" name="orgIds" id="orgIds" stag="orgIds"  />
					</li>
 
					<li class="text" ">
					<select name="operType" id="operType" >
						<option value="1">客服</option>
						<option value="2">计调</option>
						<option value="3">输单员</option>
					</select>
					</li>
					<li>
						<input type="text" name="saleOperatorName" id="saleOperatorName"  stag="userNames" readonly="readonly"  οnclick="showUser()"/>
						<input name="saleOperatorIds" id="saleOperatorIds" stag="userIds" type="hidden" />
					</li>
					<li class="text"> 产品类型:</li>
					<li >
						<input type="text" id="dicNames" readonly="readonly"  οnclick="commonDicDlg()"/>
						<input type="hidden" name="orderNo" id="dicIds"  />
					</li>
					<li class="text"> 产品套餐:</li>
					<li >
						<input type="text" name="remark" id="remark" value=""/>
					</li>
				</ul>
				<ul>
					<li class="text" >姓名:</li>
					<li >
						<input type="text" name="guestName" id="guestName" value=""  style="width: 185px;"/>
					</li>
					<li class="text">性别:</li>
					<li class="text" ">
					<select name="gender" id="gender"  style="width: 80px;">
						<option value="">全部</option>
						<option value="1">男</option>
						<option value="0">女</option>
					</select>
					</li>
					<li class="text" style="width: 140px;"> 年龄:</li>
					<li >
						<input type="text" name="ageFirst" id="ageFirst" value="" style="width: 60px;"/>
						~
						<input type="text" name="ageSecond" id="ageSecond" value="" style="width: 60px;"/>
					</li>
					<li class="text">籍贯:</li>
					<li >
						<input type="text" name="nativePlace" id="nativePlace" value=""/>
					</li>
 
					<li style="margin-left: 20px;">
						<button type="button" οnclick="searchBtn()" class="button button-primary button-small">查询</button>
						<button type="button" οnclick="toPickUpExcel()" class="button button-primary button-small">导出地接单</button>
						<button type="button" οnclick="toInsuranceExcel()" class="button button-primary button-small">导出保险单 </button>
						<a href="javascript:void(0);" id="toGuestListExcelId" target="_blank" οnclick="toGuestListExcel()" class="button button-primary button-small">导出到Excel</a>
					</li>
				</ul>
			</div>
		</div>
	</form>
 
</div>
<!-- 以上是查询的条件  -->
<!-- JqGrid  -->
<div class="p_container" >
	<div class="jqGrid_guest">
		<!-- JqGrid  Table-->
		<table id="contentGroupOrderTable"></table>
		<!-- JqGrid  page-->
		<div id="pagerGroupOrder"></div>
	</div>
</div>
 
 
<%-- <script src="<%=staticPath %>/assets/js/moment.js"></script>
<script src="<%=staticPath %>/assets/js/accounting.min.js"></script> --%>
 
<script type="text/javascript">
	$(function(){
 
		opGrid.loadGrid();
		$("#contentGroupOrderTable").setGridParam({datatype:'json', page:1}).trigger('reloadGrid');
		//opGrid.reSize();
 
		/* $(window).bind('resize', function () {
		 opGrid.reSize();
		 });  */
 
	});
	var opGrid = {//组装查询的条件参数
		/* reSize: function(){
		 var width = $('.jqGrid_wrapper').width();
		 var height = $(window).height();
		 var searchBox=80, jqGrid_head = 55, jqGrid_pager = 30, jqGrid_footer = 45;
		 height = height - searchBox - jqGrid_head - jqGrid_pager - jqGrid_footer;
		 $('#contentGroupOrderTable').setGridWidth(width);
		 $('#contentGroupOrderTable').setGridHeight(height - 10);
		 }, */
		getParam: function(){
			var rowListNum = $("#contentGroupOrderTable").jqGrid('getGridParam', 'rowNum');
			if(rowListNum == undefined){
				$('#pageSize').val(15);
			}else{
				$('#pageSize').val(rowListNum);
			}
			//组装查询的条件参数
			var params = {'startTime':$("#startTime").val()
				, 'endTime':$("#endTime").val()
				, 'supplierName':$("#supplierName").val()
				, 'groupCode':$("#groupCode").val()
				,'receiveMode':$("#receiveMode").val()
				,'orgNames':$("#orgNames").val()
				,'orgIds':$("#orgIds").val()
				,'saleOperatorName':$("#saleOperatorName").val()
				,'saleOperatorIds':$("#saleOperatorIds").val()
 
				,'productName':$("#productName").val()
				,'remark':$("#remark").val()
				,'operType':$("#operType").val()
				,'guestName':$("#guestName").val()
				,'gender':$("#gender").val()
				,'ageFirst':$("#ageFirst").val()
				,'ageSecond':$("#ageSecond").val()
				,'nativePlace':$("#nativePlace").val()
				,'pageSize':$("#pageSize").val()
				,'userRightType':$("#userRightType").val()
			};
			return params;
		},
		//对金融的处理，除以人数
		formatPerson:function(v,o,r){
			return v/(r.num_adult+r.num_child);
		},
		/* formatOrderMode:function(v,o,r){
		 return v;
		 }, */
		 //对性别的处理
		formatGender:function(v,o,r){
			if(v == 0 ){
				return '女';
			}else{
				return '男';
			}
		},
		//table数据
		loadGrid: function(){
			$("#contentGroupOrderTable").jqGrid({
				url: 'groupOrderGuestDataList.do',
				datatype: "json",
				mtype : "post",
				//height: 250,
				height: "100%",
				autowidth: false,
				shrinkToFit: false,
				rownumbers:true,
				rowNum: 15,
				rowList: [15, 30, 50, 100, 500, 1000],
				//colNames: ['团号', '发团日期', '平台来源', '客人信息', '姓名', '性别',
				//       '年龄','证件号','电话','籍贯','产品套餐','业务','销售','计调','金额'],
				colModel: [
					{label:'团号',name: 'group_code',index: 'groupCode',width: 130, sortable: false, align:'left'},
					{label:'发团日期',name: 'departure_date',index: 'departure_date',align: "center",formatter:function(cellValue,options,rowObject){
						return (moment(rowObject.departure_date).format("YYYY-MM-DD"));},width: 100, align:'center',formatoptions:''},
					{label:'平台来源',name: 'supplier_name',index: 'supplier_name',width: 60, sortable: false, align:'left'},
					{label:'客人信息',name: 'receive_mode',index: 'receive_mode',width: 200, sortable: false, align:'left'},
					{label:'姓名',name: 'name',index: 'name',width: 80, sortable: false,align:'center'},
 
					{label:'性别',name: 'gender',index: 'gender',width: 50, sortable: false, align:'center',formatter:opGrid.formatGender},
					{label:'年龄',name: 'age',index: 'age',width: 50,  align:'center'},
					{label:'证件号',name: 'certificate_num',index: 'certificate_num',width: 150, sortable: false, align:'center'},
					{label:'电话',name: 'mobile',index: 'mobile',width: 110, sortable: false, align:'center'},
					{label:'籍贯',name: 'native_place',index: 'native_place',width: 120, sortable: false, align:'left'},
 
					{label:'产品套餐',name: 'remark',index: 'remark',width: 300, sortable: false, align:'left'},
					{label:'业务',name: 'order_mode',index: 'order_mode',width: 70, sortable: false, align:'center',  formatter:'select', formatoptions:{
						value:{ '1374':'长线',1475:'短线', '1476':'签证', '1486':'门票', '1487':'酒店', '1488':'专线', '1489':'包车', '1490':'组团', '1493':'推广', '1555':'石林九乡'}
					}
					},
					{label:'销售',name: 'sale_operator_name',index: 'sale_operator_name',width: 80, sortable: false, align:'center'},
					{label:'计调',name: 'operator_name',index: 'operator_name',width: 50, sortable: false, align:'center'},
					{label:'金额',name: 'total',index: 'total',width: 60, align:'center', formatter:opGrid.formatPerson}
				],
				//sortable:true,
				//sortname: 'departure_date',
				//sortorder: 'asc',
				pager: "#pagerGroupOrder",
				viewrecords: true,
				caption: "",
				jsonReader:{//分页的关键
					id: "group_id",
					root: "result",total: "totalPage",page: "pageBean",records: "totalCount",repeatitems: false
				},
				postData:opGrid.getParam(),
				footerrow: true,
				loadComplete:function(xhr){
					//查询为空的处理方式
					var rowNum = $("#contentGroupOrderTable").jqGrid('getGridParam','records');
					if (rowNum == '0'){
						if($("#norecords").html() == null)
							$("#contentGroupOrderTable").parent().append("</pre><div id='norecords' style='text:center;padding: 8px 8px;'>没有查询记录！</div><pre>");
						$("#norecords").show();
					}else{
						$("#norecords").hide();
					}
 
				}
				//,onSortCol: function (index, colindex, sortorder)
				//{
 
				/* 列排序事件，向server传值，值为当前的页数，可以传递多个参数。
				 index, colindex, sortorder三个值可以不设值。 */
				//jQuery("#contentGroupOrderTable").jqGrid('setGridParam',{page:$('#page').val()});
 
				//}
			});
		}
	}
 
	function searchBtn() {
		//前端分页先将datatype会变成local,所以必须先将其变为Json，点击查询按钮时才不会触发两次，就可以一次性加载数据了
		$("#contentGroupOrderTable").setGridParam({datatype:'json', page:1}).jqGrid('setGridParam', {page:1, postData: opGrid.getParam()}).trigger("reloadGrid");
	}
</script>
</body>

</html>
 