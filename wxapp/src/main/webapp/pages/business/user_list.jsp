<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/statics.jsp" %>

<div class="container body">
    <div class="main_container">
        <%@ include file="../common/leftMenu.jsp" %>
        <!-- page content -->
        <div class="right_col" role="main">
            <div class="submenu" style="width:100%;">
                <h1>用户管理</h1>
            </div>
            <button class='btn btn-info add'>添加</button>
            <!-- /submenu -->
            <div id="contentwrapper" class="contentwrapper">

                <table id="tableOne" class="display" cellspacing="0" width="100%" class="table table-striped table-bordered">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>姓名</th>
                        <th>角色</th>
                        <th>联系方式</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
        <!-- /page content -->
    </div>
</div>

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
        $("#sidebar-menu").find('a:eq(2)').parent().addClass('active');
        $("#sidebar-menu").find('a:eq(2)').parent().find("ul").show();
        $("#sidebar-menu").find('a:eq(2)').parent().find("ul").find("li:eq(3)").addClass("current-page");

        $(".add").on("click",function(){
            location.href='${url }admin/user/mergepage';
        });
        var columns = [
            { "data": "id" },
            { "data": "userName" },
            { "data": "roleName" },
            { "data": "phone" }
        ];
        var columnDefs = [
            {
                "render": function (data, type, row) {
                    return "<button class='btn btn-primary' onclick='changeFun("+row.id+")'>修改</button><button class='btn btn-danger' data-toggle='modal' data-target='.bs-example-modal-sm' onclick='delFunTr("+row.id+")'>删除</button>"
                },
                "targets":4
            }
        ];
        table = initTabel("${url }admin/user/jsonlist",columns,columnDefs);
    });

    //修改
    function changeFun(id){
        location.href='${url }admin/user/mergepage?id='+id;
    }

    var trid="";
    function delFunTr(id){
        trid=id;
    }

    function  delFun() {
        $.post(url + "admin/user/del", {id: trid}, function (data) {
            if (data > 0) {
                attentionAlert("success","删除成功");
                table.draw();
            } else {
                attentionAlert("error","操作失败");
                return;
            }
        });
    }

</script>
<!-- Custom Theme Scripts -->
<script src="${url }statics/js/custom.js"></script>
