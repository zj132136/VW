<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/tag.jsp"%>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>H+ 后台主题UI框架 - 文件管理器</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
    <link rel="shortcut icon" href="favicon.ico">
    <link href="${baseurl}css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${baseurl}css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="${baseurl}css/animate.css" rel="stylesheet">
    <link href="${baseurl}css/style.css?v=4.1.0" rel="stylesheet">
    <link href="${baseurl}Hui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
	<link href="${baseurl}Hui/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
	<link href="${baseurl}Hui/css/style.css" rel="stylesheet" type="text/css" />
	<link href="${baseurl}Hui/lib/Hui-iconfont/1.0.6/iconfont.css" rel="stylesheet" type="text/css" />
	<script src="${baseurl}js/plugins/layer/laydate/laydate.js"></script> 
     
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div class="file-manager">
                            <h5>测量信息：</h5>
                            <a href="${baseurl}engine/cylinderPressureList.action?engineName=${engineName}" class="file-control active">缸压</a>
                            <a href="${baseurl}engine/oilConsumptionList.action?engineName=${engineName}" class="file-control">油耗</a>
                            <a href="${baseurl}engine/turboChargerVoltageList.action?engineName=${engineName}" class="file-control">增压器测量</a>
                            <a href="${baseurl}engine/nitrogenLeakageList.action?engineName=${engineName}" class="file-control">氮气泄露记录</a>
                            <a href="${baseurl}engine/oilPressureList.action?engineName=${engineName}" class="file-control">油压</a>
                            <div class="hr-line-dashed"></div>
                            <button class="btn btn-primary btn-block">测量管理</button>
                            <div class="hr-line-dashed"></div>
                            <h5>文件夹</h5>
                            <ul class="folder-list" style="padding: 0">
                                <li><a href="${baseurl}engine/cylinderPressureList.action?engineName=${engineName}"><i class="fa fa-folder"></i> 缸压</a>
                                </li>
                                <li><a href="${baseurl}engine/oilConsumptionList.action?engineName=${engineName}"><i class="fa fa-folder"></i> 油耗</a>
                                </li>
                                <li><a href="${baseurl}engine/turboChargerVoltageList.action?engineName=${engineName}"><i class="fa fa-folder"></i>增压器测量</a>
                                </li>
                                <li><a href="${baseurl}engine/nitrogenLeakageList.action?engineName=${engineName}"><i class="fa fa-folder"></i> 氮气泄露记录</a>
                                </li>
                                <li><a href="${baseurl}engine/oilPressureList.action?engineName=${engineName}"><i class="fa fa-folder"></i> 油压</a>
                                
                            </ul>
                            <h5 class="tag-title">标签</h5>
                            <ul class="tag-list" style="padding: 0">
                                <li><a href="${baseurl}engine/cylinderPressureList.action?engineName=${engineName}" class="file-control active">缸压</a>
                                </li>
                                <li><a href="${baseurl}engine/oilConsumptionList.action?engineName=${engineName}" class="file-control">油耗</a>
                                </li>
                                <li><a href="${baseurl}engine/turboChargerVoltageList.action?engineName=${engineName}"> 增压器测量</a>
                                </li>
                                <li><a href="${baseurl}engine/nitrogenLeakageList.action?engineName=${engineName}" class="file-control">氮气泄露记录</a>
                                </li>
                                <li><a href="${baseurl}engine/oilPressureList.action?engineName=${engineName}" class="file-control">油压</a>
                           		</li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-9 animated fadeInRight">
                
                    
                    <nav class="breadcrumb">
						<a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" >
						<i class="Hui-iconfont">&#xe68f;</i>
						</a>
					</nav>
                       <div class="pd-20">
                       <%-- <span class="col-sm-2">
							<a href="javascript:;" onclick="member_add('添加缸压信息','${baseurl}engine/cylinderPressureAdd.action?id=${id}','1200','800')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加缸压信息</a>
						</span> --%> 
						<div class="text-c"> 日期范围：
						<input type="text" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" id="datemin" class="input-text Wdate" style="width:180px;">
						-
						<input type="text" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" id="datemin" class="input-text Wdate" style="width:180px;">
					 	<input type="text" class="input-text" style="width:250px" placeholder="输入……" id="" name="">
						<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜缸压</button>
					</div>
					 <span class="l"> </span> <span class="r">共有数据：<strong>${countCylinderPressureList}</strong> 条</span> </div>
					<div class="mt-20">
					<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<!-- <th width="25"><input type="checkbox" name="" value=""></th> -->
				
				<th width="10">日期时间</th>
				<th width="10">循环时间</th>
				<th width="10">总时间</th>
				<th width="10">操作员</th>
				<th width="10">维修类型</th>
				<th width="10">测试名称</th>
				<!--<th width="10">发动机号</th>
				 <th width="10">位置信息</th> -->
				<th width="10">操作</th>
			</tr>
		</thead>
		<c:forEach items="${cylinderPressureList}" var="item">
			<tr class="text-c">
		
			<td>${item.cylinderPressureTime}</td>
		    <td>${item.cycleTime}</td>
		    <td>${item.totalTime}</td>
		    <td>${item.operator}</td>
		    <td>${item.maintenanceTpye}</td>
		    <td>${item.testName}</td>
		    <%-- <td>${item.engineName}</td>
		    <td>${item.locationName}</td>	 --%>	   
			<td class="td-manage">
			 <a title="编辑" href="javascript:;" onclick="admin_edit('${item.engineName}','${baseurl}engine/cylinderPressureEdit.action?id=${item.id}','2','1200','800')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
			 <a title="删除" href="javascript:;" onclick="admin_del(this,${item.id})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
			  </td>
			</tr>
		</c:forEach>	
		</table>
		</div>
                    </div>
                </div>
           
        
    </div>

    <!-- 全局js -->
    <script src="${baseurl}js/jquery.min.js?v=2.1.4"></script>
    <script src="${baseurl}js/bootstrap.min.js?v=3.3.6"></script>
	<script type="text/javascript" src="${baseurl}Hui/lib/jquery.min.js"></script>  
	<script type="text/javascript" src="${baseurl}Hui/lib/layer/2.1/layer.js"></script> 
	<script type="text/javascript" src="${baseurl}Hui/lib/laypage/1.2/laypage.js"></script> 
	<script type="text/javascript" src="${baseurl}Hui/lib/My97DatePicker/WdatePicker.js"></script> 
	<script type="text/javascript" src="${baseurl}Hui/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
	<script type="text/javascript" src="${baseurl}Hui/js/H-ui.js"></script> 
	<script type="text/javascript" src="${baseurl}Hui/js/H-ui.admin.js"></script> 
    <!-- 自定义js -->
    <script src="${baseurl}js/content.js?v=1.0.0"></script>
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
function admin_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}

/*用户-删除*/
function admin_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		$.ajax({
        type: "POST",
        url : "delCylinderPressure.action",
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
