///// LOGIN FORM SUBMIT /////
function login(){
	var username = $('#username').val();
	var password = $('#password').val();
	
	if(username == '') {
		$('.nousername').fadeIn();
		$('.nopassword').hide();
		return false;	
	}
	if(password == '') {
		$('.nopassword').fadeIn();
		$('.nousername').hide();
		return false;
	}
	$.post(url+"back/loginajax",{username:username,password:password},function(data){
		if(data == 200){
            document.location.href = url + "admin/index";
		//	return false;
		}else{
			$('.wrongpassword').fadeIn();
			$('.nousername,.nopassword').hide();
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

