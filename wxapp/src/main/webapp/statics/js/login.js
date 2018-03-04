///// LOGIN FORM SUBMIT /////
function login(){
	var username = $('#username').val();
	var password = $('#password').val();
	
	if(username == '') {
        $('.errorDiv').find("p").html("用户名不能为空");
		$('.errorDiv').fadeIn();
		return false;	
	}
	if(password == '') {
        $('.errorDiv').find("p").html("密码不能为空");
        $('.errorDiv').fadeIn();
		return false;
	}
	$.post(url+"back/loginajax",{username:username,password:password},function(data){
		if(data == 200){
            document.location.href = url + "admin/index";
		//	return false;
		}else{
            $('.errorDiv').find("p").html("用户名或密码错误");
            $('.errorDiv').fadeIn();
		}
		return false;
	});
}

$(document).ready(function(){
	$('#login').click(function(){
		login();
	});
});

document.onkeydown=function(event){
	var e = event || window.event || arguments.callee.caller.arguments[0];
	if(e && e.keyCode==13){ // enter 键
		login();
	}
}; 

