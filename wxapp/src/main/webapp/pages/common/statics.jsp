<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="url" value="${pageContext.request.contextPath}/" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
<!-- iCheck -->
<link href="${url }statics/plugins/iCheck/skins/flat/green.css" rel="stylesheet">
<link href="${url }statics/plugins/datatables/dataTables.bootstrap.min.css" rel="stylesheet">
<!-- PNotify -->
<link href="${url }statics/plugins/pnotify/dist/pnotify.css" rel="stylesheet">
<link href="${url }statics/plugins/pnotify/dist/pnotify.buttons.css" rel="stylesheet">
<link href="${url }statics/plugins/pnotify/dist/pnotify.nonblock.css" rel="stylesheet">


<!-- Custom Theme Style -->
<link href="${url }statics/css/custom.css" rel="stylesheet">



<!-- jQuery -->
<script src="${url }statics/plugins/jquery.js"></script>
<!-- Bootstrap -->
<script src="${url }statics/plugins/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="${url }statics/plugins/fastclick/lib/fastclick.js"></script>
<!-- iCheck -->
<script src="${url }statics/plugins/iCheck/icheck.min.js"></script>
<!-- NProgress -->
<script src="${url }statics/plugins/nprogress/nprogress.js"></script>
<!-- bootstrap-progressbar -->
<script src="${url }statics/plugins/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<!-- dataTables -->
<script src="${url }statics/plugins/datatables/jquery.dataTables.js"></script>
<!-- PNotify -->
<script src="${url }statics/plugins/pnotify/dist/pnotify.js"></script>
<script src="${url }statics/plugins/pnotify/dist/pnotify.buttons.js"></script>
<script src="${url }statics/plugins/pnotify/dist/pnotify.nonblock.js"></script>
<!-- Parsley -->
<script src="${url }statics/plugins/parsleyjs/dist/parsley.min.js"></script>

<body  class="nav-md"></body>

<script type="text/javascript">
    var url = '${url}';
    function linkajax(url,clazz){
        $.ajax({
            type: 'POST',
            url: url,
            dataType: "html",
            success: function(data){
                $("."+clazz).html(data);
            }
        });
    }

    // var time1 = new Date().Format("yyyy-MM-dd");
    //    var time2 = new Date().Format("yyyy-MM-dd HH:mm:ss");
    //格式化日期
    Date.prototype.Format = function (fmt) { //author: meizz
        var o = {
            "M+": this.getMonth() + 1, //月份
            "d+": this.getDate(), //日
            "h+": this.getHours(), //小时
            "m+": this.getMinutes(), //分
            "s+": this.getSeconds(), //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds() //毫秒
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }

    function checkForm(fid){
        $('#'+fid).parsley().validate();
        if (true === $('#'+fid).parsley().isValid()) {
            $('.bs-callout-info').removeClass('hidden');
            $('.bs-callout-warning').addClass('hidden');
            return true;
        } else {
            $('.bs-callout-info').addClass('hidden');
            $('.bs-callout-warning').removeClass('hidden');
            return false;
        }
    }


    function formatDate(now) {
        var year = now.getFullYear(),
            month = now.getMonth() + 1,
            date = now.getDate(),
            hour = now.getHours(),
            minute = now.getMinutes(),
            second = now.getSeconds();

        return year + "-" + month + "-" + date + " " + hour + ":" + minute + ":" + second;
    }

    function initTabel(url,columns,columnDefs){
        var table = $("#tableOne").DataTable({
            "bProcessing": true,
            "bServerSide": true,
            "bPaginate": true, //开关，是否显示分页器
            "bAutoWidth": true,////自动宽度
            "bLengthChange":false,//去掉每页多少条框体
            "bInfo": true,//页脚信息
            "bFilter": false,//禁用搜索
            "bSort":false,//禁用排序
            "bStateSave":false,
            "aLengthMenu": [10,20,50,100],
            "buttons": ['colvis', 'excel', 'print'],
            "oLanguage": {
                "sProcessing": "正在加载中......",
                "sLengthMenu": "每页 _MENU_ 条",
                "sZeroRecords": "对不起，过滤不到相关数据!",
                "sInfo": " _START_ 至 _END_ 项结果，共 _TOTAL_ 项",//显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项
                "sInfoEmpty": "",//显示第 0 至 0 项结果，共 0 项
                "sInfoFiltered": "",//(由 _MAX_ 项结果过滤)
                "sInfoPostFix": "",
                "sSearch": "搜索：",
                "sUrl": "",
                "sEmptyTable": "暂无数据!",
                "sLoadingRecords": "载入中...",
                "sInfoThousands": ",",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上一页",
                    "sNext": "下一页",
                    "sLast": "末页"
                }
            },
            "initComplete": function( settings, json ) {
                $('td input.flat').iCheck({
                    checkboxClass: 'icheckbox_flat-green',
                    radioClass: 'iradio_flat-green'
                });
                // Table
                $('table input').on('ifChecked', function () {
                    checkState = '';
                    $(this).parent().parent().parent().addClass('selected');
                    countChecked();
                });
                $('table input').on('ifUnchecked', function () {
                    checkState = '';
                    $(this).parent().parent().parent().removeClass('selected');
                    countChecked();
                });
            },
            "drawCallback": function( settings, json ) {
                $('td input.flat').iCheck({
                    checkboxClass: 'icheckbox_flat-green',
                    radioClass: 'iradio_flat-green'
                });
                // Table
                $('table input').on('ifChecked', function () {
                    checkState = '';
                    $(this).parent().parent().parent().addClass('selected');
                    countChecked();
                });
                $('table input').on('ifUnchecked', function () {
                    checkState = '';
                    $(this).parent().parent().parent().removeClass('selected');
                    countChecked();
                });
            },
            "ajax":{
                "url":url,
                "type":"POST",
                data:function(d){
                    var formData = $("#filter_form").serializeArray();//把form里面的数据序列化成数组
                }
            },
            "columns": columns,
            "columnDefs": columnDefs
        });
        return table;
    }

    function initTabel_one(url,columns,columnDefs,oneTable){
        var table = oneTable.DataTable({
            "bProcessing": true,
            "bServerSide": true,
            "bPaginate": true, //开关，是否显示分页器
            "bAutoWidth": true,////自动宽度
            "bInfo": true,//页脚信息
            "bFilter": false,//禁用搜索
            "bSort":false,//禁用排序
            "bStateSave":false,
            "aLengthMenu": [10,20,50,100],
            "buttons": ['colvis', 'excel', 'print'],
            "oLanguage": {
                "sProcessing": "正在加载中......",
                "sLengthMenu": "每页 _MENU_ 条",
                "sZeroRecords": "对不起，过滤不到相关数据!",
                "sInfo": " _START_ 至 _END_ 项结果，共 _TOTAL_ 项",//显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项
                "sInfoEmpty": "",//显示第 0 至 0 项结果，共 0 项
                "sInfoFiltered": "",//(由 _MAX_ 项结果过滤)
                "sInfoPostFix": "",
                "sSearch": "搜索：",
                "sUrl": "",
                "sEmptyTable": "暂无数据!",
                "sLoadingRecords": "载入中...",
                "sInfoThousands": ",",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上一页",
                    "sNext": "下一页",
                    "sLast": "末页"
                }
            },
            "ajax":{
                "url":url,
                "type":"POST",
                data:function(d){
                    var formData = $("#filter_form").serializeArray();//把form里面的数据序列化成数组
                }
            },
            "columns": columns,
            "columnDefs": columnDefs
        });
        return table;
    }

    function initTabel_oneNot_page(url,columns,columnDefs,oneTable){
        var table = oneTable.DataTable({
            "bProcessing": true,
            "bServerSide": true,
            "bPaginate": true, //开关，是否显示分页器
            "bAutoWidth": true,////自动宽度
            "bInfo": false,//页脚信息
            "bFilter": false,//禁用搜索
            "bSort":false,//禁用排序
            "bStateSave":false,
            "aLengthMenu": [7],
            "buttons": ['colvis', 'excel', 'print'],
            "oLanguage": {
                "sProcessing": "正在加载中......",
                "sLengthMenu": "每页 _MENU_ 条",
                "sZeroRecords": "对不起，过滤不到相关数据!",
                "sInfo": " _START_ 至 _END_ 项结果，共 _TOTAL_ 项",//显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项
                "sInfoEmpty": "",//显示第 0 至 0 项结果，共 0 项
                "sInfoFiltered": "",//(由 _MAX_ 项结果过滤)
                "sInfoPostFix": "",
                "sSearch": "搜索：",
                "sUrl": "",
                "sEmptyTable": "暂无数据!",
                "sLoadingRecords": "载入中...",
                "sInfoThousands": ",",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上一页",
                    "sNext": "下一页",
                    "sLast": "末页"
                }
            },
            "ajax":{
                "url":url,
                "type":"POST",
                data:function(d){
                    var formData = $("#filter_form").serializeArray();//把form里面的数据序列化成数组
                }
            },
            "columns": columns,
            "columnDefs": columnDefs
        });
        return table;
    }

</script>