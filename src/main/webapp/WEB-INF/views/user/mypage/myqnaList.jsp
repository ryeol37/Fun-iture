<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	String cp = request.getContextPath();
%>
<script>
	function check() {
		if (document.search.keyword.value == "") {
			alert("검색어를 입력하세요.");
			document.search.keyword.focus();
			return;
		}
		document.search.submit();
	}
</script>
<link href="/funiture/resources/user/css/boardList.css?ver=1"
	rel="stylesheet" type="text/css" media="all" />
<div class="grow">
	<div class="container">
		<h2>boardList</h2>
	</div>
</div>
<div id="contents">
	<div class="inner">
		<div class="titleArea"></div>
		<div
			class="xans-element- xans-myshop xans-myshop-boardhistorytab ec-base-tab ">
			<ul class="menu">
				<li class="selected"><a href="<%=cp%>/mypage/myqnaList">상품문의</a></li>
				<li class=""><a href="<%=cp%>/mypage/mycubList">주문제작</a></li>
				<li class=""><a href="<%=cp%>/mypage/mycomList">상품후기</a></li>
			</ul>
		</div>
	</div>

	<div class="xans-element- xans-myshop xans-myshop-boardpackage ">
		<div
			class="xans-element- xans-myshop xans-myshop-boardlist ec-base-table typeList gBorder gBlank10">
			<!--
            $count = 10
            $relation_post = yes
        -->
			<table border="1" summary="">
				<colgroup
					class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
					<col style="width: 90px;">
					<col style="width: 140px;">
					<col style="width: auto;">
					<col style="width: 100px;">
					<col style="width: 150px;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">분류</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody class="">
					<%-- <tr>
						<td colspan="6" class="message"><c:if
								test="${fn:length(qnaList) le 0}">
								<center>등록된 게시물이 없습니다</center>
							</c:if></td>
					</tr> --%>
				</tbody>
				<tbody class="displaynone center">
				</tbody>
				<tbody class=" center">
					<c:forEach var="myqnaList" items="${myqnaList}" varStatus="stat">
						<tr class="xans-record-">
							<td>${stat.count}</td>
							<td>상품문의</a></td>
							<td class="left subject"><a
								href="/funiture/qna/view?qna_no=${myqnaList.qna_no}">${myqnaList.subject}</a>

							</td>
							<td>${member.name}</td>
							<td><span class="txtNum"><fmt:formatDate
										value="${myqnaList.reg_date}" pattern="YYYY-MM-dd" /></span></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${fn:length(myqnaList) le 0}">
				<br />
				<center>문의 내역이 없습니다.</center>
				<br />
			</c:if>
		</div>
		<div class="page">${pageHtml}</div>
	</div>



	<form id="boardSearchForm" name="search"
		action="/funiture/mypage/myqnaList" method="post">
		<div class="xans-element- xans-myshop xans-myshop-boardlistsearch ">
			<fieldset class="boardSearch">
				<select id="keyField" name="keyField" fw-filter="" fw-label=""
					fw-msg="">
					<option value="0">제목</option>
					<option value="1">내용</option>
				</select> <input type="text" size="16" name="keyword" value=""> <input
					type="button" value="검색" onClick="check()">
			</fieldset>
		</div>
	</form>
	<!-- 
		<form id="boardSearchForm" name="" action="/myshop/board_list.html"
		method="get" enctype="multipart/form-data">
		<input id="board_no" name="board_no" value="" type="hidden"> <input
			id="page" name="page" value="1" type="hidden"> <input
			id="board_sort" name="board_sort" value="" type="hidden">
			 
		<div class="xans-element- xans-myshop xans-myshop-boardlistsearch ">
			<fieldset class="boardSearch">
				<select id="search_key" name="search_key" fw-filter="" fw-label=""
					fw-msg="">
					<option value="subject">제목</option>
					<option value="content">내용</option>
					<option value="writer_name">글쓴이</option>
					<option value="member_id">아이디</option>
				</select> <input id="search" name="search" fw-filter="" fw-label="" fw-msg=""
					class="inputTypeText" placeholder="" value="" type="text">
				<a href="#none" onclick="BOARD.form_submit('boardSearchForm');"><img
					src="//img.echosting.cafe24.com/skin/base_ko_KR/board/btn_find.gif"
					alt="찾기"></a>
			</fieldset>
		</div>
	</form>
	 -->
</div>
