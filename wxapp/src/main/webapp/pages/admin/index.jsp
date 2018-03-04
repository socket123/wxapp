<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<c:set var="url" value="${pageContext.request.contextPath}/" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>小程序集成平台</title>
    <!-- Bootstrap -->
    <link href="${url }statics/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${url }statics/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${url }statics/plugins/nprogress/nprogress.css" rel="stylesheet">
    <!-- bootstrap-progressbar -->
    <link href="${url }statics/plugins/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="${url }statics/css/custom.min.css" rel="stylesheet">
</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <%@ include file="../common/leftMenu.jsp" %>
        <!-- page content -->
        <div class="right_col" role="main">

        </div>
        <!-- /page content -->
    </div>
</div>

<!-- jQuery -->
<script src="${url }statics/plugins/jquery.js"></script>
<!-- Bootstrap -->
<script src="${url }statics/plugins/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="${url }statics/plugins/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="${url }statics/plugins/nprogress/nprogress.js"></script>
<!-- bootstrap-progressbar -->
<script src="${url }statics/plugins/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<!-- Custom Theme Scripts -->
<script src="${url }statics/js/custom.js"></script>

<script>
    (function($) {
        $("#sidebar-menu").find('a:eq(0)').parent().addClass('active');
    })(jQuery);
</script>
</body>
</html>
