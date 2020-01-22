<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">원데이 클래스 리스트</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-6">
			<div class="panel panel-default">
				<div class="panel-heading">강의 리스트 확인, 강의 등록</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>번호</th>
									<th>강의명</th>
									<th>글쓴이</th>
									<th>강의 등록 날짜</th>
								</tr>
							</thead>
							<tbody>
								<!-- 강의 리스트 페이징에 맞게 끝까지 불러오기 -->
								<c:forEach var="list" items="${list}" varStatus="stat">
									<c:url var="viewURL" value="/oneday/admodifyForm">
										<c:param name="oneday_no" value="${list.oneday_no }" />
										<%-- <c:param name="currentPage" value="${currentPage }" /> --%>
									</c:url>
									<tr>
										<td>${list.oneday_no}</td>
										<!-- 제목 클릭하면 상세 정보를 확인할 수 있고 수정할 수 있는 폼으로 넘어감 -->
										<td><a href="${viewURL}" class="list">${list.name }</td>
										<td>${list.id_admin }</td>
										<!-- 날짜 양식에 맞게 불러옴 -->
										<td><fmt:formatDate value="${list.reg_date}"
												pattern="yyyy/MM/dd"></fmt:formatDate></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="page" >${pagingHtml}</div>
					<!-- 버튼 클릭하면 강의 등록으로 넘어감 -->
					<a href="/funiture/oneday/adwriteForm"><button type="button"
							class="btn btn-primary btn-lg">강좌 등록</button> <!-- /.table-responsive -->
						
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->

		</div>
	</div>
</div>
