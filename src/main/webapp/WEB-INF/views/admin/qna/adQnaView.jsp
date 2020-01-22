<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/funiture/resources/user/css/style.css" rel="stylesheet">
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">QNA 상세보기</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
	<script type="text/javascript">
	function commentDelete(no, qna_no){
		
		var no = no;
		var qna_no = qna_no;
		/* alert(no); 변수 출력하는지 확인하는 중
		alert(qna_no); */  
		if(confirm("댓글을 삭제하시겠습니까")){
			location.href="deletecom?no=" + no + "&qna_no=" + qna_no;
		}
	} 
	
 	function commentUpdate(no){
		
		var no = no;
		/* alert(no); */
		window.name = "update";
		window.open("modifycom?no="+no, "updateForm","width=500, height=350, resizable = no, scrollbar=no");
	} 
		$(document).ready(function() {
			$("#delete").click(function(){
				if(confirm("삭제하시겠습니까?")==true){
					location.href='addelete?qna_no='+${view.qna_no};
				}else{
					return;
				}
		});
	}); 
	</script>
	<div class="panel-body">
		<div class="table-responsive">
			<!--content-->
		<table class="table table-bordered table-striped">
			<tr>
				<td height="30" bgcolor="#F5F5F5" width="70">
						<div align="center">제목</div>
					</td>
					<td bgcolor="#FFFFFF" width="70">
						<div align="center">${view.subject}</div>
					</td>
					<td bgcolor="#F5F5F5" width="70">
						<div align="center">구분</div>
					</td>
					<td bgcolor="#FFFFFF" width="70">
						<div align="center">${view.category}</div>
					</td>
					<td bgcolor="#F5F5F5" width="70">
						<div align="center">상태</div>
					</td>
					<td bgcolor="#FFFFFF" width="70">
						<div align="center">${view.status}</div>
					</td>
			</tr>
			<tr>
				<td height="30" bgcolor="#F5F5F5" width="70">
					<div align="center">No</div>
				</td>
				<td bgcolor="#FFFFFF" width="90">
					<div align="center">
						${view.qna_no}<br>
					</div>
				</td>
				<td bgcolor="#F5F5F5" width="70">
					<div align="center">등록일</div>
				</td>
				<td bgcolor="#FFFFFF" width="70">
					<div align="center">
						<fmt:formatDate value="${view.reg_date}" pattern="yyyy-MM-dd" />
					</div>
				</td>
				<td bgcolor="#F5F5F5" width="70">
					<div align="center">작성자</div>
				</td>
				<td bgcolor="#FFFFFF" width="100">
					<div align="center">${view.id}</div>
				</td>
			</tr>
			<tr>
				<td height="100%" bgcolor="#F5F5F5" valign="top" width="70">
					<div align="center">
						<br> 내 용<br>
					</div>
				</td>
				<td colspan="5" align="center" bgcolor="#FFFFFF" valign="top"
					style="padding: 15px">
					<div align="center">${view.content}</div>
				</td>
			</tr>
		</table>

		<!-- 댓글1 -->
		<!-- /.panel -->
		<div class="chat-panel panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-comment fa-fw"></i> Comment
			</div>
			<div class="panel-body">
				<c:forEach var="commentList" items="${commentList}" varStatus="status">
					<tr>
						<td>번호  : ${status.count} / </td>
					</tr>
					<input type="hidden" name="no" value="${commentList.no}">
					<%-- <strong class="primary-font">NO [ ${commentList.no} ]</strong> --%>
					<strong class="primary-font">작성자 : ${commentList.id} </strong>
					<div class="chat-body clearfix">
						<div class="header">
							<small class="pull-right text-muted"> 
							<i class="fa fa-clock-o fa-fw"></i>${commentList.com_reg_date}
							</small>
						</div>
						<p>
							${commentList.com} <br> <br> <br>
							<c:if test="${session_id == commentList.id }">
						<p class="fa fa-pencil-square-o"/>
						<a onclick="commentUpdate(${commentList.no})"><small>수정</small></a>
						</c:if>
						<p class="fa fa-trash-o"/>
						<a onclick="commentDelete(${commentList.no}, ${view.qna_no})"><small>삭제</small></a>
					</div>
					<hr size="1" width="100%">
				</c:forEach>
				<div class="panel-footer">
					<form action="comment" method="post">
						<!-- commentForm -->
						<div class="input-group">
							<input type="hidden" name="qna_no" value="${view.qna_no}" /> 
							<input type="hidden" name="id" value="${view.id}" /> 
							<input type="text" name="com" value="" class="form-control input-sm" placeholder="Type your message here..." /> 
							<span class="input-group-btn">
								<button class="btn btn-warning btn-sm" id="btn-chat" name="commentWriteBtn">
									<!-- write -->
									Send
								</button>
							</span>
						</div>
					</form>
				</div>
				</div>
				<!-- /.panel-footer -->
			</div>
			<!-- /.panel .chat-panel -->
		
	<div ALIGN="RIGHT">
		<div class="send">
			<%-- <input type="submit" value="수정" onclick="javascript:location.href='modify?qna_no=${view.qna_no}';"> --%>
			<input type="submit" value="삭제" id="delete"> 
			<input type="submit" value="목록" onclick="javascript:location.href='list';">
		</div>
	</div>
	</div>
	</div>
