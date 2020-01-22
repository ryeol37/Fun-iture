<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href="/funiture/resources/user/css/style.css" rel="stylesheet">
<link href="/funiture/resources/board/boardCss.css" rel="stylesheet">
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">공지사항 수정</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
<!--content-->
				
				<div class="col-md-12 contact-grid">
					<form action="modify" method="post">
					<input type="hidden" name="no" value="${modify.no}">
					<%-- <input type="hidden" name="currentPage" value="${currentPage}"/> --%>
						<%-- <input type="text" name="id_admin" value="${modify.id_admin}" value="Name" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='Name';}"> --%>

						<input type="text" name="subject" value="${modify.subject}">
						
						<textarea cols="77" rows="6" name="content">${modify.content}</textarea>
						<div ALIGN = "CENTER">
						<!-- <div class="send"> -->
							
						</form>
						<!-- </div> -->
						<div class="send">
						<input type="submit" value="수정">
						<input type="button" value="취소" id="reset" onclick="javascript:location.href='list';">
						</div>
						</div>
				</div>
				<div class="clearfix"> </div>
			</div>

<!--//content-->
