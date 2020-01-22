<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String cp = request.getContextPath(); %>

<script type="text/javascript">
	function admemberDelete(){

		var check = confirm("정말 탈퇴 시키시겠습니까?");
		if(check){
			return true;
		}else{
			return false;
		}
	}
</script>

<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">회원정보리스트</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            회원정보
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
						<th>회원번호</th>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>이름</th>
					<!-- 	<th>주민번호</th> -->
						<th>주소</th>
						<th>상세주소</th>
						<th>휴대폰</th>
						<th>이메일</th>
						<th>회원수정</th>
                                    </tr>
                                </thead>
                                <tbody>
                                   <c:forEach var="member" items="${memberlist}">
					<tr>
						<td>${member.no}</td>
						<td>${member.id}</td>
						<td>${member.password}</td>
						<td>${member.name}</td>
					<%-- 	<td>${member.jumin1}-${member.jumin2}</td> --%>
						<td>${member.address1}</td>
						<td>${member.address2}</td>
						<td>${member.phone}</td>
						<td>${member.email}</td>
						<td><a href="<%=cp %>/admemberModifyform?id=${member.id}" >수정</a> / <a href="<%=cp %>/admemberDelete?id=${member.id}" id="admemberDelete" onclick="return admemberDelete()">삭제</a></td> 
					</tr>
					</c:forEach>
                                    </tbody>
                                    </table>
                                    </div>

			
                                    </div>
                                    </div>
                                    </div>
                                    </div>

                                   