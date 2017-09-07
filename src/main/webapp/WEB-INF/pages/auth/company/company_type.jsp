<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="page-header" style="padding:10px 20px;margin:-18px 0px 0px">
  <div id="searchForm">
  	<div class="col-md-2" style="width: 200px">
		<input type="text" class="form-control search-query" name="name" placeholder="类型名">
	</div>
    <div class="col-md-1" style="width: 105px;">
        <button id="searchBtn" class="btn btn-labeled btn-info" onclick="javascript:formSubmit();"><span class="btn-label icon fa fa-search"></span>搜索</button>
    </div>
    <div class="col-md-3" style="text-align: left;padding-bottom: unset">
        <button id="addBtn" class="btn btn-labeled btn-primary" onclick="javascript:showModal('添加公司', 'admin/company/addTypePage');"><span class="btn-label icon fa fa-plus"></span>添加公司</button>
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
                {field:"id",text:"公司类型编号",style:"text-align:center", sortColumn:"id"},
                {field:"name", text:"类型名称",style:"text-align:center"},
                {field:"status", text:"状态",style:"text-align:center",formatter:function(index,content,data){
                    var s=content;
                    if(s==1){
                        return "激活";
                    }else{
                        return "禁用";
                    }

                }},
                {field:"update_date", text:"修改时间",style:"text-align:center"},
                {field:"create_date", text:"创建时间",style:"text-align:center"},
                {field:"id", text:"操作",width:80, style:"text-align:center", formatter:function(index, content, data){
	                    var editUrl = "admin/company/updateTypePage/" + content;
	                    var delUrl = "admin/company/deleteTypeByID/" + content;
	                    return "<a href='javascript:showModal(\"修改用户\", \""+editUrl+"\");' data-original-title='修改' class='btn btn-xs btn-warning add-tooltip'><i class='fa fa-pencil'>修改</i></a>"
	                        + "&nbsp;<a href='javascript:showCfm(\"确定删除该记录\", \""+delUrl+"\");'  data-original-title='删除' class='btn btn-xs btn-danger add-tooltip'><i class='fa fa-times'>删除</i></a>";
                	}
                }
            ],
            cls: "",
            url: _urlPath + "admin/company/queryTypePage",
            sort:"id",
            order:"desc",
            pagination:true,
            onLoad:function(){
                $(".add-tooltip").tooltip();
            }
        });
    });
</script>