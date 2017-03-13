<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
		
<script type="text/javascript">
	
	//保存
	function save(){
			if($("#id").val()==""){
				$("#id").tips({
					side:3,
		            msg:'请输入终端编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#id").focus();
				return false;
			}
			
			if($("#name").val()==""){
			$("#name").tips({
				side:3,
	            msg:'请输入终端名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#name").focus();
			return false;
		}

		hasK();
	}
	//判断关键词是否存在
	function hasK(){
		var name = $("#name").val();
		var COMMAND_ID = "${pd.COMMAND_ID}";
		$.ajax({
			type: "POST",
			url: '<%=basePath%>textmsg/hasK.do',
	    	data: {name:name,COMMAND_ID:COMMAND_ID,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" == data.result){
					$("#Form").submit();
					$("#zhongxin").hide();
					$("#zhongxin2").show();
				 }else{
					$("#name").tips({
						side:3,
			            msg:'此关键词已存在(全局)!',
			            bg:'#AE81FF',
			            time:3
			        });
					return false;
				 }
			}
		});
	}
	function setType(value){
		$("#STATUS").val(value);
	}
</script>
</head>
<body class="no-skin">

<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">

					<form action="combination/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="COMMAND_ID" id="COMMAND_ID" value="${pd.COMMAND_ID}"/>
						<input type="hidden" name="STATUS" id="STATUS" value="${pd.STATUS}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:96px;text-align: right;padding-top: 13px;">网关编号:</td>
								<td><input style="width:95%;" type="text" name="id" id="id" value="${pd.id}" maxlength="500" placeholder="这里输入组名" title="终端编号"/></td>
							</tr>
							<tr>
								<td style="width:96px;text-align: right;padding-top: 13px;">网关名称:</td>
								<td><input style="width:95%;" type="text" name="name" id="name" value="${pd.name}" maxlength="500" placeholder="这里输入终端名称" title="终端名称"/></td>
							</tr>
							<tr>
								<td style="width:96px;text-align: right;padding-top: 13px;">网关位置:</td>
								<td><input style="width:95%;" type="text" name="location" id="location" value="${pd.location}" maxlength="500" placeholder="这里输入网关位置" title="网关位置"/></td>
							</tr>
							<tr>
								<td style="width:96px;text-align: right;padding-top: 13px;">备注:</td>
								<td><input style="width:95%;" type="text" name="comment" id="comment" value="${pd.comment}" maxlength="500" placeholder="这里输入备注" title="备注"/></td>
							</tr>
							<tr>
								<td style="width:96px;text-align: right;padding-top: 13px;">终端数量:</td>
								<td><input style="width:95%;" type="text" name="number" id="number" value="${pd.number}" maxlength="500" placeholder="这里输入终端数量" title="终端数量"/></td>
							</tr>
							<tr>
								<td style="width:96px;text-align: right;padding-top: 13px;">工作状态:</td>
								<td><input style="width:95%;" type="text" name="status" id="status" value="${pd.status}" maxlength="500" placeholder="这里输入工作状态" title="工作状态"/></td>
							</tr>
							
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
	
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>	
</div>
<!-- 页面底部js¨ -->
<%@ include file="../../system/index/foot.jsp"%>
<!-- ace scripts -->
<script src="static/ace/js/ace/ace.js"></script>
<!-- ace scripts -->
<script src="static/ace/js/ace/ace.js"></script>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>	
	<script type="text/javascript">
	$(top.hangge());
	</script>
</body>
</html>