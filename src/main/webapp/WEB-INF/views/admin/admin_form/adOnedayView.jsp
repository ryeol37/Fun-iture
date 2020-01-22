<%@page import="com.my.oneday.AdOnedayDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
	function del_check(url) {
		
		if (confirm("삭제 하겠습니까?")) {
			
			location.href=url;
		}
	}
	function validation() {

		var frm = document.modify;
		
		if (frm.name.value == "") {
			alert("강좌명을 입력해주세요.");
			return false;
		}
		if (frm.name.value.length >= 9) {
			alert("제목이 너무 깁니다.");
			return false;
		}
		if (frm.price.value == "") {
			alert("1인 수업료를 입력해주세요.");
			return false;
		}
		if (frm.day.value == "") {
			alert("날짜를 입력해주세요.");
			return false;
		}
		if (frm.day.value.length != 8) {
			alert("날짜를 yyyyMMdd 형식으로 입력해주세요!")
		}
		if (frm.maxnum.value == "") {
			alert("강좌 최대 인원을 입력해주세요.");
			return false;
		}
		if (frm.content.value == "") {
			alert("강좌 설명을 입력해주세요.");
			return false;
		}
		
		return true;
	}
	

</script>
<!-- Page Content -->
<div id="page-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">

				<h1 class="page-header" style="text-align: center">원데이 클래스 수정 폼</h1>

				<!-- 폼 데이터에 입력한 값을 onedayModel에 담음 -->
				<form:form action="admodify" onsubmit="return validation()" name="modify" method="post"
					enctype="multipart/form-data" modelAttribute="adOnedayModel"
					>
					<c:forEach var="list" items="${list}" varStatus="stat">
						<tbody>
							<tr>
								<td><input type="hidden" name="oneday_no"
									value="${list.oneday_no}" /> <input type="hidden"
									name="id_admin" value="${list.id_admin}" /> <!-- 히든 값으로 이름, 관리자 이름 불러오고 내용도 채워넣기  -->
								</td>
							</tr>
							<tr>
								<label>
									<th>강의명</th>
								</label>
								</br>
								<td><form:input type="text" name="name"
										class="form-control" id="name" value="${list.name }"
										path="name" /><span class="hmsg" id="hLayerid"></span></td>


								</br>
							</tr>
							<tr>
								<label>
									<th>1인 수업료</th>
								</label>
								</br>
								<td><input type="text" name="price" class="form-control"
									id="price" value="${list.price}" path="price" /><span
									class="hmsg" id="hLayerid"></span></td>
								</br>
							</tr>
							<tr>
								<label>
									<th>강의 날짜</th>
								</label>
								</br>

								<td><input type="text" name="day" class="form-control"
									id="day"
									value="<fmt:formatDate value='${list.day}'
												pattern='yyyyMMdd'/>"
								path="day"><span class="hmsg"
									id="hLayerid"></span>
								<p class="help-block">예) yyyyMMdd로 입력하세요</p>
								<td></br>
							</tr>
							<tr>
								<label><th>강의 최대 인원</th></label>
								</br>
								<td><input type="text" name="maxnum" class="form-control"
									id="maxnum" value="${list.maxnum }" path="maxnum" /><span
									class="hmsg" id="hLayerid"></span></td>
								</br>
							</tr>
							<tr>
								<label><th>강의 설명</th></label>
								</br>
								<td><textarea class="form-control" rows="10" path="content"
										id="content" name="content">${list.content} </textarea></td>
								</br>
							</tr>
							<tr>
								<label>메인 이미지</label>

								<c:if test="${list.main_save != '사진없음'}">
									<p style="border-bottom: 1px dotted #999; width: 203px;">
										현재 등록된 이미지 : <img
											src="/funiture/resources/oneday_upload/${list.main_save }"
											width="400" height="" alt=""
											onerror="this.src='/funiture/resources/oneday_upload/noimage.jpg" /><input
											type="hidden" name="main_save">
									</p>
								</c:if>
							<tr>
							<td>
									<input type="file" class="txt" name="main_save" />
									<input type="hidden" name="main_old" value="${list.main_save}">
									<c:if test="${list.main_save != '사진없음'}">
									</P>
										사진이 이미 등록되어있습니다. 새로 등록하시면 기존 이미지와 대체됩니다.
									</c:if>
								</td>
								</p>
								</P>
							</tr>
							</br>

						</tbody>

						<tr>
							<button type="submit" class="btn btn-primary btn-lg">강좌
								수정</button>
							<button type="button" class="btn btn-primary btn-lg"
								onclick="history.back();return false">강좌 리스트로 돌아가기</button>
							<button type="button" onclick="javascript:del_check('addelete?oneday_no=${list.oneday_no}')" class="btn btn-primary btn-lg">강좌
								삭제</button>
						</tr>
					</c:forEach>
				</form:form>

			</div>

		</div>

		<!-- /.col-lg-12 -->
	</div>

	<!-- /.row -->
</div>

<!-- /.container-fluid -->
</div>


