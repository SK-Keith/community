<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script language="javascript">
	    function delcfm() {
	        if (!confirm("确认要注销吗？")) {
	            window.event.returnValue = false;
	        }
	    }
	    function login(){
	    	alert("请先登录！");
	    }
	    function sorry3(){
	    	alert("非常抱歉，该功能尚在研发当中；");
	    }
   </script> 
<header class="head-top" >
        <div class="ajy-header clearfix">
            <h1 class="ajy-header-logo">
                <a class="logo" href="<c:url value='/index.jsp'/>">
                    安居业官网
                </a>
				<a class="m-logo" href="<c:url value='/index.jsp'/>">
                    安居业官网
                </a>
                <a class="m-menu-toggle" href="javascript:"><i class="menu-icon"></i></a>
            </h1>
            <div class="ajy-menu" style="right: -230px;">
                <a href="javascript:" class="close-menu">
                    <i class="menu-icon"></i>
                </a>
                <nav class="ajy-navigation">
                    <div class="menu-%e9%a1%b6%e9%83%a8%e8%8f%9c%e5%8d%95-container">
						<ul id="menu-%e9%a1%b6%e9%83%a8%e8%8f%9c%e5%8d%95" class="headermenu">
						<c:if test="${empty username}">
						<li><a href="<c:url value='/index.jsp'/>">首页</a></li>
						<li><a onclick="login()" style="cursor:pointer;">产品</a></li>
						<li><a href="<c:url value='/jsps/ContactUs/Contact.jsp'/>" target="_blank">联系我们</a></li>
						</c:if>
						<c:if test="${not empty username}">
						<li><a onclick="sorry3()" style="cursor:pointer;">消息</a></li>
						<li><a href="<c:url value='/jsps/ContactUs/Contact.jsp'/>" style="cursor:pointer;">我的</a></li>
						</c:if>
						</ul>
					</div>                
				</nav>
               	<div class="ajy-login">
               	 	<c:if test="${empty username}">
	                    <a href="<c:url value='/jsps/user/login1.jsp'/>" target="_blank" >
	                       	登录
	                    </a>
                    </c:if>
                    <c:if test="${not empty username}">
						<a href="<c:url value='/UserServlet?method=quit'/>" onclick="delcfm();" style="width:148px;">
							用户：${sessionUser.loginname }->注销
						</a>
					</c:if>
                </div>
            </div>
        </div>        
    </header>
	<div class="headerListener" style="top: 452px;"></div>