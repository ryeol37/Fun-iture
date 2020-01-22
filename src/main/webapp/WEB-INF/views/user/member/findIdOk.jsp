<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<div class="tac">
	<h3 class="sub_tit">아이디 찾기</h3>
	<br>
	<p class="fz15">${member.name}님의 아이디는 <strong>${member.id}</Strong>입니다!!</p>
	<div class="btn_type_04">
		<a href="<%=cp %>/main" class="btn btnC_03 btnF_02 mr10">
			<span>메인으로</span>
		</a>
		<a href="<%=cp %>/member/loginform" class="btn btnC_04 btnF_02">
			<span>로그인</span>
		</a>
	</div>
</div>