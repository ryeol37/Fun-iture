<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script>
function send(){
	var form = document.write;
	
	if(form.content.value==""){
		alert("내용을 입력해주세요.");
		form.content.focus();
		return false;
	} else {
		if(confirm("확인을 누르면 메일이 전송됩니다.")==true){
			return true;
		} else {
			return false;
		}
		
	}
}
</script>
</head>
				<div class="col-md-12 contact-grid">
					<form action="write" method="post" name="write" onsubmit="return send()">
						<input type="text" name="email" value="${email}">
						<input type="text" name="subject">
						<textarea cols="77" rows="6" name="content"></textarea>
						<div class="send">
							<input type="submit" value="Send">
						</div>
						</form>
						</div>
</html>
<!--//content-->
