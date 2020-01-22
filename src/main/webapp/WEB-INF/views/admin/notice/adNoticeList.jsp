<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/funiture/resources/user/css/style.css" rel="stylesheet">
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">공지사항</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#Write").click(function() {
				// 페이지 주소 변경(이동)
				location.href = "writeForm";
			});
		});
	</script> 
	
	<div class="panel-body">
		<table width="100%"
			class="table table-striped table-bordered table-hover"
			id="dataTables-example">
			
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${list}">
						<c:url var="viewURL" value="/adnotice/view">
							<c:param name="no" value="${list.no}"/>
						</c:url>
					<tr class="odd gradeX">
						<td class="center">${list.no}</td>
						<td class="center"><a
							href="${viewURL}">${list.subject}</a></td>
						<td class="center">${list.id_admin}</td>
						<td class="center"><fmt:formatDate value="${list.reg_date}"
								pattern="yyyy-MM-dd" /></td>
						<td class="center">${list.status}</td>
					</tr>
				</c:forEach>
				
			</tbody>
		</table>
		<c:if test="${fn:length(list) le 0}">
				등록된 글이 없습니다.
			</c:if>
		<br/>
		<div ALIGN = "RIGHT">
		<div class="send">
		<input type="submit" value="글쓰기" id="Write">
		</div>
		<!-- <button type="button" class="btn btn-primary" id="Write">글쓰기</button> -->
		<!-- <button id="write" type="button" class="btn btn-primary"onclick="javascript:location.href='writeForm/';">글쓰기</button> -->
	</div>
</div>

