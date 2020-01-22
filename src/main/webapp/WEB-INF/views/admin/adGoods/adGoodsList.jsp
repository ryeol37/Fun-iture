<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
function delchk(){
    return confirm("삭제하시겠습니까?");
}
</script>
<style type="text/css">
.paging{text-align:center;height:32px;margin-top:5px;margin-bottom:15px;}
.paging a,
.paging strong{display:inline-block;width:36px;height:32px;line-height:28px;font-size:14px;border:1px solid #e0e0e0;margin-left:5px;
-webkit-border-radius:3px;
   -moz-border-radius:3px;
		border-radius:3px;
-webkit-box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
	-moz-box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
		  box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
}
.paging a:first-child{margin-left:0;}
.paging strong{color:#fff;background:#337AB7;border:1px solid #337AB7;}
.paging .page_arw{font-size:11px;line-height:30px;}
</style>
</head>
<body>
<div id=page-wrapper>
<div class="row">
<div class="col-lg-12"> 
	<h1 class="page-header">상품목록</h1>
</div>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">
                         상품목록페이지 검색, 수정, 삭제 기능하는 페이지입니다.
        </div>
        <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
						
						<div class="col-sm-6" style="text-align:right;">
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">총 상품 등록수 : ${totalCount}</div>
						</div>
						
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table
								class="table table-striped table-bordered table-hover"
								id="dataTables-example" width=100%>
								<thead>
									<tr role="row">
										<th style="width: 7%; text-align:center;">번호</th>
										<th style="width: 9%; text-align:center;">상품사진</th>
										<th style="width: 13%; text-align:center;">카테고리</th>										
										<th style="width: 29%; text-align:center;">상품명</th>
										<th style="width: 15%; text-align:center;">가격</th>
										<th style="width: 7%; text-align:center;">수량</th>
										<th style="width: 10%; text-align:center;">등록일자</th>
										<th style="width: 10%; text-align:center;">관리</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="goodsList"  items="${goodsList}" varStatus="stat">
								<c:url var="viewURL" value="goodsView" >
									<c:param name="goods_no" value="${goodsList.goods_no }"/>
								</c:url>									
									<tr class="gradeA even" role="row" style="text-align:center;">
										<td style=vertical-align:middle;>${goodsList.goods_no}</td>
										<td><img src="/funiture/resources/goodsImage/${goodsList.main_save}" width="60" height="60" alt="" onerror="this.src='/funiture/resources/user/images/noimg.gif'"></td>
										<td style=vertical-align:middle;>											
										<c:if test="${goodsList.cate_no eq 0}">SHELVES & BOOKCASES</c:if>
										<c:if test="${goodsList.cate_no eq 1}">TABLES</c:if>
										<c:if test="${goodsList.cate_no eq 2}">CHAIRS</c:if>
										<c:if test="${goodsList.cate_no eq 3}">SOFAS</c:if>
										<c:if test="${goodsList.cate_no eq 4}">BEDS</c:if>
										</td>
										<td style=vertical-align:middle;>${goodsList.goods_name}</a></td>
										<td style=vertical-align:middle;><fmt:formatNumber value="${goodsList.goods_price}" pattern="#,###"/></td>
										<td style=vertical-align:middle;>${goodsList.goods_qty}</td>							
										<td style="text-align:center;vertical-align:middle;"><fmt:formatDate value="${goodsList.reg_date}" /></td>
										<td style=vertical-align:middle;>
										<a href="../goods/adGoodsModifyForm?goods_no=${goodsList.goods_no }"><input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Cog_font_awesome.svg/32px-Cog_font_awesome.svg.png"></a>
										<c:url var="viewURL2" value="adGoodsDelete" >
											<c:param name="goods_no" value="${goodsList.goods_no }"/>	
										</c:url>	
										 <a href="${viewURL2}"><input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png" onclick="return delchk()"></a></td>
										
										</td>
									</tr>
								</c:forEach>
								<!--  등록된 상품이 없을때 -->
									<c:if test="${fn:length(goodsList) le 0}">
										<tr><td colspan="9" style="text-align:center;">등록된 상품이 없습니다</td></tr>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
					
				</div>
			</div>
			<!-- /.table-responsive -->							
		</div>
	</div>
        <!-- /.panel -->   
</div>
</div>

</body>
</html>