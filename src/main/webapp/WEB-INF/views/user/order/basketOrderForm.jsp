<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- 아코디언 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 주소 검색 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function openZipcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('address1').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('address2').focus();
        }
    }).open();
} 
</script>

<!-- 전화번호 자동 하이픈 -->
<script>
   $(document).ready(function(){ 
   $("input#phone").blur(function(){
      var num = $("#phone").val();
      blur(num)
   });
    
    $("input#phone").click(function(){
       var num = $("#phone").val();
       focus(num);
    });
});

   function focus(num) {
      num = num.replace(/[^0-9]/g, '');
      $("#phone").val(num);
   }

   function blur(num) {
      num = num.replace(/[^0-9]/g, '');
      var tmp = '';
      tmp += num.substr(0, 3);
      tmp += '-';
      tmp += num.substr(3, 4);
      tmp += '-';
      tmp += num.substr(7);
      $("#phone").val(tmp);
   }
</script>

<!-- 결제 방법 구분 -->
<script>
function click_deposit(){
   $("#settle_type").val("무통장 입금");
}


function click_card(){
   $("#settle_type").val("신용 카드");
}

</script>

<!-- 적립금 -->
<script type="text/javascript">
   jQuery(document).ready(function(){
      jQuery("#usepoint").click(function() {
         
         if(jQuery("#use_point").val()){
            console.log("클릭");
            var qurey = {use_point:jQuery("#use_point").val()};
            jQuery.ajax({
               type: "POST",
               url: "checkPoint",
               data: qurey,
               success: function(data) {
                  if(data=="true"){
                     alert("보유 포인트보다 많습니다.");
                     jQuery("#use_point").val("0");
                  } else if(data=="false"){
                     alert("사용되었습니다.");
                  }
               }
            });
      }
   });
});
</script>

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
               <div class="row cart-body ">
                <form class="form-horizontal" name="basketOrderForm" method="post" action="/funiture/order/basketOrderOk" >
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-push-6 col-sm-push-6">
                   <!--SHIPPING METHOD-->
                    <div class="panel panel-default">
                        <div class="panel-heading">배송 정보</div>
                        <div class="panel-body">
                            <div class="form-group">
                                <div class="col-md-12"><strong>이름:</strong></div>
                                <div class="col-md-12">   
                                    <input type="text" class="form-control" name="name" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-6 col-xs-12">
                                    <strong>우편번호:</strong>
                                    <input type="text" id="zipcode" name="zipcode" class="form-control" />
                              <input type="button" class="btn btn-default btn-sm" value="우편번호찾기" onclick="return openZipcode()" class="B_BUTTON">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-6 col-xs-12">
                                    <strong>기본주소:</strong>
                                    <input type="text" name="address1" id="address1" class="form-control" />
                                </div>

                                <div class="col-md-6 col-xs-12">
                                    <strong>상세주소:</strong>
                                    <input type="text" name="address2" id="address2" class="form-control"  />
                                </div>
                            </div>
                            
                              <div class="form-group">
                                <div class="col-md-12">
                                    <strong>휴대전화:</strong>
                                    <input type="text" name="phone" id="phone" class="form-control" maxlength="13" />
                               </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12"><strong>배송 메시지:</strong></div>
                                <div class="col-md-12">
                                    <input type="text" class="form-control" name="memo"  />
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--SHIPPING METHOD END-->
                    
                    
                 <!--CREDIT CART PAYMENT-->
                    <div class="panel panel-default">
                        <div class="panel-heading">결제 정보</div>
                        <div class="panel-body">
                           <div class="panel-group" id="accordion">
                       <div class="panel panel-default">
                      <div class="panel-heading">
                       <h4 class="panel-title">
                          <a data-toggle="collapse" data-parent="#accordion" href="#point">
                             적립금</a>
                        </h4>
                      </div>
                      <div id="point" class="panel-collapse collapse in">
                        <div class="panel-body">
                       <div class="form-group">
                            <div class="col-md-12"><strong>보유 적립금:</strong></div>
                           <div class="col-md-12">
                              <input type="text" class="form-control" id="mypoint" name="mypoint" value="${memberModel.point}" readonly/>
                            </div>
                       </div>
                        <div class="form-group">
                          <div class="col-md-12"><strong>사용 적립금:</strong></div>
                          <div class="col-md-12">
								<input type="text" class="form-control" id="use_point" name="use_point" value="0"/>
                               <input type="button" class="btn btn-default btn-sm" value="사용하기" id="usepoint" />
                          </div>
                        </div>
                       </div>
                      </div>
                       </div>
                       <input type="hidden" name="settle_type" id="settle_type" value=""/>
                       <div class="panel panel-default">
                      <div class="panel-heading">
                        <h4 class="panel-title">
                          <a data-toggle="collapse" data-parent="#accordion" href="#deposit" onclick="click_deposit()">
                             무통장 결제</a>
                        </h4>
                      </div>
                      <div id="deposit" class="panel-collapse collapse">
                        <div class="panel-body">
                        <div class="form-group">
                               <div class="col-md-12"><strong>은행 선택:</strong></div>
                                <div class="col-md-12">
                                   <select id="order_bank" name="order_bank" class="form-control">
                                      <option value="null">은행을 선택해주세요</option>
                                       <option value="국민은행:802001-04-222414">국민은행:802001-04-222414 이동렬</option>
                                        <option value="우리은행:1002-040-999-283">우리은행:1002-040-999-283 이동렬</option>
                                       <option value="농협:174444-52-059709">농협:174444-52-059709 이동렬</option>
                                        <option value="하나은행:350-910009-41104">하나은행:350-910009-41104 이동렬</option>
                                    </select>
                                </div>
                              </div>
                            <div class="form-group">
                                <div class="col-md-12"><strong>입금자명:</strong></div>
                                <div class="col-md-12">
                                    <input type="text" class="form-control" name="depositname" value="" />
                                </div>
                           </div>
      
                        </div>
                      </div>
                       </div>
                       <div class="panel panel-default">
                      <div class="panel-heading">
                        <h4 class="panel-title">
                             <a data-toggle="collapse" data-parent="#accordion" href="#card" onclick="click_card()">
                             카드결제</a>
                       </h4>
                      </div>
                      <div id="card" class="panel-collapse collapse">
                        <div class="panel-body">
                        <div class="form-group">
                               <div class="col-md-12"><strong>카드 번호:</strong></div>
                               <div class="col-md-12"><input type="text" class="form-control" name="card_number" value="" /></div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12"><strong>CVC 번호:</strong></div>
                                <div class="col-md-12"><input type="text" class="form-control" name="card_cvc" value="" /></div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12"><strong>유효기간</strong></div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                       <select class="form-control" name="card_month">
                                           <option value="">월</option>
                                           <option value="01">01</option>
                                           <option value="02">02</option>
                                           <option value="03">03</option>
                                           <option value="04">04</option>
                                           <option value="05">05</option>
                                           <option value="06">06</option>
                                           <option value="07">07</option>
                                           <option value="08">08</option>
                                           <option value="09">09</option>
                                             <option value="10">10</option>
                                           <option value="11">11</option>
                                           <option value="12">12</option>
                                      </select>
                                   </div>
                                   <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                       <select class="form-control" name="card_year">
                                           <option value="">연도</option>
                                           <option value="2018">2018</option>
                                           <option value="2019">2019</option>
                                           <option value="2020">2020</option>
                                           <option value="2021">2021</option>
                                           <option value="2022">2022</option>
                                           <option value="2023">2023</option>
                                           <option value="2024">2024</option>
                                           <option value="2025">2025</option>
                                      </select>
                                   </div>
                               </div>
                               <div class="form-group">
                                  <div class="col-md-12">
                                     <strong>카드 비밀번호:</strong>
                                  </div>
                                  <div class="col-md-6">
                                     <input type="text" class="form-control" name="cardpass" id="cardpass" value=""/>
                                  </div>
                               </div>
      
                           </div>
                         </div>
                          </div>
                        </div>
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <button type="submit" class="btn btn-default btn-submit-fix">결제하기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--CREDIT CART PAYMENT END-->
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-pull-6 col-sm-pull-6">
                   <!--REVIEW ORDER-->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                               결제 목록 <div class="pull-right"><small><a class="afix-1" href="/funiture/basket/list">장바구니 수정</a></small></div>
                        </div>
                        <div class="panel-body">
                        <c:forEach var="basketList"  items="${basketList}" varStatus="stat">
                            <div class="form-group">
                                <div class="col-sm-3 col-xs-3">
                                    <img class="img-responsive" src="/funiture/resources/goodsImage/${basketList.main_save}" />
                                </div>
                                <div class="col-sm-6 col-xs-6">
                                    <div class="col-xs-12">${basketList.goods_name}</div>
                                    <div class="col-xs-12"><small>수량:<span>${basketList.goods_qty}</span></small></div>
                                </div>
                                <div class="col-sm-3 col-xs-3 text-right">
                                    <h6><fmt:formatNumber value="${basketList.goods_price*basketList.goods_qty}" type="number"/><span>원</span></h6>
                                    <c:set var= "sum" value="${sum + (basketList.goods_price * basketList.goods_qty)}"/>
                                </div>
                            </div>
                          </c:forEach>
                            <div class="form-group"><hr /></div>
                            <div class="form-group"><hr /></div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <strong>구매 금액</strong>
                                    <div class="pull-right"><span><fmt:formatNumber value="${sum}" type="number"/></span><span>원</span></div>
                                </div>
                                <div class="col-xs-12">
                                    <small>배송비</small>
                                    <div class="pull-right"><span>0 원</span></div>
                                </div>
                            </div>
                            <div class="form-group"><hr /></div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <strong>결제 금액</strong>
                                    <div class="pull-right"><span><fmt:formatNumber value="${sum}" type="number"/></span><span>원</span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--REVIEW ORDER END-->
                </div>
                </form>
            </div>
            <div class="row cart-footer">
        
            </div>
                </div>
                </div>
            </div>    
    </div>