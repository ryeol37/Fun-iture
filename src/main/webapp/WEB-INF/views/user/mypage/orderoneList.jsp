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

<script>
	function go() {
		var form = document.orderstatus;

		form.action = "/funiture/mypage/orderoneList";
		form.submit();
	}
</script>
<script type="text/javascript">
	function ordercancel() {

		var check = confirm("정말 취소 하시겠습니까?");
		if (check) {
			return true;
		} else {
			return false;
		}
	}
</script>
<div class="grow">
	<div class="container">
		<h2>OrderOneList</h2>
	</div>
</div>
<div id="contents">
	<div class="inner">
		<div class="titleArea"></div>
		<div
			class="xans-element- xans-myshop xans-myshop-orderhistorytab ec-base-tab ">
			<ul class="menu">
				<li class=""><a href="<%=cp%>/mypage/ordermadeList">주문제작 내역</a></li>
				<li class="selected"><a href="<%=cp%>/mypage/orderoneList">원데이
						신청 내역 </a></li>
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
					<col style="width: 150px;">
					<col style="width: 150px;">
					<col style="width: 150px;">
					<col style="width: 0px;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">수강일자<br>[예약일자]
						</th>
						<th scope="col">상품이미지</th>
						<th scope="col">상품정보</th>
						<th scope="col">예약자명</th>
						<th scope="col">상품가격</th>
						<th scope="col">신청처리상태</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody class="center ">
					<c:forEach var="myorderOne" items="${myorderOne}" varStatus="stat">
						<tr class="xans-record-">
							<td class="number "><fmt:formatDate
									value="${myorderOne.day}" pattern="YYYY-MM-dd" />
								<p>
									<a
										href="/funiture/oneday/view?oneday_no=${myorderOne.oneday_no}">[<fmt:formatDate
											value="${myorderOne.reg_date}" pattern="YYYY-MM-dd" />]
									</a>
								</p>
								<p>
									<c:if test="${myorderOne.status_no ne 5}">
										<a
											href="/funiture/mypage/oneCancel?oneday_no=${myorderOne.oneday_no}"
											onclick="return ordercancel()"><img
											src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_cancel.gif"
											alt="주문취소"></a>
									</c:if></td>
							<td class="thumb"><img
								src="/funiture/resources/oneday_upload/${myorderOne.main_save}" /></td>
							<td class="product left top"><a
								href="/funiture/oneday/view?oneday_no=${myorderOne.oneday_no}"><strong>${myorderOne.name_1}</strong></a>
							<td class="thumb">${myorderOne.name}</td>
							<td class="right"><strong><fmt:formatNumber
										value="${myorderOne.price}" type="number" />원</strong>
							<td class="state">
								<p class="txtEm">${myorderOne.status}</p>
								<p class="displaynone">
									<a href="#" target="_self"></a>
								</p>
							</td>
							<td></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${fn:length(myorderOne) le 0}">
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
