<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/tag.jsp"%>
<%
String path = request.getContextPath()+"/"+"engine/testlist.action";

%>
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

    <style>
        /* Additional style to fix warning dialog position */

        #alertmod_table_list_2 {
            top: 600px !important;
        }
         
    </style>
    <body class="gray-bg">
    <div class="wrapper wrapper-content  animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox ">
                    <div class="ibox-title">
                        <h5>jQuery Grid Plugin – jqGrid</h5>
                    </div>
                    <div class="ibox-content">
                       
                        
                        <h4 class="m-t">高级用法</h4>


                        <div class="jqGrid_wrapper">
                            <table id="table_list_2" ></table>
                            <div id="pager_list_2"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
       <script src="../js/jquery.min.js?v=2.1.4"></script>
    <script src="../js/bootstrap.min.js?v=3.3.6"></script>



    <!-- Peity -->
    <script src="../js/plugins/peity/jquery.peity.min.js"></script>

    <!-- jqGrid -->
    <script src="../js/plugins/jqgrid/i18n/grid.locale-cn.js?0820"></script>
    <script src="../js/plugins/jqgrid/jquery.jqGrid.min.js?0820"></script>

    <!-- 自定义js -->
    <script src="../js/content.js?v=1.0.0"></script>

    <!-- Page-Level Scripts -->
    <script>
        $(function(){
  pageInit();
});
function pageInit(){
 $.jgrid.defaults.styleUI = 'Bootstrap';
 
  jQuery("#table_list_2").jqGrid(
      {
        url : "<%=path%>",
        datatype : "json",
		 height: 450,
         autowidth: true,
         shrinkToFit: true,
         rowNum: 20,
         rowList: [10, 20, 30],
        colNames : [ 'Inv No', 'Date', 'Client'],
        colModel : [ 
                     {name : 'id',index : 'id',width : 55}, 
                     {name : 'invdate',index : 'invdate',width : 90}, 
                     {name : 'name',index : 'name asc, invdate',width : 100}, 
                    
                   ],
        pager : '#pager_list_2',
        sortname : 'id',
        mtype : "post",
        viewrecords : true,
        caption: "jqGrid 示例2",
                add: true,
                edit: true,
                addtext: 'Add',
                edittext: 'Edit',
                hidegrid: false
      });
	  jQuery("#table_list_2").jqGrid('navGrid', '#pager2', {edit : false,add : false,del : false});
	  // Setup buttons
            $("#table_list_2").jqGrid('navGrid', '#pager_list_2', {
                edit: true,
                add: true,
                del: true,
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
	}
	 
    </script>

    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
    <!--统计代码，可删除-->

</body>

</html>
