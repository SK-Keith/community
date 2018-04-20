<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'information.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <section class="wxq-blog header-listener" style="padding:0;">
					<div class="w-1000 animated fadeInUp" style="width: 90%;">
						<div class="row">                   
							<div class="col-lg-offset-1 col-lg-10 blog-area" style="padding-top:30px;">
								<!--新闻列表 -->
							<c:forEach items="${newList}" var="news" varStatus="newsStatus">
								<ul class="blog-list">
									<li class="blog-item">
										<article>
											<div class="blog-date" style="float:left;width:150px;padding: 30px 0;margin-left: 7px;margin-right: 7px;">
													<img src="<c:url value='/images/${news.getPicture()}'/>" width="150" height="115" alt="图片" >   
											</div>
											<div class="blog-title">
												<a href="NewListServlet?action=read&id=${news.getId()}" target="_blank">
													${news.getTitle()} 
												</a> 
												<span> ${news.getTime()} </span>
											</div>
											<div class="blog-bottom clearfix" style="padding: 30px 14px 5px 14px;">
												<a href="NewListServlet?action=read&id=${news.getId()}" target="_blank" style="width:auto;background:inherit;text-align: left;cursor: pointer;text-indent: 28px;"> 
												${news.getContent()}
												</a> 
											</div>
										</article>
									</li>
								</ul>
							</c:forEach>
							</div>
						</div>
					</div>
				</section>
  </body>
</html>
