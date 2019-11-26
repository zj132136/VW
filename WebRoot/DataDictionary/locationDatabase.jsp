<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/tag.jsp"%>
<%
String path = request.getContextPath()+"/"+"engine/engineLocationlist.action";

%>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<LINK rel="Bookmark" href="/favicon.ico" >
<LINK rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="../lib/html5.js"></script>
<script type="text/javascript" src="../lib/respond.min.js"></script>
<script type="text/javascript" src="../lib/PIE_IE678.js"></script>
<![endif]-->
<link href="../Hui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="../Hui/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="../Hui/css/style.css" rel="stylesheet" type="text/css" />
<link href="../Hui/lib/Hui-iconfont/1.0.6/iconfont.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
 <script type="text/javascript">
 function closeWindow(){
	 if(confirm("确认要提交本表单吗？")==true){
		 
		 
	 }else{
		  return false;
	 }
 }
 </script> 
<title>台架列表</title>
</head>
<body>
<nav class="breadcrumb">
<!-- <i class="Hui-iconfont">&#xe67f;</i> 
首页 <span class="c-gray en">&gt;</span> 
台架管理 <span class="c-gray en">&gt;</span> 
台架列表  -->
<a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" >
<i class="Hui-iconfont">&#xe68f;</i>
</a>
</nav>
<div class="pd-20">

	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
			<a href="javascript:;" onclick="admin_add('添加发动机位置','${baseurl}engine/engineLocationAdd.action','1000','500')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加发动机位置</a>
		</span> 
		<span class="r">共有数据：<strong>${countModel}</strong> 条</span> 
	</div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-bg table-hover table-sort">
		<thead>
			<tr>
				<th scope="col" colspan="5">台架列表</th>
			</tr>
			<tr class="text-c">
				
				<th width="200">位置ID</th>
				<th width="200">位置名称</th>
				
				<th width="200">创建用户</th>
				<th width="200">创建时间</th>
				<th width="70">操作</th>
			</tr>
		</thead>
		<c:forEach items="${enginesList}" var="item">
	<tr class="text-c">

	<td>${item.location_id}</td>
    <td>${item.location}</td>
    <td>${item.add_by}</td>
    <td>${item.add_datetime}</td>
	<td class="td-manage">
	 <a title="编辑" href="javascript:;" onclick="admin_edit('发动机位置编辑','${baseurl}engine/engineLocationEdit.action?id=${item.location_id}','2','800','500')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
	 <a title="删除" href="javascript:;" onclick="admin_del(this,${item.location_id})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
	  </td>
	</tr>
</c:forEach>
			
	</table>
	</div>
</div>
<script type="text/javascript" src="../Hui/lib/jquery.min.js"></script>  
<script type="text/javascript" src="../Hui/lib/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="../lib/laypage/1.2/laypage.js"></script> 
<script type="text/javascript" src="../lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="../lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="../Hui/js/H-ui.js"></script> 
<script type="text/javascript" src="../Hui/js/H-ui.admin.js"></script> 
<script type="text/javascript">

/*
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
*/
/*管理员-增加*/
function admin_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*管理员-删除*/
function admin_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		$.ajax({
        type: "POST",
        url : "delEngineLocation.action",
        data: "id="+id ,   
    });
		
		$(obj).parents("tr").remove();
		layer.msg('已删除!',{icon:1,time:1000});
		
		if(1==1){
				location.replace("<%=path%>");
		}
	});
}
/*管理员-编辑*/
function admin_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*管理员-停用*/
/*密码-修改*/
function change_password(title,url,id,w,h){
	layer_show(title,url,w,h);	
}
</script>
</body>
</html>