<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="none"%>
    <%@ include file="/WEB-INF/jsp/tag.jsp"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="keywords" content="jquery,ui,easy,easyui,web">
	<meta name="description" content="easyui help you build your web page easily!">
	<title>jQuery EasyUI Demo</title>
	<link rel="stylesheet" href="${path}/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${path}/css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="${path}/css/fullcalendar.css" />
    <link rel="stylesheet" href="${path}/css/matrix-style.css" />
    <link rel="stylesheet" href="${path}/css/matrix-media.css" />
    <link href="${path}/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="${path}/css/jquery.gritter.css" />
	<link rel="stylesheet" type="text/css" href="${path}/jquery-easyui-1.4.2/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${path}/jquery-easyui-1.4.2/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${path}/../demo.css">
	<script type="text/javascript" src="${path}/jquery-easyui-1.4.2/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="${path}/jquery-easyui-1.4.2/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${path}/js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${path}/js/jquery-1.8.1.min.js"></script>
		
</head>
<body>
<script src="js/highcharts.js"></script>
<script src="js/highcharts-3d.js"></script>
<script src="js/exporting.js"></script>	
<script src="js/highcharts.js"></script>
<script src="js/modules/exporting.js"></script>
<script src="js/highcharts-3d.js"></script>

<div id="content">
 
  <div class="container-fluid">
    <div class="quick-actions_homepage">
    
      <ul class="quick-actions">
       <div id="breadcrumb"> <a title="Go to Home" class="tip-bottom"><i class="icon-home"></i>传感器更换管理</a></div> 
          
         <li class="bg_ls "> <a href="${path}/experiment/maintain/maintain.jsp?number=Math.random(); " target="main"> <i class="icon-th-list"></i> 设备维修数据库</a> </li>
        <li class="bg_lb "> <a href="${path}/maintain/maintainAdd.action" target="main"> <i class="icon-th-list"></i> 设备报修信息录入</a> </li>
        <li class="bg_lg"> <a href="${path}/experiment/maintain/repair.jsp?number=<%=Math.random() %>" target="main"> <i class="icon-exclamation-sign"></i><span class="label label-success">${countSecond}</span> 待维修设备信息 </a> </li> 
        <li class="bg_lo"> <a href="${path}/experiment/maintain/acknowledgement.jsp?number=<%=Math.random() %> " target="main"> <i class="icon-exclamation-sign"></i><span class="label label-success">${countThird}</span> 设备报修效果确认 </a> </li> 
      </ul>
    </div>
<!--End-Action boxes-->    
 
<!--Chart-box-->    
  

    
  </div>
</div>



<div class="row-fluid">
  <div id="footer" > 2015 &copy; DataFactoryManagement. Brought to you by CAMA.zj  </div>
</div>

<script type="text/javascript">
  // This function is called from the pop-up menus to transfer to
  // a different page. Ignore if the value returned is a null string:
  function goPage (newURL) {

      // if url is empty, skip the menu dividers and reset the menu selection to default
      if (newURL != "") {
      
          // if url is "-", it is this page -- reset the menu:
          if (newURL == "-" ) {
              resetMenu();            
          } 
          // else, send page to designated URL            
          else {  
            document.location.href = newURL;
          }
      }
  }

// resets the menu selection upon entry to this page:
function resetMenu() {
   document.gomenu.selector.selectedIndex = 2;
}
</script>
</body>
</html>