<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<link href="/funiture/resources/custom/css/customKHR.css" rel="stylesheet" type="text/css" media="all" />
<link href="/funiture/resources/page.css" rel="stylesheet" type="text/css" media="all" />

<!-- products -->
	<!-- grow -->
<div class="grow">
	<div class="container">
		<h2>ORDER MADE</h2>
	</div>
</div>
<!-- grow -->
<div class="pro-du">
	<div class="container">
		<div class="product1">
			<div class="content-top">
				<!-- <div class="grid-in"> -->
					<div class="col-md-3 col-sm-6 col-xs-10 grid-top simpleCart_shelfItem">
						<div style="background-color:#7d7d7d;height:200px">
							<div style="padding:10px 20px;text-align:left;color:white">OrderMade have</div>
							<div style="padding:0px 20px 0px;text-align:left;color:white">
								<font size="8"><b>${count}</b></font> product
							</div>
						</div>
						<div style="height:45px"></div>
					</div>
				<!-- 이부분부터 -->
				<c:forEach items="${list}" var="row">
					<div class="col-md-3 col-sm-6 col-xs-10 grid-top simpleCart_shelfItem">
						<div class="product-at ">
							<a href="view?cu_no=${row.cu_no}&list=${listPage}" class="b-link-stripe b-animate-go  thickbox">
							<img class="img-responsive" src="/funiture/resources/custom/customImg/${row.cu_main_save}" alt="">
								<div class="pro-grid">
									<span class="buy-in">View Detail</span>
								</div>
							</a>
						</div>
						<p id="order_goods">주문제작 상품</p>
						<p id="order_title"><a href="view?cu_no=${row.cu_no}&list=${listPage}">${row.name}</a></p>
					</div>
				</c:forEach>
				<!-- /여기까지 반복 -->
				<!-- </div> -->
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
	<div class="page">
		${pageHtml}
	</div>
</div>
<!-- products -->
