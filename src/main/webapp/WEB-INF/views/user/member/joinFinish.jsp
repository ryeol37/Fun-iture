<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/funiture/resources/user/css/common.css" rel="stylesheet" type="text/css" media="all" />
<% String cp = request.getContextPath(); %>

	<div class="grow">
		<div class="container">
			<h2>Join</h2>
		</div>
	</div>
	
<div class="sign_grp">
	<div class="step">
		<ul>
			<li>1. 약관동의</li>
			<li>2. 회원정보입력</li>
			<li class="on">3. 가입완료</li>
		</ul>
	</div>
	<div class="sign_box">
		<div class="step_03">
			<p class="success"><strong>${member.name}</strong> 고객님 <strong>가입</strong>이 <strong>완료</strong>되었습니다.</p>
			<p>Fun-iture에 가입해 주셔서 감사합니다.</p>
		</div>
	</div>

	<div class="btn_type_04">
		<a href="<%=cp %>/main" class="btn btnC_04 btnF_02">
			<span>메인으로</span>
		</a>
	</div>
</div>