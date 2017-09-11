<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="page-header" style="padding:10px 20px;margin:-18px 0px 0px">
  <div id="searchForm">
  	<div class="col-md-2" style="width: 200px">
		<input type="text" class="form-control search-query" name="username" placeholder="用户名">
	</div>
	<div class="col-md-2" style="padding-bottom: 0px;width: 200px;">
		<select class="form-control" name="active_degree" onchange="javascript:formSubmit();">
			<option value="">==广告类型==</option>
				<option value="1">Html类型</option>
			   <option value="0">内部类型</option>
		</select>
	</div>
    <div class="col-md-1" style="width: 105px;">
        <button id="searchBtn" class="btn btn-labeled btn-info" onclick="javascript:formSubmit();"><span class="btn-label icon fa fa-search"></span>搜索</button>
    </div>
    <div class="col-md-3" style="text-align: left;padding-bottom: unset">
        <button id="addBtn" class="btn btn-labeled btn-primary" onclick="javascript:showModal('添加广告', 'user/addCustomerPage');"><span class="btn-label icon fa fa-plus"></span>添加用户</button>
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
                {field:"id",text:"广告ID", sortColumn:"id"},
                {field:"name", text:"名称"},
                {field:"type", text:"类型" ,formatter:function(index,content,data){
                    return content == 1 ? "<font color='blue'>Html类型</font>" : "<font color='red'>内部类型</font>";
				}},
                {field:"icon", text:"广告图标"},
                {field:"content", text:"内容"},
                {field:"status", text:"状态"},
                {field:"update_date", text:"修改时间" },
                {field:"create_date", text:"创建时间"},
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