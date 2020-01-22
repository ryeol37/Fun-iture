<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="/funiture/resources/cuboard/css/customBKHR.css" rel="stylesheet" type="text/css" media="all" />
<link href="/funiture/resources/page.css" rel="stylesheet" type="text/css" media="all" />

	<!-- grow -->
<div class="grow">
	<div class="container">
		<h2>견적 문의</h2>
	</div>
</div>
<!-- grow -->
<div class="product">
	<div class="container">
		<div class="customDesc">
		★ 견적 문의를 원하시면 <a href="../custom/list">ORDER MADE</a> 페이지에서 원하는 상품을 확인한 후 견적 문의 폼을 등록하여 주시기 바랍니다.
		</div>
		<div class="col-lg-12">
			<div class="table-responsive table-bordered">
				<table class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>진행 상태</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${list}" var="row">
						<tr>
							<td>${row.cub_no}</td>
							<td>
								<c:if test="${session_id==row.id || session_id=='admin'}">
									<a href="view?cub_no=${row.cub_no}&list=${listPage}">${row.subject}</a>
								</c:if>
								<c:if test="${session_id!=row.id && session_id!='admin'}">
								${row.subject} <p class="fa fa-lock"></p>
								</c:if>
							</td>
							<td>${row.id}</td>
							<td><fmt:formatDate value="${row.reg_date}" pattern="yyyy-MM-dd"/></td>
							<td>
								<c:if test="${row.com==0}">
								<font color="gray">미답변</font>
								</c:if>
								<c:if test="${row.com>0 && row.price==0}">
								<font color="#800000"><b>협의중</b></font>
								</c:if>
								<c:if test="${row.price>0}">
								<font color="#800000">견적완료</font>
								</c:if>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- /.table-responsive -->
		</div>
		<!-- /.col-lg-6 -->
		<div class="clearfix"></div>
	</div>
	<div class="page">
		${pageHtml}
	</div>
</div>
<!--//content-->
