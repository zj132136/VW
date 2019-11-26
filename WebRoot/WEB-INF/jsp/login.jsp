<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/tag.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    
<head>
        <title>CAMA</title><meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="${baseurl}css/bootstrap.min.css" />
		<link rel="stylesheet" href="${baseurl}css/bootstrap-responsive.min.css" />
        <link rel="stylesheet" href="${baseurl}css/matrix-login.css" />
        <link href="${baseurl}font-awesome/css/font-awesome.css" rel="stylesheet" />
		

    </head>
    <body>
        <div id="loginbox">            
            <form id="loginform" class="form-vertical" action="${baseurl}login.action" method="post">
            <input type="hidden" name="action" value=login>
				 <div class="control-group normal_text"> <h3><img src="${baseurl}img/logo.png" alt="Logo" /></h3></div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lg"><i class="icon-user"></i></span><input type="text" placeholder="Username"  name="username"/>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_ly"><i class="icon-lock"></i></span><input type="password" placeholder="Password"  name="password"/>
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                   <!--  <span class="pull-left"><a href="#" class="flip-link btn btn-info" id="to-recover">密码丢失?</a></span> -->
                    <span class="pull-right"><input name="Submit" type="Submit" class="btn btn-success" id="Submit" value="登录" >
                    
                    
                </div>
            </form>
            <form id="recoverform" action="#" class="form-vertical">
				<p class="normal_text">Enter your e-mail address below and we will send you instructions how to recover a password.</p>
				
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lo"><i class="icon-envelope"></i></span><input type="text" placeholder="E-mail address" />
                        </div>
                    </div>
               
                <div class="form-actions">
                    <span class="pull-left"><a href="#" class="flip-link btn btn-success" id="to-login">&laquo; Back to login</a></span>
                    <span class="pull-right"><a class="btn btn-info"/>Reecover</a></span>
                </div>
            </form>
        </div>
        
        <script src="js/jquery.min.js"></script>  
        <script src="js/matrix.login.js"></script> 
    </body>

</html>
