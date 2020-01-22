<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

<!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">주문 수정</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="container">
               <div class="row cart-body ">
                <form class="form-horizontal" name="adOnedayModiForm" method="post" action="/funiture/adOneOrderModify" >
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-push-3 col-sm-push-3">
                   <!--SHIPPING METHOD-->
                    <div class="panel panel-default">
                        <div class="panel-heading">신청 정보</div>
                        <div class="panel-body">
                            <div class="form-group">
                                <div class="col-md-12"><strong>이름:</strong></div>
                                <div class="col-md-12">   
                                    <input type="text" class="form-control" name="name" value="${orderModel.name }" required/>
                                </div>
                            </div>
                              <div class="form-group">
                                <div class="col-md-12">
                                    <strong>휴대전화:</strong>
                                    <input type="text" name="phone" id="phone" class="form-control" maxlength="13" value="${orderModel.phone }" required/>
                               </div>
                            </div>
                            <div class="form-group">
                            	<div class="col-md-12"><strong>신청 상태:</strong></div>
                            	<div class="col-md-12">
									<select id="status_no" name="status_no" class="form-control" >
										<option value="${orderModel.status_no }">${orderModel.status}</option>
										<option>===========</option>
										<option value=5>예약 완료</option>
	                                    <option value=8>신청 취소</option>
	                                    <option value=9>환불 완료</option>
	                                </select>	
                            	</div>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="order_no" value="${orderModel.order_no}"/>
                    <button type="submit" class="btn btn-default btn-submit-fix pull-right">수정하기</button>
                    <button type="button" class="btn btn-default pull-right" onclick="location.href='/funiture/adOnedayList'">목록</button>
                </div>
                </form>
            </div>
                </div>
                </div>   

            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
   
      