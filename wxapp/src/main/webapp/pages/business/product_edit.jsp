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
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="proType">类别 <span
                            class="required">*</span> :</label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="proType" class="form-control col-md-7 col-xs-12" name="proType" required
                               value="${product.proType}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="proName">名称 <span
                            class="required">*</span> :</label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" id="proName" class="form-control col-md-7 col-xs-12" name="proName" required
                               value="${product.proName}" placeholder="一经保存不可以修改"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="introduce">介绍 <span
                            class="required">*</span> :</label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div id="edit">
                        </div>
                    </div>
                </div>

                <input name="createUser" id="createUser" value="${product.createUser}" type="hidden">
                <input name="introduce" id="introduce" value="" type="hidden">
                <div class="form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="imageurl">上传图片 <span
                            class="required"></span> :</label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="file" id="myfile" class="form-control col-md-7 col-xs-12" name="myfile">
                    </div>
                </div>

                <br/>
                <div class="ln_solid"></div>
                <div class="form-group">
                    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                        <span class="btn btn-primary back">取消</span>
                        <span type="button" class="btn btn-success submit">提交</span>
                    </div>
                </div>

            </form>
            <!-- end form for validations -->
        </div>
        <!-- /page content -->
    </div>
</div>



<script>
    var E = window.wangEditor
    var editor = new E('#edit')

    editor.customConfig.uploadImgShowBase64 = true   // 使用 base64 保存图片
    // 隐藏“网络图片”tab
    editor.customConfig.showLinkImg = false
    editor.customConfig.menus = [
        'head',  // 标题
        'bold',  // 粗体
        'italic',  // 斜体
        'underline',  // 下划线
        'foreColor',  // 文字颜色
        'backColor',  // 背景颜色
        'list',  // 列表
        'justify',  // 对齐方式
        'quote',  // 引用
        'image',// 插入图片
        'video',// 插入视频
        'table',  // 表格
        'undo',  // 撤销
        'redo'  // 重复
    ]
    editor.create();
    $('#edit').attr('style','height:auto;');
    $('.w-e-text').find('p').html('${product.introduce}');
    $(document).ready(function () {
        $("#sidebar-menu").find('a:eq(1)').parent().addClass('active');
        $("#sidebar-menu").find('a:eq(1)').parent().find("ul").show();
        $("#sidebar-menu").find('a:eq(1)').parent().find("ul").find("li:eq(0)").addClass("current-page");

        $(".back").on("click", function () {
            location.href = url+ 'product/manager/list';
        });
        $(".submit").on("click", function () {
                $("#introduce").val(editor.txt.html());
                var formData = new FormData(document.getElementById("basicvalidations"));//表单id
                $.ajax({
                    url: url + 'product/manager/merge',
                    type: 'POST',
                    data: formData,
                    async: false,
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function (data) {
                        if(data > 0){
                            //attentionAlert("success","保存成功");
                            location.href = url +'product/manager/list';
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
<%--
<script src="${url }statics/js/custom.js"></script>--%>
