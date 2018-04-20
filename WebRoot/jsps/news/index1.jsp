<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="<c:url value='/jsps/css/bootstrap.min.css'/>" charset="utf-8">
	<link rel="stylesheet" href="<c:url value='/jsps/css/animate.css'/>" charset="utf-8">
	<link rel="stylesheet" href="<c:url value='/jsps/css/user/style.css'/>" charset="utf-8">
	<link rel="stylesheet" href="<c:url value='/jsps/css/indexcss.css'/>" charset="utf-8">
	<link rel="stylesheet" href="<c:url value='/jsps/css/responsive.css'/>" charset="utf-8">
	<link rel="stylesheet" href="<c:url value='/jsps/css/gdt-style.css'/>" charset="utf-8">
	<title>列表页</title>
	<style>
	#nav0{background-color:#ff0;width:100%;position:absolute;}
	.nav0{width:1075px;margin:0 auto;height:50px;}
	.header{width:100%;height:100%;}
	#nav0 ul li{
		border-left: 0px solid #3ea3e4;
		float: left;
		list-style: none;
		display: block;width: 76px;
		width:120px;
	}
	#nav0 ul li a{
		color: #000;
		text-decoration: none;
		font-size: 16px;
		padding: 0 22px;
		line-height: 50px;
		font-family: "Microsoft Yahei";
		display: block;
		text-align: center;
		cursor: pointer;
	}
	#nav0 ul li ul {
		position: relative;
		width: 100px;
		display: none;
		
    }
	#nav0 ul li:hover ul{display:block; z-index:999;}
	#nav0 ul li:hover{background:#efefef;}
	#nav0 ul li ul li{
		float:none;
		position: relative;
		left: 0px;
		width:120px;}
		
	#nav0 ul li ul li:hover a{
		background:#43A105;}
	#nav0 ul li ul li a {
		background: #f5f5f5;
		color: #000000;
		font-style: normal;
		margin-left: 0px;
		font-size: 14px;
	}	
	#content01{position: relative;
    top: 50px;
    width: 100%;
    background-color: #efefef;
    height: auto;
    min-height: 500px;height:auto;}
    .text0{float: left;
    font-size: 42px;
    margin-top: -100px;
    width: 100%;
    text-align: center;
    color: #000;
    position: relative;}
	.content{width:1075px;margin:0 auto;background-color: #fff;height:auto;min-height:500px;}
	.left0{width:70%;margin:0 auto;float:left;}
	.postion0{    float: right;
    padding-right: 300px;}
	.right0{float:left;width:30%;font-size:16px;}
	.wxq-foot{height: 50px;
    position: relative;
    margin-top: 50px;}
	.clear{clear:both;}
	.blog-list .blog-item .blog-title{text-align: center;}
	
	@media (max-width:768px){
		.right{width:100%;margin:0 auto;}
		.left0{width:100%;margin:0 auto;}
		.text0{font-size:18px;font-weight:bold;margin-top:-30px;}
		.col-lg-offset-1 {margin-left: 3.333333%;}
		.col-lg-10 {width: 93.333333%;}
		.blog-item{width:500px;}
	}
	@media (min-width: 1200px){
		.col-lg-offset-1 {margin-left: 3.333333%;}
		.col-lg-10 {width: 93.333333%;}
	}
	
	</style>
</head>
<body style="overflow: auto;">
	<%@ include file="../header.jsp" %>
	<%@ include file="listActCom.jsp"%>
	<%@ include file="../foot.jsp" %>
	<script src="<c:url value='/jsps/js/jquery.min.js'/>"></script>  
    <script src="<c:url value='/jsps/js/bootstrap.min.js'/>"></script> 
    <script src="<c:url value='/jsps/js/jquery.waypoints.min.js'/>"></script> 
    <script src="<c:url value='/jsps/js/weixiaoqu.js'/>"></script> 
  </body>
</html>