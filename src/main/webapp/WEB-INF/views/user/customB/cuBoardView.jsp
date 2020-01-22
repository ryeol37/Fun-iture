<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="/funiture/resources/cuboard/css/customBKHR.css" rel="stylesheet" type="text/css" media="all" />
<script src="/funiture/resources/cuboard/js/customBKHR.js"></script>

	<!-- grow -->
<div class="grow">
	<div class="container">
		<h2>견적 문의</h2>
	</div>
</div>
<c:if test="${session_id=='admin'}">
<div>
	<table id="list">
		<tr>
		<td><a href="../ad/cuboard/list">관리자 목록으로</a></td>
		</tr>
	</table>
</div>
</c:if>
<!-- grow -->
<div class="product">
	<div class="container">
			<c:if test="${item.cub_save!=null}">
			<div class="col-lg-8 col-md-8">
			</c:if>
			<c:if test="${item.cub_save==null}">
			<div class="col-lg-8 col-md-8 col-lg-offset-2 col-md-offset-2">
			</c:if>
				<div class="panel panel-default">
					<div class="panel-top">
					ID : ${item.id} 님이 남기신 견적 문의&nbsp;&nbsp;&nbsp;
					<small>(<fmt:formatDate value="${item.reg_date}" pattern="yyyy-MM-dd HH:mm"/>)</small>
					</div>
					<div class="panel-body">
						<div class="col-md-12 contact-grid">
							<h3>제목 : ${item.subject}</h3>
							<div>
								<span>주문제작 상품 : ${item.name}</span>
								<span data-toggle="modal" data-target="#defaultOption">요청하신 기본 옵션
								<p class="fa fa-photo"></p></span>
								<p style="padding-bottom:30px">${item.options}</p>
								<span>기타 추가 요청사항</span>
								<p>${item.content}</p>
							</div>
							<c:if test="${session_id==item.id && item.price=='0'}">
							<div style="text-align:right">
							<a href="#" class="modi">수정하기</a>
							<a href="#" class="dele">삭제하기</a>
							</div>
							</c:if>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<c:forEach items="${cubCom}" var="row">
				<c:if test="${row.id=='admin'}">
				<div class="panel panel-default">
					<div class="panel-top">
					<p class="fa fa-share"></p> Funiture의 feedback &nbsp;&nbsp;&nbsp;&nbsp;
					<small>(<fmt:formatDate value="${row.com_reg_date}" pattern="yyyy-MM-dd HH:mm"/>)</small>
					</div>
					<div class="panel-body" style="background-color:#fafafa">
				</c:if>
				<c:if test="${row.id!='admin'}">
				<div class="panel panel-default">
					<div class="panel-top">
					<p class="fa fa-reply"></p> ${row.id}의 feedback &nbsp;&nbsp;&nbsp;&nbsp;
					<small>(<fmt:formatDate value="${row.com_reg_date}" pattern="yyyy-MM-dd HH:mm"/>)</small>
					</div>
					<div class="panel-body">
				</c:if>
						<div class="col-md-12 contact-grid">
							<div>
								<p>${row.com}</p>
							</div>
							<c:if test="${session_id==row.id}">
							<div style="text-align:right">
							<a href="delcom?no=${row.no}&cub_no=${item.cub_no}" onclick="return delcom()">삭제</a>
							</div>
							</c:if>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				</c:forEach>
				<div class="panel panel-default">
					<div class="panel-top">Comment Form</div>
					<div class="panel-body">
						<div class="col-md-12 contact-grid">
							<div>
								<form action="com" method="post" name="comment"
								onsubmit="return blank()">
								<input type="hidden" name="cub_no" value="${item.cub_no}"/>
								<input type="hidden" name="cu_no" value="${item.cu_no}"/>
								<span style="padding-bottom:5px">FeedBack : 
								<c:if test="${session_id=='admin'}">
								견적협의<p class="fa fa-check-square-o" id="reply" style="padding:0px 1px"></p>
								최종견적<p class="fa fa-square-o" id="final"></p>
								</c:if>
								</span>
								<textarea cols="50" rows="4" name="com" id="com" style="display:block"></textarea>
								<div style="display:none" id="comFinal">
									<span>최종 가격</span>
									<input type="text" name="price"
									onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'/>
									<span>최종 옵션</span>
									<input type="text" name="options"/>
								</div>
								<input type="submit" name="comment" value="등록하기"/>
								</form>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
			<c:if test="${item.cub_save!=null}">
			<div class="col-lg-4 col-md-4">
				<div class="panel panel-default">
					<div class="panel-top">ID : ${item.id} 님이 남기신 이미지</div>
					<div class="panel-body">
				<img class="img-responsive" style="padding-bottom:30px"
				src="/funiture/resources/cuboard/cuboardImg/${item.cub_save}" alt=""
				data-toggle="modal" data-target="#userImage">
					</div>
				</div>
			</div>
			<!-- /.col-lg-4 col-md-4 -->
			</c:if>
			<div class="col-md-12 register-bottom-grid"
			style="padding-top:20px;vertical-align:middle;text-align:center">
				<a href="#" class="list"><button type="button" id="list">목록으로</button></a>
			</div>
			<div class="clearfix"></div>
	</div>
</div>
<!--//content-->
<%@ include file="modalOfView.jsp" %>
<script src="/funiture/resources/admin/js/bootstrap.min.js"></script>
<script type="text/javascript">
function delcom(){
	var conf = confirm("댓글을 삭제하시겠습니까?");
	if(!conf){return false;}
}
$(document).ready(function(){
	
	if(${item.price}!=0 || ${session_id=='admin'}){
		$("input[value=확인]").attr("disabled","ture");
		$("input[value=확인]").attr("title","이미 확인하셨습니다.");
	}
		
	$(".list").click(function(e){
		e.preventDefault();
		location.href='list?page='+${listPage};
	});
	$(".modi").click(function(e){
		e.preventDefault();
		var conf = confirm("견적문의 글을 수정하시겠습니까?");
		if(!conf){return false;}
		location.href='modifyForm?cub_no='+${item.cub_no}+'&page='+${listPage};
	});
	$(".dele").click(function(e){
		e.preventDefault();
		var conf = confirm("견적문의 글을 삭제하시겠습니까?");
		if(!conf){return false;}
		location.href='delete?cub_no='+${item.cub_no};
	});
	$("[name=confirm]").click(function(e){
		e.preventDefault();
		chkBlank();
	});
	function chkBlank(){
		var status_no = $("input[name=status_no]").val();
		if(status_no==2){
			var error = 0;
			for(var i=0; i<5; i++){
				var length = $("#f2").find("[size=4]:eq("+i+")").val().length;
				if(length!=4){
					error+=1;
				}
			}
			for(var i=0; i<2; i++){
				var length = $("#f2").find("[size=2]:eq("+i+")").val().length;
				if(length!=2){
					error+=1;
				}
			}
			var length3 = $("#f2").find("[size=3]").val().length;
			if(length3!=3){
				error+=1;
			}
			
			if(error>0){
				alert("결제정보를 정확하게 입력해주세요.");
				return false;
			}
		}
		var memoInput = $("input[name=memoInput]").val();
		$("input[name=memo]").val(memoInput);
		document.form.method = 'post';
		document.form.action = 'addOrders';
		document.form.submit();
	}
	
	//관리자 댓글 종류
	$("#reply").click(function(){
		$("#com").attr("style","display:block");
		$("#comFinal").attr("style","display:none");
		$("#reply").attr("class","fa fa-check-square-o");
		$("#final").attr("class","fa fa-square-o");
	});
	$("#final").click(function(){
		$("#com").attr("style","display:none");
		$("#comFinal").attr("style","display:block");
		$("#final").attr("class","fa fa-check-square-o");
		$("#reply").attr("class","fa fa-square-o");
	});
	//모달
	$("#1").click(function(){
		$("input[name=status_no]").val(1);
		$("#f1").attr("style","display:block");
		$("#f2").attr("style","display:none");
	});
	$("#2").click(function(){
		$("input[name=status_no]").val(2);
		$("#f1").attr("style","display:none");
		$("#f2").attr("style","display:block");
	});
});
</script>
