<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/statics.jsp" %>
<%@page import="java.util.Date" %>

<div class="container body">
    <div class="main_container">
        <%@ include file="../common/leftMenu.jsp" %>
        <!-- page content -->
        <div class="right_col" role="main">
            <div class="submenu" style="width:100%;">
                <h1>产品管理</h1>
            </div>
            <button class='btn btn-info add'>添加</button>
            <!-- /submenu -->
            <div id="contentwrapper" class="contentwrapper">

                <table id="tableOne" class="display" cellspacing="0" width="100%" class="table table-striped table-bordered">
                    <thead>
                    <tr>
                        <th class="table-check">
                            <input type="checkbox" id="check-all" class="flat check-all">
                        </th>
                        <th>ID</th>
                        <th>分类</th>
                        <th>名称</th>
                        <th>创建人</th>
                        <th>创建时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
        <!-- /page content -->
    </div>
</div>

<%--<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">Small modal</button>--%>

<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel2">提示信息</h4>
            </div>
            <div class="modal-body">
                <h4>确定删除此条记录么？删除后将不能恢复！</h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="delFun()">确认</button>
            </div>

        </div>
    </div>
</div>


<script>
    var table;
    $(document).ready(function(){
        $("#sidebar-menu").find('a:eq(1)').parent().addClass('active');
        $("#sidebar-menu").find('a:eq(1)').parent().find("ul").show();
        $("#sidebar-menu").find('a:eq(1)').parent().find("ul").find("li:eq(0)").addClass("current-page");

        $(".add").on("click",function(){
            location.href='${url }product/manager/propage';
        });
        var columns = [
            { "data": "id", "sClass": "table-check", "bSortable": false},
            { "data": "id" },
            { "data": "proType" },
            { "data": "proName" },
            { "data": "createUser"},
            { "data": "createTime"}
        ];
        var columnDefs = [
            {
                "render": function (data, type, full, meta) {
                    return '<input type="checkbox" class="flat" name="table_records" value="'+data+'">';
                },
                "targets":0
            },
            {
                "render": function (data, type, row) {
                    return (new Date(data)).Format("yyyy-MM-dd hh:mm");
                },
                "targets":5
            },
            {
                "render": function (data, type, row) {
                    return "<button class='btn btn-primary' onclick='changeFun("+row.id+")'>修改</button><button class='btn btn-danger' data-toggle='modal' data-target='.bs-example-modal-sm' onclick='delFunTr("+row.id+")'>删除</button>"
                },
                "targets":6
            }
        ];
        table = initTabel("${url }product/manager/jsonlist",columns,columnDefs);

    });

    //修改
    function changeFun(id){
        location.href='${url }product/manager/propage?id='+id;
    }

    var trid="";
    function delFunTr(id){
        trid=id;
    }

    function  delFun() {
        $.post(url + "product/manager/del", {id: trid}, function (data) {
            if (data > 0) {
                new PNotify({
                    title: '成功',
                    text: '删除成功！',
                    type: 'success',
                    hide: false,
                    styling: 'bootstrap3'
                });
                table.draw();
            } else {
                new PNotify({
                    title: '错误',
                    text: '操作失败！',
                    type: 'error',
                    hide: false,
                    styling: 'bootstrap3'
                });
                return;
            }
        });
    }

</script>
<!-- Custom Theme Scripts -->
<script src="${url }statics/js/custom.js"></script>
