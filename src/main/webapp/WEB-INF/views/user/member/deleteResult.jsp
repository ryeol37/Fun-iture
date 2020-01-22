<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">

	window.onload = function(){
		var chk = ${deleteCheck}
		if(chk == 1){
			alert('정상적으로 탈퇴처리가 되었습니다.');
			window.location.href = '/funiture/main';
		}
		if(chk == -1){
			alert('비밀번호가 틀렸습니다');
			history.back();
		}
	}
</script>