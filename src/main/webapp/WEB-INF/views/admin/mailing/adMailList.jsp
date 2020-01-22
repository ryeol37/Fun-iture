<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/funiture/resources/user/css/style.css" rel="stylesheet">    
<div id="page-wrapper">
   <div class="row">
      <div class="col-lg-12">
         <h1 class="page-header">Mailling List</h1>
      </div>
      <!-- /.col-lg-12 -->
   </div>
   <!-- /.row -->

    <!-- jQuery  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script type="text/javascript">
    $(function(){ // = javascript의 window.onload와 비슷한 의미를 가짐. (=웹페이지의 로딩이 완료되면 jQuery 내용을 실행해라.)
      $("#checkall").click(function(){ // id가 checkall을 클릭했을 때 함수실행
         if($("#checkall").prop("checked")){ // 클릭 되었으면
            $("input[name=chk]").prop("checked",true); // $("input[name=]") 이름으로 찾기
         // input태그의 name이 chk인 태그들을 찾아서 checked 옵션을 true로 정의. 
      } else { // 클릭이 안되있으면
         $("input[name=chk]").prop("checked",false); // prop : checked 프로퍼티의 값을 표시. attr : checked 속성의 값을 표시.
      // input 태그의 name이 chk인 태그들을 찾아서 checked 옵션을 false로 정의.
      }
   });
         });
    
</script> 
 
    
    <br><br>
 
    <div class="row">
    
        <button type="button" class="btn btn-outline btn-primary pull-right" id="selectBtn">선택</button>
        <table id="example-table-3" width="100%" class="table table-bordered table-hover text-center">
            <thead>
                <tr>
                	<th><input type="checkbox" id="checkall"/></th>
                    <th>No. </th>
                    <th>이메일</th>
                </tr>
            </thead>
            <tbody>
            	    <c:forEach var="list" items="${list}">
                <tr>
                    <td><input type="checkbox" name="chk"></td>
                    <td>${list.no}</td>
                    <td>${list.email}</td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        <!-- <div class="col-lg-12" id="ex3_Result1" ></div>  -->
        <div class="col-lg-12" id="mailform" ></div> 
    </div>
    
    <br><br>
 
    <script>
    
    
        // 상단 선택버튼 클릭시 체크된 Row의 값을 가져온다.
        $("#selectBtn").click(function(){ 
            
            var rowData = []; // 배열 생성
            var tdArr = [];
 			var email ="";
            var checkbox = $("input[name=chk]:checked");
            
            // 체크된 체크박스 값을 가져온다
            checkbox.each(function(i) {
    
                // checkbox.parent() : checkbox의 부모는 <td>이다.
                // checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
                var tr = checkbox.parent().parent().eq(i);
                var td = tr.children();
                
                // 체크된 row의 모든 값을 배열에 담는다.
                rowData.push(tr.text());
                
                // td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
                var no = td.eq(1).text()+","
                email += td.eq(2).text()+","; 
                
                // 가져온 값을 배열에 담는다.
                tdArr.push(no);
                tdArr.push(email);
                
                // console.log("no : " + no);
                // console.log("email : " + email);
            });
            
            /* $("#ex3_Result1").html(" * 체크된 Row의 모든 데이터 = "+rowData);    
            $("#ex3_Result2").html(tdArr);  */ 
            
            
    $.ajax({
    	url:'write',
    	method : 'GET',
    	data : {'email':email},
    	success:function(data){
    		alert("메일을 작성 하시겠습니까? ");
    		/* window.location="write"; */
    		$("#mailform").html(data); 
    	}
    });
    return false;
    });
    </script>
</div>
 
 
 


