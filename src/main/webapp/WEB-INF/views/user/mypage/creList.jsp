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
	$(function() {
		$("#start_date").datepicker({
			dateFormat : 'yy-mm-dd'
		});
		$("#end_date").datepicker({
			dateFormat : 'yy-mm-dd'
		});
	});
	function check() {
		if (document.OrderHistoryForm.start_date.value == ""
				|| document.OrderHistoryForm.end_date.value == "") {
			alert("날짜를 선택하세요");
			document.OrderHistoryForm.start_date.focus();
			return;
		}
		document.OrderHistoryForm.submit();
	}
</script>
<div class="grow">
	<div class="container">
		<h2>C.R.E List</h2>
	</div>
</div>
<div id="contents">
	<div class="inner">
		<div class="titleArea"></div>
		<div
			class="xans-element- xans-myshop xans-myshop-orderhistorytab ec-base-tab ">
			<ul class="menu">
				<li class=""><a href="<%=cp%>/mypage/orderList">주문내역조회</a></li>
				<li class="selected"><a href="<%=cp%>/mypage/creList">취소/반품/교환내역
				</a></li>
			</ul>
		</div>
		<!-- 
		<form method="POST" id="OrderHistoryForm" name="OrderHistoryForm"
			action="/funiture/mypage/creList">
			
			<div class="xans-element- xans-myshop xans-myshop-orderhistoryhead ">
				<fieldset class="ec-base-box">
					<legend>검색기간설정</legend>
					<div class="stateSelect ">
						<select id="order_status" name="order_status" class="fSelect">
							<option value="all">전체 주문처리상태</option>
							<option value="shipped_before">입금전</option>
							<option value="shipped_standby">배송준비중</option>
							<option value="shipped_begin">배송중</option>
							<option value="shipped_complate">배송완료</option>
							<option value="order_cancel">취소</option>
							<option value="order_exchange">교환</option>
							<option value="order_return">반품</option>
						</select>
					</div>
					
					<span class="period"> <a href="#none" class="btnNormal"
						days="00"><img
							src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date1.gif"
							offimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date1.gif"
							onimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date1_on.gif"
							alt="오늘"></a> <a href="#none" class="btnNormal" days="07"><img
							src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date2.gif"
							offimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date2.gif"
							onimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date2_on.gif"
							alt="1주일"></a> <a href="#none" class="btnNormal" days="30"><img
							src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date3.gif"
							offimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date3.gif"
							onimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date3_on.gif"
							alt="1개월"></a> <a href="#none" class="btnNormal" days="90"><img
							src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date4.gif"
							offimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date4.gif"
							onimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date4_on.gif"
							alt="3개월"></a> <a href="#none" class="btnNormal" days="180"><img
							src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date5.gif"
							offimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date5.gif"
							onimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date5_on.gif"
							alt="6개월"></a>
					</span>
					
					<input type="text" id="start_date" name="start_date"> ~ <input
						type="text" id="end_date" name="end_date"> <input
						type="submit" class="ui-datepicker-trigger" value="찾기"
						onClick="check()" />
				</fieldset>
				<ul>
					<li>기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
					<li>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
				</ul>
			</div>
			 
			
			<input id="mode" name="mode" value="" type="hidden"> <input
				id="term" name="term" value="" type="hidden">
		</form>
		-->
		<div
			class="xans-element- xans-myshop xans-myshop-orderhistorylistitem ec-base-table typeList">

			<div class="title">
				
			</div>
			<table border="1" summary="">
				<caption>주문 상품 정보</caption>
				<colgroup>
					<col style="width: 150px;">
					<col style="width: 120px;">
					<col style="width: auto;">
					<col style="width: 90px;">
					<col style="width: 140px;">
					<col style="width: 140px;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">주문일자<br>[주문번호]
						</th>
						<th scope="col">이미지</th>
						<th scope="col">상품정보</th>
						<th scope="col">수량</th>
						<th scope="col">상품구매금액</th>
						<th scope="col">주문처리상태</th>
					</tr>
				</thead>
				<tbody class="center ">
					<c:forEach var="creList" items="${creList}" varStatus="stat">
						<tr class="xans-record-">
							<td class="number "><fmt:formatDate
									value="${creList.reg_date}" pattern="YYYY-MM-dd" />
								<p>
									<a href="/funiture/goods/goodsView?goods_no=${creList.goods_no}">[${creList.order_no}]</a>
								</p> 
							<td class="thumb"><img
								src="/funiture/resources/goodsImage/${creList.main_save}" /></td>
							<td class="product left top"><a
								href="/funiture/goods/goodsView?goods_no=${creList.goods_no}"><strong>${creList.goods_name}</strong></a>
								<div class="option ">[옵션: ${creList.goods_size}]</div>
							<td>${creList.order_qty}</td>
							<td class="right"><strong><fmt:formatNumber value="${creList.order_price}" type="number"/>원</strong>
								<div class="displaynone"></div></td>
							<td class="state">
								<p class="txtEm">${creList.status}</p>
								<p class="displaynone">
									<a href="#" target="_self"></a>
								</p>
								<p class="displaynone">
									<a href="#none" class="line" onclick="">[]</a>
								</p> <c:if test="${creList.status eq '배송 완료'}">
									<a
										href="/funiture/goods/goodsView?goods_no=${creList.goods_no}"
										class=""> <img
										src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_comment.gif"
										alt="구매 후기"></a>
								</c:if> 
								 <c:if test="${creList.status eq '교환 요청'}">
									<a href="/funiture/mypage/reCancel?order_no=${creList.order_no}&&id=${creList.id}" class=""
										onclick="OrderHistory.withdraw('E','20180102-0000020|399|000U|8974','F')"><img
										src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_retract2.gif"
										alt="교환 철회"></a>
								</c:if> <c:if test="${creList.status eq '반품 요청'}">
									<a href="/funiture/mypage/reCancel?order_no=${creList.order_no}&&id=${creList.id}" class=""
										onclick="OrderHistory.withdraw('R','20180102-0000020|399|000U|8974','F')"><img
										src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_retract3.gif"
										alt="반품 철회"></a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${fn:length(creList) le 0}">
				<br />
				<center>주문 내역이 없습니다.</center>
				<br />
			</c:if>
		</div>

		<div
			class="xans-element- xans-myshop xans-myshop-orderhistorypaging ec-base-paginate">
			<!-- <a
				href="?page=1"
				class="first"><img
				src="//img.echosting.cafe24.com/skin/base/common/btn_page_first.gif"
				alt="첫 페이지"></a> <a
				href="?page=1&amp;history_start_date=2017-10-21&amp;history_end_date=2018-01-19"><img
				src="//img.echosting.cafe24.com/skin/base/common/btn_page_prev.gif"
				alt="이전 페이지"></a>
			<ol>
				<li class="xans-record-"><a
					href="?page=1&amp;history_start_date=2017-10-21&amp;history_end_date=2018-01-19"
					class="this">1</a></li>
			</ol>
			<a
				href="?page=1&amp;history_start_date=2017-10-21&amp;history_end_date=2018-01-19"><img
				src="//img.echosting.cafe24.com/skin/base/common/btn_page_next.gif"
				alt="다음 페이지"></a> <a
				href="?page=1&amp;history_start_date=2017-10-21&amp;history_end_date=2018-01-19"
				class="last"><img
				src="//img.echosting.cafe24.com/skin/base/common/btn_page_last.gif"
				alt="마지막 페이지"></a> -->
		</div>
		<div class="page">${pageHtml}</div>
	</div>
</div>
