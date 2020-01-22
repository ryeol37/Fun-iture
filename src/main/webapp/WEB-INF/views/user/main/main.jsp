<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		
	<div class="banner">
		<div class="container">
	  <script src="/funiture/resources/user/js/responsiveslides.min.js"></script>
  <script>
    $(function () {
      $("#slider").responsiveSlides({
      	auto: true,
      	nav: true,
      	speed: 500,
        namespace: "callbacks",
        pager: true,
      });
    });
  </script>
			<div  id="top" class="callbacks_container">
			<ul class="rslides" id="slider">
			    <li>
					
						<div class="banner-text">
							<h3>New Items</h3>
						<p>당신의 공간을 채워 줄 새로운 가구들이 준비되어있습니다.</p>
						
						</div>
				
				</li>
				<li>
					
						<div class="banner-text">
							<h3>Fun-iture makes Furniture</h3>
						<p>Fun-iture는 가구의 디자인부터 제작까지 모두 참여합니다.</p>
												

						</div>
					
				</li>
				<li>
						<div class="banner-text">
							<h3>Only one what you need</h3>
						<p>특별한 공간을 꿈꾸는 당신을 위해 주문 제작 상품을 이용할 수 있습니다.</p>

						</div>
					
				</li>
				<li>
						<div class="banner-text">
							<h3>Only one what you make</h3>
						<p>특별한 강사와 함께 당신만의 제품을 만들어보세요.</p>

						</div>
				</li>
			</ul>
		</div>

	</div>
	</div>

<!--content-->
<div class="container">
	<div class="cont">
		<div class="content">
			<div class="content-top">
			<br>
			<br>
				<h1>BEST SELLER</h1>
				<div class="grid-in">
				<c:forEach items="${bestList}" var="row" end="3">
				<div class="col-md-3 grid-top simpleCart_shelfItem">
					
							<a href="goods/goodsView?goods_no=${row.goods_no}" class="b-link-stripe b-animate-go  thickbox">
							<img class="img-responsive" src="/funiture/resources/goodsImage/${row.main_save}" alt="" width="100%"><br>
								<div class="b-wrapper">
								<h3 class="b-animate b-from-left    b-delay03  ">
									<span class="buy-in">View Detail</span>
									</h3>
								</div>
							</a>				
					</div>
				</c:forEach>
				</div>
			</div>

			<div class="content-top">
			<br>
			<br>
				<h1>NEW PRODUCTS</h1>
				<div class="grid-in">
				<c:forEach items="${newList}" var="row" end="3">
				<div class="col-md-3 grid-top simpleCart_shelfItem">	
									
							<a href="goods/goodsView?goods_no=${row.goods_no}" class="b-link-stripe b-animate-go  thickbox">
							<img class="img-responsive" src="/funiture/resources/goodsImage/${row.main_save}" alt="" width="100%"><br>
								<div class="b-wrapper">
								<h3 class="b-animate b-from-left    b-delay03  ">
									<span class="buy-in">View Detail</span>
									</h3>
								</div>
							</a>			
					</div>
				</c:forEach>
				</div>
			</div>
			</div>
			</div>
</div>
			