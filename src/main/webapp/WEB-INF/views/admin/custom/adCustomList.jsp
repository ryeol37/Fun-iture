<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${!empty error}">
</c:if>
		<!-- Page Content -->
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">List
				<small>Custom Goods</small>
			</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->

	<div class="row">
		<div class="col-lg-12">
			<table width="100%"	class="table table-striped table-bordered table-hover"
				id="dataTables-example">
				<thead>
					<tr>
						<th>no</th>
						<th>Custom Goods Name&nbsp;&nbsp;</th>
						<th>Custom Options&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
						<th>Registered&nbsp;</th>
						<th>Reviews</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<!-- 여기서부터 custom list -->
				<c:forEach items="${list}" var="row">
					<tr>
						<td class="customNo">${row.cu_no}</td>
						<td class="customName"><a href="../../custom/view?cu_no=${row.cu_no}">${row.name}</a></td>
						<td>${row.options}</td>
						<td class="center"><fmt:formatDate value="${row.reg_date}" pattern="yyyy-MM-dd"/></td>
						<td class="center">${row.review}
							<a href="../../custom/view?cu_no=${row.cu_no}#customReview"><code>(${row.review-row.reply})</code></a>
						</td>
						<td>
							<a href="#" class="modi"><p class="fa fa-wrench"></p></a>&nbsp; /
							&nbsp;&nbsp;<a href="#" class="dele"><p class="fa fa-trash-o"></p></a>
						</td>
					</tr>
				</c:forEach>
				<!-- /여기까지 custom list -->
				</tbody>
			</table>
			<!-- /.table-responsive -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
</div>
<!-- /#page-wrapper -->

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript">
 $(document).ready(function(){
	 
	$(".modi").click(function(e){
		e.preventDefault();
		var conf = confirm("주문제작 상품을 수정하시겠습니까?");
		if(!conf){return false;}
		var cu_no = $(this).closest("tr").find(".customNo").text();
		location.href='modifyform?cu_no='+cu_no;
	});
	$(".dele").click(function(e){
		e.preventDefault();
		var conf = confirm("주문제작 상품을 삭제하시겠습니까?");
		if(!conf){return false;}
		var cu_no = $(this).closest("tr").find(".customNo").text();
		location.href='delete?cu_no='+cu_no;
	});
	$(".regist").click(function(e){
		e.preventDefault();
		location.href='writeform';
	});
	
});
</script>