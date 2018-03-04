<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/statics.jsp" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>优团报到</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link href="${url }/statics/pugles/mui/css/mui.min.css" rel="stylesheet">
    <link href="${url }/statics/css/mobles/userSet.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${url }/statics/pugles/mui//css/app.css"/>

    <link href="//at.alicdn.com/t/font_211066_ly4g2n0rhtsgiudi.css" rel="stylesheet">
    <style>
       .inputs-reds{    width: 45% !important; float: left !important;
         }

       .indexs_user_button{    margin-right: 10px !important;
           width: 25% !important;}
        .idnex-buoor{margin-top:10em;}
       .mui-page .mui-table-view:first-child{margin-top: 0px  !important;}
       .mui-table-view-cell>a:not(.mui-btn){padding-left: 0px; margin-left: 10px;}
       .mui-table-view-cell.mui-checkbox input[type=checkbox], .mui-table-view-cell.mui-radio input[type=radio]{top: 9px;}
       .muisdd:after, .mui-push-right:after{
           transform: rotate(-90deg);
           -ms-transform: rotate(-90deg);
           -moz-transform: rotate(-90deg);
           -webkit-transform: rotate(-90deg);
           -o-transform: rotate(-90deg);
       }
        /*.mui-scrolls{overflow: auto;height: 90%;}*/
        .button-fixes{position:fixed;bottom: 0px;height: 50px;}
        .view-lise{overflow: auto;}
        .mui-scroll-wrappers{overflow: auto;height: 100%}
       .lid{padding: 12px 0px;padding-left: 38px!important; ;}
       .mui-navigate-right_one{margin: -11px -60px;}
       .mui-table-view-cell>a:not(.mui-btn){}
        .muisddse{display: none  !important;;}
        .mui-table-view-cell>a:not(.mui-btn){font-size: 0.8em;}
        .indess-li{    padding-left: 1em;
            padding-right: 1em;
            height: 40px;
            line-height: 40px;
            background: #e4dfdf;
            margin: auto;
            border-bottom: 1px solid #FFF;
            float: left;
            margin-left: 6.5em;
        }
        .indess-li-span{}
        /*.chushaixuanxiang{float: right;*/
            /*text-align: right;margin-top: -1em;color: #FFBF38;}*/
        .fontsd{color: #FF2F2F;}

        /*.mui-navbar{background-color: #efeff4 !important;}*/
    .hears{ display: none;}
        .mui-pages{
          }
       .mui-content>.mui-card:first-child{margin-top:0px !important;}
        .mui-card{padding-top: 0em ;margin-top:0px !important;

             box-shadow: 0 1px 2px rgba(0,0,0,0) !important;
        }
        label{color: #FFBF38;width: 30%!important;}
       .mui-switch.mui-active:before{content:"男" !important;}
       .mui-switch:before{content:"女"  !important;}
.index-spans{    display: block;
    float: left;
    width: 20px;
    height: 40px;
    line-height: 40px;}
        .padding-left{padding-left:1px!important;}
        .mui-switch.mui-active{border-color: #FFBF38 !important;
            background-color: #FFBF38 !important;}
        .idnex-buttonsd{width:60%;margin: auto;}
       .mui-btn-blue, .mui-btn-primary, input[type=submit] {
           color: #fff;
           border: 1px solid #FFBF38;
           background-color: #FFBF38;}
       .mui-content{background-color: #FFF!important;}
       .mui-page-content{background-color: #FFF!important;}
       .mui-navbar{background-color: #FFF!important;}
       .mui-pages{background-color: #FFF!important;}
       .mui-scroll-wrapper, .mui-scroll{background-color: #FFF!important;}
       .mui-views, .mui-view, .mui-pages, .mui-page, .mui-page-content{background-color: #FFF!important;}
        .buttons{-moz-box-shadow: 1px 6px 10px #928383;
            -webkit-box-shadow: 1px 6px 10px #928383;
            box-shadow: 1px 6px 10px #928383;}
       .mui-radio input[type=radio]:before{content:url('${url }/statics/pugles/mui/images/xuanze_ont.png')}
       .mui-radio input[type=radio]:checked:before{content:url('${url }/statics/pugles/mui/images/xuanze18.png')}
       .mui-checkbox input[type=checkbox]:checked:before, .mui-radio input[type=radio]:checked:before{color:rgba(0,0,0,0)}


       .mui-btn-block{font-size: 15px;
           display: block;
           width: 100%;
           margin-bottom: 10px;
           padding: 7px 0;}
        .idnse-hear{width: 90%;

            height: 40px;
            float: right;}

        .phone1{
            width: 25%;
            height: 35px;
            border-radius: 50px;
            line-height: 35px;
            text-align: center;
            float: right;
            background: #FFBF38;
            color: #ffffff;
            font-size: 1em;
        }
        .phone1not{
            background: #999999;
        }
        .spamsd{color: #999999;}
    </style>
    <link rel="stylesheet" type="text/css" href="${url }/statics/pugles/mui/css/feedback.css" />
</head>

<body class="mui-fullscreen">
<!--页面主结构开始-->
<div id="app" class="mui-views">
    <div class="mui-view">
        <div class="mui-navbar">
        </div>
        <div class="mui-pages">
        </div>
    </div>
</div>
<!--页面主结构结束-->
<!--单页面开始-->
<div id="setting" class="mui-page">
    <!--页面标题栏开始-->
    <div class="mui-navbar-inner mui-bar mui-bar-nav hears">
        <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left ">
            <span class=""></span>
        </button>
        <h1 class="mui-center mui-title"></h1>
    </div>
    <!--页面标题栏结束-->
    <!--页面主内容区开始-->
    <div class="mui-page-content">
        <div class="mui-scroll-wrapper">
            <%--<div class="mui-scroll">--%>
                <div class="mui-content">
                    <div class="mui-card">
                        <div class="mui-content-padded" style="margin: 5px;">
                            <input type="hidden" value="" class="zhu_orgNum">
                            <input type="hidden" value="" class="zhu_id">
                            <input type="hidden" value="0" class="zhu_xingbie" id="zhu_xingbie">
                            <input type="hidden" value="" class="openId" id="openId">
                            <input type="hidden" value="" class="ids" id="ids">
                            <form class="mui-input-group">
                                <div class="li-index">

                                    <div class="mui-input-row indexs">
                                        <label>姓名<span class="fontsd">&nbsp;&nbsp;&nbsp;*</span></label>
                                        <input type="text" placeholder="输入姓名" class="inputs-one inputs-reds" id="name" >
                                    </div>

                                </div>
                                <div class="li-index">
                                    <div class="mui-input-row indexs">
                                        <label>手机号<span class="fontsd">&nbsp;&nbsp;&nbsp;*</span></label>
                                        <input type="text" placeholder="输入手机号"  class="inputs-one inputs-reds" id="phone" >
                                        <div class="phone1 phoneCode">
                                                发送验证码
                                        </div>
                                    </div>

                                </div>
                                <div class="li-index">

                                    <div class="mui-input-row indexs">
                                        <label>验证码</label>
                                        <input type="text" placeholder="输入验证码"  class="inputs-one inputs-reds " id="codes" >
                                    </div>
                                </div>
                                <div class="li-index">
                                    <div class="mui-input-row indexs">
                                        <label>邮箱</label>
                                        <input type="text" placeholder="输入邮箱"  class="inputs-one inputs-reds" id="emain" >
                                    </div>
                                </div>
                                <div class="li-index">
                                    <div class="mui-input-row indexs">
                                        <label>职位</label>
                                        <input type="text" placeholder="输入职位"  class="inputs-one inputs-reds" id="post" >
                                    </div>
                                </div>
                                <div class="li-index">
                                    <div class="mui-input-row indexs">
                                        <label>性别<span class="fontsd">&nbsp;&nbsp;&nbsp;*</span></label>

                                            <span class="index-spans" id="index-spans"></span>
                                            <div class="mui-switch mui-active" id="mySwitch"  data-off="女" data-on = "男">
                                                <div class="mui-switch-handle" ></div>
                                            </div>

                                    </div>
                                </div>
                                <div class="li-index">
                                    <div class="mui-input-row indexs">
                                        <label>部门<span class="fontsd">&nbsp;&nbsp;&nbsp;*</span></label>
                                        <a href="#account" >
                                        <input type="text" placeholder="部门选择" readonly="readonly"  class="inputs-one inputs-reds padding-left ">
                                        </a>

                                    </div>
                                </div>
                                <%--<div class="li-index ">--%>
                                    <%--<div class="mui-input-row indexs">--%>
                                        <%--<span class="spamsd">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:发送验证码功能仅限北京地区手机号码使用</span>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <div class="li-index claindexs">

                                </div>


                                <div class="idnex-buoor">
                                    <div class="idnex-buttonsd">
                                        <button type="button" class="mui-btn mui-btn-block mui-btn-primary buttons" onclick="ajax_getTijiao()">提交</button>

                                    </div>

                                </div>

                            </form>

                        </div>

                    </div>
                </div>

            <%--</div>--%>
        </div>
    </div>
    <!--页面主内容区结束-->
</div>
<!--单页面结束-->
<div id="account" class="mui-page">
    <div class="mui-navbar-inner mui-bar mui-bar-nav">
        <%--mui-action-back --%>
        <button type="button" class="mui-left mui-btn  mui-btn-link mui-btn-nav mui-pull-left des ">
            <span class=""><i class="iconfont icon-fanhui spand-icon"></i></span>
        </button>
            <input type="hidden" value="" class="inputs_orgNum">
            <input type="hidden" value="" class="inputs_parentNum">
            <input type="hidden" value="" class="inputs_id"  >
          <div class="idnse-hear">
              <div class="mui-input-row mui-search">
                  <%--oninput="ajax_getUserNames(event)"--%>
                  <input type="search" class="mui-input-clear" placeholder="搜索" id="sousuo">
              </div>
          </div>
    </div>
    <div class="mui-page-content">
        <div class="mui-scroll-wrapper mui-scroll-wrappers">

            <div class="mui-scroll mui-scrolls">
                <ul class="mui-table-view ">
                    <li class="mui-table-view-cell mui-radio mui-left lid ">
                        <input name="radio" type="radio" value="1" ids="说得对"><a class="mui-navigate-right mui-navigate-right_one" href="#">文字排版</a>
                        <%--disap--%>
                        <div class="rodie_hides disap">
                            <ul class="mui-table-view">
                                <li class="mui-table-view-cell mui-radio mui-left  ">
                                    <input name="radio" type="radio"value="2" ><a class="mui-navigate-right mui-navigate-right_one" href="#">文字排版</a>
                                </li>
                            </ul>
                        </div>
                    </li>


                </ul>
            </div>

        </div>

    </div>
</div>




</body>
<script src="${url }/statics/pugles/mui/js/mui.min.js "></script>
<script src="${url }/statics/pugles/mui/js/mui.view.js "></script>
<%--<script src='${url }/statics/pugles/mui/js/feedback.js'></script>--%>
<script>
    mui.init();
    //初始化单页view
    var viewApi = mui('#app').view({
        defaultPage: '#setting'
    });
    //初始化单页的区域滚动
    mui('.mui-scroll-wrapper').scroll();
    //分享操作
    var shares = {};


    var view = viewApi.view;
    (function($) {
        //处理view的后退与webview后退
        var oldBack = $.back;
        $.back = function() {
            if (viewApi.canBack()) { //如果view可以后退，则执行view的后退
                viewApi.back();
            } else { //执行webview后退
                oldBack();
            }
        };
        //监听页面切换事件方案1,通过view元素监听所有页面切换事件，目前提供pageBeforeShow|pageShow|pageBeforeBack|pageBack四种事件(before事件为动画开始前触发)
        //第一个参数为事件名称，第二个参数为事件回调，其中e.detail.page为当前页面的html对象
        view.addEventListener('pageBeforeShow', function(e) {
            //				console.log(e.detail.page.id + ' beforeShow');
        });
        view.addEventListener('pageShow', function(e) {
            //				console.log(e.detail.page.id + ' show');
        });
        view.addEventListener('pageBeforeBack', function(e) {
            //				console.log(e.detail.page.id + ' beforeBack');
        });
        view.addEventListener('pageBack', function(e) {
            //				console.log(e.detail.page.id + ' back');
        });

        mui('.mui-content .mui-switch').each(function() { //循环所有toggle
            //toggle.classList.contains('mui-active') 可识别该toggle的开关状态
//            this.parentNode.querySelector('span').innerText = '' + (this.classList.contains('mui-active') ? '男' : '女');
             document.getElementById("index-spans").innerText = '' + (this.classList.contains('mui-active') ? '男' : '女');
            /**
             * toggle 事件监听
             */
            this.addEventListener('toggle', function(event) {
                //event.detail.isActive 可直接获取当前状态
                document.getElementById("index-spans").innerText = '' + (event.detail.isActive ? '男' : '女');
                var xingbie  = event.detail.isActive ? '0' : '1'
                document.getElementById("zhu_xingbie").value= xingbie;
            });
        });
    })(mui);
$(function () {

    sdlag_pabdaub();

            // 加载
            $(document).on("tap",".mui-navigate-right_one",function(){
                       if( $(this).hasClass("muisdd")){
                           console.log($(this).next());
                           $(this).removeClass("muisdd")
                           $(this).next().css("display","none");
                       }else{
                           $(this).addClass("muisdd");
                           console.log($(this).next());
                           var pan = $(this).attr("ids");

                           ajax_getOrgin(pan,$(this));
                           $(this).next().css("display","block");

                       }
            });
            // 返回
            $(document).on("tap",".des",function(){
                           var pan = $(".inputs_orgNum").val();
                           var parentNum =   $(".inputs_parentNum").val();
                           var inputsId =   $(".inputs_id").val();
                            var indexlist = inputsId.split(",");
                              var indexlistStr = [];
                             parentNum = ajax_getOrgin_ones(indexlist[indexlist.length-1]);
                             console.log(indexlist);
                             for(var i = 0; i < indexlist.length-1; i ++){
                                 indexlistStr.push(indexlist[i]);
                             }
                             console.log(indexlistStr);
                            $(".inputs_id").val(indexlistStr.join(","));
                           ajax_getOrgin(parentNum.parentNum,0);
                        if(parentNum == 0){
                            $(this).addClass("mui-action-back");
                        }
            });
            // 选择
            $(document).on("tap","input[name='radio']",function(){
                console.log($(this));
                var orgNum = $(this).val();// 值 id
                var names = $(this).attr("idsname");//名称
                var id = $(this).attr("ids");//名称
                var btnArray = ['否', '是'];
                mui.confirm(''+names+'', '是否选择', btnArray, function(e) {
                    if (e.index == 1) {
                            $("#sousuo").val("");
                            var flag = true;
                            var chushaixuanxiang = $(".chushaixuanxiang");
                            if(chushaixuanxiang.length > 0){
                                for(var i = 0; i< chushaixuanxiang.length; i ++){
                                    var lisListd = chushaixuanxiang.eq(i)
                                    if(lisListd.attr("orgnim") == orgNum ){
                                        flag = false;
                                    }
                                }
                            }
                            if(flag){
                                var htmls_one = [];
                                if(names.length > 14){
                                    names = names.substring(0,14)+"...";
                                }
                                htmls_one.push('<div class="indess-li chushaixuanxiang"  ids="'+id+'" names="'+names+'" orgnim="'+orgNum+'" >');
                                htmls_one.push('  <span class="indess-li-sapn">'+names+'</span>');
                                htmls_one.push('   </div>');
                                $(".claindexs").append(htmls_one.join(''));
                            }
                        ajax_getOrgin(0,0);
                    } else {

                    }
                })
                $(".mui-popup-button-bold").addClass("mui-action-back");
//                alert(1);
            });
            // 删除
            $(document).on("tap",".chushaixuanxiang",function(){
                console.log($(this));
                var thiz =  $(this);
                var names = $(this).attr("names");
                var orgnims = $(this).attr("orgnim");
                var btnArray = ['否', '是'];
                mui.confirm(''+names+'', '是否删除', btnArray, function(e) {
                    if (e.index == 1) {
                        thiz.remove();

                    }else{

                    }
                });
            });
            // 验证码
            $(document).on("tap",".phoneCode",function(){
                var thiz =  $(this);
                thiz.removeClass("phoneCode");
                thiz.addClass("phone1not");
                var phone = $("#phone").val();
                phoness_init(phone);
            });

    $('#sousuo').bind('input propertychange', function() {

            var name = $(this).val();

            if(name.length > 0){
                ajax_getUserNames(name)
            }else{
                sousuo_html();
            }
    });

        ajax_getOrgin(0,0);


})


    /**
     * 手机号 验证码
     * */
    ///////////////////////////////////////////////////////////////////
    var phone_count = 60;
    var set ;
    // 手机
    function phoness_init(phone) {
        var flages = true;

        if(phone.trim() == null || phone.trim() == undefined || phone.length <= 0){
            mui.toast("请填写手机号");
            flages = false ;

        }
        var myreg = /^1[0-9]{10}$/;
        if(!myreg.test(phone))
        {
            mui.toast('请输入有效的手机号码！');
            flages = false ;

        }
        if(flages){
            var data = {
                "phone":phone,
            };
           var flage =  ajax_phones_init(data);
            flage = true;
           if(flage){
               set =  setInterval(function () {
                   phone_texiao();
               }, 1000);
           }else{
               phone_count = 60;
               $(".phone1").addClass("phoneCode");
               $(".phone1").removeClass("phone1not");
               $(".phone1").html("发送验证码");
           }

        }else{
            phone_count = 60;
            $(".phone1").addClass("phoneCode");
            $(".phone1").removeClass("phone1not");
            $(".phone1").html("发送验证码");
        }


    }

    function phone_texiao() {
        console.log(phone_count);
        if(phone_count > 0){
            phone_count --;
            $(".phone1").html(phone_count);

        }else{
            window.clearInterval(set);
            phone_count = 60;
            $(".phone1").addClass("phoneCode");
            $(".phone1").removeClass("phone1not");
            $(".phone1").html("发送验证码");
        }

    }


    // 获取 验证码
    function ajax_phones_init(data) {
        var flahse = true ;
        $.ajax({
            //提交数据的类型 POST GET
            type:"GET",
            //提交的网址
            url:${url}+"/wechat//user/getPhoneCode",
            //提交的数据
            data:data,
             async : false, //默认为true 异步
            //返回数据的格式
            dataType: "json",//"xml", "html", "script", "json", "jsonp", "text".
            //成功返回之后调用的函数
            success:function(data){
                if(data.status == "200"){
                    mui.toast("发送成功",100);
                }else{
                    flahse = false;
                    mui.toast("提交失败",100);
                }
            }   ,
            //调用出错执行的函数
            error: function(data){
                //请求出错处理
                console.log(data);
            }
        });
        return flahse;
    }

    ///////////////////////////////////////////////////////////////////
    if(mui.os.stream){
        document.getElementById("check_update").display = "none";
    }

    /**
     *  提交数据
     */
    function  ajax_getTijiao() {
        var btnArray = ['否', '是'];
        mui.confirm('', '是否确认提交', btnArray, function(e) {
            if (e.index == 1) {
                        var gums = [];
                        var flags = true ;
                        var chushaixuanxiang = $(".chushaixuanxiang");
                        if(chushaixuanxiang.length > 0){
                            for(var i = 0; i< chushaixuanxiang.length; i ++){
                                var lisListd = chushaixuanxiang.eq(i);
                                gums.push(lisListd.attr("orgnim"));
                            }
                        }else{
                            mui.toast("请选择部门");
                            flags = false ;
                            return ;
                        }
                        var emain = $("#emain").val();
                        var phone = $("#phone").val();
                        var gender = $("#zhu_xingbie").val();
                        var name = $("#name").val();
                        var openId = $("#openId").val();
                        var post = $("#post").val();
                        var ids = $("#ids").val();
                        var code = $("#codes").val();
                        if(phone.trim() == null || phone.trim() == undefined || phone.length <= 0){
                            mui.toast("请填写手机号");
                            flags = false ;
                            return ;
                        }
                var myreg = /^1[0-9]{10}$/;
                if(!myreg.test(phone))
                {
                    mui.toast('请输入有效的手机号码！');
                    flags = false ;
                    return false;
                }
                if(name.trim() == null || name.trim() == undefined || name.length <= 0){
                            mui.toast("请填写名称");
                            flags = false ;
                            return ;
                        }
                if(code.trim() == null || code.trim() == undefined || code.length <= 0){
                            mui.toast("请填写验证码");
                            flags = false ;
                            return ;
                        }
                        if(flags){
//                             mui.toast("正在提交..",10);
                            var data  ={
                                orgNums:gums.join(","),
                                id:ids,
                                emain:emain,
                                phone:phone,
                                gender:gender,
                                name:name,
                                openId:openId,
                                post:post,
                                status:1,
                                code:code,
                            };
                            console.log(data);
                            $.ajax({
                                //提交数据的类型 POST GET
                                type:"POST",
                                //提交的网址
                                url:${url}+"/wechat/mobile/saveWechatUser",
                                //提交的数据
                                data:data,
                    //            async : false, //默认为true 异步
                                //返回数据的格式
                                dataType: "json",//"xml", "html", "script", "json", "jsonp", "text".
                                //成功返回之后调用的函数
                                success:function(data){
                                    console.log(data);
                                    var datas = data;
                                    if(data.success ==true){
                                        mui.alert('提交成功', '', function() {

                                        });
                                    }else{
                                        mui.toast(""+data.message+"",10);
                                    }
                                }   ,
                                //调用出错执行的函数
                                error: function(data){
                                    //请求出错处理
                                    console.log(data);
                                }
                            });
                        }

            }
        });

    }
    /**
     *  获取在组织结构
     */
    function  ajax_getOrgin(pan,div) {
        mui.toast("正在加载..",100);
        var data  ={
            parentNum:pan
        };
        $.ajax({
            //提交数据的类型 POST GET
            type:"GET",
            //提交的网址
            url:${url}+"/wechat/user/getDepartJsonList",
            //提交的数据
            data:data,
//            async : false, //默认为true 异步
            //返回数据的格式
            dataType: "json",//"xml", "html", "script", "json", "jsonp", "text".
            //成功返回之后调用的函数
            success:function(data){
                console.log(data);

                orgerview_lise0(data,pan,div)
            }   ,
            //调用出错执行的函数
            error: function(data){
                //请求出错处理
                console.log(data);
            }
        });
    }


    function  orgerview_lise0(data,pan,divs) {

        var htmls =[];
        if(data.length > 0){
            for(var i=0; i< data.length ;i ++ ){
                var datas =data[i];

                $(".inputs_parentNum").val(datas.parentNum);
            htmls.push('<ul class="mui-table-view ">');
            htmls.push('    <li class="mui-table-view-cell mui-radio mui-left  lid">');
            htmls.push('        <input name="radio" type="radio" value="'+datas.orgNum+'"  idsname="'+datas.orgName+'"  ids="'+datas.id+'"><a class="mui-navigate-right mui-navigate-right_one  mui-collapse"' +
                ' parentNum="'+datas.parentNum+'"  idsi="'+datas.id+'" ids="'+datas.orgNum+'" href="#">'+datas.orgName+'</a>');
            htmls.push('        <div class="rodie_hides disap">');
            htmls.push('        </div>');
            htmls.push('     </li>');
            htmls.push('</ul>');
            }

            if(pan == 0 || pan == undefined){
                $(".des").addClass("mui-action-back");
                $(".mui-scrolls").html(htmls.join(''));
            }else{
                $(".des").removeClass("mui-action-back");
                $(".mui-scrolls").html(htmls.join(''));
            }
            if(divs != 0){
                console.log(divs);
            var idsi = divs.attr("idsi");
            var indes = $(".inputs_id").val();
            var parentNums = $(".inputs_parentNum").val();
            var parentNum = divs.attr("parentNum");
                console.log(idsi);
                console.log(indes);
            $(".inputs_orgNum").val(pan);
            $(".inputs_parentNum").val(parentNum);
            $(".inputs_id").val(indes+","+idsi);
            }
        }else{

            mui.toast("已是最基层");
        }


    }


    /**
     *  获取在组织结构 单个
     */
    function  ajax_getOrgin_ones(pan) {
        var datas = [];
        var data  ={
            id:pan
        };
        $.ajax({
            //提交数据的类型 POST GET
            type:"GET",
            //提交的网址
            url:${url}+"/wechat/user/getDepartJsonListOne",
            //提交的数据
            data:data,
            async : false, //默认为true 异步
            //返回数据的格式
            dataType: "json",//"xml", "html", "script", "json", "jsonp", "text".
            //成功返回之后调用的函数
            success:function(data){
                console.log(data);
                datas = data;
            }   ,
            //调用出错执行的函数
            error: function(data){
                //请求出错处理
                console.log(data);
            }
        });
        return datas;
    }

    // 获取 微信
    function sdlag_pabdaub() {
//        ajax_weixinUser("ocO1Yv8HDzku9DMtDiNUo3TL1siE");
       var openIs =  ajax_weixinGetOpneId();
       if(openIs != 0){
           ajax_weixinGetOpneIds();
           ajax_weixinUser(openIs);
       }else{
//           ajax_weixin()
           ajax_weixinGetOpneId();
       }



    }

    /**
     *  获取openId接口
     */
    function  ajax_weixin() {
        var data  ={
//            flags:1
        };
        $.ajax({
            //提交数据的类型 POST GET
            type:"GET",
            //提交的网址
            url:${url}+"/wechat/user/initPagedoGet",
            //提交的数据
            data:data,
            async : false, //默认为true 异步
            //返回数据的格式
            dataType: "json",//"xml", "html", "script", "json", "jsonp", "text".

            //成功返回之后调用的函数
            success:function(data){
                console.log(data);

            }   ,
            //调用出错执行的函数
            error: function(data){
                //请求出错处理
                console.log(data);
            }
        });
    }
    /**
     *  获取openId接口 是否 是session
     */
    function  ajax_weixinGetOpneId() {
        var openId ="0";
        var data  ={
        };
        $.ajax({
            //提交数据的类型 POST GET
            type:"GET",
            //提交的网址
            url:${url}+"/wechat/user/openIdUserFlag",
            //提交的数据
            data:data,
            async : false, //默认为true 异步
            //返回数据的格式
            dataType: "json",//"xml", "html", "script", "json", "jsonp", "text".

            //成功返回之后调用的函数
            success:function(data){
                console.log(data);
                if(data.status == 200){
                    openId = data.data.openId;
                    $("#openId").val(openId);
                }

            }   ,
            //调用出错执行的函数
            error: function(data){
                //请求出错处理
                console.log(data);
            }
        });
        return openId;
    }
    /**
     *  获取     * 是否 关注 公众号
     */
    function  ajax_weixinGetOpneIds() {
        var subscribe ="0";
        var data  ={
        };
        $.ajax({
            //提交数据的类型 POST GET
            type:"GET",
            //提交的网址
            url:${url}+"/wechat/user/openIdUserFlagguanzhu",
            //提交的数据
            data:data,
            async : false, //默认为true 异步
            //返回数据的格式
            dataType: "json",//"xml", "html", "script", "json", "jsonp", "text".

            //成功返回之后调用的函数
            success:function(data){
                console.log(data);
                if(data.status == 200){
                    subscribe = data.data;

                    if(subscribe == 0){
                            mui.alert('请先关注公众号', '', function() {
                                window.location.href="https://mp.weixin.qq.com/mp/profile_ext?action=home&__biz=MzA5MjIxOTYxMA==&scene=124#wechat_redirect";
                            });

                    }else{

                    }
                }
            }   ,
            //调用出错执行的函数
            error: function(data){
                //请求出错处理
                console.log(data);
            }
        });
        return subscribe;
    }

    /**/

    /**
     *  获取 部门 搜索
     */
    function  ajax_getUserNames(name) {

        var data  ={
            parentName:name
        };
        $.ajax({
            //提交数据的类型 POST GET
            type:"POST",
            //提交的网址
            url:${url}+"/wechat/user/getDepartJsonListName",
            //提交的数据
            data:data,
//            async : false, //默认为true 异步
            //返回数据的格式
            dataType: "json",//"xml", "html", "script", "json", "jsonp", "text".
            //成功返回之后调用的函数
            success:function(data){
                console.log(data);
                if(data.status == 200){
                    ajax_getUserNamesHtmls(data.data);
                }else{
                }
            }   ,
            //调用出错执行的函数
            error: function(data){
                //请求出错处理
                console.log(data);
            }
        });

    }

    function ajax_getUserNamesHtmls(data) {
        var htmls = [];
        for(var i=0; i< data.length ;i ++ ){
            var datas =data[i];
            htmls.push('<ul class="mui-table-view ">');
            htmls.push('    <li class="mui-table-view-cell mui-radio mui-left  lid">');
            htmls.push('        <input name="radio" type="radio" value="'+datas.orgNum+'"  idsname="'+datas.orgName+'"  ids="'+datas.id+'"><a class="mui-navigate-right mui-navigate-right_one  mui-collapse"' +
                ' parentNum="'+datas.parentNum+'"  idsi="'+datas.id+'" ids="'+datas.orgNum+'" href="#">'+datas.orgName+'</a>');
            htmls.push('        <div class="rodie_hides disap">');
            htmls.push('        </div>');
            htmls.push('     </li>');
            htmls.push('</ul>');
        }
        $(".mui-scrolls").html(htmls.join(''));
    }

    /**
     * 搜索 为空时
     * */
    function  sousuo_html() {
        var inputsId =   $(".inputs_id").val();
        var indexlist = inputsId.split(",");
        var indexlistStr = [];
         var  parentNum = ajax_getOrgin_ones(indexlist[indexlist.length-1]);
        ajax_getOrgin(parentNum.parentNum,0);
    }

    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    /**
     *  获取 用户数据
     */
    function  ajax_weixinUser(openId) {

        var data  ={
            openId:openId
        };
        $.ajax({
            //提交数据的类型 POST GET
            type:"GET",
            //提交的网址
            url:${url}+"/wechat/mobile/queryWechatUserByOpenId",
            //提交的数据
            data:data,
            async : false, //默认为true 异步
            //返回数据的格式
            dataType: "json",//"xml", "html", "script", "json", "jsonp", "text".
            //成功返回之后调用的函数
            success:function(data){
                console.log(data);
                if(data.success ==true){
                    ajax_weixinUser_htmls(data);
                }else{
                }
            }   ,
            //调用出错执行的函数
            error: function(data){
                //请求出错处理
                console.log(data);
            }
        });

    }


    /**
     * 回传数据显示
     * @param data
     */
    function ajax_weixinUser_htmls(data) {
        var emain = data.data.emain;
        var phone = data.data.phone;
        var gender = data.data.gender;
        var name = data.data.name;
        var post = data.data.post;
        var ids = data.data.id;
        var agum = data.data.departList;
        $("#emain").val(emain);
        $("#phone").val(phone);
        $("#ids").val(ids);
        $("#name").val(name);
        $("#post").val(post);

        if(gender == 1){
            $("#zhu_xingbie").val(1);
            $("#index-spans").text("女");
            $("#mySwitch").removeClass('mui-active');
            $(".mui-switch-handle").attr("style","transition-duration: 0.2s; transform: translate(0px, 0px);");
        }

        var htmls_one = [];
        for(var i = 0 ; i < agum.length ; i ++ ){
            var datasagum = agum[i];
            var nasms = "";
            if(datasagum.orgName.length > 14){
                nasms = datasagum.orgName.substring(0,14)+"...";
            }else{
                nasms = datasagum.orgName;
            }
            htmls_one.push('<div class="indess-li chushaixuanxiang"  names="'+datasagum.orgName+'" orgnim="'+datasagum.orgNum+'" >');
            htmls_one.push('  <span class="indess-li-sapn">'+nasms+'</span>');
            htmls_one.push('   </div>');
        }
        $(".claindexs").append(htmls_one.join(''));
    }
</script>

</body>

</html>