<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/statics.jsp" %>
<script type="text/javascript" src="${url}statics/js/wangEditor.min.js"></script>
<script type="text/javascript" src="${url}statics/js/jquery.form.js"></script>
<script type="text/javascript" src="${url}statics/js/jquery-2.1.4.js"></script>
<div class="container body">
    <div class="main_container">
        <%@ include file="../common/leftMenu.jsp" %>
        <!-- page content -->
        <div class="right_col" role="main">
            <!-- start form for validation -->
            <form id="basicvalidations" action="${url}product/manager/merge" class="form-horizontal form-label-left" method="post" enctype="multipart/form-data">

                <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="introduce"></label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div id="edit">
                        </div>
                    </div>
                </div>
                <input name="introduce" id="introduce" value="" type="hidden">
                <input name="id" id="id" value="${product.id}" type="hidden">
                <input name="proType" id="proType" value="${product.proType}" type="hidden">
                <input name="proName" id="proName" value="${product.proName}" type="hidden">
                <input name="createUser" id="createUser" value="${product.createUser}" type="hidden">
                <input name="imageurl" id="imageurl" value="${product.imageurl}" type="hidden">
                <input name="createTime" id="createTime" value="${product.createTime}" type="hidden">

                <br/>
                <div class="ln_solid"></div>
                <div class="form-group">
                    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                        <span class="btn btn-primary back">返回</span>
                    </div>
                </div>

            </form>
            <!-- end form for validations -->
        </div>
        <!-- /page content -->
    </div>
</div>

<script>


    $(document).ready(function () {
        $("#sidebar-menu").find('a:eq(2)').parent().addClass('active');
        $("#sidebar-menu").find('a:eq(2)').parent().find("ul").show();
        $("#sidebar-menu").find('a:eq(2)').parent().find("ul").find("li:eq(0)").addClass("current-page");
        var html ='${product.introduce}';
        $("#edit").html(html);
        $(".back").on("click", function () {
            location.href = url+ 'product/manager/list2';
        });

    });

</script>
<!-- Custom Theme Scripts -->
<script src="${url }statics/js/custom.js"></script>