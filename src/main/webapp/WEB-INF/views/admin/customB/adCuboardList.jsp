<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="/funiture/resources/page.css" rel="stylesheet" type="text/css" media="all" />

		<!-- Page Content -->
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header" id="list" style="cursor:pointer">
				List
				<small>Custom Board</small>
			</h1>
			
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	
	<div class="row col-lg-6 col-md-6">
		<div class="form-group">
		<input type="radio"	name="slctCate" id="1" value="1" checked>
		GoodsName / Id / Subject
		<input type="radio"	name="slctCate" id="2" value="2">
		Status
		</div>
		<form name="form">
		<div class="form-group input-group" id="f1" style="display:block">
			<select class="form-control" name="searchCate">
				<option value="name">상품 이름</option>
				<option value="id">문의자 아이디</option>
				<option value="subject">제목</option>
			</select>
			<input type="text" class="form-control" name="keyword">
			<input type="hidden" name="slctCate" value="1">
			<span class="input-group-addon" id="searchText" style="cursor:pointer">
			<p class="fa fa-search"></p>
			</span>
		</div>
		</form>
		<form name="form2">
		<div class="form-group input-group" id="f2" style="display:none">
			<select class="form-control" name="keyword">
				<option value="견적완료">견적완료</option>
				<option value="협의중">협의중</option>
				<option value="미답변">미답변</option>
			</select>
			<input type="hidden" name="searchCate" value="status">
			<input type="hidden" name="slctCate" value="2">
			<span class="input-group-addon" id="searchSelect" style="cursor:pointer">
			<p class="fa fa-search"></p>
			</span>
		</div>
		</form>
	</div>
	<div class="row col-lg-12 col-md-12">
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th>no</th>
						<th>Goods Name&nbsp;&nbsp;</th>
						<th>Subject&nbsp;&nbsp;&nbsp;&nbsp;</th>
						<th>Id&nbsp;</th>
						<th>Status</th>
						<th>Date</th>
					</tr>
				</thead>
				<tbody>
					<!-- 여기서부터 cuboard list -->
					<c:forEach items="${list}" var="row">
					<tr>
						<td class="customNo">${row.cub_no}</td>
						<td class="customName">${row.name}</td>
						<td class="customName"><a href="../../cuboard/view?cub_no=${row.cub_no}">${row.subject}</a></td>
						<td>${row.id}</td>
						<td class="center">
							<c:if test="${row.com==0}">
							<font color="gray">미답변</font>
							</c:if>
							<c:if test="${row.com>0 && row.price==0}">
							<font color="#800000"><b>협의중</b></font>
							</c:if>
							<c:if test="${row.price>0}">
							<font color="#800000">견적완료</font>
							</c:if>
						</td>
						<td class="center"><fmt:formatDate value="${row.reg_date}" pattern="yyyy-MM-dd"/></td>
					</tr>
					</c:forEach>
					<!-- /여기까지 custom list -->
				</tbody>
			</table>
		</div>
		<!-- /.table-responsive -->
	</div>
	<!-- /.row -->
	<div class="page col-lg-12 col-md-12">
		${pageHtml}
	</div>
</div>
</div>
<!-- /#page-wrapper -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("select").val("${searchCate}");
	$("[name=keyword]").val("${keyword}");
	var cate = ${slctCate};
	$("[type=radio]:input[value="+cate+"]").attr("checked","true");
	if(cate==2){
		//$("#2").trigger("click");
		$("#f1").attr("style","display:none");
		$("#f2").attr("style","display:block");
	}
	
	$("#searchText").click(function(){
		search();
	});
	$("#searchSelect").click(function(){
		searchSlct();
	});
	
	function search(){
		var input = document.form;
		if(!input.searchCate.value){
			return false;
		}
		input.method = "GET";
		input.action = "list";
		input.submit();
	}
	function searchSlct(){
		var input = document.form2;

		input.method = "GET";
		input.action = "list";
		input.submit();
	}
	
	$("#1").click(function(){
		$("#f1").attr("style","display:block");
		$("#f2").attr("style","display:none");
	});
	$("#2").click(function(){
		$("#f1").attr("style","display:none");
		$("#f2").attr("style","display:block");
	});
	$("#list").click(function(){
		location.href='list';
	});
});
</script>