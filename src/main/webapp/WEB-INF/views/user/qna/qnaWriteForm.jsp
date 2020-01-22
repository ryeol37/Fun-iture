<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href="/funiture/resources/board/boardCss.css" rel="stylesheet">
<!-- grow -->
<div class="grow">
	<div class="container">
		<h2>QNA 글쓰기</h2>
	</div>
</div>
<!-- grow -->
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<!-- <script>
	function sub(){
		var x = writeForm.select.value;
		$.ajax({
			type: "POST", // Get,Post 방식(default:Get)
			url: "list.jsp", // 요청이 전송되는 URL
			data : "qna="+x,  // 전송하는 값
			success : result // 성공시 이벤트 핸들러
			}
		);
	}
</script> -->
<!--content-->
<div class="contact">

	<div class="container">
		<div class="contact-form">

			<div class="col-md-12 contact-grid">
			<form:errors path="model"/>
				<form:form commandName="model" action="writeForm" method="post"> 
					<%-- <form:input type="hidden" name="id" id= "id" path="id" value="${id}"/> --%>
					<div class="form-group">
						<form:select class="form-control" name="category" path="category" items="${category}" onchange="sub();"/>
					</div>
					<form:input type="text" name="subject"  path="subject" onfocus="this.value='';"/>
					<form:errors path="subject"/>
					<textarea cols="77" rows="6" name="content" value=" " onfocus="this.value='';" ></textarea>
					<form:errors path="content"/>
					<div ALIGN="CENTER">
						<div class="send">
							<input type="submit" value="등록"> 
							<input type="button" value="취소" id="reset" onclick="javascript:location.href='list';">
						</div>
					</div>
				</form:form>
			</div>
		</div>
	
	</div>
</div>

<!--//content-->
