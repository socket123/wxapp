<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/statics.jsp" %>

<div class="container body">
    <div class="main_container">
        <%@ include file="../common/leftMenu.jsp" %>
        <!-- page content -->
        <div class="right_col" role="main">
            <div class="submenu" style="width:100%;">
                <h1>角色管理</h1>
            </div>
            <button class='btn btn-info add'>添加</button>
            <!-- /submenu -->
            <div id="contentwrapper" class="contentwrapper">

                <table id="tableOne" class="display" cellspacing="0" width="100%" class="table table-striped table-bordered">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>角色名称</th>
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
        $("#sidebar-menu").find('a:eq(2)').parent().addClass('active');
        $("#sidebar-menu").find('a:eq(2)').parent().find("ul").show();
        $("#sidebar-menu").find('a:eq(2)').parent().find("ul").find("li:eq(2)").addClass("current-page");

        $(".add").on("click",function(){
            location.href='${url }admin/role/mergepage';
        });

        var columns = [{ "data": "id" },
            { "data": "roleName" },
            { "data": "createTime" }
        ];
        var columnDefs = [
            {
                "render": function (data, type, row) {
                    return (new Date(data)).Format("yyyy-MM-dd hh:mm");
                },
                "targets":2
            },{
                "render": function (data, type, row) {
                    var html='';
                    html += "<button class='btn btn-red' onclick='changeFun("+row.id+")'>修改</button>";
                    html +="<button class='btn btn-primary' onclick='setMenuList("+row.id+")'>分配权限</button>";
                    html +="<button class='btn btn-danger' data-toggle='modal' data-target='.bs-example-modal-sm' onclick='delFunTr("+row.id+")'>删除</button>";
                    return html;
                },
                "targets":3
            }];
        table = initTabel("${url }admin/role/jsonlist",columns,columnDefs);
    });

    function changeFun(id){
        location.href='${url }admin/role/mergepage?id='+id;
    }

    function setMenuList(id) {
        location.href='${url }admin/role/setMenu?id='+id;
    }

    var trid="";
    function delFunTr(id){
        trid=id;
    }
    function  delFun() {
        $.post(url + "admin/role/del", {id: trid}, function (data) {
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
