<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% String cp = request.getContextPath(); %>
    
    <!-- Bootstrap Core CSS -->
    <link href="/funiture/resources/admin/css/bootstrap.min.css" rel="stylesheet">

    <!-- Social Buttons CSS -->
    <link href="/funiture/resources/admin/css/bootstrap-social.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/funiture/resources/admin/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/funiture/resources/admin/css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <form action="<%=cp %>/at_login" method="post" name="adloginform">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" id="id" placeholder="ID" name="id">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" id="pw" placeholder="Password" name="password" type="password">
                                </div>
<!--                                 <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                    </label>
                                </div> -->
                                <!-- Change this to a button or input when using this as a form -->
                                <input type="submit" class="btn btn-lg btn-success btn-block" value="Login">
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- jQuery -->
    <script src="/funiture/resources/admin/js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/funiture/resources/admin/js/bootstrap.min.js"></script>
    
    <!-- Custom Theme JavaScript -->
    <script src="/funiture/resources/admin/js/sb-admin-2.js"></script>
    
</body>
</html>