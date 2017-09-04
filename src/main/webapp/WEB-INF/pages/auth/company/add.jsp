<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form id="submitForm" class="form-horizontal">
    <div class="form-group">
        <label class="col-sm-3 control-label" for="type"><font color="red">*</font>所属类型：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="type" name="type" placeholder="请填写公司类型"/>
            <div id="validation-type" class="validate-error help-block"></div>
        </div>
	</div>
	
    <div class="form-group">
        <label class="col-sm-3 control-label" for="name"><font color="red">*</font>公司名称：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="name" name="name" placeholder="请填写公司名称"/>
            <div id="validation-name" class="validate-error help-block"></div>
        </div>
    </div>
    
    <div class="form-group">
        <label class="col-sm-3 control-label" for="address"><font color="red">*</font>公司地址：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="address" name="address" placeholder="请填写公司地址" />
            <div id="validation-address" class="validate-error help-block"></div>
        </div>
    </div>
    
    <div class="form-group">
        <label class="col-sm-3 control-label" for="introduce"><font color="red">*</font>公司介绍：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="introduce" name="introduce" placeholder="请填写公司介绍" />
            <div id="validation-introduce" class="validate-error help-block"></div>
        </div>
    </div>
    
    <div class="form-group">
        <label class="col-sm-3 control-label" for="product_id">公司产品：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="product_id" name="product_id" placeholder="请填写公司相关的产品" />
        </div>
    </div>
    <div class="form-group">
    <label class="col-sm-3 control-label" for="good_at">公司擅长：</label>
    <div class="col-sm-8">
        <input class="form-control" type="text" id="good_at" name="good_at" placeholder="请填写公司擅长" />
    </div>
</div>
    <div class="form-group">
        <label class="col-sm-3 control-label" for="score">公司评分：</label>
        <div class="col-sm-8">
            <input class="form-control" type="text" id="score" name="score" placeholder="请填写评分" />
        </div>
    </div>
    
   <%-- <div class="form-group">
        <label class="col-sm-3 control-label" for="useable">是否可用：</label>
        <div class="col-sm-8">
            <div class="radio">
				<label style="display: inline-block; width: 50px;">
					<input checked value="1" name="useable" type="radio" class="ace"/>是
				</label>
				<label style="display: inline-block; width: 50px;">
					<input value="0" name="useable" type="radio" class="ace"/>否
				</label>
			</div>
        </div>
    </div>--%>
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
		ajaxRequest("admin/company/add", data);
	}
</script>