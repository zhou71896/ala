<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form id="submitForm" class="form-horizontal">
    <div class="form-group">
        <label class="col-sm-3 control-label" for="active_degree"><font color="red">*</font>所属角色：</label>
		<div class="col-sm-8">
			<select class="form-control span2" id="active_degree" name="active_degree"">
					<option value="1">顾客</option>
                    <option value="0">商家</option>

            </select>
		</div>
	</div>
	
    <div class="form-group">
        <label class="col-sm-3 control-label" for="nick_name"><font color="red">*</font>用户名称：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="nick_name" name="nick_name" placeholder="请填写用户昵称"/>
            <div id="validation-username" class="validate-error help-block"></div>
        </div>
    </div>
    
    <div class="form-group">
        <label class="col-sm-3 control-label" for="password"><font color="red">*</font>登录密码：</label>
        <div class="col-sm-8">
            <input class="form-control" type="password" id="password" placeholder="请填写登录密码" />
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