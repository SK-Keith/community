<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>登录页面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link
	href="<c:url value='/jsps/vendor/bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="<c:url value='/jsps/vendor/metisMenu/metisMenu.min.css'/>"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="<c:url value='/jsps/dist/css/sb-admin-2.css'/>"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="<c:url value='/jsps/vendor/font-awesome/css/font-awesome.min.css'/>"
	rel="stylesheet" type="text/css">
<style>
.btn-zhuce {
	background-color: #F8F8F8;
	color: #000;
	border-color: #efefef;
}
</style>
<script>
	function change(){
		$("#imgVerifyCode").attr("src","/community/VerifyCodeServlet?a="+ new Date().getTime());
	}
</script>
</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">登录</h3>
					</div>
					<div class="panel-body">
						<form role="form" action="<c:url value='/UserServlet'/>"
							method="post" target="_top">
							<input type="hidden" name="method" value="login" />
							<fieldset>
								<div class="form-group">${msg }</div>
								<div class="form-group">
									<input class="form-control" placeholder="帐号" name="loginname"
										type="text" autofocus>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="密码" name="loginpass"
										type="password" value="">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="验证码" name="verifyCode"
										id="verifyCode" value="${form.verifyCode }" type="text"
										value="">
								</div>
								<div class="form-group">
									<img class="verifylg" id="imgVerifyCode"
										src="<c:url value='/VerifyCodeServlet'/>"
										style="width:72px;height:32px;" /> <a class="verifyCodelg"
										id="verifyCode" href="javascript:change()">换张图</a>
								</div>
								<div class="checkbox">
									<label> <input name="remember" type="checkbox"
										value="Remember Me">记住我 </label>
								</div>
								<!-- Change this to a button or input when using this as a form -->
								<button type="submit" class="btn btn-lg btn-success btn-block"
									id="button">登录</button>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="<c:url value='/jsps/vendor/jquery/jquery.min.js'/>"></script>

	<!-- Bootstrap Core JavaScript -->
	<script
		src="<c:url value='/jsps/vendor/bootstrap/js/bootstrap.min.js'/>"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="<c:url value='/jsps/vendor/metisMenu/metisMenu.min.js'/>"></script>

	<!-- Custom Theme JavaScript -->
	<script src="<c:url value='/jsps/dist/js/sb-admin-2.js'/>"></script>
</body>
</html>
