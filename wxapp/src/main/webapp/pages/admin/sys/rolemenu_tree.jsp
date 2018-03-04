<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../common/statics.jsp" %>
<style>
.dyntable2_left {width: 500px; position: absolute;overflow-x:hide;margin-top: 20px;}
</style>
 <div class="pageheader notab">
    <h1 class="pagetitle">分配权限</h1>
    <span class="pagedesc"></span>
</div><!--pageheader-->
<div id="contentwrapper" class="contentwrapper">
	<button type="submit" class="btn btn-primary submit save">保存</button>
	<button type="reset" class="btn btn-default back">取消</button>
	<input type="hidden" id="roleId" value="${roleId}">
	<div id="dyntable2_left" class="dyntable2_left">
		<div><ul id="treeDemo" class="ztree"></ul></div>
	</div>
</div>
<script type="text/javascript">
var adminUrl = '${url}admin/';
//zTree 的数据属性
var zNodes = ${treeJson};
var roleId = "${roleId}";
</script>
<script type="text/javascript" src="${url }/statics/plugins/ztree/ztree.js"></script>
<%--<script type="text/javascript" src="${url }/statics/js/plugins/ztree/jquery.ztree.excheck.js"></script>--%>
<link rel="stylesheet" media="screen" href="${url }/statics/plugins/ztree/zTreeStyle/zTreeStyle.css"/>
<script src="${url }/statics/admin/js/custom/general.js"></script>
<script> 
//初始化
$(document).ready(function(){
    $(".back").click(function(){
        location.href = url+"admin/role/list";
	});

	/******************ztree*******************/
	var zTreeObj;
	// zTree 的参数配置
	var setting = {
        check: {
            enable: true
        },
        data: {
            simpleData: {
                enable: true
            }
        }
	};
	zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
	zTreeObj.expandAll(true);
	
	$(".save").on("click",function(){
		var roleId = $("#roleId").val();
		var menuIds = getSelectedIds();
		if(!menuIds){
            attentionAlert("warn","请选择菜单!");
			return;
		}
		
		$.post(adminUrl+"role/saveRoleMenu",{roleId:roleId,menuIds:menuIds},function(data){
			if(data > 0){
                attentionAlert("success","分配菜单成功!");
			}else{
                attentionAlert("error","分配菜单失败，请重新分配!");
			}
		})
	});
});

//获取选择的多个选框ID
function getSelectedIds() {
    var zTree = $.fn.zTree.getZTreeObj("treeDemo");
    checkCount = zTree.getCheckedNodes(true);

    var classpurview = "";
    for(var i=0;i<checkCount.length;i++) {
    	if(i == 0){
    		classpurview += checkCount[i].id
    	}else{
        	classpurview += "," + checkCount[i].id
    	}
    }
    return classpurview;
}
</script>
