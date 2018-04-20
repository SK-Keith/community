<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="ajy-product-top">
      
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" >
		  <!-- Indicators -->
		 <ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="<c:url value='/images/06.jpg'/>" alt="..." class="car_img">
				<div class="carousel-caption">
				构建安居业公司专属的小区移动微信平台
				</div>
			</div>
			<div class="item">
				<img src="<c:url value='/images/04.jpg'/>" alt="..." class="car_img">
				<div class="carousel-caption">
				打造安居业公司线上线下的专业平台
				</div>
			</div>
			<div class="item">
				<img src="<c:url value='/images/03.jpg'/>" alt="..." class="car_img">
				<div class="carousel-caption">
				合作共赢实现安居业小区的智能服务
				</div>
			</div>
		</div>
		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
		</a>
		<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
		</a>	
	</div>
	<div class="side-bar">
		<a href="#" class="icon-qq">QQ在线咨询</a>
		<a href="#" class="icon-chat">微信
		<div class="chat-tips" onmouseover="show(this)" onmouseout="hidden(this)">
		<i></i><img style="width:138px;height:138px;" src="<c:url value='/images/website-chat.jpg'/>" alt="微信公众号"></div></a>
		<a target="_blank" href="" class="icon-blog">微博</a>
		<a href="#" class="icon-mail">mail</a>
	</div>
    </section>