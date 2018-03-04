/**
 * Created by Administrator on 2017/11/25 0025.
 */

//右下角的提示框
function attentionAlert(a,msg,msgHtml){
    var news = new Array();
    var c="";
    if(a=="success"){
        c="notification-success";
    } else if(a=="error"){
        c="notification-red";
    } else if(a=="warn"){
        c="notification-warning";
    }
    news.push('<div class="notification '+c+' notificationG" style="position: absolute;bottom:40px;right:0;">');
    news.push('   <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>');
    if(msg==""){
        news.push(msgHtml);
    } else{
        news.push('      <h4 style="min-width:150px;">'+msg+'</h4>');
    }
    news.push('</div>');
    $("body").append(news.join(""));
    setTimeout(function(){
        $(".notificationG").fadeOut(3000);
    },500);
}









