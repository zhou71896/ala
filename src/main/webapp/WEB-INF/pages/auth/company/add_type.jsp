<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form id="submitForm" class="form-horizontal">
    <div class="form-group">
        <label class="col-sm-3 control-label" for="name"><font color="red">*</font>类型名称：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="name" name="name" placeholder="请填写公司类型"/>
            <div id="validation-type" class="validate-error help-block"></div>
        </div>
	</div>
    
    <div class="form-group">
        <label class="col-sm-3 control-label" for="status">是否可用：</label>
        <div class="col-sm-8">
            <div class="radio">
				<label style="display: inline-block; width: 50px;">
					<input checked value="1" name="status" type="radio" class="ace"/>是
				</label>
				<label style="display: inline-block; width: 50px;">
					<input value="0" name="status" type="radio" class="ace"/>否
				</label>
			</div>
        </div>
    </div>
</form>

<script type="text/javascript">
	submit = function(){
		frmValidate();
		/*var password = $("#password").val();
		var rePass = $("#rePass").val();
		if(password != rePass){
			modalErr("两次密码不一致");
			return;
		}
		password = hex_md5(password);*/
		var data = $("#submitForm").serialize();
		ajaxRequest("admin/company/addCompanyType", data);
	}
</script>