<%@ page import="com.my.oneday.AdOnedayDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/funiture/resources/user/css/common.css" rel="stylesheet"
   type="text/css" media="all" />
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">
<%String contextPath = request.getContextPath();%>
var contextPath = "<%=contextPath%>";
   jQuery(document).ready(function() {
      jQuery("#priceBtn").click(function() {
         var qurey = {
            price : jQuery("#goods_price").val(),
            maxnum : jQuery("#goods_qty").val()
         };
         jQuery.ajax({
            type : "POST",
            url : "/funiture/oneday/test",
            data : qurey,
            success : function(data) {
               $("#priceDiv").html(data);
            }
         });
      });
   });

   function reserveConfirm() {

      var frm = document.order;

      if (frm.name.value == "") {
         alert("예약자를 입력해주세요.");
         return false;
      }
      if (frm.phone.value == "") {
         alert("전화번호를 입력해주세요.");
         return false;
      }
      if (confirm("예약하시겠습니까? 결제를 마치셔야 예약이 완료됩니다. ") == true) {
         return true;
      } else {
         return false;
      }
   }
</script>
<!-- grow -->
<div class="grow">
   <div class="container">
      <h2>ONE-DAY CLASS</h2>
   </div>
</div>
<!-- grow -->
<div class="product">
   <div class="container">
      <form:form action="order" name="order" method="post"
         modelAttribute="userOnedayModel" encType="multipart/form-data"
         onsubmit="return reserveConfirm()">
         <c:forEach var="list" items="${list}" varStatus="stat">
            <div class="product-price1">
               <div class="top-sing">
                  <div class="col-md-6 single-top">
                     <div class="flexslider">
                        <ul class="slides">
                           <tr>
                              <td>
                                 <div class="thumb-image">
                                    <img
                                       src="/funiture/resources/oneday_upload/${list.main_save }"
                                       data-imagezoom="true" class="img-responsive" /> <input
                                       type="hidden" id="goods_no" name="goods_no"
                                       value="${list.oneday_no}" /> <input type="hidden"
                                       id="oneday_no" name="oneday_no" value="${list.oneday_no}" />

                                 </div>
                              </td>
                           </tr>
                        </ul>
                     </div>
                     <div class="clearfix"></div>
                  </div>
                  <div class="col-md-5 single-top-in simpleCart_shelfItem">
                     <div class="single-para ">
                        <h4>${list.name }</h4>
                        <div class="star-on">
                           <div class="clearfix"></div>
                        </div>

                        <h5 class="item_price">
                           <img src="/funiture/resources/oneday_upload/krw.png" width="20"
                              height="20" />
                           <fmt:formatNumber value="${list.price }" pattern="#,###" />
                           <input type="hidden" value="${list.price }" id="goods_price"
                              name="goods_price" />
                        </h5>
                        <p>
                           날짜&nbsp;:&nbsp;
                           <fmt:formatDate value="${list.day}" pattern="yyyy/MM/dd"></fmt:formatDate>
                        </p>
                        <p>${list.content }</p>
                        <p>※ 원데이 클래스는 무통장 입금으로만 결제 가능합니다.</p>
                        <p>
                           <input type="hidden" value="${list.maxnum }" id="testMaxnum"
                              name="testMaxnum" /> 인원 &nbsp;:&nbsp;&nbsp;<select
                              name="goods_qty" id="goods_qty">
                              <!-- 선택 가능 인원수 반복문으로 출력 -->
                              <c:if test="${0 eq list.maxnum}">
                                    <option value="0">SOLD OUT</option>
                                    
                                 </c:if>
                              <c:forEach var="list2" items="${list2}" varStatus="stat">
                                 <c:if test="${0 ne list.maxnum}">
                                    <option value="${list2}">${list2}</option>
                                 </c:if>
                                 
                              </c:forEach>
                           </select>
                        </p>
                        <p>
                           예약자&nbsp;:&nbsp;&nbsp;<input type="text" id="name" path="name"
                              name="name" placeholder="입금자명을 적어주세요." />
                        </p>
                        <p>
                           전화번호&nbsp;:&nbsp;&nbsp;<input type="text" id="phone"
                              path="phone" name="phone" placeholder="'-'를 빼고 적어주세요." />
                        </p>
                        <p>
                        <div id="priceDiv"></div>
                        </p>

                        <div class="clearfix"></div>
                        <input type="button" class="add-cart item_add" id="priceBtn"
                           value="가격 계산하기" />
                        <button type="submit" class="add-cart item_add">예약하기</button>
                        <button onclick="history.back();return false"
                           class="add-cart item_add">리스트로 돌아가기</button>
                     </div>
                  </div>
               </div>
            </div>
         </c:forEach>
         <div class="page">${pageHtml}</div>
      </form:form>
   </div>

</div>
</div>
<div class="clearfix"></div>
