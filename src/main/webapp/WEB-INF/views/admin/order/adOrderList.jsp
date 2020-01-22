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
                                        <th>상품 이름</th>
                                        <th>주문 수량</th>
                                        <th>주문 금액</th>
                                        <th>주문 상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="orderList" items="${orderList}" varStatus="stat">
										<tr class="odd gradeX">
											<td class="center"><a href="<%=cp %>/adOrderModifyForm?order_no=${orderList.order_no}">${orderList.order_no}</a></td>
											<td class="center">${orderList.id}</td>
											<th class="center">${orderList.goods_name }</th>
											<th class="center">${orderList.order_qty }</th>
											<th class="center">${orderList.order_price }</th>
											<th class="center">${orderList.status }</th>
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