<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="page-header" style="padding:10px 20px;margin:-18px 0px 0px">
  <div id="searchForm">
  	<div class="col-md-2" style="width: 200px">
		<input type="text" class="form-control search-query" name="username" placeholder="用户名">
	</div>
	<div class="col-md-2" style="padding-bottom: 0px;width: 200px;">
		<select class="form-control" name="active_degree" onchange="javascript:formSubmit();">
			<option value="">==所属角色==</option>
				<option value="1">顾客</option>
			   <option value="0">商家</option>
		</select>
	</div>
    <div class="col-md-1" style="width: 105px;">
        <button id="searchBtn" class="btn btn-labeled btn-info" onclick="javascript:formSubmit();"><span class="btn-label icon fa fa-search"></span>搜索</button>
    </div>
    <div class="col-md-3" style="text-align: left;padding-bottom: unset">
        <button id="addBtn" class="btn btn-labeled btn-primary" onclick="javascript:showModal('添加用户', 'user/addCustomerPage');"><span class="btn-label icon fa fa-plus"></span>添加用户</button>
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
                {field:"nick_name", text:"用户昵称"},
                {field:"password", text:"密码"},
                {field:"mobile", text:"电话号码"},
                {field:"email", text:" 电子邮件",},
                {field:"gender", text:"性别" ,formatter:function(index, content, data){
                    return content == 1 ? "<font color='blue'>男</font>" : "<font color='red'>女</font>";
                }},
                {field:"active_degree", text:"角色类型",formatter:function(index, content, data){
                    return content == 1 ? "<font color='blue'>顾客</font>" : "<font color='red'>商家</font>";
                }},
                {field:"registe_time", text:"注册时间"},
                {field:"status", text:"状态",formatter:function(index, content, data){
                    return content == 1 ? "<font color='blue'>可用</font>" : "<font color='red'>禁用</font>";
                }},

            ],
            cls: "",
            url: _urlPath + "user/queryPage",
            sort:"id",
            order:"desc",
            pagination:true,
            onLoad:function(){
                $(".add-tooltip").tooltip();
            }
        });
    });
</script>