<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>

<div class="sign_grp">
		<div class="grow">
		<div class="container">
			<h2>MemberDelete</h2>
		</div>
	</div>
		<form action="memberDelete" method="post" name="memberDeleteform" onsubmit="return memberDeleteChk()">
				<div class="tbl_type_01">
					<table>
					<br>
						<caption>비밀번호입력으로 회원탈퇴하기</caption>
						<colgroup>
							<col style="width:120px;" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">비밀번호</th>
								<td><input type="password" class="txt w220" name="password" /></td>
							</tr>
						</tbody>
					</table>
				</div>
				<br>
				<div class="btn_type_04">
					<a href="<%=cp %>/mypage/myform" class="btn btnC_03 btnF_02 mr10">
						<span>취소</span>
					</a>
					<span class="btn btnC_04 btnF_02">
						<input type="submit" value="탈퇴" name="leave" />
					</span>
				</div>
			</fieldset>
		</form>
	</div>
</div>
<script type="text/javascript">
	function memberDeleteChk(){
		if(document.memberDeleteform.passwd.value == ""){
			alert("비밀번호를 입력하세요.");
			document.memberDeleteform.passwd.focus();
			return false;
		}
		return true;;
	}
</script>