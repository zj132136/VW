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

<link href="${baseurl}Hui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="${baseurl}Hui/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="${baseurl}Hui/css/style.css" rel="stylesheet" type="text/css" />
<link href="${baseurl}Hui/lib/Hui-iconfont/1.0.6/iconfont.css" rel="stylesheet" type="text/css" />
<script src="${baseurl}js/plugins/layer/laydate/laydate.js"></script> 
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
<div class="pd-20">
	<div class="text-c"> 日期范围：
		<input type="text" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" id="datemin" class="input-text Wdate" style="width:180px;">
		-
		<input type="text" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" id="datemin" class="input-text Wdate" style="width:180px;">
	 	<input type="text" class="input-text" style="width:250px" placeholder="输入会员名称、电话、邮箱" id="" name="">
		<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜发动机履历</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	<span class="col-sm-2">
		<a href="javascript:;" onclick="admin_add('添加发动机履历','${baseurl}engine/engineRecordAdd.action','1000','500')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加发动机履历</a>
	</span> 
	<span class="r">共有数据：<strong>88</strong> 条</span> </div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<!-- <tr>
				<th scope="col" colspan="6" class="text-c">履历管理</th>
				<th scope="col" colspan="5" class="text-c">状态管理</th>
				<th scope="col" colspan="1" class="text-c">操作管理</th>
			</tr> -->
			<tr class="text-c">
				<!-- <th width="25"><input type="checkbox" name="" value=""></th> -->
				<th width="80">ID</th>
				<th width="40">发动机号</th>
				<th width="40">位置</th>
				<th width="40">日期</th>
				<th width="40">操作人</th>			
				<th width="100">操作</th>
			</tr>
			</thead>
			<c:forEach items="${engineTestBasiclist}" var="item">
				<tr class="text-c">
				    <td>${item.username}</td>
					<td>${item.sex}</td>
					<td>${item.phone}</td>
					<td>${item.email}</td>
					<td>${item.role}</td>
					<td>${item.time}</td>
					<td class="td-manage">
					 <a title="编辑" href="javascript:;" onclick="admin_edit('管理员编辑','${baseurl}users/editUser.action?id=${item.id}','2','800','500')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
					 <a style="text-decoration:none" class="ml-5" onClick="change_password('修改密码','${baseurl}users/userPassword.action?id=${item.id}','10001','600','270')" href="javascript:;" title="修改密码"><i class="Hui-iconfont">&#xe63f;</i></a> 
					 <a title="删除" href="javascript:;" onclick="admin_del(this,${item.id})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
					 </td>
				</tr>
			</c:forEach>
	</table>
	</div>
</div>
<script type="text/javascript" src="${baseurl}Hui/lib/jquery.min.js"></script>  
<script type="text/javascript" src="${baseurl}Hui/lib/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="${baseurl}Hui/lib/laypage/1.2/laypage.js"></script> 
<script type="text/javascript" src="${baseurl}Hui/lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="${baseurl}Hui/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${baseurl}Hui/js/H-ui.js"></script> 
<script type="text/javascript" src="${baseurl}Hui/js/H-ui.admin.js"></script> 
<script src="${baseurl}js/plugins/layer/laydate/laydate.js"></script> 
<script type="text/javascript">
$(function(){
	$('.table-sort').dataTable({
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0]}// 制定列不参与排序
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
/*用户-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*用户-停用*/
function member_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
		$(obj).remove();
		layer.msg('已停用!',{icon: 5,time:1000});
	});
}

/*用户-启用*/
function member_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
		$(obj).remove();
		layer.msg('已启用!',{icon: 6,time:1000});
	});
}
/*用户-编辑*/
function member_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*密码-修改*/
function change_password(title,url,id,w,h){
	layer_show(title,url,w,h);	
}
/*用户-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$(obj).parents("tr").remove();
		layer.msg('已删除!',{icon:1,time:1000});
	});
}
</script> 
</body>
</html>