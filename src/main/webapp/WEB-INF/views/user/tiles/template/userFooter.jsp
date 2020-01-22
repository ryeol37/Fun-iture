<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="footer w3layouts">
				<div class="container">
			<div class="footer-top-at w3">
			
				<div class="col-md-3 amet-sed w3l">
				<h4>MORE INFO</h4>
				<ul class="nav-bottom">
						<li><a href="#">How to order</a></li>
						<li><a href="#">FAQ</a></li>
						<li><a href="contact.html">Location</a></li>
						<li><a href="#">Shipping</a></li>
						<li><a href="#">Membership</a></li>	
					</ul>	
				</div>
				<div class="col-md-3 amet-sed w3ls">
					<h4>CATEGORIES</h4>
					<ul class="nav-bottom">
						<li><a href="#">READY MADE</a></li>
						<li><a href="#">ORDER MADE</a></li>
						<li><a href="#">ONEDAY CLASS</a></li>
					</ul>
					
				</div>
				<div class="col-md-3 amet-sed agileits">
					<h4>NEWSLETTER</h4>
					<div class="stay agileinfo">
						<div class="stay-left wthree">
							<form action="insert" method="post">
								<input type="text" name="email" id="email" placeholder="Enter your email">
							</form>
						</div>
						<div class="btn-1 w3-agileits">
						<br>
								<input type="submit" value="등록" id="sendEmail">
						</div>
							<div class="clearfix"> </div>
			</div>
				</div>
					
				<div class="col-md-3 amet-sed agileits-w3layouts">
				<h4>CONTACT US</h4>
					<p>Fun-iture can do </p>
					<p>What you think now</p>
					<p>office :  Fun-iture Factory</p>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
		<div class="footer-class w3-agile">
		<p>© 2018 FUN-ITURE . All Rights Reserved | Design by  <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
		</div>
		</div>
</body>

<script type="text/javascript">
	$(function(){
		$('#sendEmail').click(function(){ // sendEmail 버튼을 누르면
			var value = $('#email').val() // id가 email인 값을 받음.
			/* alert(value); // 입력된 값 출력 test */
			$.post('/funiture/mailing/insert',{ // controller에 받은 email을 처리할 클래스의 매핑 url
				email : value // 처리 클래스에서 parameter로 받을 값.
			}, function(){ 
				alert("등록되었습니다.")
				/* alert(1); function 실행되는지 확인*/ 
				$('#email').val(''); // id가 email인 값을 빈 값으로 받아서 적용. => 입력처리 후 빈칸으로 만듬.
			})
		})
	})
</script>

