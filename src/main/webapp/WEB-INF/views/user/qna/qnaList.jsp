<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/funiture/resources/page.css" rel="stylesheet">
<!-- grow -->
	<div class="grow">
		<div class="container">
			<h2>QNA</h2>
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
					<th>구분</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<!-- <th>상태</th> -->
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${list}">
					<tr class="odd gradeX">
						<td class="center">${list.qna_no}</td>
						<td class="center">${list.category}</td>
						<td class="center">
						<c:if test="${session_id !=list.id && session_id !='admin' }">
						${list.subject}
						<c:if test="${list.count_q > 0}">
						<span style="color:red;">(${list.count_q})</span>
						</c:if>
						</c:if>
						<c:if test="${session_id == list.id||session_id=='admin'}">
						<a href="<c:url value='/qna/view?qna_no=${list.qna_no}'/>">${list.subject}</a>
						<c:if test="${list.count_q > 0}">
						<span style="color:red;">(${list.count_q})</span>
						</c:if>
						</c:if>
						</td>
						<td class="center">${list.id}</td>
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
		<c:if test="${session_id != null }">
		<div align="right">
		<div class="send">
			<input type="submit" value="글쓰기" onclick="javascript:location.href='writeForm';">
		</div>
		</div>
		</c:if>
		<div class="page">
		${pageHtml}
	</div>
	</div>
		</div>

