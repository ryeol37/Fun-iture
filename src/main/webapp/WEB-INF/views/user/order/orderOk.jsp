<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>​

<style>
.box {
  background:#fff;
  transition:all 0.2s ease;
  border:2px dashed #dadada;
  margin-top: 10px;
  margin-bottom: 100px;
  box-sizing: border-box;
  border-radius: 5px;
  background-clip: padding-box;
  padding:0 20px 20px 20px;
  min-height:340px;
}

.box span.box-title {
    color: #fff;
    font-size: 24px;
    font-weight: 300;
    text-transform: uppercase;
}

.box .box-content {
  padding: 16px;
  border-radius: 0 0 2px 2px;
  background-clip: padding-box;
  box-sizing: border-box;
}
.box .box-content p {
  color:#515c66;
  text-transform:none;
}

</style>

<!-- grow -->
<div class="grow">
	<div class="container">
		<h2>Order</h2>
	</div>
</div>
<!-- grow -->
	
<div class="container wrapper">
	<div class="row cart-head">
		<div class="container">
            <div class="check">
                <div class="col-md-4 text-center">
                </div>
                <div class="col-md-4 text-center">
                    <div class="box">
                        <div class="box-content">
                            <h2 class="tag-title">주 문 완 료</h2>
                            <hr />
                            <br/>
                            <c:choose>
                            <c:when test="${orderModel.settle_type == '무통장 입금'}">
                            	<p>주문이 완료되었습니다.</p><br/>
                            	<p>3일 이내로 ${orderModel.order_bank }로 <br/>${orderModel.order_price }원을 입금해주세요.</p><br/>
                            	<p>주문해주셔서 감사합니다.</p>
                            	<br/>
                            </c:when>
                            <c:otherwise>
                            	<p>주문이 완료되었습니다.</p><br/>
                            	<p>주문해주셔서 감사합니다.</p>
                            	<br/>
                            </c:otherwise>
                            </c:choose>
                            <span><a class="btn btn-default" href="/funiture/main" role="button">메인으로</a></span>
                            <span><a class="btn btn-default" href="/funiture/mypage/orderList" role="button">주문 내역 확인</a></span>
                        </div>
                    </div>
                </div>
            </div>           
        </div>
	</div>
</div>