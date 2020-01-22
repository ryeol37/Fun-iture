<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- grow -->
	<div class="grow">
		<div class="container">
			<h2>Basket</h2>
		</div>
	</div>
	<!-- grow -->
<div class="container">
	<div class="check">	 
			 <h1>My Shopping Bag (${fn:length(basketList) })</h1>
			 
		 <form name="basketList" method="post">
		 <div class="col-md-9 cart-items">
		 <c:if test="${fn:length(basketList) <= 0}">
			<span>장바구니에 담긴 상품이 없습니다.</span>
		 </c:if>
			 <c:forEach var="basketList" items="${basketList }" varStatus="stat">
			 <div class="cart-header" id="cart">
				 <div class="close1"> 
				 	<a href="/funiture/basket/delete?no=${basketList.no}"><img src="/funiture/resources/images/close_1.png"></a>
				 </div>
				 <div class="cart-sec simpleCart_shelfItem">
						<div class="cart-item cyc">
							 <img src="/funiture/resources/goodsImage/${basketList.main_save}" class="img-responsive" alt=""/>
						</div>
					   <div class="cart-item-info">
						<h3><a href="/funiture/goods/goodsView?goods_no=${basketList.goods_no}">${basketList.goods_name}</a><span>　　</span></h3>
						<ul class="qty">
							<li><p>사이즈 : ${basketList.goods_size } </p></li>
							<li><p>수량 : ${basketList.goods_qty }</p></li>
						</ul>
						<div class="delivery">
							 <p>${basketList.goods_qty * basketList.goods_price } 원</p>
							 <span>배송은 주말/공휴일을 제외하고 7일이 소요됩니다.</span>
							 <div class="clearfix"></div>
				        </div>	
				        <c:set var= "sum" value="${sum + (basketList.goods_price * basketList.goods_qty)}"/>
					   </div>
					   <div class="clearfix"></div>
										
				  </div>
			 </div>	
			 </c:forEach>
		 </div>
		 
		  <div class="col-md-3 cart-total">
			 <a class="continue" href="/funiture/goods/goodsList">쇼핑 계속하기</a>
			 <c:choose>
			 <c:when test="${fn:length(basketList) <= 0}">		<!-- 장바구니 비어있음 -->
			 <div class="price-details">
				 <h3>Price Details</h3>
				 <span>TOTAL</span>
				 	<span class="total1">---</span>	<!-- 상품 금액 -->
				 <span>Delivery Charges</span>
				 	<span class="total1">---</span>		<!-- 배송비 -->
				 <div class="clearfix"></div>
			 </div>			 
			 	 <ul class="total_price">
			   	 <li class="last_price"> <h4>TOTAL</h4></li>	
			   	 	<li class="last_price"><span>---</span></li>		<!-- 결제 금액 -->
			 	 </ul>
			 	 </c:when>
			 	 <c:otherwise>						<!-- 장바구니에 물건 있음 -->
			 	 <div class="price-details">
				 <h3>Price Details</h3>
				 <span>TOTAL</span>
				 <span class="total1"><fmt:formatNumber value="${sum}" type="number"/>원</span>	<!-- 상품 금액 -->
				 <span>Delivery Charges</span>
				 <span class="total1">0</span>		<!-- 배송비 -->
				 <div class="clearfix"></div>				 
			 </div>	
			 <ul class="total_price">
			   <li class="last_price"> <h4>TOTAL</h4></li>	
			   <li class="last_price"><span><fmt:formatNumber value="${sum}" type="number"/>원</span></li>		<!-- 결제 금액 -->
			   <div class="clearfix"> </div>
			 </ul>
			 	</c:otherwise>
			 	</c:choose>
			
			 
			 <div class="clearfix"></div>
			 <a class="order" href="/funiture/order/basketBuy">주문하기</a>
			</div>
		
			<div class="clearfix"> </div>
			</form>
	 </div>
	 </div>


<!--//content-->