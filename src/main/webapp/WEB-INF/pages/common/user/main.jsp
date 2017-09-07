<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="page-header" style="padding:10px 20px;margin:-18px 0px 0px">
  <div id="searchForm">
  	<div class="col-md-2" style="width: 200px">
		<input type="text" class="form-control search-query" name="username" placeholder="用户名">
	</div>
	<div class="col-md-2" style="padding-bottom: 0px;width: 200px;">
		<select class="form-control" name="roleid" onchange="javascript:formSubmit();">
			<option value="">==所属角色==</option>
			<c:forEach items="${list}" var="role">
				<option value="${role.roleid}">${role.cname}</option>
			</c:forEach>
		</select>
	</div>
    <div class="col-md-1" style="width: 105px;">
        <button id="searchBtn" class="btn btn-labeled btn-info" onclick="javascript:formSubmit();"><span class="btn-label icon fa fa-search"></span>搜索</button>
    </div>
    <div class="col-md-3" style="text-align: left;padding-bottom: unset">
        <button id="addBtn" class="btn btn-labeled btn-primary" onclick="javascript:showModal('添加用户', 'admin/user/addPage');"><span class="btn-label icon fa fa-plus"></span>添加用户</button>
    </div>
  </div>
</div>
<div class="openAppGrid">
	<div id="openAppGrid"></div>
</div>
<script type="text/javascript">
    $(function (){
        $("#openAppGrid").sgrid({
            columns:[
                {field:"id",text:"用户ID", sortColumn:"id"},
                {field:"nickNmae", text:"用户昵称"},
                {field:"password", text:"密码"},
                {field:"mobile", text:"密码"},
                {field:"email", text:" 电子邮件",formatter:function(index, content, data){
                    return content == 1 ? "<font color='blue'>可用</font>" : "<font color='red'>禁用</font>";
                }},
                {field:"gender", text:"性别"},
                {field:"active_degree", text:"激活等级"},
                {field:"birthday", text:"生日"},
                {field:"singature", text:"签名"},
                {field:"register_time", text:"注册时间"},
                {field:"province", text:"省份"},
                {field:"city", text:"城市"},
                {field:"head_img_url", text:"头像"},
                {field:"fk_resource_id", text:"资源id"},
                {field:"introduction", text:"介绍"},
                {field:"status", text:"状态"},
                {field:"id", text:"操作",width:80, style:"text-align:center", formatter:function(index, content, data){
                	if("admin" == data.username){
                		return "禁止操作超级管理员";
                	}else{
	                    var editUrl = "admin/user/updatePage/" + content;
	                    var resetPwd = "admin/user/updatePwdPage?id=" + content;
	                    var delUrl = "admin/user/deleteByID/" + content;
	                    return "<a href='javascript:showModal(\"更新用户\", \""+editUrl+"\");' data-original-title='修改' class='btn btn-xs btn-warning add-tooltip'><i class='fa fa-pencil'>修改</i></a>"
	                        + "&nbsp;<a href='javascript:showCfm(\"确定删除该记录\", \""+delUrl+"\");'  data-original-title='删除' class='btn btn-xs btn-danger add-tooltip'><i class='fa fa-times'>删除</i></a>";
                	}
                }}
            ],
            cls: "",
            url: _urlPath + "admin/user/queryPage",
            sort:"id",
            order:"desc",
            pagination:true,
            onLoad:function(){
                $(".add-tooltip").tooltip();
            }
        });
    });
</script>