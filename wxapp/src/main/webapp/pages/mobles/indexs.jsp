<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/statics.jsp" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>报名记录</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" type="text/css" href="${url }/statics/plugins/mui/css/app.css"/>
    <link href="${url }/statics/plugins/mui/css/mui.min.css" rel="stylesheet">
    <link href="${url }/statics/mobles/indexs.css" rel="stylesheet">
    <link href="//at.alicdn.com/t/font_211066_xvlquaotahqzd7vi.css" rel="stylesheet">
</head>

<body>

<header class="mui-bar mui-bar-nav">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
    <h1 class="mui-title">课程列表</h1>
</header>
<div class="mui-content">
    <div class="title">

    </div>
    <ul class="mui-table-view mui-table-view-chevron">
        <c:forEach var="jyKecheng" begin="" items="${jyKecheng}" varStatus="status">
        <li class="mui-table-view-cell mui-media">
            <a class="mui-navigate-right">
                <img class="mui-media-object mui-pull-left" src="${url }/statics/plugins/mui/images/cbd.jpg">
                <div class="mui-media-body">
                    ${jyKecheng.name}
                    <p class='mui-ellipsis'> ${jyKecheng.nicName}</p>
                </div>
            </a>
        </li>
            <ul class="OA_task_1" class="mui-table-view">
                <c:forEach var="jyBaoming" begin="" items="${jyKecheng.jyBaoming}" varStatus="status">
                <li class="mui-table-view-cell" ids="${jyBaoming.userId}" jke="${jyKecheng.id}">
                    <div class="mui-slider-right mui-disabled">
                        <a class="mui-btn mui-btn-red">删除</a>
                    </div>
                    <div class="mui-slider-handle">
                        <p>姓名:${jyBaoming.name}
                        </p>
                        <p>手机号:
                                ${jyBaoming.phone}
                        </p>

                    </div>
                </li>
                </c:forEach>
            </ul>
        </c:forEach>
    </ul>
</div>
<script src="${url }/statics/plugins/mui/js/mui.min.js"></script>

<script type="text/javascript" charset="utf-8">
    var urls = ${url };
    $(function () {

    })
    mui.init({
        swipeBack: true //启用右滑关闭功能
    });



    (function($) {
        //$.swipeoutOpen(el,direction)//打开指定列的滑动菜单，el:指定列的dom对象，direction：取值left|right，指定打开的是左侧或右侧滑动菜单
        //$.swipeoutClose(el);//关闭指定列的滑动菜单，el:指定列的dom对象
        //				setTimeout(function() {
        //					$.swipeoutOpen(document.getElementById("OA_task_1").querySelector('li:last-child'), 'left');
        //					setTimeout(function() {
        //						$.swipeoutClose(document.getElementById("OA_task_1").querySelector('li:last-child'));
        //					}, 1000);
        //				}, 1000);
        //第一个demo，拖拽后显示操作图标，点击操作图标删除元素；
        var btnArray = ['确认', '取消'];
        $('.OA_task_1').on('tap', '.mui-btn', function(event) {
            var elem = this;
            var li = elem.parentNode.parentNode;
            mui.confirm('确认删除该条记录？', 'Hello MUI', btnArray, function(e) {
                if (e.index == 0) {//删除
//                    li.parentNode.removeChild(li);
                    console.log(elem);
                    console.log(li.getAttribute("ids"));
                    ajax_index_select(li.getAttribute("ids"),li.getAttribute("jke"));
                    li.parentNode.removeChild(li);
                } else {// 取消
//                    setTimeout(function() {
//                        $.swipeoutClose(li);
//                    }, 0);
                    console.log(e.index);
                }
            });
        });



    })(mui);


    /**
     *
     */
    function ajax_index_select(ids,jke) {
        var data  ={
            userId:ids,
            kechengId:jke
        };
        $.ajax({
            //提交数据的类型 POST GET
            type:"GET",
            //提交的网址
            url:${url}+"/web/jy/deletuser",
            //提交的数据
            data:data,
//            async : false, //默认为true 异步
            //返回数据的格式
            dataType: "json",//"xml", "html", "script", "json", "jsonp", "text".
//            //在请求之前调用的函数
//            beforeSend:function(){
//
//            },
            //成功返回之后调用的函数
            success:function(data){
                mui.toast("删除成功");

            }   ,
            //调用执行后调用的函数
//            complete: function(XMLHttpRequest, textStatus){
//                mui.toast("失败");
//
//            },
            //调用出错执行的函数
            error: function(data){
                //请求出错处理
                console.log(data);
            }
        });
    }








</script>
</body>

</html>