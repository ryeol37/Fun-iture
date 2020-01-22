<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<title>FUN-ITURE:::주문제작 후기를 남겨주세요.</title>
<link href="/funiture/resources/user/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="/funiture/resources/user/css/style.css" rel="stylesheet" type="text/css" media="all" />	
<link href="/funiture/resources/custom/css/customKHR.css" rel="stylesheet" type="text/css" media="all" />
<script src="/funiture/resources/custom/js/customKHR.js"></script>
</head>
<body>
<!-- products -->
	<!-- grow -->
	<div class="grow">
		<div class="container">
			<h5>주문 제작 후기를 작성해주세요.</h5>
		</div>
	</div>
	<!-- grow -->
<div class="contact">
	<div class="container">
		<div class="contact-form">
			<div class="col-md-8 contact-grid">
				<form:form name="form" method="post" enctype="multipart/form-data"
					onsubmit="return go('reviewWrite')">
					<input type="hidden" name="cu_no" value="${cu_no}"/>
					<label>제목</label>
					<input type="text" name="subject" value=""
					style="margin-bottom:15px" placeholder="5자 이상 작성해주세요.">
					<label style="margin-bottom:5px">이미지 - <small>구매하신 상품을 설치한 사진을 올려주세요! (.jpg, .png 형식)</small></label>
					<input type="file" name="re_img" style="margin-bottom:15px">
					<label>내용</label>
					<textarea cols="77" name="com" rows="6" placeholder="상품 후기를 남겨주세요.(10자 이상)"></textarea>
					<div class="send">
						<input type="submit" value="후기 등록하기" style="margin-top:30px">
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>
<!--//content-->
</body>
</html>
<!-- 770 x 620 -->	