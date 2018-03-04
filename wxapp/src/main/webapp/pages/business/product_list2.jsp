<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/statics.jsp" %>
<%@page import="java.util.Date" %>

<div class="container body">
    <div class="main_container">
        <%@ include file="../common/leftMenu.jsp" %>
        <!-- page content -->
        <div class="right_col" role="main">
            <div class="">
                <div class="page-title">
                    <div class="title_left">
                        <h3>产品列表</h3>
                    </div>

                    <div class="title_right">
                        <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search for...">
                                <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="x_panel">
                            <div class="x_content">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12 text-center">
                                        <ul class="pagination pagination-split">
                                            <li><a href="#">A</a></li>
                                            <li><a href="#">B</a></li>
                                            <li><a href="#">C</a></li>
                                            <li><a href="#">D</a></li>
                                            <li><a href="#">E</a></li>
                                            <li>...</li>
                                            <li><a href="#">W</a></li>
                                            <li><a href="#">X</a></li>
                                            <li><a href="#">Y</a></li>
                                            <li><a href="#">Z</a></li>
                                        </ul>
                                    </div>

                                    <c:forEach items="${list }" var="list">
                                    <ol>
                                    <div class="col-md-4 col-sm-4 col-xs-12 profile_details">
                                        <div class="well profile_view">
                                            <div class="col-sm-12">
                                                <div class="left col-xs-7">
                                                    <h2>${list.proName}</h2>
                                                    <p><strong>产品分类: </strong> ${list.proType}</p>
                                                    <ul class="list-unstyled">
                                                        <li> 创建时间:${list.createTime} </li>
                                                        <li> 创建人员 :${list.createUser} </li>
                                                    </ul>
                                                </div>
                                                <div class="right col-xs-5 text-center">
                                                    <img src=${list.imageurl} alt="" class="img-circle img-responsive">
                                                </div>
                                            </div>
                                            <div class="col-xs-12 bottom text-center">
                                                <div class="col-xs-12 col-sm-6 emphasis">
                                                    <p class="ratings">
                                                        <a>4.0</a>
                                                        <a href="#"><span class="fa fa-star"></span></a>
                                                        <a href="#"><span class="fa fa-star"></span></a>
                                                        <a href="#"><span class="fa fa-star"></span></a>
                                                        <a href="#"><span class="fa fa-star"></span></a>
                                                        <a href="#"><span class="fa fa-star-o"></span></a>
                                                    </p>
                                                </div>
                                                <div class="col-xs-12 col-sm-6 emphasis">
                                                    <button type="button" class="btn btn-success btn-xs"  data-toggle='modal' data-target='.bs-example-modal-sm' onclick="add('${list.id}')">
                                                        <i class="fa fa-user" ></i> 新增</button>
                                                    <%--<button class='btn btn-danger' data-toggle='modal' data-target='.bs-example-modal-sm' onclick='delFunTr("+row.id+")'>删除</button>"--%>
                                                    <button type="button" class="btn btn-primary btn-xs" onclick="detaile('${list.id}')">
                                                        <i class="fa fa-user" > </i> 详情</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </ol>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
                <b>添加至:</b>
                <select name="curStatus"  value="${curStatus}">
                    <option value="0">-请选择-</option>
                    <option value="1" <c:if test="${'1' eq curStatus}">selected</c:if> >男</option>
                    <option value="2" <c:if test="${'2' eq curStatus}">selected</c:if> >女</option>
                </select>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="addFun(${product.id})">确认</button>
            </div>

        </div>
    </div>
</div>



<script>
    var trid="";
    function add(id){
        trid=id;
    }
    
    function  detaile(id) {
        location.href='${url }product/manager/detaile?id='+id;
    }
    
    function  addFun(id) {
        location.href='${url }app/manager/merge?id='+id;
    }
    $(document).ready(function(){
        $("#sidebar-menu").find('a:eq(2)').parent().addClass('active');
        $("#sidebar-menu").find('a:eq(2)').parent().find("ul").show();
        $("#sidebar-menu").find('a:eq(2)').parent().find("ul").find("li:eq(0)").addClass("current-page");
    });

</script>
<!-- Custom Theme Scripts -->
<script src="${url }statics/js/custom.js"></script>
