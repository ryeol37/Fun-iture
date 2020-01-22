<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href="/funiture/resources/user/css/common.css" rel="stylesheet" type="text/css" media="all" />
<% String cp = request.getContextPath(); %>

<script type="text/javascript">
    function tocheckpw1() {
        var pw = document.getElementById("pw").value;
        var pwck = document.getElementById("pw2").value;
 
        if (pw != pwck) {
            alert('비밀번호가 틀렸습니다. 다시 입력해 주세요');
            document.getElementById("pw").focus();
            return false;
        }
        return true;
    }
</script>

	  <!-- 전화번호 자동 하이픈 -->
<script>
jQuery(document).ready(function(){ 
	jQuery("input#phone").blur(function(){
      var num = jQuery("#phone").val();
      blur(num)
   });
    
	jQuery("input#phone").click(function(){
       var num = jQuery("#phone").val();
       focus(num);
    });
});

   function focus(num) {
      num = num.replace(/[^0-9]/g, '');
      jQuery("#phone").val(num);
   }

   function blur(num) {
      num = num.replace(/[^0-9]/g, '');
      var tmp = '';
      tmp += num.substr(0, 3);
      tmp += '-';
      tmp += num.substr(3, 4);
      tmp += '-';
      tmp += num.substr(7);
      jQuery("#phone").val(tmp);
   }
</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function openZipcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address1').value = fullRoadAddr;
                document.getElementById('address2').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
	<div class="sign_grp">
<div id="page-wrapper">
	<div class="grow">
		<div class="container">
			<h2>MemberModify</h2>
		</div>
	</div>

				<form:form commandName="member" action="memberModify" method="post" name="memberModify" onsubmit="return tocheckpw1()">	
				
						<div class="sign_box">
						<br>
			<p class="tit"><span><img src="/funiture/resources/images/icon/sign_02.png" alt="회원수정" /></span>회원수정</p>
			<div class="step_02">
				<div class="tbl_type_01">
				<table>

						<tbody>
						<tr>
								<th scope="row" >아이디</th>
								<td>
									${member.id}
									<form:hidden path="id"/>
								</td>
							</tr>
							<tr>
								<th scope="row">비밀번호</th>
								<td>
									<form:input type="password" path="password" id="pw" value="${member.password}"/>
									<strong class="pt_red ibk"><font color="red"><form:errors path="password" /></font></strong>
								</td>
							</tr>
							<tr>
								<th scope="row">비밀번호 확인</th>
								<td>
									<form:input type="password"  path="password2" id="pw2" value="${member.password2}" />
									<strong class="pt_red ibk"><font color="red"><form:errors path="password2" /></font></strong>
								</td>
							</tr>
							<tr>
								<th scope="row">이름</th>
								<td>
									<form:input type="text"  path="name" value="${member.name}"/>
									<strong class="pt_red ibk"><font color="red"><form:errors path="name" /></font></strong>
								</td>
							</tr>
							<tr>
								<th scope="row">주소</th>
								<td>
								<form:input type="text" id="zipcode" path="zipcode" value="${member.zipcode}" placeholder="우편번호" />
								<input type="button" onclick="openZipcode()" value="우편번호 찾기"><br>
								<form:input type="text" id="address1" path="address1" value="${member.address1}" placeholder="도로명주소" />
								<form:input type="text" id="address2" path="address2" value="${member.address2}" placeholder="지번주소" />
								<span id="guide" style="color:#999"></span>
								</td>
							</tr>
							<tr>
								<th scope="row">휴대폰</th>
								<td>
									<form:input type="text" path="phone" id="phone" maxlength="11"  value="${member.phone}"/>
									<span class="ibk">" - " 없이 입력하세요.</span>
								</td>
							</tr>
							<tr>
								<th scope="row">이메일</th>
								<td>
									<form:input type="text" path="email" value="${member.email}"/>
									<strong class="pt_red ibk"><font color="red"><form:errors path="email" /></font></strong>
								</td>
							</tr>
							<tr>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="btn_type_04">
			<a href="<%=cp %>/mypage/myform" class="btn btnC_03 btnF_02 mr10">
				<span>취소</span>
			</a>
			<span class="btn btnC_04 btnF_02">
				<input type="submit" value="수정" />
			</span>
		</div>
	</form:form>
	</div>
</div>





<!-- // container -->
	






























