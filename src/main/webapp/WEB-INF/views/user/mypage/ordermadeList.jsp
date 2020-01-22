<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/funiture/resources/user/css/myorderList.css"
	rel="stylesheet" type="text/css" media="all" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<%
	String cp = request.getContextPath();
%>

<div class="grow">
	<div class="container">
		<h2>OrderMadeList</h2>
	</div>
</div>
<div id="contents">
	<div class="inner">
		<div class="titleArea"></div>
		<div
			class="xans-element- xans-myshop xans-myshop-orderhistorytab ec-base-tab ">
			<ul class="menu">
				<li class="selected"><a href="<%=cp%>/mypage/ordermadeList">주문제작
						내역</a></li>
				<li class=""><a href="<%=cp%>/mypage/orderoneList">원데이 신청
						내역 </a></li>
			</ul>
		</div>

		<form method="POST" id="OrderHistoryForm" name="OrderHistoryForm"
			action="/funiture/mypage/ordermadeList">
			<div class="xans-element- xans-myshop xans-myshop-orderhistoryhead ">
			</div>
		</form>

		<div
			class="xans-element- xans-myshop xans-myshop-orderhistorylistitem ec-base-table typeList">

			<table border="1" summary="">
				<caption>주문 상품 정보</caption>
				<colgroup>
					<col style="width: 150px;">
					<col style="width: 100px;">
					<col style="width: auto;">
					<col style="width: 80px;">
					<col style="width: 140px;">
					<col style="width: 140px;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">주문일자<br>[주문번호]
						</th>
						<th scope="col">이미지</th>
						<th scope="col">상품정보</th>
						<th scope="col">결제방식</th>
						<th scope="col">상품구매금액</th>
						<th scope="col">주문처리상태</th>
					</tr>
				</thead>
				<tbody class="center ">
					<c:forEach var="myorderCus" items="${myorderCus}" varStatus="stat">
						<tr class="xans-record-">
							<td class="number "><fmt:formatDate
									value="${myorderCus.reg_date}" pattern="YYYY-MM-dd" />
								<p>
									<a
										href="/funiture/custom/view?cu_no=${myorderCus.cu_no}&list=1">[${myorderCus.order_no}]</a>
								</p>
								<p></td>
							<td class="thumb"><img
								src="/funiture/resources/custom/customImg/${myordersCus.cu_main_save}" /></td>
							<td class="product left top"><a
								href="/funiture/custom/view?cu_no=${myorderCus.cu_no}&list=1"><strong>${myorderCus.name}</strong></a>
								<div class="option ">[옵션: ${myorderCus.options}]</div>
							<td>${myorderCus.settle_type}</td>
							<td class="right"><strong><fmt:formatNumber
										value="${myorderCus.order_price}" type="number" />원</strong></td>
							<td class="state">
								<p class="txtEm">${myorderCus.status}</p> <c:if
									test="${myorderCus.status_no eq 4}">
									<a
										href="<%=cp%>/cuboard/modifyForm"
										class=""> <img
										src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_comment.gif"
										alt="구매후기"></a>
								</c:if>
							</td>
							<td></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${fn:length(myorderCus) le 0}">
				<br />
				<center>주문 내역이 없습니다.</center>
				<br />
			</c:if>
		</div>

		<div
			class="xans-element- xans-myshop xans-myshop-orderhistorypaging ec-base-paginate">
		</div>
		<div class="page">${pageHtml}</div>
	</div>
</div>
