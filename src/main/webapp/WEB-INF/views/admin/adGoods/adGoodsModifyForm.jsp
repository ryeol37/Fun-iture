<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<script type="text/javascript">
function validateForm() {
    var x = document.forms["joinform"]["goods_name"].value;
    if (x == null || x == "") {
        alert("상품명은 입력해야합니다");
        return false;
    }
}
</script>
</head>


<!-- 메뉴 시작 -->
<div id=page-wrapper>
<div class="row">
<div class="col-lg-12">    
	<h1 class="page-header">상품수정</h1>
</div>
</div>

<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">상품수정 페이지입니다.</div>
			<div class="panel-body">
			
			<form action="adGoodsModify" enctype="multipart/form-data" method="post">
			<input type="hidden" name="goods_no" value="${goodsModel.goods_no}">
					   <div class="form-group">
                            <label>카테고리</label>
                               <select name="cate_no" class="form-control" style="width:initial;">
								<option value="0" label="SHELVES & BOOKCASES"/>
								<option value="1" label="TABLES"/>
								<option value="2" label="CHAIRS"/>
								<option value="3" label="SOFAS"/>
								<option value="4" label="BEDS"/>
							</select>
                        </div>
                         <div class="form-group">
                            <label>상품명</label>
                            <input type="text" class="form-control" name="goods_name" id="goods_name" value="${goodsModel.goods_name}" style="width:300px;"/>
                        </div>
                        <div class="form-group">
                            <label>상품사이즈</label>
                            <input type="text" class="form-control" name="goods_size" value="${goodsModel.goods_size}" style="width:300px;"/>
                        </div>
                        <div class="form-group">
                            <label>상품수량</label>
                            <input type="text" class="form-control" name="goods_qty"  placeholder="상품수량을 입력해주세요" value="${goodsModel.goods_qty}" style="width:107px;"/>
                        </div>
                        <div class="form-group">
                            <label>판매가격</label>
                            <input type="text" class="form-control" name="goods_price" value="${goodsModel.goods_price}" style="width:initial;"/>
                        </div>
                        <div class="form-group">
                            <label>상품 메인 이미지</label>
                            <c:if test="${!empty goodsModel.main_save}">
                            	<p style="border-bottom: 1px dotted #999;width:203px;">현재 등록된 메인 이미지 : <img src="/funiture/resources/goodsImage/${goodsModel.main_save}" width="60" height="60" alt="" onerror="this.src='/funiture/resources/user/images/noimg.gif'"/><input type="hidden"  name="main_save" value="${goodsModel.main_save}"></p>
                            </c:if>
                            <input type="file" name="file[0]" value="${goodsModel.main_save}"/>
                            <p class="help-block">상품메인 이미지 입니다.</p>
                        </div>
                        <div class="form-group">
                            <label>상품 상세 이미지</label>
                            <c:if test="${!empty goodsModel.detail_save}">
                            	<p style="border-bottom: 1px dotted #999;width:203px;">현재 등록된 상세 이미지 : <img src="/funiture/resources/goodsImage/${goodsModel.detail_save}" width="60" height="60" alt="" onerror="this.src='/funiture/resources/user/images/noimg.gif'"/><input type="hidden"  name="detail_save" value="${goodsModel.detail_save}"></p>
                            </c:if>
                            <input type="file" name="file[1]" value="${goodsModel.detail_save}"/>
                            <p class="help-block">상품설명 이미지 입니다.</p>
                        </div>
                        <button type="submit" class="btn btn-success">상품수정</button>
                  </form>
			</div>
	</div>
</div>
</div>