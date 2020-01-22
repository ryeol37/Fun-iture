<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Button trigger modal -->
<!-- Modal -->
<div class="modal fade" id="defaultOption" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h5 class="modal-title" id="myModalLabel">Funiture의 기본 옵션</h5>
			</div>
			<div class="modal-body">
			<img class="img-responsive" style="padding-bottom:30px" src="/funiture/resources/custom/customImg/${item.cu_detail}" alt="">
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<c:if test="${item.cub_save!=null}">
<div class="modal fade" id="userImage" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h5 class="modal-title" id="myModalLabel">업로드하신 이미지</h5>
			</div>
			<div class="modal-body">
			<img class="img-responsive" style="padding-bottom:30px" src="/funiture/resources/cuboard/cuboardImg/${item.cub_save}" alt="">
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
</c:if>

<div class="modal fade" id="confirm" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="alert alert-danger alert-dismissable">
			<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel"><b>결제하기</b></h4>
			</div>
			<div class="modal-body">
				옵션과 가격을 <b>꼭</b> 확인하시고 결제를 진행해 주세요.<br/>
				현재 옵션에서 추가 요청사항이 있으시면 <b>댓글을 추가로</b> 작성하시면 됩니다.<br/>
				<font color="#800000"><b>결제 이후에는 본 견적문의 글을 수정 할 수 없으며</b></font><br/>
				옵션 관련하여 변동내용 발생 시 고객센터로 전화문의를 해주시기 바랍니다.<br/><br/>
				<div class="pay">
					<div class="form-group">
					<input type="radio"	name="slctPay" id="1" checked >
					무통장
					<input type="radio"	name="slctPay" id="2" >
					신용카드
					</div>
					<div class="form-group input-group" id="f1" style="display:block">
						<label>은행선택 :
						<select class="form-control" name="settle_type">
							<option value="1">국민은행:802001-04-222414 이동렬</option>
							<option value="2">우리은행:1002-040-999-283 이동렬</option>
							<option value="3">농협:174444-52-059709 이동렬</option>
							<option value="4">하나은행:359-910009-41104 이동렬</option>
						</select>
						</label>
						<label>입금자명 :
						<input type="text" class="form-control" size="40"
						value="${session_name} : 주문자명과 동일해야 확인 가능합니다." readonly >
						</label>
					</div>
					<div class="form-group input-group" id="f2" style="display:none">
						<label style="padding-bottom:10px">카드 번호 :
						<input type="text" size="4" > ― <input type="password" size="4" > ― 
						<input type="password" size="4" > ― <input type="text" size="4" >
						</label>
						<br/>
						<label style="padding-bottom:10px">CVC 번호 :
						<input type="text" size="3" >
						</label>
						<br/>
						<label style="padding-bottom:10px">유효기간: 
						<input type="text" size="2" >월 / 
						<input type="text" size="2" >년
						</label>
						<br/>
						<label>카드 비밀번호:
						<input type="text" size="4" >
						</label>
					</div>
					<div class="form-group input-group" >
						<label>배송 관련 요청사항 :</label>
						<input type="text" class="form-control" name="memoInput" size="300">
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">취소하기</button>
                <button type="button" class="btn btn-confirm" name="confirm">결제하기</button>
			</div>
		</div>
	</div>
</div>

