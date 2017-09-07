<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form id="submitForm" class="form-horizontal">
    <input name="id" value="${companyTypeEntity.id}" type="text" hidden="hidden">
    <div class="form-group">
        <label class="col-sm-3 control-label" for="name"><font color="red">*</font>类型名称：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="name" name="name" placeholder="请填写公司类型" value="${companyTypeEntity.name}"/>
            <div id="validation-type" class="validate-error help-block"></div>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-3 control-label" for="status">是否可用：</label>
        <div class="col-sm-8">
            <div class="radio">
                <label style="display: inline-block; width: 50px;">
                    <input checked value="1" name="status" type="radio" class="ace" <c:if test="${1 == companyTypeEntity.status}">checked</c:if>/>是
                </label>
                <label style="display: inline-block; width: 50px;">
                    <input value="0" name="status" type="radio" class="ace" <c:if test="${0 == companyTypeEntity.status}">checked</c:if>/>否
                </label>
            </div>
        </div>
    </div>

</form>
<script type="text/javascript">
	submit = function(){
		frmValidate();
		var data = $("#submitForm").serialize();
		ajaxRequest("admin/company/updateCompanyType", data);
	}
</script>