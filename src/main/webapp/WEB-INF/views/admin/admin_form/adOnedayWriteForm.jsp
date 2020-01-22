<%@page import="com.my.oneday.AdOnedayDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<script type="text/javascript">
	function validation() {

		var frm = document.write;

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
		if (frm.price.value.length >= 9) {
			alert("너무 비쌉니다....");
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
				<h1 class="page-header" style="text-align: center">원데이 클래스 등록 폼</h1>
				<!-- 폼 데이터에 입력한 값을 onedayModel에 담음 -->
				<form:form action="adwrite" onsubmit="return validation()"
					method="post" enctype="multipart/form-data"
					modelAttribute="adOnedayModel" name="write">
					<tbody>
						<tr>
							<label>
								<th>강의명</th>
							</label>
							</br>
							<td><input type="text" name="name" class="form-control"
								id="name" placeholder="ex) 의자 만들기" path="name" /> <span class="hmsg"
								id="hLayerid"></span></td>

							</br>
						</tr>
						<tr>
							<label>
								<th>1인 수업료</th>
							</label>
							</br>
							<td><input type="text" name="price" class="form-control"
								id="price" placeholder="ex) 5000000" path="price" /><span
								class="hmsg" id="hLayerid"></span></td>
							</br>
						</tr>
						<tr>
							<label>
								<th>강의 날짜</th>
							</label>
							</br>
							<input type="text" name="day" id="day" class="form-control"
								path="day" placeholder="ex) 20190909"/>
							<span class="hmsg" id="hLayerid"></span>
							</td>
							</br>
						</tr>
						<tr>
							<label><th>강좌 최대 인원</th></label>
							</br>
							<td><input type="text" name="maxnum" class="form-control"
								id="maxnum" placeholder="ex) 10" path="maxnum" /><span
								class="hmsg" id="hLayerid"></span></td>
							</br>
						</tr>
						<tr>
							<label><th>강의 설명</th></label>
							</br>
							<td><textarea class="form-control" rows="3" path="content"
									class="form-control" id="content" name="content"></textarea></td>
							</br>
						</tr>
						<tr>
							<label><th>메인 이미지</th></label>
							</br>
							<input type="file" path="main_save" id="main_save"
								name="main_save" content="main_save" value=''>
						</tr>
						</br>
					</tbody>

					<tr>
						<button type="submit" class="btn btn-primary btn-lg">강좌
							등록</button>
						<button type="button" class="btn btn-primary btn-lg"
							onclick="history.back();return false">강의 리스트로 돌아가기</button>
					</tr>
				</form:form>
			</div>
		</div>

		<!-- /.col-lg-12 -->
	</div>

	<!-- /.row -->
</div>

<!-- /.container-fluid -->
</div>

<!-- /#page-wrapper -->

