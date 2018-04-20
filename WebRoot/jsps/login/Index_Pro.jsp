<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="<c:url value='/jsps/css/bootstrap.min.css'/>" charset="utf-8">
	<link rel="stylesheet" href="<c:url value='/jsps/css/animate.css'/>" charset="utf-8">
	<link rel="stylesheet" href="<c:url value='/jsps/css/style.css'/>" charset="utf-8">
	<link rel="stylesheet" href="<c:url value='/jsps/css/indexcss.css'/>" charset="utf-8">
	<link rel="stylesheet" href="<c:url value='/jsps/css/responsive.css'/>" charset="utf-8">
	<link rel="stylesheet" href="<c:url value='/jsps/css/gdt-style.css'/>" charset="utf-8">
	<link rel="stylesheet" href="<c:url value='/jsps/css/login/login.css'/>" charset="utf-8">
	<link rel="stylesheet" href="<c:url value='/jsps/font-awesome-4.7.0/css/font-awesome.min.css'/>">

	<script src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jsps/js/login.js'/>"></script> 
	<title>安居业</title>
	<script>
		function notice(){
			alert("该功能尚在研发当中");
		}
	</script>
</head>
<body style="overflow: auto;">
	<%@ include file="../header.jsp"%>
	<%@ include file="carousel.jsp"%>
	<%@ include file="AJY-Pro.jsp"%>
	<%@ include file="../foot.jsp"%>
	<script src="<c:url value='/jsps/js/jquery.min.js'/>"></script> 
    <script src="<c:url value='/jsps/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/jsps/js/jquery.waypoints.min.js'/>"></script> 
    <script src="<c:url value='/jsps/js/weixiaoqu.js'/>"></script> 
  </body>
</html>