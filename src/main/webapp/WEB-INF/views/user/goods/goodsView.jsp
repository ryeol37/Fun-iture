<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
  <!-- goods CSS -->
<link href="/funiture/resources/user/css/goods.css" rel="stylesheet">
<script type="text/javascript">

	// 구매갯수 변환 함수
	function count_change(temp){
		var test=document.goodsform.amount.value;
		var price="${goodsModel.goods_price}";//숫자계산위해필요
			if(temp==0){
				test++;
			}else if(temp==1){
				if(test >1 ) test--;
			}
		if(test>"${goodsModel.goods_qty}"){
			alert("잔여수량만큼 구매하세요");
			test=1;
		}
		
		document.goodsform.amount.value=test;
		var value2 = $("#span1").html(price*test); //숫자계산위해필요
	    var value3 = $("em").html(price*test);//숫자계산위해필요
	    var value4 = $("#am2").html("("+test+"개)");//숫자계산위해필요
	}
	
	//span값변경
	 $(window).load(function(){ 
	    
	    var amount=document.goodsform.amount.value;
	    var price="${goodsModel.goods_price}";
	    var value2 = $("#span1").html(price*amount); 
	    var value3 = $("em").html(price*amount);
	    var value4 = $("#am2").html("("+amount+"개)");
	    
	    $('em, #span1').each(
				function() {
					if (!isNaN(Number($(this).text())) && $(this).text())
						$(this).text(
								Number($(this).text()).toLocaleString().split('.')[0]);
				});
	   
	}); 
	
	//장바구니 처리
		var onBasket = function(){
			
			var num="${goodsModel.goods_no}";
			var amount = document.goodsform.amount.value;
			var id = "${session_id}";
			location.href = '/funiture/basket/add?goods_no='+num+'&goods_qty='+amount+'&id='+id;
		};
		
		//주문처리
		var onOrder = function(){
	     
	     var num="${goodsModel.goods_no}";
	     var amount = document.goodsform.amount.value;
	     var id = "${session_id}";
	     location.href = '/funiture/order/orderBuy?goods_no='+num+'&goods_qty='+amount+'&id='+id;
	     
	  };
  
  //코멘트 처리
  var onComment = function(){
		var form = $('.goodsComForm')[0];
		form.action = 'goodsComWrite'; 
		form.submit();
	};
	
	//코멘트 삭제 팝업
	function delchk(){
	    return confirm("삭제하시겠습니까?");
	}
</script>

</head>
<body>
<div class="grow">
		<div class="container">
			<h2>Products</h2>
		</div>
</div>

    
<div class="xans-element- xans-product xans-product-menupackage "><p class="color-bar"></p>
<div class="xans-element- xans-product xans-product-headcategory title ">
	<h2><span>
	 	<c:if test="${goodsCate eq 0}">
			SHELVES & BOOKCASES
		</c:if>
		<c:if test="${goodsCate eq 1}">
			TABLES
		</c:if>	
		<c:if test="${goodsCate eq 2}">
			CHAIRS
		</c:if>	
		<c:if test="${goodsCate eq 3}">
			SOFAS
		</c:if>
		<c:if test="${goodsCate eq 4}">
			BEDS
		</c:if>	
	</span></h2>
</div>
</div>
<div class="xans-element- xans-product xans-product-detail">
<div class="headingArea">
</div>
<div class="detailArea ">

        <span class="icon">      </span>

        <!-- 이미지 영역 -->
        <div class="xans-element- xans-product xans-product-image imgArea "><!--js(/js/module/product/product_image.js)-->
<div class="imgBox">
   
                            <a href="Javascript:void(0)">
                                <img src="/funiture/resources/goodsImage/${goodsModel.main_save}" onerror="this.src='/funiture/resources/user/images/noimg.gif'" class="imgbox">
                            &nbsp;</a>
                        
                    

            </div>
<!-- //참고 -->


<div class="likeButton">
                <a href="goodsLikes?goods_no=${goodsModel.goods_no}">
                <button type="submit"><span class="title">좋아요</span><span class="count">${likesCount }</span></button>
                </a>
            </div>
</div>
<!-- //이미지 영역 -->
        <!-- 상세정보 내역 -->
        <form name="goodsform" action="#" method="post" >
        <div class="infoArea">
            <h2>${goodsModel.goods_name}</h2>
            <p class="summary"></p>
            <%-- <p class="description">${goodsModel.goods_size}</p> --%>

            <div class="xans-element- xans-product xans-product-detaildesign">
            <!--
                    출력 갯수 지정 변수, 없으면 설정된 전체가 나옵니다.
                    count = 10
                -->
<table border="1" summary="">
<caption> 기본 정보</caption>
                    <tbody>
<tr class="displaynone xans-record-">
<th scope="row"><span style="font-size:11px;color:#555555;">NAME</span></th>
                            <td><span style="font-size:11px;color:#555555;">${goodsModel.goods_name}</span></td>
                        </tr>
<tr class="displaynone xans-record-">
<th scope="row"><span style="font-size:12px;color:#000033;font-weight:bold;">PRICE</span></th>
                            <td><span style="font-size:12px;color:#000033;font-weight:bold;"><strong id="span_product_price_text" style="text-decoration: line-through;">${goodsModel.goods_price}</strong><input id="product_price" name="product_price" value="" type="hidden"></span></td>
                        </tr>
<tr class=" xans-record-">
<th scope="row"><span style="font-size:11px;color:#555555;">사이즈</span></th>
                            <td><span style="font-size:11px;color:#555555;">${goodsModel.goods_size}</span></td>
                        </tr>
<tr class=" xans-record-">
<th scope="row"><span style="font-size:11px;color:#555555;">상품소재</span></th>
                            <td><span style="font-size:11px;color:#555555;">칠레산 소나무</span></td>
                        </tr>
<tr class=" xans-record-">
<th scope="row"><span style="font-size:11px;color:#555555;">마감도료</span></th>
                            <td><span style="font-size:11px;color:#555555;">오스모社 천연오일</span></td>
                        </tr>
<tr class=" xans-record-">
<th scope="row"><span style="font-size:11px;color:#555555;">브랜드</span></th>
                            <td><span style="font-size:11px;color:#555555;">Fun-iture</span></td>
                        </tr>
</tbody>
</table>
</div>

            
            <!-- //상세정보 내역 -->

            

            <!-- 참고 : 뉴상품관리 전용 모듈입니다. 뉴상품관리 이외의 곳에서 사용하면 정상동작하지 않습니다. -->
            <!-- //참고 -->
            <!-- 참고 : 뉴상품관리 전용 변수가 포함되어 있습니다. 뉴상품관리 이외의 곳에서 사용하면 일부 변수가 정상동작하지 않을 수 있습니다. -->
            <div id="totalProducts" class="">
                <table border="1">
<caption>상품 목록</caption>
                    <colgroup>
<col style="width:284px;">
<col style="width:80px;">
<col style="width:110px;">
</colgroup>
<thead><tr>
<th scope="col">상품명</th>
                            <th scope="col">상품수</th>
                            <th scope="col">가격</th>
                        </tr></thead>
<tbody><tr>
<td>수량</td>
                            <td>
                                <p class="quantity">
                                    <input type="text" name="amount" class="quantity_opt" value="1" style="text-align: center; ime-mode:Disabled;" onkeypress="checknum()" readonly  />                                   
                                    <a href="JavaScript:count_change(0)"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_up.gif" alt="수량증가" class="QuantityUp up"></a>
                                    <a href="JavaScript:count_change(1)"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_down.gif" alt="수량감소" class="QuantityDown down"></a>
                                </p>
                            </td>
                            <td class="right">
<span class="quantity_price" id="span1"></span>원
</td>
                        </tr></tbody>
<!-- 참고 : 옵션선택 또는 세트상품 선택시 상품이 추가되는 영역입니다. 쇼핑몰 화면에는 아래와 같은 마크업구조로 표시됩니다. 삭제시 기능이 정상동작 하지 않습니다.--><tbody><!-- tr>
                            <td>
                                <p class="product">
                                    $상품명<br />
                                    <span>$옵션</span>
                                </p>
                            </td>
                            <td>
                                <span class="quantity">
                                    <input type="text" class="quantity_opt" />
                                    &nbsp;<a href="#none"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_up.gif" alt="수량증가" class="up" /></a>
                                    <a href="#none"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_down.gif" alt="수량감소" class="down" /></a>
                                </span>
                                <a href="#none"><img src="//img.echosting.cafe24.com/design/skin/default/product/btn_price_delete.gif" alt="삭제" class="option_box_del" /></a>
                            </td>
                            <td class="right">
                                <span>$가격</span>
                                <span class="mileage">(<img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/product/ico_pay_point.gif" /> &nbsp;<span class="mileage_price">$적립금</span>)</span>
                            </td>
                        </tr --></tbody>
<!-- //참고 --><tfoot><tr>
<td colspan="3">
                                <strong>총 상품금액</strong>(수량) : <span class="total"><strong><em>${goodsModel.goods_price}</em></strong> <span id="am2">(${goodsModel.goods_qty}개)</span></span>
                            </td>
                        </tr></tfoot>
</table>
</div>
<!-- //참고 -->
            <!-- 참고 : 뉴상품관리 전용 변수가 포함되어 있습니다. 뉴상품관리 이외의 곳에서 사용하면 일부 변수가 정상동작하지 않을 수 있습니다. -->
            <div class="xans-element- xans-product xans-product-action ">
            		<div class="ec-base-button">
                    <a href="JavaScript:onOrder()" class="first  point" onclick="product_submit(1, '/exec/front/order/basket/', this)">Buy now</a>
                    <a href="JavaScript:onBasket()" class="" onclick="product_submit(2, '/exec/front/order/basket/', this)">cart</a>
                    <a href="#none" onclick="add_wishlist_nologin('/member/login.html');" class="">wish</a>
                </div>
</div>
<!-- //참고 -->
        </div>
        </form>
    </div>
    </div>
    <!-- //상단 제품 정보 -->

<script>
    var $title = $(".detailArea.setProduct .title"),
        set = $(".setProduct .productSet");
            
    if(set.is(':visible')){          
        $title.css("display","block");
      }else{          
          $title.css("display","none");
      }   
</script>
<!-- 쿠폰 다운로드 -->
<!-- //쿠폰 다운로드 -->
<div class="xans-element- xans-product xans-product-additional "><!-- 상품상세정보 -->
<div id="prdDetail">
        <ul class="menu">
<li class="selected"><a href="#prdDetail">Detail info</a></li>
            <li><a href="#prdInfo">Shop guide</a></li>
            <li><a href="#prdReview">Review</a></li>
        </ul>
<div class="cont">
<img src="/funiture/resources/goodsImage/${goodsModel.detail_save}" onerror="this.src='/funiture/resources/user/images/noimg.gif'">
</div>
    </div>
<!-- //상품상세정보 -->
<!-- 상품구매안내 -->
<div id="prdInfo">
        <ul class="menu">
			<li><a href="#prdDetail">Detail info</a></li>
            <li class="selected"><a href="#prdInfo">Shop guide</a></li>
            <li><a href="#prdReview">Review</a></li>
        </ul>
<div class="cont">
           

<div id="tab-container" class="tab-container" data-easytabs="true">
  
<div class="panel-container">
        <div id="tabs1">
                <h3>상품결제정보</h3>
                고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다. 확인과정에서 도난 카드의 사용이나 타인 명의의 주문등
      정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다. &nbsp; <br>
      <br>
      무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다. &nbsp;<br>
      주문시 입력한&nbsp;입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, 7일 이내로 입금을 하셔야 하며&nbsp;입금되지
      않은 주문은 자동취소 됩니다. <br>
      <br><br><br><br><br>
        </div>
        <div id="tabs2">
                <h3>배송정보</h3>
                <ul class="delivery">
					<li>배송 방법 : 직접배송</li>
                    <li>배송 지역 : </li>
                    <li>배송 비용 : 무료</li>
                    <li>배송 기간 : 10일 ~ 21일</li>
                    <li>배송 안내 : 상세 페이지 참조</li>
                    <br><br><br><br><br>
                </ul>
        </div>
        <div id="tabs3">
                <h3>교환 및 반품정보</h3>
                상세 페이지 참조
                <br><br><br><br><br>
        </div>
        <div id="tabs4">
                <h3>서비스문의</h3>
                <br><br><br><br><br>
        </div>
    </div>
</div>

        </div>
    </div>
<!-- //상품구매안내 -->
<!-- 상품사용후기 -->
<div id="prdReview">
        <ul class="menu">
<li><a href="#prdDetail">Detail info</a></li>
            <li><a href="#prdInfo">Shop guide</a></li>
            <li class="selected"><a href="#prdReview">Review</a></li>
        </ul>
        
<div class="inner">
        <form class="goodsComForm" method="post" enctype="multipart/form-data">
        <input type="hidden" name="item_no" value="${goodsModel.goods_no}"/>
        
<div class="board">
            <h3>PHOTO REVIEW</h3>
            <p class="desc">상품의 사용후기를 적어주세요.</p>

            <div class="xans-element- xans-product xans-product-review"><a name="use_review"></a>
<p class="noAccess displaynone">글읽기 권한이 없습니다.</p>

<div class="ec-base-table typeList">
                    <table border="1" summary="" class="">
<caption>상품사용후기</caption>
                    

                            
                         
<tbody class="center">
<!-- 리뷰 글쓰기 -->
<tr class="xans-record-">
<c:if test="${session_id == null}">
<input type="text" style="align:center; margin: 10px; width: 950px; height: 55px;" value="로그인 후에 후기 작성이 가능합니다." readonly="readonly"/>
<p class="ec-base-button typeBorder"></p>
</c:if>

<c:if test="${session_id != null}">
<textarea name="goodsComment" style="margin: 10px; width: 849px; height: 55px;"></textarea>
<button type="button" class="point" onclick="onComment()">Write</button>
<input type="file" name="fileload" style="width : 200px;" id="fileload" value="이미지등록">
<p class="ec-base-button typeBorder"></p>
</c:if>
</tr>
<!-- //리뷰 글쓰기 -->


<c:if test="${fn:length(goodsComList) ge 0}">
		<p class="reply_num"> </p>
		</c:if> 
		

                    
       <colgroup>
<col style="width:70px;">
<col style="width:134px;">
<col style="width:auto">
<col style="width:80px;">
<col style="width:100px;">
<col style="width:55px;">
</colgroup>
<thead><tr>
<th scope="col">번호</th>
                                <th scope="col"></th>
                                <th scope="col">내용</th>
                                <th scope="col">작성자</th>
                                <th scope="col">작성일</th>
                                <th scope="col"></th>
                            </tr></thead>
                            
<c:forEach var="goodsComList" items="${goodsComList}" varStatus="stat">


<tbody>
<tr class="xans-record-">
<td>${goodsComList.no}</td>
                                <td><img src="/funiture/resources/goodsImage/${goodsComList.re_save}" onerror="this.src='/funiture/resources/user/images/noimg.gif'" width=100%></td>
                                <td class="subject left txtBreak">${goodsComList.com}<span class="txtWarn"></span>
</td>
                                <td><strong>${goodsComList.id}</strong></td>
                                <td class="txtInfo txt11"><fmt:formatDate value="${goodsComList.com_reg_date}" pattern="yy.MM.dd"></fmt:formatDate></td>
                                <td class="txtInfo txt11">
                                
                     <!-- Delete Button -->
					<c:if test="${session_id == goodsComList.id}">
						<a href="goodsComDelete?no=${goodsComList.no}&goods_no=${goodsModel.goods_no}" class="ec-base-button" onclick="return delchk()">
							<span class="ec-base-button">Delete</span>
						</a>
					</c:if>
					<!-- Delete Button -->
					
								</td>
                            </tr>
</tbody>
</c:forEach>	
</table>
</div>

		<!-- 페이징 -->
		<!-- //페이징 -->
		
</div>
</div>
</form>
        </div>
    </div>
<!-- //상품사용후기 -->

</div>