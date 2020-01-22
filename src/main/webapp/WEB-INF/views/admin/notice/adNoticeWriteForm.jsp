<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href="/funiture/resources/user/css/style.css" rel="stylesheet">
<link href="/funiture/resources/board/boardCss.css" rel="stylesheet">
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">공지사항 글쓰기</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
<!--content-->
				<div class="col-md-12 contact-grid">
				<form:errors path="model"/>
					<form:form commandName="model" action="writeForm" method="post">
						<form:input type="hidden" name="id_admin" path="id_admin" value="${id_admin}"/>

						<form:input type="text" name="subject" path="subject"/>
						<form:errors path="subject"/>
						<textarea cols="77" rows="6" name="content"></textarea>
						<form:errors path="content"/>
						<div ALIGN = "CENTER">
						<div class="send">
							<input type="submit" value="등록">
							<input type="button" value="취소" id="reset" onclick="javascript:location.href='list';">
						</div>
						</div>
					</form:form>
				</div>
				<div class="clearfix"> </div>
			</div>

<!--//content-->
