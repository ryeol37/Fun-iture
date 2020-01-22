<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/funiture/resources/custom/css/customKHR.css" rel="stylesheet" type="text/css" media="all" />
	<!-- grow -->
<div class="grow">
	<div class="container">
		<h2>ERROR</h2>
	</div>
</div>
<!-- grow -->
<div class="pro-du">
	<div class="container">
		<div style="padding-bottom:30px">
			예상치 못한 문제로 예외가 발생하였습니다. 다시 시도해주세요.
		</div>
		<div>
			<a href="#" onclick="go_back()"
			style="color:#fff;background:#800000;padding:0.4em 0.8em;font-size:0.9em" >돌아가기</a>
		</div>
	</div>
</div>
<script type="text/javascript">
function go_back(){
	history.back(-1);
}
</script>