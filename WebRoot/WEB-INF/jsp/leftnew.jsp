<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String username = (String)request.getSession().getAttribute("username");
System.out.println("========" + username);
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />	
		<title>Simpla Admin</title>
		<link rel="stylesheet" href="resources/css/reset.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="resources/css/style.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="resources/css/invalid.css" type="text/css" media="screen" />	
		<script type="text/javascript" src="resources/scripts/jquery-1.3.2.min.js"></script>
		<script type="text/javascript" src="resources/scripts/simpla.jquery.configuration.js"></script>
		<script type="text/javascript" src="resources/scripts/facebox.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.wysiwyg.js"></script>	
		<script type="text/javascript" src="resources/scripts/jquery.datePicker.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.date.js"></script>
	</head>
  
	<body>
	<div id="body-wrapper">
		<div id="sidebar"><div id="sidebar-wrapper"> 
			<h1 id="sidebar-title"><a href="#">CAMA</a></h1> 
			<a href="#">
			<img id="logo" src="resources/images/logo.png" alt="Simpla Admin logo" /></a>
			<div id="profile-links">
				Helloaa, <a href="#" title="Edit your profile">${user.username}</a><br />
						
			</div>        
			<ul id="main-nav">  <!-- Accordion Menu -->	
				<li>
					<a href="#" class="nav-top-item no-submenu"> 
						主页
					</a> 
					 <ul>
						<li><a href="right.jsp" target="main">主页</a></li>
			
						<li><a href="experiment/calibrationOverTime2.jsp" target="main">文件管理2</a></li>
						<li><a href="http://localhost:8080/test/" target="main">文件管理</a></li>
						<li><a href="uploadFile/uploadFilelist.action" target="main">上传测试</a></li>
						
					</ul>     
				</li>
				<li>
					<a href="#" class="nav-top-item no-submenu"> 
						试验运行
					</a> 
					 <ul>
					    <li><a href="experiment/experiment.action" target="main">运行监控</a></li>
					    <li><a href="AlarmTitle.jsp" target="main">报警记录</a></li>
					    <li><a href="RunTitle.jsp" target="main">运行月报</a></li>
					    <li><a href="experiment/trouble.action" target="main">样机故障反馈</a></li>
					    
					    <li><a href="maintain/MaintainTitle.action" target="main">设备故障反馈</a></li>
					    <li><a href="experiment/CalibrationTitle.action" target="main">标定期间核查</a></li>
			  			<li><a href="experiment/sensor/sensorTitle.action" target="main">传感器更换</a></li>
					   <li><a href="LogTitle.jsp" target="main">运行日报（日志）</a></li>		
					    	
					     
					     		
					</ul>     
				</li>
				<li>
					<a href="#" class="nav-top-item current"> 
						试验开发
					</a> 
					 <ul>
					    <li><a href="AlarmTitle.jsp" target="main">项目DVP计划</a></li>
					    <li><a href="PlanTitle.jsp" target="main">月度试验计划</a></li>
					    <li><a href="uploadFile/testReport/testReportlist.action" target="main">试验大纲报告</a></li>	
					    <li><a href="uploadFile/testSummarize/testSummarizelist.action" target="main">试验总结评审</a></li>
					    <li><a href="uploadFile/yjmalfunction/yjmalfunctionlist.action" target="main">样机故障报告</a></li>
					    <li><a href="test/testlist.action" target="main">试验数据库</a></li>
					    						
					</ul>     
				</li>
				
				
				<li>
					<a href="#" class="nav-top-item">
						设备信息管理
					</a>
					<ul>
					    <li><a href="uploadFile/archives/archiveslist.action" target="main">技术档案管理</a></li> 
						<li><a href="equipmentTitle.jsp" target="main">设备台账管理</a></li> 
						<li><a href="baoyangTitle.jsp" target="main">设备保养管理</a></li> 
						<li><a href="equipmentTitle.jsp" target="main">设备故障报告库</a></li> 
						<li><a href="jgscheduleTitle.jsp" target="main">基建技改管理</a></li> 	
					</ul>
				</li>	
				<li>
					<a href="#" class="nav-top-item">
						试验管理

					</a>
					<ul>
					    <li><a href="CNASTitle.jsp" target="main">CNAS体系管理</a></li> 
						<li><a href="testStandardTitle.jsp" target="main">试验标准规范</a></li> 
						<li><a href="experiment/instrument.action" target="main">小仪器管理</a></li> 
						<li><a href="experiment/assemble.action" target="main">试验工装管理</a></li> 	
					</ul>
				</li>
					
				 <!-- <li> 
					<a href="#" class="nav-top-item"> Add the class "current" to current menu item
					运行信息管理
					</a>
					<ul>
						<li><a href="RunManager/run.jsp" target="main">运行时间管理</a></li>
						<li><a class="current" href="RunManager/RunLineChart.jsp" target="main">运行时间报表</a></li> Add class "current" to sub menu items also				
					</ul>
				</li>
							
				
				
				<li>
					<a href="#" class="nav-top-item">
						日志信息管理
					</a>
					<ul>
         				 <li><a href="log/log.action" target="main">日志信息管理</a></li> 
         				 <li><a href="log/logAdd.jsp" target="main">日志信息录入</a></li>
					</ul>
				</li>  --> 
				
				<li>
					<a href="#" class="nav-top-item">
						用户权限管理
					</a>
					<ul>
						 
        				 <li><a href="users/userManager.action" target="main">用户信息管理</a></li>					
					</ul>
				</li>  
				<li>
					<a href="#" class="nav-top-item">
						老模块
					</a>
					<ul>
				    	<li><a href="ExperManager/experimentnew.jsp" target="main">运行状态浏览</a></li>
						<li><a href="ExperManager/experimentnew.jsp" target="main">报告/大纲管理</a></li>
						<li><a href="experiment/trouble.action" target="main">样机故障反馈</a></li>
						<li><a href="ExperManager/experimentnew.jsp" target="main">日志管理</a></li>
        				<li><a href="ExperManager/ExperInfo.jsp" target="main">台架实时状态管理</a></li> 
						 <li><a href="ExperManager/experimentnew.jsp" target="main">运行监控</a></li>
        				<li><a href="MaintainTitle.jsp" target="main">设备故障反馈</a></li>
        				<li><a href="runoldTitle.jsp" target="main">运行</a></li>
        				<li><a href="EquipmentManager/equipmenttest.jsp" target="main">台架设备信息目录</a></li>
						<li><a href="EquipmentManager/equipment.jsp" target="main">台架设备信息目录</a></li>
        				<li><a href="EquipmentManager/EquipmentAdd1.jsp" target="main">试台架设备信息录入</a></li> 
        				<li><a href="MaintainTitle.jsp" target="main">设备维修管理</a></li> 		
        				<li><a href="EquipmentManager/sensorManager.jsp" target="main">传感器外部设备管理</a></li> 
        				<li><a href="EquipmentManager/OverSensorManager.jsp" target="main">超时未更换传感器外部设备</a></li> 	
					</ul>
				</li>  
			</ul>	
		</div></div> 
	</div></body>
</html>
