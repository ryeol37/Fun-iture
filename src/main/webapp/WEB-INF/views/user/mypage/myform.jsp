<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<link href="/funiture/resources/user/css/myform.css" rel="stylesheet"
	type="text/css" media="all" />
<div class="grow">
	<div class="container">
		<h2>MyPage</h2>
	</div>
</div>
<div id="contents">
	<div class="inner">
		<div class="titleArea"></div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<p>[ ${member.id} ] 님의 적립금은 [ ${member.point} ] 원 입니다.</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">나의 주문처리 현황</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>입금 전</th>
									<th>배송준비중</th>
									<th>배송중</th>
									<th>배송완료</th>
									<th>취소/교환/반품</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${statusCount1}</td>
									<td>${statusCount2}</td>
									<td>${statusCount3}</td>
									<td>${statusCount4}</td>
									<td>${statusCount5}</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- <div class="col-lg-4">
				<div class="panel panel-default">
					<div class="panel-heading">나의 주문처리 현황</div>
					<div class="panel-body">
						<p>입금 전, 배송준비중, 배송중, 배송완료, 취소, 교환, 반품 부분</p>
					</div>
				</div>
			</div> -->
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<!-- /.panel-heading -->
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th><a href="<%=cp%>/mypage/orderList">order 주문내역 조회</a></th>
									<th><a href="<%=cp%>/member/memberModifyform?id=${session_id}">profile 회원정보</a></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>고객님께서 주문하신 상품의 주문내역을 확인하실 수 있습니다.
									</td>
									<td>회원이신 고객님의 개인정보를 관리하는 공간입니다.<br>개인정보를 최신 정보로 유지하시면
										보다 간편히 쇼핑을 즐기실 수 있습니다.
									</td>
								</tr>
							</tbody>

							<thead>
								<tr>
									<th><a href="<%=cp%>/mypage/likeList">like 관심상품</th>
									<th><a href="<%=cp%>/mypage/myqnaList">board 게시물 관리</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>관심상품으로 등록하신 상품의 목록을 보여드립니다.</td>
									<td>고객님께서 작성하신 게시물을 관리하는 공간입니다.<br>고객님께서 작성하신 글을 한눈에
										관리하실 수 있습니다.
									</td>
								</tr>
							</tbody>
							
							<thead>
								<tr>
									<th><a href="<%=cp%>/mypage/ordermadeList">made 제작내역 조회</th>
									<th><a href="<%=cp%>/member/Deleteform">delete 회원탈퇴</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>고객님께서 제작의뢰 및 원데이 신청 내역을 확인하실 수 있습니다.</td>
									<td>고객님께서 비밀번호를 입력하여 탈퇴를 하실 수 있습니다.</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
