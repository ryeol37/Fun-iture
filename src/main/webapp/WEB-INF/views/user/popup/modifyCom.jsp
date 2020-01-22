<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script>
// 댓글 수정
function center(){ 
	var x,y; 
	
	if (self.innerHeight) { // IE 외 모든 브라우저 
	x = (screen.availWidth - self.innerWidth) / 2; 
	y = (screen.availHeight - self.innerHeight) / 2; 
	} else if (document.documentElement && document.documentElement.clientHeight) { // Explorer 6 Strict 모드 
	x = (screen.availWidth - document.documentElement.clientWidth) / 2; 
	y = (screen.availHeight - document.documentElement.clientHeight) / 2; 
	} else if (document.body) { // 다른 IE 브라우저( IE < 6) 
	x = (screen.availWidth - document.body.clientWidth) / 2; 
	y = (screen.availHeight - document.body.clientHeight) / 2; 
	} 
	window.moveTo(x,y); 
	} 
center();
function send(){
	var form = document.modify;
	
	if(form.com.value==""){
		alert("글 내용을 입력해주세요.");
		form.com.focus();
		return;
	}
	form.action="modifycomment";
	form.submit();
	self.close();
	
}

</script>
<body>
	<div id="updatecom">
		<br> <b><font size="5" color="gray">댓글 수정</font></b>
		<hr size="1" width="100%">
		
		<div id="updateForm">
			<form name="modify" target="update" method="post">
				<input type="hidden" name="no" value="${model.no}">
				<input type="hidden" name="qna_no" value="${model.qna_no}">
				<textarea rows="7" cols="70" name="com">${model.com}</textarea>
				<br> <br>
				<input type="button" value="등록" onclick="send()">
				<input type="button" value="취소" onclick="window.close()">
				
			</form>
		</div>
	</div>
</body>
</html>