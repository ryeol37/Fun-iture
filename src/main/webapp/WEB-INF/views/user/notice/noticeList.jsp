<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/funiture/resources/page.css" rel="stylesheet">
<link href="/funiture/resources/board/boardCss.css" rel="stylesheet">
<!-- grow -->
	<div class="grow">
		<div class="container">
			<h2>공지사항</h2>
		</div>
	</div>
	<!-- grow -->
<!--content-->
<div class=" container">
<div class=" register">
		<table width="100%"
			class="table table-striped table-bordered table-hover"
			id="dataTables-example">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<!-- <th>상태</th> -->
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${list}">
						<c:url var="viewURL" value="/notice/view">
							<c:param name="no" value="${list.no}"/>
						</c:url>
					<tr class="odd gradeX">
						<td class="center">${list.no}</td>
						<td class="center"><a
							href="${viewURL}">${list.subject}</a></td>
						<td class="center">${list.id_admin}</td>
						<td class="center"><fmt:formatDate value="${list.reg_date}"
								pattern="yyyy-MM-dd" /></td>
						<%-- <td class="center">${list.status}</td> --%>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${fn:length(list) le 0}">
				등록된 글이 없습니다.
			</c:if>
		<!-- 검색 -->
			<div align="center">
					<div class="abc">
						<form>
							<div class="field_box">
								<select id="searchOption" name="searchOption" title="검색 조건 선택" class="comm_sel comm_sel_type1" style="width:50px;">
									<option value="0">제목</option>
									<option value="1">내용</option>
								</select>
								<input type="text" name="search" value="${search}" title="검색어 입력">
								<input type="button" class="add-cart item_add" value="검색">
							</div>
							</form>
					</div>
					<!-- //검색 -->
		</div>
		<div align="right">
		<div class="page">
		${pageHtml}
	</div>
	</div>
		</div>
</div>

