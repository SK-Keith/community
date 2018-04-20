<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	function sorry2(){
		alert("非常抱歉，暂时没有往期活动！");
	}
	function sorry1(){
		alert("非常抱歉，论坛功能暂未开放！");
	}
</script>
 <div id="header0">
	<div class="header0">
		<img src="${pageContext.request.contextPath}/images/24075.jpg" width="100%" height="auto">
		<div class="text0" >
		<a style="color:#319F0F;">足不出户，便知天下事</a>
		</div>
	</div>
	<div class="clear" style="clear:both;"></div>
 </div>
 
 <div id="content01">
	<div class="content">
	<div class="clear" style="clear:both;"></div>
		<div class="left0">
			<div class="content001">
				<div class="postion0" style="font-size:16px;padding-top:10px;color:#319F0F;float:left;padding-right:0px;">
					<span>您的位置：</span><a href="${pageContext.request.contextPath }/Index_Pro.jsp" target="_blank" style="color:#319F0F;">首页</a>><a href="NewListServlet?action=show0" target="_blank" style="color:#319F0F;">小区活动</a>
				</div>
				<div class="col-lg-offset-1 col-lg-10 blog-area" style="padding-top: 30px;">
					<!--新闻列表 -->
					<c:forEach items="${news}" var="n" varStatus="newsStatus">
						<ul class="blog-list">
							<li class="blog-item">
								<article>
									<div class="blog-date" style="float:left;">
										<img src="<c:url value='/jsps/images/${n.image_n}'/>" width="150" height="115" alt="图片" style="width:auto;">   
									</div>
									<div class="blog-title">
										<a href="<c:url value='/NewsServlet?method=findByNid&nid=${n.nid }'/>" target="_blank">
											${n.title} 
										</a><br> 
										<span> ${n.time} </span>
										<span> ${n.writer} </span>
									</div>
									<div class="blog-bottom clearfix" >
										<span class="blog-date" style="cursor: pointer;text-indent: 28px;"> ${n.abstracts}
										</span> 
									</div>
								</article>
							</li>
						</ul>
					</c:forEach>
				</div>
			</div>
			<div class="clear" style="clear: both;"></div>
		</div>

		<div class="right0" >
		<div>
			<img src="${pageContext.request.contextPath}/images/you01.jpg" width="100%" height="auto">
			<a href="https://yili.tmall.com/p/rd563808.htm?spm=a21bo.2017.201863-6.d2.47456970ZA4yVe&pos=2&acm=201608180-2.1003.1.1418823&scm=1003.1.201608180-2.THJH_280551-BASE_1418823&scene=taobao_shop">11月22日~23日期间，下单成功即可抽马思纯签名照一张，数量有限，先到先得</a>
		</div>
		<div>
			<img src="${pageContext.request.contextPath}/images/suo01.jpg" width="100%" height="auto">
			<a href="https://detail.tmall.com/item.htm?id=543495940105&_u=u2ac6lmm2ff8&sku_properties=5919063:6536025&ali_trackid=17_a5332eb74748fe196e325743257e8d07&spm=a21bo.2017.201863-2.2">索尼爆款，热销10000台</a>
		</div>
	</div>
	<div class="clear" style="clear:both;"></div>
	</div>
	<div class="clear" style="clear:both;"></div>
 </div>
