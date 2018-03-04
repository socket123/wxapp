<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/statics.jsp" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>报名人员记录</title>
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
    <h1 class="mui-title">滑动触发列表项菜单</h1>
</header>
<div class="mui-content">
    <h5 class="mui-content-padded" style="margin: 35px 10px 15px 10px;">拖拽(滑动)显示功能按钮，点击按钮触发事件</h5>
        <ul id="OA_task_1" class="mui-table-view">
            <li class="mui-table-view-cell">
                <div class="mui-slider-right mui-disabled">
                    <a class="mui-btn mui-btn-red">删除</a>
                </div>
                <div class="mui-slider-handle">
                    左滑显示删除按钮
                </div>
            </li>

        </ul>


</div>
<script src="${url }/statics/plugins/mui/js/mui.min.js"></script>

<script type="text/javascript" charset="utf-8">
    <script>
    mui.init();
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
        $('#OA_task_1').on('tap', '.mui-btn', function(event) {
            var elem = this;
            var li = elem.parentNode.parentNode;
            mui.confirm('确认删除该条记录？', 'Hello MUI', btnArray, function(e) {
                if (e.index == 0) {
                    li.parentNode.removeChild(li);
                } else {
                    setTimeout(function() {
                        $.swipeoutClose(li);
                    }, 0);
                }
            });
        });
        var btnArray = ['确认', '取消'];
        //第二个demo，向左拖拽后显示操作图标，释放后自动触发的业务逻辑
        $('#OA_task_2').on('slideleft', '.mui-table-view-cell', function(event) {
            var elem = this;
            mui.confirm('确认删除该条记录？', 'Hello MUI', btnArray, function(e) {
                if (e.index == 0) {
                    elem.parentNode.removeChild(elem);
                } else {
                    setTimeout(function() {
                        $.swipeoutClose(elem);
                    }, 0);
                }
            });
        });
        //第二个demo，向右拖拽后显示操作图标，释放后自动触发的业务逻辑
        $('#OA_task_2').on('slideright', '.mui-table-view-cell', function(event) {
            var elem = this;
            mui.confirm('确认删除该条记录？', 'Hello MUI', btnArray, function(e) {
                if (e.index == 0) {
                    elem.parentNode.removeChild(elem);
                } else {
                    setTimeout(function() {
                        $.swipeoutClose(elem);
                    }, 0);
                }
            });
        });
    })(mui);
</script>
</body>

</html>