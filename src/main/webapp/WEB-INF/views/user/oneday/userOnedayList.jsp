<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/funiture/resources/page.css" rel="stylesheet">
<!-- products -->
<!-- grow -->
<div class="grow">
	<div class="container">
		<h2>ONE-DAY CLASS</h2>
	</div>
</div>
<!-- grow -->
<div class="pro-du">
	<div class="container">
		<div class="col-md-9 product1">
			<c:forEach var="list" items="${list}" varStatus="stat">
				<div class=" bottom-product">
					<div class="col-md-6 bottom-cd simpleCart_shelfItem">
						<div class="product-at ">
							<a href="/funiture/oneday/view?oneday_no=${list.oneday_no }">
							<img src="/funiture/resources/oneday_upload/${list.main_save }"
								width="100" height="350" alt="">
								<tr>
									<td>
										<div class="pro-grid">
											<span class="buy-in">Reserve Now</span>
										</div>
									</td>
								</tr></a>
						</div>
						<p class="tun">
							<span><strong>DIY ${list.name }</strong></span><br>
							<fmt:formatDate value="${list.day}" pattern="yyyy/MM/dd"></fmt:formatDate>
						</p>
						<div class="ca-rt">
									<fmt:formatNumber value="${list.price }" pattern="#,###" />
									<i> </i>
								
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</c:forEach>
			<div class="page">${pagingHtml}</div>
		</div>
		<div class="col-md-3 prod-rgt">
			<div class="pr-btm">
				<h4>Who will teach you?</h4>
				<img class="img-responsive"
					src="/funiture/resources/oneday_upload/teacher.png" alt="">
				<h6>강사 홍길동</h6>
				<p>귀엽고 잘 가르치는 강사</p>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
</div>