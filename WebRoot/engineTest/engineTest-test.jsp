<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/tag.jsp"%>
<%
String path = request.getContextPath()+"/"+"engine/testlist1.action";

%>
<%
String pathengine = request.getContextPath()+"/"+"engine/engineLocationlistJson.action";

%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>H+ 后台主题UI框架 - jqGird</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico"> <link href="../css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="../css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <!-- jqgrid-->
    <link href="../css/plugins/jqgrid/ui.jqgrid.css?0820" rel="stylesheet">

    <link href="../css/animate.css" rel="stylesheet">
    <link href="../css/style.css?v=4.1.0" rel="stylesheet">
<script src="../js/plugins/layer/laydate/laydate.js"></script> 
<link href="../Hui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="../Hui/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="../Hui/css/style.css" rel="stylesheet" type="text/css" />
<link href="../Hui/lib/Hui-iconfont/1.0.6/iconfont.css" rel="stylesheet" type="text/css" />

    <style>
        /* Additional style to fix warning dialog position */

        #alertmod_table_list_2 {
            top: 900px !important;
        }
        gridComplete:function () {
            $(table_list_2).closest("div.ui-jqgrid-view")
                .children("div.ui-jqgrid-titlebar")
                .css("text-align", "center")
                .children("span.ui-jqgrid-title")
                .css("float", "none");
        }
        
        beforeRequest: function () {
			$("thead th").css("text-align", "center").css("font-weight", "bold");
			},
    </style>

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content  animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
            
 				<form id="formSearch" class="form-horizontal">
		            <div class="form-group" style="margin-top:15px">
		                
						<span class="col-sm-2">
							<a href="javascript:;" onclick="admin_add('添加发动机履历','${baseurl}engine/engineRecordAdd.action','1000','500')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加发动机履历</a>
						</span> 
	
		                <label class="control-label col-sm-1" style="width: 120px" for="GOODS_NAM">日期范围 </label>
		              	<div class="col-sm-2">
		                    <input type="text" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" class="form-control" id="starttime">
		                </div>
		              
		                <div class="col-sm-2">
		                    <input type="text" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" class="form-control" id="endtime">
		                </div>
		                <label class="control-label col-sm-1" style="width: 120px" for="GOODS_NAM">发动机号 </label>
		                <div class="col-sm-2">
		                       <div class="input-group">
						          <input type="text" class="form-control" id="engineName">
						          <div class="input-group-btn">
						              <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						                  <span class="caret"></span>
						              </button>
						              <ul class="dropdown-menu dropdown-menu-right" role="menu">
						              </ul>
						          </div>
						          <!-- /btn-group -->
						    	  </div>

		                </div>
						<div class="col-sm-1" style="text-align:center;">
		                    <button type="button"  id="find_btn" class="btn btn-primary">查询</button>
		                </div>
		            </div>
      		 	</form>
                <div class="ibox ">
                    <div class="ibox-title">
                        <h5>发动机履历库</h5>
                    </div>
                     
                    <div class="ibox-content">
                        
                        <div class="jqGrid_wrapper">
                        
                            <table id="table_list_2"></table>
                            <div id="pager_list_2"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 全局js -->
    <script src="../js/jquery.min.js?v=2.1.4"></script>
    <script src="../js/bootstrap.min.js?v=3.3.6"></script>
    <!-- Peity -->
    <script src="../js/plugins/peity/jquery.peity.min.js"></script>

    <!-- jqGrid -->
    <script src="../js/plugins/jqgrid/i18n/grid.locale-cn.js?0820"></script>
    <script src="../js/plugins/jqgrid/jquery.jqGrid.min.js?0820"></script>
    <!-- 自定义js -->
    <script src="../js/content.js?v=1.0.0"></script>
	<script src="../js/plugins/suggest/bootstrap-suggest.min.js"></script>
  
<script type="text/javascript" src="../Hui/lib/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="../Hui/lib/laypage/1.2/laypage.js"></script> 
<script type="text/javascript" src="../Hui/lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="../Hui/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="../Hui/js/H-ui.js"></script> 
<script type="text/javascript" src="../Hui/js/H-ui.admin.js"></script> 
	
    <!-- Page-Level Scripts -->
    <script>
        $(document).ready(function () {

            $.jgrid.defaults.styleUI = 'Bootstrap';
            

            // Configuration for jqGrid Example 2
            $("#table_list_2").jqGrid({
                url : "<%=path%>",
        		datatype : "json",
                height: 450,
                autowidth: true,
                shrinkToFit: true,
                rowNum: 20,
                rowList: [10, 20, 30],
                colNames: ['序号','发动机号','日期','位置','基本信息','试验信息','发动机零部件','试验测量','机油消耗','机油压力','缸压','氮气泄露','增压器测量'/* ,'删除' */],
                colModel: [
                    {name: 'id',index: 'id',editable: true,width: 60,sorttype: "int",search: true},
                    {name: 'engineName',index:'engineName',editable: true,width: 90},
                    {name: 'time',index:'time',editable: true,width: 100,sorttype: "datetime",formatter: "datetime"},
                    {name: 'engineLoaction',index:'engineLoaction',editable: true,width: 80},
                    {name: 'id',index: 'id',editable: true,width: 80,formatter:basicInfoFormat},
                    {name: 'id',index: 'id',editable: true,width: 80,formatter:engineTestInfoFormat},
                    {name: 'id',index: 'id',editable: true,width: 100,sortable: false,formatter:enginePartsFormat},
                    {name: 'id',index: 'id',editable: true,width: 100,sortable: false,formatter:measureFormat},
                    {name: 'oilConsume',index: 'oilConsume',align:'center',width: 100,sortable: false,formatter:imageFormat},
                    {name: 'oilPressure',index: 'id',align:'center',width: 100,sortable: false,formatter:imageFormat},
                    {name: 'cylPressure',index: 'cylPressure',align:'center',width: 100,sortable: false,formatter:imageFormat},
                    {name: 'nitrogenLeak',index: 'nitrogenLeak',align:'center',width: 100,sortable: false,formatter:imageFormat},
                    {name: 'superchargerMeasure',index: 'superchargerMeasure',align:'center',width: 100,sortable: false,formatter:imageFormat},
                   /*  {name: 'id',index: 'id',align:'center',width: 100,sortable: false,formatter:delFormat} */
                ],
                pager: "#pager_list_2",
                viewrecords: true,
                caption: "履历库",
                add: true,
                edit: true,
                addtext: 'Add',
                edittext: 'Edit',
                hidegrid: true,
                footerrow:true, //加这个标识
		        jsonReader : {
		            root: "users",
		            /* userdata:"sumData", */
		            page: "page",
		            total: "total",
		            records: "records",
		            repeatitems: false
		        },
		        prmNames : {
		            page:"pageNum", 
		            rows:"limit", 
		            order: "order"
		        },  
		        gridComplete: function () {
           		 $(table_list_2).closest("div.ui-jqgrid-view")
                .children("div.ui-jqgrid-titlebar")
                .css("text-align", "center")
                .children("span.ui-jqgrid-title")
                .css("float", "none");
        		} 
                
            });
           
		        
			    $("#find_btn").click(function() {
			     	var starttime = $("#starttime").val(); 
		            var endtime = $("#endtime").val();
		            var engineName = $("#engineName").val();
				    $("#table_list_2").jqGrid('setGridParam', {
				        url:"<%=path%>",
				        datatype:'json',
				        postData : { //传递查询参数到后台 
				            'starttime' : starttime,
				            'endtime' : endtime,
				            'engineName' : engineName,
				            'search_sensorType' : "sensorType",
				        }, 
				        page : 1
				    }).trigger("reloadGrid"); //重新载入 
				
				});

            // Add selection
            $("#table_list_2").setSelection(4, true);


            // Setup buttons
            $("#table_list_2").jqGrid('navGrid', '#pager_list_2', {
                edit: false,
                add: false,
                del: false,
                search: true
            }, {
                height: 200,
                reloadAfterSubmit: true
            });

            // Add responsive to jqGrid
            $(window).bind('resize', function () {
                var width = $('.jqGrid_wrapper').width();
                $('#table_list_1').setGridWidth(width);
                $('#table_list_2').setGridWidth(width);
            });
        });
        
    </script>
   
   <script type="text/javascript">
   function imageFormat(cellvalue, options, rowObject){
   		if(cellvalue=="OK"){
	   		return "<span class='label label-success radius'>"+ cellvalue +"</span>" ;
	   		}else{
	   		return "<span class='label label-danger radius'>"+ cellvalue +"</span>";
	   		}
		};	
   </script>
   <script type="text/javascript">
   function delFormat(cellvalue, options, rowObject){
		return "<a title='删除' href='javascript:;' onclick='member_del(this,'1')' class='ml-5' style='text-decoration:none'><i class='Hui-iconfont'>&#xe6e2;</i></a>";  
		};	
   </script>
   <script type="text/javascript">
   function basicInfoFormat(cellvalue, options, rowObject){
		return "<a title='装机信息' class='J_menuItem' href='${baseurl}engine/engineTestBasicListByEngineId.action?id="+cellvalue +"' class='ml-5' style='text-decoration:none'>"+ "装机信息" +"</a>";  
		};	
   </script>
   <script type="text/javascript">
   function engineTestInfoFormat(cellvalue, options, rowObject){
		return "<a title='试验信息' class='J_menuItem' href='${baseurl}engine/engineTestListByEngineId.action?id="+cellvalue +"' class='ml-5' style='text-decoration:none'>"+ "试验信息" +"</a>";  
		};	
   </script>
   <script type="text/javascript">
   function enginePartsFormat(cellvalue, options, rowObject){
		return "<a title='零部件信息' class='J_menuItem' href='${baseurl}engine/enginePartsListByEngineId.action?id="+cellvalue +"' class='ml-5' style='text-decoration:none'>"+ "零部件信息" +"</a>";  
		};	
   </script>
   <script type="text/javascript">
   function measureFormat(cellvalue, options, rowObject){
		return "<a title='试验测量' class='J_menuItem' href='${baseurl}engine/cylinderPressureListFromTest.action?id="+cellvalue +"' class='ml-5' style='text-decoration:none'>"+ "试验测量" +"</a>";  
		};	
   </script>
   <script type="text/javascript">
   	(function() {
    /**
     * 测试(首次从 URL 获取数据，显示 header，不显示按钮，忽略大小写，可清除)
     */
    $("#engineName").bsSuggest({
        url: "<%=pathengine%>",
        /*effectiveFields: ["userName", "shortAccount"],
        searchFields: [ "shortAccount"],*/
        effectiveFieldsAlias:{engineName: "发动机名", addBy:"创建人", addDatetime:"创建时间"},
        ignorecase: true,
        showHeader: true,
        showBtn: false,     //不显示下拉按钮
        delayUntilKeyup: true, //获取数据的方式为 firstByUrl 时，延迟到有输入/获取到焦点时才请求数据
        idField: "engineId",
        keyField: "engineName",
        clearable: true
    }).on('onDataRequestSuccess', function (e, result) {
        console.log('onDataRequestSuccess: ', result);
    }).on('onSetSelectValue', function (e, keyword, data) {
        console.log('onSetSelectValue: ', keyword, data);
    }).on('onUnsetSelectValue', function () {
        console.log("onUnsetSelectValue");
    });

}());


  
   </script>
   
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
        url : "delEngine.action",
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
