<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/statics.jsp" %>

<div class="container body">
    <div class="main_container">
        <%@ include file="../common/leftMenu.jsp" %>
        <!-- page content -->
        <div class="right_col" role="main">
            <!-- start form for validation -->
            <form id="basicvalidations" data-parsley-validate class="form-horizontal form-label-left">
                <input type="hidden" id="id" name="id" value="${role.id}">
                <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="roleName">角色名称 <span class="required">*</span> :</label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="roleName" name="roleName" class="form-control col-md-7 col-xs-12" name="username" required value="${role.roleName}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="type" >角色 :</label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <select name="type" id="type"  class="form-control" required >
                            <option value="2">通用角色</option>
                            <option value="1">系统管理角色</option>
                        </select>
                    </div>
                </div>
                <br/>
                <div class="ln_solid"></div>
                <div class="form-group">
                    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                        <span class="btn btn-primary back">取消</span>
                        <span class="btn btn-success submit">确认</span>
                    </div>
                </div>

            </form>
            <!-- end form for validations -->
        </div>
        <!-- /page content -->
    </div>
</div>

<script>
    $(document).ready(function() {
        $("#sidebar-menu").find('a:eq(2)').parent().addClass('active');
        $("#sidebar-menu").find('a:eq(2)').parent().find("ul").show();
        $("#sidebar-menu").find('a:eq(2)').parent().find("ul").find("li:eq(2)").addClass("current-page");

        $(".back").on("click",function(){
            location.href = url +'admin/role/list';
        });
        $(".submit").on("click",function(){
            if(checkForm("basicvalidations")){
                $.ajax({
                    url: url +'admin/role/merge',
                    data:$('#basicvalidations').serialize(),
                    dataType: "json",
                    type : "post",
                    success: function(data) {
                        if(data > 0){
                            attentionAlert("success","保存成功");
                            location.href = url +'admin/role/list';
                        }else{
                            attentionAlert("error","保存失败");
                            return;
                        }
                    }
                });
            }
        });
    });

</script>
<!-- Custom Theme Scripts -->
<script src="${url }statics/js/custom.js"></script>
