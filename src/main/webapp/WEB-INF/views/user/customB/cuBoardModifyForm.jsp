<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/funiture/resources/cuboard/css/customBKHR.css"
	rel="stylesheet" type="text/css" media="all" />
<script src="/funiture/resources/cuboard/js/customBKHR.js"></script>

		<!-- grow -->
<div class="grow">
	<div class="container">
		<h2>견적 문의 게시글 수정</h2>
	</div>
</div>
<!-- grow -->
<div class="product">
	<div class="container">
		<form action="modify" method="post" enctype="multipart/form-data"
		onsubmit="return checkValues()" name="frm">
		<input type="hidden" name="optionDefault" value="${item.options}"/> 
		<input type="hidden" name="cub_no" value="${item.cub_no}"/> 
			<div class="col-lg-6 col-md-6">
				<div class="panel panel-default">
					<div class="panel-top">선택하신 상품 : ${item.name}</div>
					<div class="panel-heading">게시글 관련</div>
					<div class="panel-body">
						<div class="col-md-12 contact-grid">
							<h3>Article infomation</h3>
							<div>
								<span>제목</span>
								<input type="text" name="subject" value="${item.subject}"/>
								<span>내용</span>
								<textarea cols="50" rows="6" name="content">${item.content}</textarea>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="panel-footer">Customizing Service : 더 원하시는 조건이
						있다면 입력해주세요!</div>
				</div>
			</div>
			<!-- /.col-lg-6 -->
			<div class="col-lg-6 col-md-6">
				<div class="panel panel-default">
					<div class="panel-top">선택하신 상품 : ${item.name}</div>
					<div class="panel-heading">상품 옵션 및 파일 업로드</div>
					<div class="panel-body">
						<div class="col-md-12 register-top-grid" id="input-option">
							<input type="hidden" name="optionDefault" value="${item.options}"/>
							<h3>Customizing-options</h3>
							<div style="padding: 10px 0px" id="frm">
								<span>옵션 1 : 단수(단위:ea)</span>
								<input type="text" name="option" value="" 
								onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'/>
							</div>
						</div>
						<div class="col-md-12 register-top-grid">
							<h3>File upload</h3>
							<div style="padding-bottom: 20px">
								<span>첨부파일(.jpg 또는 .png 또는 .zip 형식으로 업로드해주세요.)<br/>기존 파일 : ${item.cub_save}</span>
								<input type="file" name="cub_img">
								<input type="hidden" name="cub_old" value="${item.cub_save}"/>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="panel-footer">Customizing Service : 옵션은 입력된 기본값을 참조하여 수정가능합니다.</div>
				</div>
			</div>
			<!-- /.col-lg-6 -->
			<div class="col-md-12 register-bottom-grid"
				style="padding-top: 20px; vertical-align: middle; text-align: center">
				<input type="hidden" name="cu_no" value="${item.cu_no}">
				<input type="submit" value="수정하기">
				<a href="#" class="list"><input type="button" value="목록으로"></a>
			</div>
			<div class="clearfix"></div>
		</form>
	</div>
</div>
<!--//content-->
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var $frm = $("#frm");
	var optionList = ${option[0]};
	var typeList = ${option[2]};
	var nameList = ${option[1]};
	var num = optionList.length;
	
	load();
	
	function load(){
		$("#input-option").children("div").remove();
		
		var no=1;
		for(var i=0; i<num; i++){
			$frm.find("span").text("옵션"+no+" : "+nameList[i]+"(단위:"+typeList[i]+")");
			$frm.find("input[name=option]").val(optionList[i]);
			$frm.clone().appendTo("#input-option");
			++no;
		}
		
	}
	
	$(".list").click(function(e){
		e.preventDefault();
		location.href='list?page='+${listPage};
	});
	
});
</script>