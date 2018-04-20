<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet"
	href="<c:url value='/jsps/css/bootstrap.min.css'/>" charset="utf-8">
<link rel="stylesheet" href="<c:url value='/jsps/css/animate.css'/>"
	charset="utf-8">
<link rel="stylesheet" href="<c:url value='/jsps/css/style.css'/>"
	charset="utf-8">
<link rel="stylesheet" href="<c:url value='/jsps/css/indexcss.css'/>"
	charset="utf-8">
<link rel="stylesheet" href="<c:url value='/jsps/css/responsive.css'/>"
	charset="utf-8">
<link rel="stylesheet" href="<c:url value='/jsps/css/gdt-style.css'/>"
	charset="utf-8">
<link rel="stylesheet"
	href="<c:url value='/jsps/font-awesome-4.7.0/css/font-awesome.min.css'/>">
<script src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
<title>安居业</title>
<style type="text/css">
.chat-tips {
	padding: 20px;
	border: 1px solid #d1d2d6;
	position: absolute;
	right: 78px;
	top: -55px;
	background-color: #ffffff;
	display: none;
}

.fa-up {
	padding-top: 5px;
}

@media ( max-width :768px) {
	.carousel-control.left {
		display: none;
	}
	.carousel-control.right {
		display: none;
	}
	.car_img {
		height: 200px !important;
	}
}
</style>
<script>
	function show(x) {
		x.style.display = "block";
	}
	function hidden(x) {
		x.style.display = "none";
	}
</script>

</head>

<body style="overflow: auto;">
	<%@ include file="header.jsp"%>
	<%@ include file="carousel.jsp"%>
	<%@ include file="AJY.jsp"%>
	<%@ include file="foot.jsp"%>
	<script src="<c:url value='/jsps/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/jsps/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/jsps/js/jquery.waypoints.min.js'/>"></script>
	<script src="<c:url value='/jsps/js/weixiaoqu.js'/>"></script>
</body>
</html>
