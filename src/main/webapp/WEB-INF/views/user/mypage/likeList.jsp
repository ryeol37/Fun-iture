<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/funiture/resources/user/css/myorderList.css?ver=1"
	rel="stylesheet" type="text/css" media="all" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<%
	String cp = request.getContextPath();
%>

<div class="grow">
	<div class="container">
		<h2>likeList</h2>
	</div>
</div>
<div id="contents">
	<div class="inner">
		<div class="titleArea"></div>

		<form method="POST" id="OrderHistoryForm" name="OrderHistoryForm"
			action="/mypage/orderList">
			<input id="mode" name="mode" value="" type="hidden"> <input
				id="term" name="term" value="" type="hidden">
		</form>
		<div
			class="xans-element- xans-myshop xans-myshop-orderhistorylistitem ec-base-table typeList">
			<table border="1" summary="">
				<colgroup>
					<col style="width: 110px">
					<col style="width: 300px">
					<col style="width: 105px">
					<col style="width: 100px">
					<col style="width: 85px">
					<col style="width: 105px">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">이미지</th>
						<th scope="col">상품정보</th>
						<th scope="col">판매가</th>
						<th scope="col">적립금</th>
						<th scope="col">배송비</th>
						<th scope="col">합계</th>
					</tr>
				</thead>
				<tbody class="center ">
					<c:forEach var="likeList" items="${likeList}" varStatus="stat">
					
						<tr class="xans-record-">
							<td class="thumb"><img
								src="/funiture/resources/goodsImage/${likeList.main_save}" /></td>
							<td class="product left top"><a
								href="/funiture/goods/goodsView?goods_no=${likeList.goods_no}"><strong>${likeList.goods_name}</strong></a>
								<div class="option ">[옵션: ${likeList.goods_size}]</div>
							<td c lass="right"><strong><fmt:formatNumber value="${likeList.goods_price}" type="number"/>원</strong>
							<td><fmt:formatNumber value="${likeList.goods_price*0.01}" type="number"/>원</td>
							
							<td>무료배송</td>
							<td><strong><fmt:formatNumber value="${likeList.goods_price}" type="number"/>원</strong></td>
						</tr>
					
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${fn:length(likeList) le 0}">
				<br />
				<center>좋아요 내역이 없습니다.</center>
				<br />
			</c:if>
		</div>

		<div
			class="xans-element- xans-myshop xans-myshop-orderhistorypaging ec-base-paginate">
		</div>
		<div class="page">${pageHtml}</div>
	</div>
</div>
