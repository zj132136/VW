<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
 <%@ page import="java.text.*" %>
    <%@ page import="java.util.Date" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import=" java.util.List" %>
    <%@ page import="com.bq.plan.*" %>
     <%@ page import="com.bq.maintain.*" %>
     <%@ page import="com.bq.util.DB" %>
    <%!
   public String Str_sess(String str){
     if(str==null){
       str  ="" ; 
      }else{
    try {
      str = str;   
      }catch (Exception ex) {}
     }
    return str ;
 }
%>


<%
String admin = (String)session.getAttribute("admin");
String test = (String)session.getAttribute("test");
boolean login = true;
//System.out.println("========="+admin);
//System.out.println("------------"+test);
//if(admin != null && admin.equals("true")) {
//	login = true;
//}else {
//	login = false;
//}
//System.out.println("------------login"+login);
%>
 


<%!
String str = "";

private void tree(Connection conn, int id) {
	Statement stmt = null;
	ResultSet rs = null;

	
	try {
		stmt = conn.createStatement();
		String sql = "select * from rlcgj where ID = " + id;
		rs = stmt.executeQuery(sql);
		
		
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		try {
			if(rs != null) {
				rs.close();
				rs = null;
			}
			if(stmt != null) {
				stmt.close();
				stmt = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
%>

<%
request.setCharacterEncoding("UTF-8");
int i= OverPlanCount.count();
int m= Maintain.count();
int n= acknowledgement.count();
Connection conn = DB.getConn();
String sql1 ="";
String sql2 ="";
sql1 = "select sum(prepareTime),sum(experTime),sum(fixTime),sum(maintainTime),sum(malfunctionTime),sum(freeTime),mouth  from (select *,left(rundate,7) as mouth from run ) a GROUP BY mouth ";
sql2 = "select sum(prepareTime),sum(experTime),sum(fixTime),sum(maintainTime),sum(malfunctionTime),sum(freeTime) from run ";



Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(sql1);
//rs,rs1有顺序区
List list1 = new ArrayList();
List list2 = new ArrayList();
List list3 = new ArrayList();
List list4 = new ArrayList();
List list5 = new ArrayList();
List list6 = new ArrayList();
List listx = new ArrayList();
while(rs.next()) {
	 list1.add(rs.getString("sum(prepareTime)"));
	 list2.add(rs.getString("sum(experTime)"));
	 list3.add(rs.getString("sum(fixTime)"));
	 list4.add(rs.getString("sum(maintainTime)"));
	 list5.add(rs.getString("sum(malfunctionTime)"));
	 list6.add(rs.getString("sum(freeTime)"));
	 listx.add("'"+rs.getString("mouth")+"'");
}

ResultSet rs1 = stmt.executeQuery(sql2);
String blist1 = "";
String blist2 = "";
String blist3 = "";
String blist4 = "";
String blist5 = "";
String blist6 = "";
while(rs1.next()) {
	blist1 =  rs1.getString("sum(prepareTime)");
	blist2 = rs1.getString("sum(experTime)");
	blist3 =  rs1.getString("sum(fixTime)");
	blist4 = rs1.getString("sum(maintainTime)");
	blist5 = rs1.getString("sum(malfunctionTime)");
	blist6 =  rs1.getString("sum(freeTime)");
}
System.out.println(blist1);
%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="keywords" content="jquery,ui,easy,easyui,web">
	<meta name="description" content="easyui help you build your web page easily!">
	<title>jQuery EasyUI Demo</title>
	<link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="css/fullcalendar.css" />
    <link rel="stylesheet" href="css/matrix-style.css" />
    <link rel="stylesheet" href="css/matrix-media.css" />
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/jquery.gritter.css" />
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.2/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.2/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="../demo.css">
	<script type="text/javascript" src="jquery-easyui-1.4.2/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="jquery-easyui-1.4.2/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
		<style type="text/css">
${demo.css}
		</style>
		<script type="text/javascript">
$(function () {
    $('#container').highcharts({
        title: {
            text: '总台架报表',
            x: -20 //center
        },
        subtitle: {
            text: '凯迈机电',
            x: -20
        },
        xAxis: {
        	title:{
        	       text:'设备各类时间的大数据分析图'
        	   },
            categories: <%=listx%>
        },
        yAxis: {
            title: {
                text: '时（h）'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: '时'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: '准备时间',
            data:  <%=list1%>
        }, {
            name: '试验运行时间',
            data: <%=list2%>
        }, {
            name: '故障维修时间',
            data: <%=list3%>
        }, {
            name: '维护保养时间',
            data: <%=list4%>
        }, {
            name: '样机故障时间',
            data: <%=list5%>
        }, {
            name: '空闲时间',
            data: <%=list6%>
        }]
    });
});
		</script>
		
		
			<script type="text/javascript">
$(function () {
    $('#container1').highcharts({
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45,
                beta: 0
            }
        },
        title: {
            text: '饼状图'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                depth: 35,
                dataLabels: {
                    enabled: true,
                    format: '{point.name}'
                }
            }
        },
        series: [{
            type: 'pie',
            name: 'Browser share',
            data: [
                ['准备时间',   <%=blist1%>],
                ['试验运行时间',  <%=blist2%>],
                ['故障维修时间',  <%=blist3%>], 
                ['维护保养时间',    <%=blist4%>],
                ['样机故障时间',     <%=blist5%>],
                   {
                    name: '空闲时间',
                    y: <%=blist6%>,
                    sliced: true,
                    selected: true
                }
                
            ]
        }]
    });
});
		</script>
		


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
        <li class="bg_lb"> <a href="right.jsp" target="main"> <i class="icon-dashboard"></i>主页 </a> </li>
        <li class="bg_lg "> <a href="RunManager/RunLineChart.jsp" target="main"> <i class="icon-signal"></i> 运行时间报表</a> </li>
        <li class="bg_ly"> <a href="UserManager/userlist.jsp" target="main"> <i class="icon-group"></i> 用户信息 </a> </li>
        <li class="bg_lo"> <a href="LogManager/log.jsp" target="main"> <i class="icon-th"></i> 日志信息</a> </li>
        <li class="bg_lo"> <a href="EquipmentManager/equipment.jsp" target="main"> <i class="icon-fullscreen"></i> 设备信息目录</a> </li>
        <li class="bg_ls"> <a href="EquipmentManager/MaintainInfo.jsp" target="main"> <i class="icon-inbox"></i> 设备维修信息</a> </li>
        <li class="bg_lr"> <a href="EquipmentManager/RepairAdd.jsp" target="main"> <i class="icon-wrench"></i><span class="label label-success"><%= m %></span>待维修台架</a> </li>
        <li class="bg_lo "> <a href="PlanManager/plan.jsp" target="main"> <i class="icon-th-list"></i> 试验计划信息</a> </li>
        <li class="bg_ls"> <a href="PlanManager/OverTimePlan.jsp" target="main"> <i class="icon-tint"></i><span class="label label-important"><%-- <%= i %> --%></span> 超时计划信息</a> </li>
        <li class="bg_lb"> <a href="AlarmManager/AlarmInfoDir.jsp" target="main"> <i class="icon-pencil"></i>报警信息目录</a> </li>
        <li class="bg_lg"> <a href="ExperManager/experimentnew.jsp" target="main"> <i class="icon-globe"></i> 台架实时状态</a> </li>
        <li class="bg_lr"> <a href="error404.html"> <i class="icon-info-sign"></i><span class="label label-success"><%= n %></span>报修效果确认</a> </li>
      </ul>
    </div>
<!--End-Action boxes-->    
 
<!--Chart-box-->    
    <div class="row-fluid">
      <div class="widget-box">
        <div class="widget-title bg_lg"><span class="icon"><i class="icon-signal"></i></span>
          <h5>Site Analytics</h5>
        </div>
        <div class="widget-content" >
          <div class="row-fluid">
    
<div class="span9">
<div id="container" style="min-width: 180px; height: 300px; margin: 0 auto"></div>
</div>
            <div class="span3">
              <ul class="site-stats">
                <li class="bg_lh"><i class="icon-cogs"></i> <strong>2540</strong> <small>Total Test</small></li>
                <li class="bg_lh"><i class="icon-cog"></i> <strong>120</strong> <small>Today Test </small></li>
                <li class="bg_lh"><i class="icon-wrench"></i> <strong>656</strong> <small>Total Maintain</small></li>
                <li class="bg_lh"><i class="icon-warning-sign"></i> <strong>9540</strong> <small>Total Warn</small></li>
                <li class="bg_lh"><i class="icon-dashboard"></i> <strong>70</strong> <small>Total Facility</small></li>
                <li class="bg_lh"><i class="icon-group"></i> <strong>540</strong> <small>Total Users</small></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>

    
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