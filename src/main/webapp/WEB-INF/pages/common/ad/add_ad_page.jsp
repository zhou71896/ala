<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form id="submitForm" class="form-horizontal">
    <div class="form-group">
        <label class="col-sm-3 control-label" for="type"><font color="red">*</font>广告类型：</label>
		<div class="col-sm-8">
			<select class="form-control span2" id="type" name="type"">
					<option value="1">Html类型</option>
                    <option value="0">内部类型</option>

            </select>
		</div>
	</div>
	
    <div class="form-group">
        <label class="col-sm-3 control-label" for="name"><font color="red">*</font>名称：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="name" name="name" placeholder="请填写广告名称"/>
            <div id="validation-name" class="validate-error help-block"></div>
        </div>
    </div>
    
    <div class="form-group">
        <label class="col-sm-3 control-label" for="content"><font color="red">*</font>：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="content" placeholder="请填写登录密码" />
            <div id="validation-password" class="validate-error help-block"></div>
        </div>
    </div>
    
    <div class="form-group">
        <label class="col-sm-3 control-label" for="rePass"><font color="red">*</font>确认密码：</label>
        <div class="col-sm-8">
            <input class="form-control" type="password" id="rePass" placeholder="请填写确认密码" />
            <div id="validation-password" class="validate-error help-block"></div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="mobile">手机号：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="mobile" name="mobile" placeholder="请填写手机号" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="email">电子邮箱：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="email" name="email" placeholder="请填写电子邮箱" />
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="gender">性别：</label>
        <div class="col-sm-8">
            <div class="radio">
                <label style="display: inline-block; width: 50px;">
                    <input checked value="1" name="gender" type="radio" class="ace"/>男
                </label>
                <label style="display: inline-block; width: 50px;">
                    <input value="0" name="gender" type="radio" class="ace"/>女
                </label>
            </div>
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
		var password = $("#password").val();
		var rePass = $("#rePass").val();
		if(password != rePass){
			modalErr("两次密码不一致");
			return;
		}
		password = hex_md5(password);
		var data = $("#submitForm").serialize() + "&password="+password;
		ajaxRequest("user/addCustomer", data);
	}
</script>