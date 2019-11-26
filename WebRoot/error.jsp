<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/tag.jsp"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="keywords" content="jquery,ui,easy,easyui,web">
	<meta name="description" content="easyui help you build your web page easily!">
	<title>异常</title>
	<link rel="stylesheet" href="${baseurl}css/bootstrap.min.css" />
    <link rel="stylesheet" href="${baseurl}css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="${baseurl}css/fullcalendar.css" />
    <link rel="stylesheet" href="${baseurl}css/matrix-style.css" />
    <link rel="stylesheet" href="${baseurl}css/matrix-media.css" />
    <link href="${baseurl}font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="${baseurl}css/jquery.gritter.css" />
	<link rel="stylesheet" type="text/css" href="${baseurl}jquery-easyui-1.4.2/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${baseurl}jquery-easyui-1.4.2/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${baseurl}../demo.css">
	<script type="text/javascript" src="${baseurl}jquery-easyui-1.4.2/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="${baseurl}jquery-easyui-1.4.2/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${baseurl}js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${baseurl}js/jquery-1.8.1.min.js"></script>
</head>
<body>
<script src="${baseurl}js/highcharts.js"></script>
<script src="${baseurl}js/highcharts-3d.js"></script>
<script src="${baseurl}js/exporting.js"></script>	
<script src="${baseurl}js/highcharts.js"></script>
<script src="${baseurl}js/modules/exporting.js"></script>
<script src="${baseurl}js/highcharts-3d.js"></script>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#">Sample pages</a> <a href="#" class="current">Error</a> </div>
    <h1>${message}</h1>
  </div>
  <div class="container-fluid">
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>${message}</h5>
          </div>
          <div class="widget-content">
            <div class="error_ex">
              <h1>抱歉</h1>
              <h3>Opps, You're lost.</h3>
              <p>We can not find the page you're looking for.</p>
              <%-- <a class="btn btn-warning btn-big"  href="${baseurl}first.action">Back to Home</a> </div> --%>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>



<div class="row-fluid">
  <div id="footer" > 2016 &copy; TestManagementSystem. Brought to you by CAMA.zj  </div>
</div>

</body>
</html>