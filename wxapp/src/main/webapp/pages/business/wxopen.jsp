<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/statics.jsp" %>

<div class="container body">
    <div class="main_container">
        <%@ include file="../common/leftMenu.jsp" %>
        <!-- page content -->
        <div class="right_col" role="main">
            <!-- start form for validation -->
            <form id="basicvalidations" data-parsley-validate class="form-horizontal form-label-left">
               <input type="hidden" id="id" name="id" value="${Wxopen.id}">
                <input type="hidden" id="createUser" name="createUser" value="${Wxopen.createUser}">
                   <div class="form-group">
                       <label class="control-label col-md-3 col-sm-3 col-xs-12" for="produceName">程序名称 <span class="required">*</span> :</label>
                       <div class="col-md-6 col-sm-6 col-xs-12">
                           <input type="text" id="produceName" class="form-control col-md-7 col-xs-12" name="produceName" required value="${Wxopen.produceName}" placeholder="请输入程序名称" />
                           <%--<input type="text"  id="createUser" class="form-control col-md-7 col-xs-12" value="${product.createUser}" readonly="readonly" disabled="disabled" />--%>
                       </div>
                   </div>
                <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="accountName">账户名 <span class="required">*</span> :</label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="accountName" class="form-control col-md-7 col-xs-12" name="accountName" required value="${Wxopen.accountName}"  placeholder="请输入账户名"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="accountPassword">密码 <span class="required">*</span> :</label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="password" id="accountPassword" class="form-control col-md-7 col-xs-12" name="accountPassword" required value="${Wxopen.accountPassword}" placeholder="请输入密码" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="produceLogo">LOGO <span class="required"></span> :</label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="produceLogo" cols="30" rows="10" class="form-control col-md-7 col-xs-12" name="produceLogo"  value="${Wxopen.produceLogo}" placeholder="产品LOGO">
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="remarks">备注 <span class="required"></span> :</label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <textarea name="remarks" id="remarks" cols="30" rows="10" class="form-control col-md-7 col-xs-12"   value="" >${Wxopen.remarks}</textarea>
                    </div>
                </div>

                <br/>
                <div class="ln_solid"></div>
                <div class="form-group">
                    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
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
        $("#sidebar-menu").find('a:eq(9)').parent().addClass('active');
        $("#sidebar-menu").find('a:eq(9)').parent().find("ul").show();
        $("#sidebar-menu").find('a:eq(2)').parent().find("ul").find("li:eq(0)").addClass("current-page");


        $(".submit").on("click",function(){
            if(checkForm("basicvalidations")) {
                $.ajax({
                    url: url + 'open/manager/merge',
                    data: $('#basicvalidations').serialize(),
                    dataType: "json",
                    type: "post",
                    success: function (data) {
                        if (data > 0) {
                            attentionAlert("success", "保存成功");
                            location.href = url + 'product/manager/list';
                        } else {
                            attentionAlert("error", "保存失败");
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
