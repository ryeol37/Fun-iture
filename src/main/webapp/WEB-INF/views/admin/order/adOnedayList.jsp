<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
<% 
   String cp = request.getContextPath(); 
   
%>
</script>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">주문관리</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	주 문 목 록
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                         <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>주문 번호</th>
                                        <th>주문자 ID</th>
                                        <th>클래스 이름</th>
                                        <th>인원</th>
                                        <th>가격</th>
                                        <th>신청 상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="onedayList" items="${onedayList}" varStatus="stat">
										<tr class="odd gradeX">
											<td class="center"><a href="<%=cp %>/adOnedayModifyForm?order_no=${onedayList.order_no}">${onedayList.order_no}</a></td>
											<td class="center">${onedayList.id}</td>
											<th class="center">${onedayList.goods_name }</th>
											<th class="center">${onedayList.order_qty }</th>
											<th class="center">${onedayList.order_price }</th>
											<th class="center">${onedayList.status }</th>
										</tr>    
	                                 </c:forEach>
                                </tbody>
                            </table>
                            </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->