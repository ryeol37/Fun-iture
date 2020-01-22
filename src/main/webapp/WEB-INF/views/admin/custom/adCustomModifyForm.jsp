<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="/funiture/resources/custom/js/customKHR.js"></script>

        <!-- Page Content -->
<div id="page-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					Register <small>New Custom Goods</small>
				</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container-fluid 페이지 제목 그룹 -->
	
	<form:form action="modify" method="post" enctype="multipart/form-data"
		onsubmit="return checkValuesM()" name="frm">
		<input type="hidden" name="cu_no" value="${modi.cu_no}"/>
		<input type="hidden" name="cu_main_old" value="${cu_main[0]}"/>
		<input type="hidden" name="cu_main_old" value="${cu_main[1]}"/>
		<input type="hidden" name="cu_main_old" value="${cu_main[2]}"/>
		<input type="hidden" name="cu_detail_old" value="${modi.cu_detail_save}"/>
		<div class="row">
			<div class="col-lg-6 col-md-6">
				<div class="panel panel-success">
					<div class="panel-heading">Basic Inform</div>
					<div class="panel-body">
						<div class="col-lg-12">
							<div class="form-group">
								<label>상품 이름</label>
								<input class="form-control"	value="${modi.name}" name="name" placeholder="상품 이름을 작성하세요.">
							</div>
							<div class="form-group">
								<small>▼ 파일을 재업로드하면 기존 파일은 삭제됩니다 ▼</small>
							</div>
							<div class="form-group">
								<label>상품 설명 이미지(메인1)</label>
								<c:if test="${cu_main[0]!=null}">
								<small><font color="green"><b>
								- ${cu_main[0]}
								</b></font></small>
								</c:if>
								<input type="file" name="cu_main_v">
							</div>
							<div class="form-group">
								<label>상품 설명 이미지(메인2)</label>
								<c:if test="${cu_main[1]!=null}">
								<small><font color="green"><b>
								- ${cu_main[1]}
								</b></font></small>
								</c:if>
								<input type="file" name="cu_main_v">
							</div>
							<div class="form-group">
								<label>상품 설명 이미지(메인3)</label>
								<c:if test="${cu_main[2]!=null}">
								<small><font color="green"><b>
								- ${cu_main[2]}
								</b></font></small>
								</c:if>
								<input type="file" name="cu_main_v">
							</div>
							<div class="form-group">
								<label>상품 설명 이미지(상세)</label>
								<c:if test="${modi.cu_detail_save!=null}">
								<small><font color="green"><b>
								- ${modi.cu_detail_save}
								</b></font></small>
								</c:if>
								<input type="file" name="cu_detail_v">
							</div>
						</div>
						<!-- /.col-lg-6 (nested) -->
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-6 col-md-6 상품 기본 정보 -->

			<div class="col-lg-6 col-md-6">
				<div class="panel panel-success">
					<div class="panel-heading">Select the number of options</div>
					<div class="panel-body">
						<div class="col-lg-12">
							<div class="form-group col-lg-9 col-md-9 col-sm-9 col-xs-9">
								<select id="selectNum" class="form-control">
									<c:forEach items="1,2,3,4,5,6" var="row">
									<option value="${row}">${row}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group col-lg-3 col-md-3 col-sm-3 col-xs-3">
								<button type="button" id="plusNumber"class="btn btn-default btn-circle">
									<i class="fa fa-check"></i>
								</button>
							</div>
						</div>
						<!-- /.col-lg-12 -->
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-6 col-md-6 옵션 수량 선택 그룹 -->

			<div class="col-lg-6 col-md-6">
				<div class="panel panel-success">
					<div class="panel-heading">Detail of options</div>
					<div class="panel-body" id="input-option">
						<div class="col-lg-12 form" id="frm">
							<div class="form-group col-lg-12">
								<label>옵션1</label>&nbsp;&nbsp;&nbsp;
								<label class="radio-inline">
									<input type="radio" name="optionType1"
									id="optionsRadiosInline1" value="ea" />개수형
								</label>
								<label class="radio-inline">
									<input type="radio"	name="optionType1"
									id="optionsRadiosInline2" value="mm" />치수형(mm)
								</label>
							</div>
							<div class="form-group col-lg-4 col-md-4 col-sm-3 col-xs-3">
								<input class="form-control" value=""
								name="option" placeholder="개수/치수입력"
								onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
							</div>
							<div class="form-group col-lg-8 col-md-8 col-sm-9 col-xs-9">
								<input class="form-control" value=""
								name="optionName" placeholder="옵션이름">
							</div>
						</div>
						<!-- /.col-lg-12 (nested) -->
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-6 col-md-6 상세 옵션 그룹 -->
			<div class="col-lg-12 col-md-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-4 col-md-6 col-lg-offset-4 col-md-offset-4 col-sm-offset-4 col-xs-offset-3">
								<button type="submit" class="btn btn-success">
									상품 수정하기
								</button>&nbsp;&nbsp;&nbsp;
								<button type="button" id="goList" class="btn btn-outline btn-warning">
									목록으로
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.제출버튼 그룹 -->
		</div>
		<!-- /.row -->
	</form:form>
	
</div>
<!-- /#page-wrapper -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var $frm = $("#frm");
	var optionList = ${option[0]};
	var typeList = ${option[2]};
	var nameList = ${option[1]};
	var num = optionList.length;
	
	load();
	
	function load(){
		$("select").val(num);
		$("#input-option").children().remove();
		
		var no=1;
		for(var i=0; i<num; i++){
			$frm.find("label:eq(0)").text("옵션"+no);
			$frm.find("input[type=radio]").attr("name","optionType"+no);
			$frm.find("input[name=option]").attr("id","o"+no);
			$frm.find("input[name=optionName]").attr("id","on"+no);
			$frm.clone().appendTo("#input-option");
			dataInput(i);
			++no;
		}
		$frm.find("label:eq(0)").text("옵션1");
		
 		function dataInput(i){
 			var $frmR = $('input:radio[name=optionType'+(i+1)+']:input[value='+typeList[i]+']').attr("checked",true);
			$('[name=option]:eq('+i+')').val(optionList[i]);
			$('[name=optionName]:eq('+i+')').val(nameList[i]);
		}
		
	}
	
	$("#plusNumber").click(function(){
		var child = $("#input-option").children().length;
		var no = child+1;
		num2 = $("select option:selected").text();
		if(child==num2){
			return;
		} else if(num2>child){
			for(var i=child; i<num2; i++){
				$frm.find("label:eq(0)").text("옵션"+no);
				$frm.find("input[type=radio]").attr("name","optionType"+no);
				$frm.find("input[value=ea]").attr("checked",true);
				$frm.clone().appendTo("#input-option");
				++no;
			}
			$frm.find("label:eq(0)").text("옵션1");
		} else if(num2<child){
			for(var i=child; i>num2; i--){
				$("#input-option").children(":last").remove();
			}
		}
	});
	
	$("#goList").click(function(e){
		e.preventDefault();
		location.href='list';
	});
});
</script>
<!-- 770 x 620 -->