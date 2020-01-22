<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="/funiture/resources/custom/css/customKHR.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="/funiture/resources/user/css/flexslider.css" type="text/css"
						media="screen" />
<script src="/funiture/resources/custom/js/customKHR.js"></script>

		<!-- products -->
<!-- grow -->
<div class="grow">
	<div class="container">
		<h2 id="ordermade">ORDER MADE - DETAILS</h2>
	</div>
</div>
<!-- grow -->
<div class="product">
	<div class="container">
		<div class="product-price1">
			<a href="list?page=${listPage}" class="go-list item_add">GO TO CUSTOM GOODS LIST</a>
			<!-- custom 제품 관련 -->
			<div class="top-sing">
				<!-- 제품 이미지 -->
				<div class="col-md-6 col-sm-12 single-top">
					<div class="flexslider">
						<ul class="slides">
							<li data-thumb="/funiture/resources/custom/customImg/${cu_main_save[0]}">
								<div class="thumb-image">
									<img src="/funiture/resources/custom/customImg/${cu_main_save[0]}"
										data-imagezoom="true" class="img-responsive">
								</div>
							</li>
							<li data-thumb="/funiture/resources/custom/customImg/${cu_main_save[1]}">
								<div class="thumb-image">
									<img src="/funiture/resources/custom/customImg/${cu_main_save[1]}"
										data-imagezoom="true" class="img-responsive">
								</div>
							</li>
							<li data-thumb="/funiture/resources/custom/customImg/${cu_main_save[2]}">
								<div class="thumb-image">
									<img src="/funiture/resources/custom/customImg/${cu_main_save[2]}"
										data-imagezoom="true" class="img-responsive">
								</div>
							</li>
						</ul>
					</div>

					<div class="clearfix"></div>
					<!-- slide -->

					<!-- flexSlider -->
					<script defer src="/funiture/resources/user/js/jquery.flexslider.js"></script>
					<script>
						// Can also be used with $(document).ready()
						$(window).load(function() {
							$('.flexslider').flexslider({
								animation : "slide",
								controlNav : "thumbnails"
							});
						});
					</script>
				</div>
				<!-- /제품 이미지 -->
				<!-- 제품 기본 설명 -->
				<div class="col-md-6 single-top-in simpleCart_shelfItem">
					<div class="single-para ">
						<h4>${item.name}</h4>
						<input type="hidden" name="cu_no" value="${item.cu_no}" class="cu_no"/>
						<div class="star-on">

							<div class="review">
								<a href="#customReview"> ${totalCount} customer review </a>

							</div>
							<div class="clearfix"></div>
						</div>

						<h6 class="item_price">￦ 0  (견적 문의를 통해 결정됩니다.)</h6>
						<p>
							자세한 내용은 <a href="#customDetail">상세 설명 페이지</a>를 참조하여 주시기 바랍니다.
						</p>
						<p>
							제작을 원하시면 아래 버튼을 눌러 견적 문의 폼을 작성하여 등록해주세요. 관리자와 협의하여 옵션 및 견적가가 결정됩니다. 
						</p>
						<a href="#" class="go-form item_add">GO TO ESTIMATING GOODS</a>
						<div class="clearfix"></div>
					</div>
				</div>
				<!-- /제품 기본 설명 -->
				<!-- 상세설명 페이지 -->
				<div class="col-md-12 single-top-in">
					<div class="single-para ">
						<h6 class="item_price" id="customDetail">상세 설명 페이지</h6>
						<img id="customDetailImg" src="/funiture/resources/custom/customImg/${item.cu_detail_save}">
					</div>
					<div style="text-align:right">
						<a href="#ordermade" style="font-size:1em;color:#800000">
						▲TOP</a></div>
				</div>
				<!-- /상세설명 페이지 -->
			</div>
			<!-- /custom 제품 관련 -->
			<!-- review -->
			<div class=" bottom-product">
				<div class="col-md-12 single-top-in">
					<div class="single-para ">
						<h6 class="item_price" id="customReview">주문제작 후기</h6>
						<c:if test="${session_id!=null}">
						<span><a href="#" class="reviewForm">후기 작성하기</a></span>
						</c:if>
						<div class="panel">
							<div class="panel-group">
								<c:if test="${empty review}">
								<div style="padding:50px;text-align:center">
									작성된 후기가 없습니다.
								</div>
								</c:if>
								<!-- 여기부터forEach -->
								<c:forEach items="${review}" var="row">
								<div class="panel panel-default">
									<div class="panel-heading">
										<input type="hidden" class="reviewNo" value="${row.no}"/>
										<table class="table-responsive">
											<tr>
												<td style="padding-right:30px">${row.no}</td>
												<td>
													<h6 class="panel-title">
														<a href="#cuboardCom_${row.no}" class="body">
															${row.subject}
														</a>
														<c:if test="${row.reply!=null}">
														[1]
														</c:if>
													</h6>
												</td>
												<td style="padding-left:50px;padding-right:30px">
													<fmt:formatDate value="${row.com_reg_date}" pattern="yyyy-MM-dd HH:mm"/>
												</td>
												<c:if test="${session_id==row.id}">
												<td>
													<small>
													<a href="#" class="modi">수정</a>
													<a href="#" class="dele">삭제</a>
													</small>
												</td>
												</c:if>
											</tr>
										</table>
									</div>
									<div id="cuboardCom_${row.no}" style="display:none" class="panel-collapse collapse in">
										<div class="panel-body">
											<p class="custom_comment">ID : ${row.id}
												<c:if test="${row.reply==null&&session_id=='admin'}">
												&nbsp;/&nbsp;&nbsp;&nbsp;
												<a href="#" class="reply">reply</a>
												</c:if>
											</p>
											${row.com}<br/>
											<c:if test="${row.re_save!=null}">
											<img src="/funiture/resources/custom/customReImg/${row.re_save}"
												width="500">
											</c:if>
										</div>
										<div class="panel-comment">
											<c:if test="${row.reply!=null}">
											<p class="custom_comment">
												Funiture :&nbsp;&nbsp;&nbsp;${row.re_reg_date}&nbsp;&nbsp;&nbsp;
												<c:if test="${session_id=='admin'}">
												<small><a href="#" class="comDele">delete</a></small>
												</c:if>
											</p>
											<div class="panel">
												${row.reply}
											</div>
											</c:if>
											<div class="contact-grid" style="display:none">
												<label style="padding-top:20px">답변하기</label>
												<form action="reviewComWrite" method="post"
													onsubmit="return blank(this)" name="form">
													<input type="hidden" name="no" value="${row.no}">
													<input type="hidden" name="cu_no" value="${item.cu_no}">
													<textarea name="reply" cols="50" rows="2" placeholder="답변글을 작성하세요."></textarea>
													<span class="send">
														<input type="submit" value="등록하기">
													</span>
												</form>
											</div>
										</div>
										
									</div>
								</div>
								</c:forEach>
								<!-- /여기까지 forEach -->
							</div>
						</div>
						<!-- .panel-body -->
						<div style="text-align:right">
						<a href="#ordermade" style="font-size:1em;color:#800000">
						▲TOP</a></div>
					</div>
					<span id="moreReviews"
					style="cursor:pointer;background-color:#800000;border-color:white;border:1px solid;
					width:10%;padding:0.5em;font-size:0.9em;color:#fff;text-align:center">
						<p class="fa fa-hand-o-down"></p> 리뷰를 더 보기
					</span>
					<span id="rollUpReviews"
					style="cursor:pointer;background-color:#800000;border-color:white;border:1px solid;
					width:10%;padding:0.5em;font-size:0.9em;color:#fff;text-align:center">
						<p class="fa fa-hand-o-up"></p> 리뷰 이제 접기
					</span>
				</div>
			</div>
			<!-- /review -->
		</div>
	</div>
</div>
<!-- products -->

    <!-- Custom Theme JavaScript -->
<script type="text/javascript">
 $(document).ready(function(){
	 var cu_no = $(".cu_no").val();
	 var reviewNum = $(".panel-group").children().length;
	 var clickNum = 5;
	load(); 
	
	function load(){
		for(var i=clickNum; i<reviewNum; i++){
			$(".panel-group").children(":eq("+i+")").css("display","none");
		}
	}
	
	$(".body").click(function(e){
		e.preventDefault();
		var body = $(this).attr("href");
		$(body).slideToggle("slow");
	});
	$(".reply").click(function(e){
		e.preventDefault();
		var cmnt = $(this).closest(".panel-body").next().find(".contact-grid");
		$(cmnt).slideToggle("slow");
	});
	
	$(".go-form").click(function(e){
		e.preventDefault();
		if('${session_id}'==""){
			alert('로그인 후 이용해주세요.');
			return false;
		}
		location.href='../cuboard/writeForm?cu_no='+cu_no;
	});
	
	$(".modi").click(function(e){
		e.preventDefault();
		var conf = confirm("후기를 수정하시겠습니까?");
		if(!conf){return false;}
		var no = $(this).closest(".panel-heading").find(".reviewNo").val();
		openModifyForm(cu_no, no);
	});
	
	$(".dele").click(function(e){
		e.preventDefault();
		var conf = confirm("후기를 삭제하시겠습니까?");
		if(!conf){return false;}
		var no = $(this).closest(".panel-heading").find(".reviewNo").val();
		location.href='reviewDelete?no='+no+'&cu_no='+cu_no;
	});
	$(".comDele").click(function(e){
		e.preventDefault();
		var conf = confirm("답변글을 삭제하시겠습니까?");
		if(!conf){return false;}
		var no = $(this).closest(".panel").find(".reviewNo").val();
		location.href='reviewComDelete?no='+no+'&cu_no='+cu_no;
	});
	$(".reviewForm").click(function(e){
		e.preventDefault();
		openReviewForm(cu_no);
	});
	
	function openReviewForm(a) {
		url = "reviewForm?cu_no="+a;
		open(
			url,
			"confirm",
			"toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=770,height=620");
	}
	function openModifyForm(a,b) {
		url = "reviewModifyForm?cu_no="+a+'&no='+b;
		open(
			url,
			"confirm",
			"toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=770,height=620");
	}
	
	$("#moreReviews").click(function(e){
		e.preventDefault();
		for(var i=clickNum; i<clickNum+5; i++){
			$(".panel-group").children(":eq("+i+")").css("display","block");
		}
		clickNum+=5;
	});
	$("#rollUpReviews").click(function(e){
		clickNum=5;
		load();
	});
	
/* 	$(".fa").click(function() {
		alert();
		var page = $("strong").text();
		//click event가 prv인지 next인지
		if($(this).attr("id")=='prv'){
			page = page-1
		}else if($(this).attr("id")=='next'){
			page = page+1
		};
		var qurey = {
			cu_no:$(".cu_no").val()
			,page:page
		};
		$.ajax({
            type: "POST",
            url: "test",
            data: qurey,
            success: function(data) {
            	for(var key in data){
	            	if(key=='pageHtml'){
	            		$(".pageArea").html(data[key]);
	            	} else{
	            		var reviewArea = $(".panel-group").children();
	            		var area = $(reviewArea).first();
	            		$(reviewArea).remove();
	            		for(var i in data[key]){
	            			var review = data[key][i];
	            			$(area).find(".reviewNo").attr("value",review['no']);
	            			$(area).find("td:eq(0)").text(review['no']);
	            			$(area).find(".body").attr("href","#cuboardCom_"+review['no']);
	            			$(area).find(".body").text(review['subject']);
	            			alert(review['com_reg_date']);
	            			//$(area).find("td:eq(2)").text(date);
	            			$(area).clone().appendTo(".panel-group");
	            			//$("c:forEach").attr("items",review);
	            		}
	            		
	            		//$(review).
	            		//$(review).appendTo(".panel-group");
	            	}
            	}
			}
		});
	}); */
});
</script>
