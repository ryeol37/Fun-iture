<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- grow -->
<div class="grow">
	<div class="container">
		<h2>QNA 수정</h2>
	</div>
</div>
<!-- grow -->
<!--content-->
<div class="contact">

	<div class="container">
		<div class="contact-form">

			<div class="col-md-12 contact-grid">
				<form action="modify" method="post">
					<input type="hidden" name="qna_no" value="${modify.qna_no}">
					<input type="hidden" name="id" value="${modify.id}">
					<div class="form-group">
					<!-- select 태그에 value 속성은 안씀. -->
						<select class="form-control" name="category">
							<option value="${modify.category}">${modify.category}</option>
						</select>
					</div>
					<input type="text" name="subject" value="${modify.subject}">

					<textarea cols="77" rows="6" name="content" value=" ">${modify.content}</textarea>
					<div ALIGN="CENTER">
						<div class="send">
							<input type="submit" value="등록"> <input type="submit"
								value="취소" onclick="javascript:location.href='list';">
						</div>
					</div>
				</form>
			</div>
		</div>
</div>

<!--//content-->
