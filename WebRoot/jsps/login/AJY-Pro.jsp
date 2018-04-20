<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.fa-up {
	padding-top: 5px;
}
</style>
<section class="wxq-product-1 header-listener">
	<div class="w-1200">
		<div class="p-center" id="main">
			<div class="title"
				style="    margin-bottom: 15px;
    padding-top: 35px;">
				<h3>欢迎您的到来</h3>
				<p>功能齐全，只为君来</p>
			</div>
			<div id="main2">
				<li class="active1"
					style="border:1px solid #efefef;cursor:pointer;font-size:16px;font-weight:bold;padding-top: 15px;">日常区</li>
				<li class="normal1"
					style="border:1px solid #efefef;cursor:pointer;font-size:16px;font-weight:bold;padding-top: 15px;">指南区</li>
			</div>
			<div class="all-func" style="padding-top:75px;">
				<ul class="clearfix" style="list-style:none;">
					<div class="richang huan" style="display:block;">
						<li class="function-item">
							<div class="clearfix">
								<div class="icon pull-left"
									onclick="window.open('NewsServlet?method=findAll2');">
									<i class="fa fa-comments fa-3x fa-up"></i>
								</div>
								<div class="pull-left" onclick="window.open('NewsServlet?method=findAll2');"
									style="cursor:pointer;">
									<h4>小区公告</h4>
								</div>
							</div>
						</li>
						<li class="function-item">
							<div class="clearfix">
								<div class="icon pull-left" onclick="window.open('InformationServlet?method=findAll2');">
									<i class="fa fa-bullhorn fa-3x fa-up">  </i>
								</div>
								<div class="pull-left" onclick="window.open('InformationServlet?method=findAll2');"
									style="cursor:pointer;">
									<h4>小区活动</h4>
								</div>
							</div>
						</li>
						<li class="function-item">
							<div class="clearfix">
								<div class="icon pull-left"
									onclick="window.open('<c:url value='/jsps/ContactUs/Contact.jsp'/>')">
									<i class="fa fa-street-view fa-3x fa-up"></i>
								</div>
								<div class="pull-left"
									onclick="window.open('<c:url value='/jsps/ContactUs/Contact.jsp'/>')"
									style="cursor:pointer;">
									<h4>业主信息</h4>
								</div>
							</div>
						</li>
						<li class="function-item">
							<div class="clearfix">
								<div class="icon pull-left" onclick="notice();">
									<i class="fa fa-search fa-3x fa-up"></i>
								</div>
								<div class="pull-left" onclick="notice();"
									" style="cursor:pointer;">
									<h4>报修平台</h4>
								</div>
							</div>
						</li>
						<li class="function-item">
							<div class="clearfix">
								<div class="icon pull-left" style="padding-top:2px;"
									onclick="notice();">
									<i class="fa fa-lightbulb-o fa-3x fa-up"> </i>
								</div>
								<div class="pull-left" onclick="notice();"
									style="cursor:pointer;">
									<h4>电费缴费</h4>
								</div>
							</div>
						</li>
						<li class="function-item">
							<div class="clearfix">
								<div class="icon pull-left" onclick="notice();">
									<i class="fa fa-home fa-3x fa-up"></i>
								</div>
								<div class="pull-left" onclick="notice();"
									style="cursor:pointer;">
									<h4>水费缴费</h4>
								</div>
							</div>
						</li>
						<li class="function-item">
							<div class="clearfix">
								<div class="icon pull-left" onclick="notice();">
									<i class="fa fa-automobile fa-3x fa-up"></i>
								</div>
								<div class="pull-left" onclick="notice();"
									style="cursor:pointer;">
									<h4>车辆收费</h4>
								</div>
							</div>
						</li>
						<li class="function-item">
							<div class="clearfix">
								<div class="icon pull-left" onclick="notice();">
									<i class="fa fa-phone fa-3x fa-up">  </i>
								</div>
								<div class="pull-left" onclick="notice();"
									style="cursor:pointer;">
									<h4>投诉平台</h4>
								</div>
							</div>
						</li>
					</div>
					<div class="zhinan huan" style="display:none;">
						<li class="function-item">
							<div class="clearfix">
								<div class="icon pull-left"
									onclick="notice();">
									<i class="fa fa-feed fa-3x fa-up"></i>
								</div>
								<div class="pull-left"
									onclick="notice();"
									style="cursor:pointer;">
									<h4>周边设施</h4>
								</div>
							</div>
						</li>
						<li class="function-item">
							<div class="clearfix">
								<div class="icon pull-left" onclick="notice();">
									<i class="fa fa-smile-o fa-3x fa-up"></i>
								</div>
								<div class="pull-left" onclick="notice();"
									style="cursor:pointer;">
									<h4>小区便利店</h4>
								</div>
							</div>
						</li>
						<li class="function-item">
							<div class="clearfix">
								<div class="icon pull-left" onclick="notice();">
									<i class="fa fa-support fa-3x fa-up"></i>
								</div>
								<div class="pull-left" onclick="notice();"
									style="cursor:pointer;">
									<h4>设备管理</h4>
								</div>
							</div>
						</li>
						<li class="function-item">
							<div class="clearfix">
								<div class="icon pull-left" onclick="notice();">
									<i class="fa fa-building fa-3x fa-up">  </i>
								</div>
								<div class="pull-left" onclick="notice();"
									style="cursor:pointer;">
									<h4>楼盘管理</h4>
								</div>
							</div>
						</li>
					</div>
				</ul>

			</div>
		</div>
</section>
<div class="blank16"></div>
<div class="gonggao00">
	<div class="col-sm-6 col-xs-12 solution-item">
		<div class="gonggao01"
			style="height:50px;width: 300px;margin: 0 auto;padding-top: 18px;font-size: 18px;">
			<h3 class="tit">
				<span class="title"
					style="float: left;padding-top: 5px;font-size: 22px;" id="tl01">小区公告</span>
			</h3>
			<span class="more" style="font-size: 14px;transform: rotate(7deg);">
				<a href="<c:url value='/NewsServlet?method=findAll2'/>"
				target="_blank" style="font-size: 18px">更多&gt;&gt;</a> </span>
		</div>
		<div class="gonggao02">
			<section class="wxq-blog header-listener" style="padding:0;">
				<div class="w-1000 animated fadeInUp" style="width: 90%;">
					<div class="row">
						<div class="col-lg-offset-1 col-lg-10 blog-area"
							style="padding-top:30px;">

							<!--新闻列表 -->
							<c:forEach items="${newsList }" var="news" varStatus="newsStatus">
								<ul class="blog-list">
									<li class="blog-item">
										<article>
											<div class="blog-date"
												style="float:left;width:150px;padding: 30px 0;margin-left: 7px;margin-right: 7px;">
												<img src="<c:url value='/images/${news.image_n}'/>"
													width="150" height="115" alt="图片">
											</div>
											<div class="blog-title">
												<a href="<c:url value='/UserServlet?method=login'/>"
													target="_blank"> ${news.title} </a> <span>
													${news.time } </span>
											</div>
											<div class="blog-bottom clearfix"
												style="padding: 30px 14px 5px 14px;">
												<a href="<c:url value='/UserServlet?method=login'/> target="
													_blank" style="width:auto;background:inherit;text-align: left;cursor: pointer;text-indent: 28px;">
													${news.abstracts} </a>
											</div>
										</article>
									</li>
								</ul>
							</c:forEach>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<div class="col-sm-6 col-xs-12 solution-item">
		<div class="gonggao01"
			style="height: 50px;width: 300px;margin: 0 auto;padding-top: 18px;font-size: 18px;">
			<h3 class="tit">
				<span class="title"
					style="float: left;padding-top: 5px;font-size: 22px;" id="tl02">小区活动</span>
			</h3>
			<a href="InformationServlet?method=findAll2" target="_blank"
				style="font-size: 18px;">更多&gt;&gt;</a>
		</div>
		<div class="gonggao02">
			<section class="wxq-blog header-listener" style="padding:0;">
				<div class="w-1000 animated fadeInUp" style="width: 90%;">
					<div class="row">
						<div class="col-lg-offset-1 col-lg-10 blog-area"
							style="padding-top:30px;">
							<c:forEach items="${information }" var="in" varStatus="newsStatus">
							<ul class="blog-list">
								<li class="blog-item" style="text-align:center;">
									<article>
										<div class="blog-date"
											style="width:250px;padding: 30px 0;margin-left: 7px;margin:0 auto;text-align:center;">
											<img src="<c:url value='/images/${in.image_i }'/>" width="250" height="240" alt="图片">
										</div>
										<div class="blog-title">
											<a
												href="<c:url value='/InformationServlet?method=load&iid=${in.iid }'/>"
												target="_blank"> 标题：${in.title }</a><br> <span>
												时间：${in.time } </span>

										</div>
										<div class="blog-bottom clearfix"
											style="padding: 0px 0px 25px 0px;">
											<a
												href="<c:url value='/InformationServlet?method=load&iid=${in.iid }'/>"
												target="_blank"
												style="width:auto;background:inherit;font-size: 18px;cursor: pointer;">
												主题： ${in.abstracts }</a>
										</div>
									</article>
								</li>
							</ul>
							</c:forEach>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<div class="content0" style="width:85%;margin:0 auto;">
		<div class="col-md-4 col-sm-6 col-xs-12 solution-item "
			style="padding-left: 50px;height:420px;">
			<a onclick="notice();" class="solution-item-box"
				style="background: url(${pageContext.request.contextPath}/images/011.jpg) no-repeat;
    background-position: 71% 0;
    background-size: cover;">
				<div class="solution-item-info">
					<div class="solution-icon">
						<i class="wxq-icon">&#xe6c4;</i>
					</div>
					<div class="solution-title">活动室入口</div>
				</div> </a>
		</div>
		<div class="col-md-4 col-sm-6 col-xs-12 solution-item"
			style="padding-left: 50px;height:420px;">
			<a onclick="notice();" class="solution-item-box"
				style="background: url(${pageContext.request.contextPath}/images/012.jpg) no-repeat;background-position: 71% 0;background-size: cover;"
				target="_blank">
				<div class="solution-item-info">
					<div class="solution-icon">
						<i class="wxq-icon">&#xe6c4;</i>
					</div>
					<div class="solution-title">商城入口</div>
				</div> </a>
		</div>
		<div class="col-md-4 col-sm-6 col-xs-12 solution-item"
			style="padding-left: 50px;height:420px;">
			<a class="solution-item-box"
				style="background: url(${pageContext.request.contextPath}/images/013.jpg) no-repeat;
    background-position: 71% 0;
    background-size: cover;cursor:pointer;"
				target="_blank" onclick="notice();">
				<div class="solution-item-info">
					<div class="solution-icon">
						<i class="wxq-icon">&#xe6c4;</i>
					</div>
					<div class="solution-title">小区美景</div>
				</div> </a>
		</div>
	</div>
</div>