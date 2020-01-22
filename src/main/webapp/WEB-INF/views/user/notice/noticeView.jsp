<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- grow -->
<div class="grow">
	<div class="container">
		<h2>공지사항</h2>
	</div>
</div>
<!-- grow -->
<!--content-->
<div class=" container">
	<div class=" register">
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
					<div align="center">
						<fmt:formatDate value="${view.reg_date}" pattern="yyyy-MM-dd" />
					</div>
				</td>
				<td bgcolor="#F5F5F5" width="70">
					<div align="center">작성자</div>
				</td>
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
		
		</table>
		<div ALIGN = "RIGHT">
	<div class="send">
		<input type="submit" value="목록" onclick="javascript:location.href='list';" >
	</div>
	</div>
	</div>
</div>
