<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    </div>
    <!-- /#wrapper : header.jsp 47line에 있는 div의 /tag 입니다. 삭제 금지! -->
    
    <!-- jQuery -->
    <script src="/funiture/resources/admin/js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/funiture/resources/admin/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/funiture/resources/admin/js/metisMenu.min.js"></script>
    
    <!-- DataTables JavaScript -->
    <!-- DataTables Advanced Tables에관련된 페이징,정렬 기능 -->
    <script src="/funiture/resources/admin/js/jquery.dataTables.min.js"></script>
    <!-- DataTables Advanced Tables의 모양에 관련된 기능 -->
    <script src="/funiture/resources/admin/js/dataTables.bootstrap.min.js"></script>
    <!-- DataTables Advanced Tables의 반응형에 관련된 기능 -->
    <script src="/funiture/resources/admin/js/dataTables.responsive.js"></script>
    
    
	<!-- Flot Charts JavaScript -->
    <script src="/funiture/resources/admin/js/excanvas.min.js"></script>
    <!-- ※ flot.html의 그래프와 관련된 색상들이 정리되어있는 파일 -->
    <script src="/funiture/resources/admin/js/jquery.flot.js"></script>
    <!-- ※ flot.html의 그래프에 들어가는 숫자의 유효성검사와(음수가 아니어야함) % 계산을 해주는 파일 -->
    <script src="/funiture/resources/admin/js/jquery.flot.pie.js"></script>
    <!-- ※ flot.html의 그래프가 브라우저의 창 크기에 따라서 달라지도록 하는 파일 -->
    <script src="/funiture/resources/admin/js/jquery.flot.resize.js"></script>
    <!-- ※ flot.html의 그래프에서 x축이 시간인 그래프에 적용되는 시간 관련 파일 -->
    <script src="/funiture/resources/admin/js/jquery.flot.time.js"></script>
    <script src="/funiture/resources/admin/js/jquery.flot.tooltip.min.js"></script>
    <!-- ※ flot.html의 그래프에 들어가는 data들이 예시로 들어가있는 파일 -->
    <script src="/funiture/resources/admin/data/flot-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/funiture/resources/admin/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    //table.jsp 중에서 가장 첫번째꺼 창 줄여보면 반응형으로 바뀌는것을 알 수 있다.
    </script>
    
    <!-- Page-Level Demo Scripts - Notifications - Use for reference -->
    <script>
    // tooltip demo : notifications.jsp 페이지 가장 하단에 tooltip demo 누르면 말풍선이 유지됨. 다른 버튼 또는 아예다른 doc를 클릭하면 사라짐
    $('.tooltip-demo').tooltip({
        selector: "[data-toggle=tooltip]",
        container: "body"
    })
    // popover demo : notifications.jsp 페이지 가장 하단에 popover demo 누르면 말풍선이 유지됨. toggle임
    $("[data-toggle=popover]")
        .popover()
    </script>
    
</body>

