<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>注册界面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/user/regist.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/user/logincss.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/app.min.1.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/app.min.2.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/animate.css'/>">
	
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jsps/js/hm.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jsps/js/analysis.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jsps/js/user/regist.js'/>"></script>

  </head>
  
  <body class="login-content">
	
	<div class="lc-block animated flipInX login-form" id="l-login">
	<div class="pwd-login signin-box login-show ha" style="display:block;margin-top:-28px!important">
	<div class=="title" style="font-size:20px;line-height:80px;">注册窗口</div>
	<form action="<c:url value='/UserServlet'/>" method="post" class="login" id="registForm">
		<input type="hidden" name="method" value="regist"/> 
		<div class="input-group m-b-20">
			<div class="tdLabel fg-user">用户名：</div>
			<div class="tdInput fg-line">
				<input type="text" name="loginname" id="loginname" class="input form-control" autocomplete="off" value="${form.loginname }"/>
			</div>
			<div class="tdError">
				<label class="labelError" id="loginnameError"></label>
			</div>
		</div>
		<div class="input-group m-b-10">
			<div class="tdLabel">登录密码：</div>
			<div class="tdInput fg-line">
				<input type="password" name="loginpass" id="loginpass" class="input form-control" value="${form.loginpass}"/>
			</div>
			<div class="tdError">
				<label class="labelError" id="loginpassError"></label>
			</div>			
		</div>
		<div class="input-group m-b-10" id="div_pwd">
			<div class="tdLabel">确认密码：</div>
			<div class="tdInput fg-line">
				<input type="password" name="reloginpass" id="reloginpass" class="input form-control" value="${form.reloginpass}"/>
			</div>
			<div class="tdError">
				<label class="labelError" id="reloginpassError">${errors.loginpass }</label>
			</div>
		</div>
		<div class="input-group m-b-10">
			<div class="tdLabel fg-email">Email：</div>
			<div class="tdInput fg-line">
				<input type="text" name="email" id="email" class="input form-control" value="${form.email}"/>
			</div>
			<div class="tdError">
				<label class="labelError" id="emailError">${errors.email }</label>
			</div>
		</div>
		<div class="input-group m-b-10" style="height: 80px;">
			<div class="tdLabel fg-verify">图形验证码：</div>
			<div class="tdInput fg-line">
				<input type="text" name="verifyCode" id="verifyCode" class="input form-control" value="${form.verifyCode}" style="color:#000;"/>
				<span class="verifyCodeImg"><img id="vCode" width="100" src="<c:url value='/VerifyCodeServlet'/>"/></span>
				<div class="hyz1"><a href="javascript:change()">换一张</a></div>
			</div>
			<div class="tdError fg-verifyCode"> 
				<label class="labelError" id="verifyCodeError">${errors.verifyCode }</label>
			</div>
		</div>
		<div class="sub_re">
			<input type="submit" class="btn btn-block btn-lg btn-primary waves-effect" id="submitBtn" > 
			</div>
		</div>
	</form>
	</div></div>
	<script src="<c:url value='/jsps/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/jsps/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/jsps/js/waves.min.js'/>"></script>
	<script src="<c:url value='/jsps/js/md5.js'/>"></script>
</body>
</html>
