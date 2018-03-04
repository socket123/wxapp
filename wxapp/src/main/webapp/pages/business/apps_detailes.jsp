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
            <form id="basicvalidations" data-parsley-validate class="form-horizontal form-label-left">
                <input type="hidden" id="id" name="id" value="${wxOpen.id}">

                <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="produceName">程序名称 <span class="required">*</span> :</label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="produceName" class="form-control col-md-7 col-xs-12" name="produceName" required value="${wxOpen.produceName}" placeholder="请输入程序名称" />
                        <%--<input type="text"  id="createUser" class="form-control col-md-7 col-xs-12" value="${product.createUser}" readonly="readonly" disabled="disabled" />--%>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="accountName">账户名 <span class="required">*</span> :</label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="accountName" class="form-control col-md-7 col-xs-12" name="accountName" required value="${wxOpen.accountName}"  placeholder="请输入账户名" disabled/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="accountPassword">密码 <span class="required">*</span> :</label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="accountPassword" class="form-control col-md-7 col-xs-12" name="accountPassword" required value="${wxOpen.accountPassword}" placeholder="请输入密码" disabled />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="produceLogo">LOGO <span class="required"></span> :</label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="produceLogo" cols="30" rows="10" class="form-control col-md-7 col-xs-12" name="produceLogo"  value="${wxOpen.produceLogo}" placeholder="产品LOGO">
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="remarks">备注 <span class="required"></span> :</label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <textarea name="remarks" id="remarks" cols="30" rows="10" class="form-control col-md-7 col-xs-12"   value="" >${wxOpen.remarks}</textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="remarks">产品列表:</label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                    <c:forEach items="${list }" var="list">
                        <b cols="30" rows="10" class="form-control col-md-7 col-xs-12" >${list.pro_name}</b>
                    </c:forEach>
                    </div>
                </div>

                <br/>
                <div class="ln_solid"></div>
                <div class="form-group">
                    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                        <span class="btn btn-primary back">返回</span>
                        <span type="button" class="btn btn-success submit">修改</span>
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
        $("#sidebar-menu").find('a:eq(10)').parent().addClass('active');
        $("#sidebar-menu").find('a:eq(10)').parent().find("ul").show();
        $("#sidebar-menu").find('a:eq(10)').parent().find("ul").find("li:eq(0)").addClass("current-page");
        var html ='${product.introduce}';
        $("#edit").html(html);
        $(".back").on("click", function () {
            location.href = url+ 'open/manager/list';
        });
        $(".submit").on("click", function () {
            var formData = new FormData(document.getElementById("basicvalidations"));//表单id
            $.ajax({
                url: url + 'open/manager/merge',
                type: 'POST',
                data: formData,
                async: false,
                cache: false,
                contentType: false,
                processData: false,
                success: function (data) {
                    if(data > 0){
                        //attentionAlert("success","保存成功");
                        location.href = url +'open/manager/list';
                    }else{
                        //attentionAlert("error","保存失败");
                        return;
                    }

                }
            });
        });


    });

</script>
<!-- Custom Theme Scripts -->
