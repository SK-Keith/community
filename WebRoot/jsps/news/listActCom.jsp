<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	function sorry2(){
		alert("非常抱歉，暂时没有往期活动！")
	}
	function sorry1(){
		alert("非常抱歉，论坛功能暂未开放！")
	}
</script>
<style>
.postion0 {
    float: inherit!important; 
    padding-right: 0px!important;
}
</style>
 <div id="header0">
	<div class="header0">
		<img src="${pageContext.request.contextPath}/images/24075.jpg" width="100%" height="auto">
		<div class="text0" >
		<a style="color:#319F0F;">足不出户，便知天下事</a>
		</div>
	</div>
	<div class="clear" style="clear:both;"></div>
 </div>
 <div class="clear" style="clear:both;"></div>
 <div style="clear:both;"></div>
 <div id="content01">
	<div class="content">
	<div class="clear" style="clear:both;"></div>
	<div class="content02">
		<div class="xinwen">
			  	<div class="postion0" style="font-size:16px;padding-top:10px;color:#319F0F;">
					<span>您的位置：</span><a href="UserServlet?action=login" target="_blank" style="color:#319F0F;">首页</a>><a href="NewListServlet?action=show0" target="_blank" style="color:#319F0F;">小区新闻</a>>
					<a href="#" style="color:#319F0F;">新闻内容</a>
				</div>
				<div style="margin-top:10px;border-top:2px solid #efefef;">
				<ul>
					<li>
						<div class="blog-title" style="font-size: 16px;">
							<div style="padding: 15px 0;font-size: 25px;font-weight: bold;text-align: center;">
								${news.title}
							</div>
							<div style="padding:10px 0;font-size:16px;text-align:center;">
								${news.time}
							</div>
							<div style="line-height: 39px;text-indent: 32px;">
								${news.content}
							</div>
						</div>
						
					</li>
				</ul>
				</div>
			</div>
	</div>
	<div class="clear" style="clear:both;"></div>
	</div>
	<div class="clear" style="clear:both;"></div>
 </div>