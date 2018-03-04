<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <!-- Meta, title, CSS, favicons, etc. -->
 <meta charset="utf-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">

 <title>小程序集成平台</title>
 <!-- Bootstrap -->
 <link href="${url }statics/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
 <!-- Animate.css -->
 <link href="${url }statics/plugins/animate.css/animate.min.css" rel="stylesheet">
 <!-- Custom Theme Style -->
 <link href="${url }statics/css/custom.min.css" rel="stylesheet">

 <script src="${url }statics/plugins/jquery.js"></script>
 <script type="text/javascript">
     var url = '${url}';
 </script>
 <script language="javascript" type="text/javascript" src="${url }statics/js/login.js"></script>
</head>

<body class="login">
<div>
 <a class="hiddenanchor" id="signup"></a>
 <a class="hiddenanchor" id="signin"></a>

 <div class="login_wrapper">
  <div class="animate form login_form">
   <section class="login_content">
    <form>
     <h1>登录</h1>
     <div>
      <input type="text" class="form-control" id="username" placeholder="用户名" required="" />
     </div>
     <div>
      <input type="password" class="form-control" id="password" placeholder="密码" required="" />
     </div>
     <div class="errorDiv" style="display: none">
      <p style="color: red"></p>
     </div>
     <div>
      <a class="btn btn-default submit" href="javascript:void(0)" id="login">登录</a>
      <a class="reset_pass" href="#">忘记密码?</a>
     </div>

     <div class="clearfix"></div>

     <div class="separator">
      <p class="change_link">新用户?
       <a href="#signup" class="to_register"> 注册 </a>
      </p>
      <div class="clearfix"></div>
      <br />
     </div>
    </form>
   </section>
  </div>

  <div id="register" class="animate form registration_form">
   <section class="login_content">
    <form>
     <h1>注册</h1>
     <div>
      <input type="text" class="form-control" placeholder="用户名" required="" />
     </div>
     <div>
      <input type="email" class="form-control" placeholder="邮箱" required="" />
     </div>
     <div>
      <input type="password" class="form-control" placeholder="密码" required="" />
     </div>
     <div>
      <a class="btn btn-default submit" href="index.html">提交</a>
     </div>

     <div class="clearfix"></div>

     <div class="separator">
      <p class="change_link">已经有账号 ?
       <a href="#signin" class="to_register"> 登录 </a>
      </p>

      <div class="clearfix"></div>
      <br />
     </div>
    </form>
   </section>
  </div>
 </div>
</div>
</body>
</html>
