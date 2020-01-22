<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String cp = request.getContextPath(); %>

	<!-- grow -->
	<div class="grow">
		<div class="container">
			<h2>Login</h2>
		</div>
	</div>
	<!-- grow -->
<!--content-->
<div class="container">
		<div class="account">
		<div class="account-pass">
		<div class="col-md-8 account-top">
			<form action="<%=cp %>/member/login" method="post" name="loginform">
				
			<div> 	
				<span>ID</span>
				<input type="text" id="id" name="id" placeholder="ID" > 
			</div>
			<div> 
				<span >Password</span>
				<input type="password" id="pw" name="password" placeholder="Password" >
			</div>			
			<div align="right"><p><a href="findIdform" title="아이디찾기"> 아이디찾기</a>&nbsp;
			<a href="findPwform" title="비밀번호찾기"> 비밀번호찾기</a></p></div>
			
				<input type="submit" value="로그인">
			</form>

			<form action="<%=cp %>/member/joinAgree" method="post" name="joinform">
			<input type="submit" value="회원가입">
		</div>
						
		
		<div class="col-md-4 left-account ">
			<a href="/funiture/goods/goodsView?goods_no=159"><img class="img-responsive " src="/funiture/resources/goodsImage/1519019320497_688_shop1_439441.jpg" alt=""></a>
			<div class="five">
			<h2>25% </h2><span>discount</span>
			</div>
			 <a href="register.html" class="create">Today's Product</a> 
<div class="clearfix"> </div>
		</div>
	<div class="clearfix"> </div>
	</div>
	</div>

</div>
</body>
</html>
			