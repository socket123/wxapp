<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../common/statics.jsp" %>
<link rel="stylesheet" media="screen" href="${url }statics/plugins/ztree/zTreeStyle/zTreeStyle.css"/>

<style>
    .dataTables_wrapper {margin-left: 200px;border: 1px solid #ddd;height: 340px;padding-top: 10px;}
    .dataTables_wrapper input {width: 160px;}
    .dyntable2_left {width: 200px;
        border: 1px solid #ddd;
        position: absolute;overflow-x:hide }
</style>
<script type="text/javascript">
    //zTree 的数据属性
    var zNodes = ${treeJson};
</script>

<div class="container body">
    <div class="main_container">
            <%@ include file="../../common/leftMenu.jsp" %>
        <!-- page content -->
        <div class="right_col" role="main">
            <div class="submenu" style="width:100%;">
                <h1>系统菜单管理</h1>
            </div>
            <button class='btn btn-info add'>添加</button>
            <!-- /submenu -->
            <div id="contentwrapper" class="contentwrapper">
                <div id="dyntable2_left" class="dyntable2_left">
                    <div><ul id="treeDemo" class="ztree"></ul></div>
                </div>
                <input type="hidden" id="pid" value="${pid }">
                <!--contenttitle-->
                <div class="dataTables_wrapper" id="dyntable2_wrapper">

                </div>
            </div>
        </div>
        <!-- /page content -->
    </div>
</div>


<script>

    $(document).ready(function(){
        $("#sidebar-menu").find('a:eq(3)').parent().addClass('active');
        $("#sidebar-menu").find('a:eq(3)').parent().find("ul").show();
        $("#sidebar-menu").find('a:eq(3)').parent().find("ul").find("li:eq(1)").addClass("current-page");

        $(".add").on("click",function(){
            /*location.href='${url }admin/sysmenu/mergepage';*/
          linkajax(url+'admin/sysmenu/mergepage','dataTables_wrapper');
        });
        //初始化
        var zTreeObj;
        // zTree 的参数配置
        var setting = {
            data: {
                simpleData: {
                    enable:true,
                    idKey: "id",
                    pIdKey: "pId",
                    rootPId: ""
                }
            },
            callback: {
                beforeClick: function(treeId, treeNode) {
                    var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                    linkajax(url+"admin/sysmenu/mergepage?id="+treeNode.id,"dataTables_wrapper");
                    if (treeNode.isParent) {
                        //zTree.expandNode(treeNode);
                        return false;
                    } else {
                        return true;
                    }
                }
            }
        };
        zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        zTreeObj.expandAll(true);

    });

</script>
<!-- Custom Theme Scripts -->
<script src="${url }statics/js/custom.js"></script>
<script type="text/javascript" src="${url }statics/plugins/ztree/ztree.js"></script>
