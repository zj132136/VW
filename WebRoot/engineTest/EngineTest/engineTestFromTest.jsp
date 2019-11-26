<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/tag.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link href="../Hui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="../Hui/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="../Hui/css/style.css" rel="stylesheet" type="text/css" />
<link href="../Hui/lib/Hui-iconfont/1.0.6/iconfont.css" rel="stylesheet" type="text/css" />
<script src="../js/plugins/layer/laydate/laydate.js"></script> 
<style type="text/css">
      .salesInfoStyle{
		    border-top: none !important;
		    border-bottom: none !important;
		    background: #b17744 !important;
		}
		.dispositionStyle{
		    border-top: none !important;
		    border-bottom: none !important;
		    background: #a76428 !important;
		}
  </style>
<title>用户管理</title>
</head>
<body>
<nav class="breadcrumb">
<a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" >
<i class="Hui-iconfont">&#xe68f;</i>
</a>
</nav>
<div class="pd-20">
	<div class="text-c"> 日期范围：
		<input type="text" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" id="datemin" class="input-text Wdate" style="width:180px;">
		-
		<input type="text" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" id="datemin" class="input-text Wdate" style="width:180px;">
	 	<input type="text" class="input-text" style="width:250px" placeholder="发动机号……" id="" name="">
		<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜试验信息</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"> 
	<a href="javascript:;" onclick="member_add('添加试验信息','${baseurl}engine/engineTestInfoAdd.action?engineId=${engineId}','1000','550')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加试验信息</a>
	
	</span> <span class="r">共有数据：<strong>${countEngineTestlist}</strong> 条</span> </div>
	
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr>
				<th scope="col" colspan="6" class="text-c">试验信息</th>
				<th scope="col" colspan="4" class="text-c">时间信息</th>
				<th scope="col" colspan="1" class="text-c">操作管理</th>
			</tr>
			<tr class="text-c">
				<!-- <th width="25"><input type="checkbox" name="" value=""></th> -->
				<th width="80">ID</th>
				<th width="40">试验名称</th>
				<th width="40">发动机名称</th>
				<th width="40">位置信息</th>
				<th width="40">创建人员</th>
				<th width="40">创建时间</th>
				<th width="40">计划开始时间</th>
				<th width="40">计划结束时间</th>
				<th width="40">实际开始时间</th>
				<th width="40">实际结束时间</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<c:forEach items="${engineTestlist}" var="item">
			<tr class="text-c">
			<td>${item.id}</td>
			<td>${item.testName}</td>
		    <td>${item.engineName}</td>
		    <td>${item.locationName}</td>
		    <td>${item.addByUser}</td>
		    <td>${item.time}</td>
		    <td>${item.planStartTime}</td>
		    <td>${item.planEndTime}</td>
		    <td>${item.actualStartTime}</td>
		    <td>${item.actualEndTime}</td>
			<td class="td-manage">
			 <a title="编辑" href="javascript:;" onclick="admin_edit('发动机位置编辑','${baseurl}engine/engineTestEdit.action?id=${item.id}','2','1000','550')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
			 <a title="删除" href="javascript:;" onclick="admin_del(this,${item.id})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
			  </td>
			</tr>
		</c:forEach>	
	</table>
	</div>
<script type="text/javascript" src="../Hui/lib/jquery.min.js"></script>  
<script type="text/javascript" src="../Hui/lib/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="../Hui/lib/laypage/1.2/laypage.js"></script> 
<script type="text/javascript" src="../Hui/lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="../Hui/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="../Hui/js/H-ui.js"></script> 
<script type="text/javascript" src="../Hui/js/H-ui.admin.js"></script> 
<script src="../js/plugins/layer/laydate/laydate.js"></script> 
<script type="text/javascript">
$(function(){
	$('.table-sort').dataTable({
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,8,9]}// 制定列不参与排序
		]
	});
	$('.table-sort tbody').on( 'click', 'tr', function () {
		if ( $(this).hasClass('selected') ) {
			$(this).removeClass('selected');
		}
		else {
			table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
	});
});
/*用户-添加*/
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*用户-编辑*/
function admin_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}

/*用户-删除*/
function admin_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		$.ajax({
        type: "POST",
        url : "delEngineTest.action",
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