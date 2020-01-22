<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<!-- grow -->
	<div class="grow">
		<div class="container">
		<ul>
	 	<c:if test="${goodsCate eq 0}">
			<h2>SHELVES & BOOKCASES</h2>
		</c:if>
		<c:if test="${goodsCate eq 1}">
			<h2>TABLES</h2>
		</c:if>	
		<c:if test="${goodsCate eq 2}">
			<h2>CHAIRS</h2>
		</c:if>	
		<c:if test="${goodsCate eq 3}">
			<h2>SOFAS</h2>
		</c:if>
		<c:if test="${goodsCate eq 4}">
			<h2>BEDS</h2>
		</c:if>		
	</ul>
		</div>
	</div>
	<!-- //grow -->
	
	
	<!-- products List -->
	<div class="pro-du">
		<div class="container">
			<div class="col-md-12 product1">
			
			<c:forEach var="goodsList"  items="${goodsList}" varStatus="stat">	
			<ul>
				<div class=" bottom-product">
					<div class="col-md-4 bottom-cd simpleCart_shelfItem">
						<div class="product-at ">
							<a href="goodsView?goods_no=${goodsList.goods_no}"><img src="/funiture/resources/goodsImage/${goodsList.main_save}" alt="" onerror="this.src='/funiture/resources/user/images/noimg.gif'">
							<div class="pro-grid">
										<span class="buy-in">View Detail</span>
							</div>
						</a>	
						</div>
						<p class="tun"><span>${goodsList.goods_name}</span><br>Funiture</p>
						<div class="ca-rt">
							₩ <fmt:formatNumber value="${goodsList.goods_price}" pattern="#,###" />					
						</div>
					</div>
				</div>
			</ul>
				</c:forEach>
				
				<!--  등록된 상품이 없을 때 -->
			<c:if test="${fn:length(goodsList) le 0}">
				<img src="/funiture/resources/user/images/noitem.gif"/>
			</c:if>
			    <!--  //등록된 상품이 없을 때 -->
			    
				</div>
		</div>
	</div>
	<!-- //products List -->