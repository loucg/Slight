<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
</head>
<body class="no-skin">
	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12" >
								<form action="userInfo/${msg }.do" name="userInfoForm" id="userInfoForm" method="post">
									<input type="hidden" name="USER_ID" id="user_id" value="${pd.USER_ID }"/>
									<div id="zhongxin" style="padding-top: 20px;">
									<table id="table_report" class="table table-striped table-bordered table-hover">
										<tr>
											<td style="width:79px;text-align: right;padding-top: 4px;">登录名:</td>
											<td><input type="text" name="USERNAME" id="username" value="${pd.USERNAME }" maxlength="32" placeholder="" title="登录名" style="width:98%;"/></td>
										</tr>
										<tr>	
											<td style="width:79px;text-align: right;padding-top: 4px;">原始密码:</td>
											<td><input type="text" name="OLDPASSWORD" id="oldPassword"  maxlength="32" placeholder="输入原始密码，不修改密码无需输入" title="原始密码" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 4px;">新密码:</td>
											<td><input type="text" name="NEWPASSWORD" id="newPassword"  maxlength="32" placeholder="输入新密码，为空时表示不修改" title="新密码" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 4px;"><span style="color:red;">*</span>姓名:</td>
											<td><input type="text" name="NAME" id="name"  value="${pd.NAME }"  maxlength="32" placeholder="这里输入姓名" title="姓名" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 4px;"><span style="color:red;">*</span>手机:</td>
											<td><input type="number" name="PHONE" id="phone"  value="${pd.PHONE }"  maxlength="32" placeholder="这里输入手机号" title="手机号" style="width:98%;"/></td>
										</tr>
										<tr>
										<td style="width:79px;text-align: right;padding-top: 4px;">邮箱:</td>
										<td><input type="email" name="EMAIL" id="email"  value="${pd.EMAIL }" maxlength="32" placeholder="这里输入邮箱" title="邮箱" style="width:98%;"/></td>
										</tr>
										<tr>
										<td style="width:79px;text-align: right;padding-top: 4px;">联系地址:</td>
										<td><input type="text" name="ADDRESS" id="address"  value="${pd.ADDRESS }"  maxlength="32" placeholder="这里输入联系地址" title="联系地址" style="width:98%;"/></td>
										</tr>
										<tr>
										<td style="width:79px;text-align: right;padding-top: 4px;">职务:</td>
										<td><input type="text" name="POSITION" id="position"  value="${pd.POSITION }"  maxlength="32" placeholder="" title="职务" style="width:98%;"/></td>
										</tr>
										<tr>
										<td style="width:79px;text-align: right;padding-top: 4px;">公司:</td>
										<td><input type="text" name="COMPANY" id="company"  value="${pd.COMPANY }"  maxlength="32" placeholder="" title="公司" style="width:98%;"/></td>
										</tr>
										<tr>
										<td style="width:79px;text-align: right;padding-top: 4px;"><span style="color:red;">*</span>语言:</td>
											<td id="yuyan">
											<select class="chosen-select form-control" name="LANGUAGE_ID" id="language_id" data-placeholder="请选择语言" style="vertical-align:top;width:98%;">
											<option value="">请选择语言</option>
											<c:forEach items="${languageList}" var="language">
												<option value="${language.id }"<c:if test="${language.id == pd.LANGUAGE_ID }">selected</c:if>>${language.name }</option>
											</c:forEach>
											</select>
										</td>
										</tr>
										<tr>
											<td style="text-align: center;" colspan="10">
												<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
												<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
											</td>
										</tr>
									</table>
									</div>
									<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
								</form>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
</body>
<script type="text/javascript">
	$(top.hangge());
	$(document).ready(function(){
		if($("#user_id").val()!=""){
			//默认不能修改的数据
			$("#username").attr("readonly","readonly");
			$("#username").css("color","gray");
			$("#position").attr("readonly","readonly");
			$("#position").css("color","gray");
			$("#company").attr("readonly","readonly");
			$("#company").css("color","gray");
		}
	});
	//保存
	function save(){
		/*
		if($("#USERNAME").val()=="" || $("#USERNAME").val()=="此登录名已存在!"){
			$("#USERNAME").tips({
				side:3,
	            msg:'输入登录名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#USERNAME").focus();
			$("#USERNAME").val('');
			$("#USERNAME").css("background-color","white");
			return false;
		}else{
			$("#USERNAME").val(jQuery.trim($('#USERNAME').val()));
		}
		*/
		/*
		if($("#USER_ID").val()=="" && $("#PASSWORD").val()==""){
			$("#PASSWORD").tips({
				side:3,
	            msg:'输入密码',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PASSWORD").focus();
			return false;
		}
		*/
		
		if($("#newPassword").val()!="" && $("#oldPassword").val() == ""){ //当用户输入新密码而原始密码为空时
			$("#oldPassword").tips({
				side:3,
	            msg:'输入原始密码',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#oldPassword").focus();
			return false;
		}
		
		if($("#name").val()==""){
			$("#name").tips({
				side:3,
	            msg:'输入姓名',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#name").focus();
			return false;
		}
		
		var myreg = /^(((13[0-9]{1})|159)+\d{8})$/;
		if($("#phone").val()==""){
			
			$("#phone").tips({
				side:3,
	            msg:'输入手机号码',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#phone").focus();
			return false;
		}else if($("#phone").val().length != 11 && !myreg.test($("#phone").val())){
			$("#phone").tips({
				side:3,
	            msg:'手机号码格式不正确',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#phone").focus();
			return false;
		}
		
		if($("#email").val()!=""){
			if(!ismail($("#email").val())){
				$("#email").tips({
					side:3,
		            msg:'邮箱格式不正确',
		            bg:'#AE81FF',
		            time:3
		        });
				$("#email").focus();
				return false;
			}
			}
		
		if($("#language_id").val()==""){
			$("#yuyan").tips({
				side:3,
	            msg:'选择语言',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#language_id").focus();
			return false;
		}
		
		
		
		
		
		/*
		if($("#EMAIL").val()==""){
			
			$("#EMAIL").tips({
				side:3,
	            msg:'输入邮箱',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#EMAIL").focus();
			return false;
		}
		*/
		
		
		
		if($("#user_id").val()==""){
			hasU();
		}else{
			$("#userInfoForm").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show(); 
		}
	}
	function ismail(mail){
		return(new RegExp(/^(?:[a-zA-Z0-9]+[_\-\+\.]?)*[a-zA-Z0-9]+@(?:([a-zA-Z0-9]+[_\-]?)*[a-zA-Z0-9]+\.)+([a-zA-Z]{2,})+$/).test(mail));
		}
	
	//判断用户名是否存在
	function hasU(){
		var USERNAME = $.trim($("#USERNAME").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>user/hasU.do',
	    	data: {USERNAME:USERNAME,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" == data.result){
					$("#userInfoForm").submit();
					$("#zhongxin").hide();
					$("#zhongxin2").show();
				 }else{
					$("#USERNAME").css("background-color","#D16E6C");
					setTimeout("$('#USERNAME').val('此用户名已存在!')",500);
				 }
			}
		});
	}
	
	//判断邮箱是否存在
	function hasE(USERNAME){
		var EMAIL = $.trim($("#EMAIL").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>user/hasE.do',
	    	data: {EMAIL:EMAIL,USERNAME:USERNAME,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.result){
					 $("#EMAIL").tips({
							side:3,
				            msg:'邮箱 '+EMAIL+' 已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					 $("#EMAIL").val('');
				 }
			}
		});
	}
	/*
	$(function() {
		//下拉框
		if(!ace.vars['touch']) {
			$('.chosen-select').chosen({allow_single_deselect:true}); 
			$(window)
			.off('resize.chosen')
			.on('resize.chosen', function() {
				$('.chosen-select').each(function() {
					 var $this = $(this);
					 $this.next().css({'width': $this.parent().width()});
				});
			}).trigger('resize.chosen');
			$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
				if(event_name != 'sidebar_collapsed') return;
				$('.chosen-select').each(function() {
					 var $this = $(this);
					 $this.next().css({'width': $this.parent().width()});
				});
			});
			$('#chosen-multiple-style .btn').on('click', function(e){
				var target = $(this).find('input[type=radio]');
				var which = parseInt(target.val());
				if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
				 else $('#form-field-select-4').removeClass('tag-input-style');
			});
		}
	});
	*/
</script>
</html>