<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/funiture/resources/user/css/style.css" rel="stylesheet">
<link href="/funiture/resources/board/boardCss.css" rel="stylesheet">
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">공지사항</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
	<!-- <script>
			if(confirm("삭제 하시겠습니까?")==true){
				location.href='delete?no=${view.no}';
			} else{
				return;
			}
		});
	</script> -->
	<script type="text/javascript">
		$(document).ready(function() {
			$("#delete").click(function(){
				if(confirm("삭제하시겠습니까?")==true){
					location.href='delete?no='+${view.no};
				}else{
					return;
				}
		});
	}); 
	</script>
	<div class="panel-body">
		<div class="table-responsive">
			<table class="table table-bordered table-striped">
				<tr>
					<td height="30" bgcolor="#F5F5F5" width="70">
						<div align="center">제목</div>
					</td>
					<td colspan="5" bgcolor="#FFFFFF">
						<div align="center">${view.subject}</div>
					</td>
				</tr>
				<tr>
					<td height="30" bgcolor="#F5F5F5" width="70">
						<div align="center">No</div>
					</td>
					<td bgcolor="#FFFFFF" width="90">
						<div align="center">
							${view.no}<br>
						</div>
					</td>
					<td bgcolor="#F5F5F5" width="70">
						<div align="center">등록일</div> 
					</td>
					<td bgcolor="#FFFFFF" width="70">
						<div align="center"><fmt:formatDate value="${view.reg_date}" pattern="yyyy-MM-dd"/></div>
					</td>
					<td bgcolor="#F5F5F5" width="70">
						<div align="center">작성자</div></td>
                                        <td bgcolor="#FFFFFF" width="100">
                                          <div align="center">${view.id_admin}</div>
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
						<%-- <!-- 이전글 다음글 -->
						<c:choose>
							<c:when test="${fn:length(list)==2 and view.no == list[0].no}">
							<tr>
								<td><span class="prev">이전</span>이전글이 없습니다.</td>
							</tr>
							<tr>
								<td><span class="next">다음</span><a href="/adnotice/view?no=${list[1].no}">${list[1].subject}</a></td>
							</tr>
							</c:when>
							<c:when test="${fn:length(list)==2 and view.no < list[0].no}">
							<tr>
								<td><span class="prev">이전</span><a href="/adnotice/view?no=${list[0].no}">${list[0].subject}</a></td>
							</tr>
							<tr>
								<td><span class="next">다음</span>다음글이 없습니다.</td>
							</tr>
							</c:when>
							<c:when test="${fn:length(list) == 3 and view.no <list[0].no}">
							<tr>
								<td><span class="prev">이전</span><a href="/adnotice/view?no=${list[0].no}">${list[0].subject}</a></td>
							</tr>
							<tr>
								<td><span class="next">다음</span><a href="/adnotice/view?no=${list[2].no}">${list[2].subject}</a></td>
							</tr>
							</c:when>
							</c:choose> --%>
						</table>
						</div>
						<div ALIGN = "CENTER">
			<div class="send">
							<input type="submit" value="수정" onclick="javascript:location.href='modify?no=${view.no}';">
							<input type="submit" value="삭제" id="delete">
							<input type="button" value="목록" id="reset" onclick="javascript:location.href='list';">
						</div>
						</div>