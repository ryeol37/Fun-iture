<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% String cp = request.getContextPath(); %>


<script type="text/javascript">
	function logout(){
		var logout = document.getElementById("logout");
		var check = confirm("로그아웃 하시겠습니까?");
		if(check){
			logout.method = "post";
			logout.action = "<%=cp %>/member/logout";
			logout.submit();
			return true;
		}else{
			return false;
		}
	}
</script>


<!DOCTYPE html>
<html>
<head>
<title>FUN-ITURE:::YOUR FURNITURE MUST BE SUPER FUN</title>
<link href="/funiture/resources/user/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="/funiture/resources/user/js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="/funiture/resources/user/css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Mattress Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--fonts-->
<link href='//fonts.googleapis.com/css?family=Lato:100,300,400,700,900' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'><!--//fonts-->
<!-- start menu -->
<link href="/funiture/resources/user/css/memenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="/funiture/resources/user/js/memenu.js"></script>
<script>$(document).ready(function(){$(".memenu").memenu();});</script>
<script src="/funiture/resources/user/js/simpleCart.min.js"> </script>
<!-- Custom Fonts -->
<link href="/funiture/resources/admin/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<!--header-->
<div class="header">
	<div class="header-top">
		<div class="container">
			<div class="social">
				<ul>
					<li><a href="#"><i class="facebok"> </i></a></li>
					<li><a href="#"><i class="twiter"> </i></a></li>
					<li><a href="#"><i class="inst"> </i></a></li>
					<li><a href="#"><i class="goog"> </i></a></li>
						<div class="clearfix"></div>	
				</ul>
			</div>
			<div class="header-left">

<script src="/funiture/resources/user/js/classie.js"></script>

				<div class="ca-r"> 
					 <div class="cart box_1"> 
					 
					
							
						<c:if test="${session_status == 'Y'}">
						<form id="logout">
						<div class="total">
							</div>
						
						<br>
						
						<p><font color="#FFE05C">${session_name} 님 환영합니다!</font>&nbsp;&nbsp;<a href="#none" onclick="logout()">로그아웃</a></p></form>
						</c:if>
							</div>
				</div>	
											
					<div class="clearfix"> </div>
			</div>
				
		</div>
		</div>
		<div class="container">
			<div class="head-top">
				<div class="logo">
					<h1><a href="<%=cp %>/main">FUN-ITURE</a></h1>
				</div>
		  <div class=" h_menu4">
				<ul class="memenu skyblue">	
				      <li><a class="color1" href="<%=cp %>/contact">ABOUT US</a>
				      	<div class="mepanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<ul>
										<li><a href="<%=cp %>/contact">STORY & CONTACT</a></li>
										<li><a href="<%=cp %>/qna/list">QnA</a></li>
										
									</ul>	
								</div>							
							</div>
							 <div class="col1">
								<div class="h_nav">
									<ul>
										<li><a href="<%=cp %>/notice/list">NOTICE</a></li>
										<li><a href="<%=cp %>/cuboard/list">견적문의</a></li>
									</ul>	
								</div>								
							</div>
						  </div>
						</div>
					</li>
				    <li class="grid"><a class="color2" href="/funiture/goods/goodsList">SHOPPING</a>
					  	<div class="mepanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<ul>
										<li><a href="/funiture/goods/goodsCategoryList?cate_no=0">SHELVES & BOOKCASES</a></li>
										<li><a href="/funiture/goods/goodsCategoryList?cate_no=3">SOFAS</a></li>
									</ul>	
								</div>								
							</div>
							<div class="col1">
								<div class="h_nav">
									<ul>
										<li><a href="/funiture/goods/goodsCategoryList?cate_no=1">TABLES</a></li>
										<li><a href="/funiture/goods/goodsCategoryList?cate_no=4">BEDS</a></li>
									</ul>		
								</div>							
							</div>
							<div class="col1">
								<div class="h_nav">
									<ul>
										<li><a href="/funiture/goods/goodsCategoryList?cate_no=2">CHAIRS</a></li>
									</ul>	
								</div>												
							</div>
						  </div>
						</div>
			    </li>


			<c:if test="${session_status == 'Y'}">
			    				<li><a class="color8" href="<%=cp %>/oneday/list">ONEDAY CLASS</a></li>
			    				 <li><a class="color8" href="<%=cp %>/custom/list">ORDER MADE</a></li>
				<li><a class="color8" href="<%=cp %>/mypage/myform">MY PAGE</a></li>
				<li><a class="color8" href="/funiture/basket/list">BASKET</a></li>
				</c:if>
				
				<c:if test="${session_name == null }">
				<li><a class="color8" href="<%=cp %>/oneday/list">ONEDAY CLASS</a></li>
				 <li><a class="color8" href="<%=cp %>/custom/list">ORDER MADE</a></li>
			<li><a class="color8" href="<%=cp %>/mypage/myform">MY PAGE</a></li> 	
			</c:if>
			<c:if test="${session_name == null }">
					<li class="grid"><a class="color2" href="<%=cp %>/member/loginform">USER</a>
					  	<div class="mepanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<ul>
										<li><a href="<%=cp %>/member/joinAgree">JOIN</a></li>										
									</ul>	
								</div>								
							</div>
							<div class="col1">
								<div class="h_nav">
									<ul>
										<li><a href="<%=cp %>/member/loginform">LOGIN</a></li>
									</ul>	
								</div>								
							</div>
							</div></div>
							</li>
			</c:if>

			  </ul> 
			</div>
	
				<div class="clearfix"> </div>
		</div>
		</div>
	</div>
