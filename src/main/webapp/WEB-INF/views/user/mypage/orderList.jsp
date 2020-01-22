<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/funiture/resources/user/css/myorderList.css"
	rel="stylesheet" type="text/css" media="all" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 하이딩 안되면 밑에꺼 삭제 -->
<script src="https://code.jquery.com/jquery-latest.js"></script>

<%
	String cp = request.getContextPath();
%>

<script>
function go()
{
	var form = document.orderstatus;
	
	form.action = "/funiture/mypage/orderList";
	form.submit();
}

	/* 
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
	 */
</script>
<script type="text/javascript">
	function ordercancel(){

		var check = confirm("정말 취소 하시겠습니까?");
		if(check){
			return true;
		}else{
			return false;
		}
	}
</script>
<div class="grow">
	<div class="container">
		<h2>OrderList</h2>
	</div>
</div>
<div id="contents">
	<div class="inner">
		<div class="titleArea"></div>
		<div
			class="xans-element- xans-myshop xans-myshop-orderhistorytab ec-base-tab ">
			<ul class="menu">
				<li class="selected"><a href="<%=cp%>/mypage/orderList">주문내역조회</a></li>
				<li class=""><a href="<%=cp%>/mypage/creList">취소/반품/교환내역 </a></li>
			</ul>
		</div>

		<form method="POST" id="OrderHistoryForm" name="OrderHistoryForm"
			action="/funiture/mypage/orderList">
			<div class="xans-element- xans-myshop xans-myshop-orderhistoryhead ">
				<!-- 
				<fieldset class="ec-base-box">
					<legend>검색기간설정</legend>
					<div class="stateSelect ">
						<select id="order_status" name="order_status" class="fSelect">
							<option value="all">전체 주문처리상태</option>
							<option value="shipped_before">입금 대기 중</option>
							<option value="shipped_standby">상품 준비 중</option>
							<option value="shipped_begin">배송중</option>
							<option value="shipped_complate">배송완료</option>
							<option value="order_cancel">주문 취소</option>
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
				 -->
				<!--  
				<ul>
					<li>기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
					<li>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
				</ul>
				 -->
			</div>
		</form>
		<div
			class="xans-element- xans-myshop xans-myshop-orderhistorylistitem ec-base-table typeList">
			<form method="POST" id="orderstatus" name="orderstatus"	>
				<select id="os" name="os" class="fSelect" onchange="javascript:go();">
					<option value="#">====주문상태====</option>
					<option value="all">전체 주문처리상태</option>
					<option value="before">입금 대기 중</option>
					<option value="standby">상품 준비 중</option>
					<option value="begin">배송 중</option>
					<option value="complate">배송완료</option>
					<option value="cancel">주문 취소</option>
					<option value="exchange">교환 요청</option>
					<option value="return">반품 요청</option>
				</select>
			</form>


			<table border="1" summary="">
				<caption>주문 상품 정보</caption>
				<colgroup>
					<col style="width: 150px;">
					<col style="width: 100px;">
					<col style="width: auto;">
					<col style="width: 80px;">
					<col style="width: 140px;">
					<col style="width: 140px;">
					<col style="width: 130px;">
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
						<th scope="col">취소/교환/반품</th>
					</tr>
				</thead>
				<tbody class="center ">
				<c:forEach var="myorderList" items="${myorderList}" varStatus="stat">

						<tr class="xans-record-">
							<td class="number "><fmt:formatDate
									value="${myorderList.reg_date}" pattern="YYYY-MM-dd" />
								<p>
									<a href="/funiture/goods/goodsView?goods_no=${myorderList.goods_no}">[${myorderList.order_no}]</a>
								</p> 
								
								<p><c:if test="${myorderList.status_no ne 4}"> <a href="/funiture/mypage/orderCancel?order_no=${myorderList.order_no}&&id=${myorderList.id}" onclick="return ordercancel()">
										<img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_cancel.gif" alt="주문취소"></a></c:if></td>
									
							<td class="thumb"><img
								src="/funiture/resources/goodsImage/${myorderList.main_save}" /></td>
							<td class="product left top"><a
								href="/funiture/goods/goodsView?goods_no=${myorderList.goods_no}"><strong>${myorderList.goods_name}</strong></a>
								<div class="option ">[옵션: ${myorderList.goods_size}]</div>
							<td>${myorderList.order_qty}</td>
							<td class="right"><strong><fmt:formatNumber
                              value="${myorderList.order_price}" type="number" />원</strong>
								<div class="displaynone"></div></td>
							<td class="state">
								<p class="txtEm">${myorderList.status}</p>
								<p class="displaynone">
									<a href="#" target="_self"></a>
								</p>
								<p class="displaynone">
									<a href="#none" class="line" onclick="">[]</a>
								</p> <c:if test="${myorderList.status_no eq 4}">
									<a
										href="/funiture/goods/goodsView?goods_no=${myorderList.goods_no}"
										class=""> <img
										src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_comment.gif"
										alt="구매후기"></a>
								</c:if> <c:if test="${myorderList.status_no eq 8}">
									<a href="#none" class=""
										onclick="OrderHistory.withdraw('C','20180102-0000020|399|000U|8974','F')"><img
										src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_retract.gif"
										alt="취소철회"></a>
								</c:if> <c:if test="${myorderList.status_no eq 10}">
									<a href="/funiture/mypage/reCancel?order_no=${myorderList.order_no}&&id=${myorderList.id}" class=""
										onclick="OrderHistory.withdraw('E','20180102-0000020|399|000U|8974','F')"><img
										src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_retract2.gif"
										alt="교환철회"></a>
								</c:if> <c:if test="${myorderList.status_no eq 6}">
									<a href="/funiture/mypage/reCancel?order_no=${myorderList.order_no}&&id=${myorderList.id}" class=""
										onclick="OrㄹderHistory.withdraw('R','20180102-0000020|399|000U|8974','F')"><img
										src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_retract3.gif"
										alt="반품철회"></a>
								</c:if>
							</td>
							<td>
							<c:if test="${myorderList.status_no eq 4}">
							<p><a href="/funiture/mypage/exchange?order_no=${myorderList.order_no}&&id=${myorderList.id}"><img 
									src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_exchange.gif"
									alt="교환요청"></a>
									<p><a href="/funiture/mypage/refound?order_no=${myorderList.order_no}&&id=${myorderList.id}"><img 
									src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_return.gif"
									alt="환불요청"></a>
									</c:if>
								<p>
								<c:if test="${myorderList.status_no ne 4}">-</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${fn:length(myorderList) le 0}">
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