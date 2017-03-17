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
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
		
<script type="text/javascript">
	
	//保存
	function save(){
			if($("#register").val()==""){
				$("#register").tips({
					side:3,
		            msg:'请输入终端编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#register").focus();
				return false;
			}
			
			if($("#explain").val()==""){
			$("#explain").tips({
				side:3,
	            msg:'请输入终端名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#explain").focus();
			return false;
		}

			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
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

					<form action="repair/${msg}" name="Form" id="Form" method="post">
						<input type="hidden" name="id" id="id" value="${pd.id}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">终端编号:</td>
								<td><input style="width:95%;" type="text" name="register" id="register" value="${pd.register}" maxlength="500" placeholder="请输入登记人" title="登记人"/></td>
							</tr>
							<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">终端名称:</td>
								<td><input style="width:95%;" type="text" name="repairman" id="repairman" value="${pd.repairman}" maxlength="500" placeholder="请输入维修人" title="维修人"/></td>
							</tr>
							<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">灯杆号:</td>
								<td><input style="width:95%;" type="text" name="repairman" id="repairman" value="${pd.repairman}" maxlength="500" placeholder="请输入维修人" title="维修人"/></td>
							</tr>
							
							<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">备注:</td>
								<td><input style="width:95%;" type="text" name="repairman" id="repairman" value="${pd.repairman}" maxlength="500" placeholder="请输入维修人" title="维修人"/></td>
							</tr>
				 
							
							<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">工作状态:</td>
								<td>
									<select class="chosen-select form-control" name="result" id="result" data-placeholder="请选择状态" style="float:left;padding-left: 12px;width:95%;">
										<option value="1" <c:if test="${pd.result==1}">selected</c:if>>正常</option>
										<option value="2" <c:if test="${pd.result==2}">selected</c:if>>异常</option>
										<option value="3" <c:if test="${pd.result==3}">selected</c:if>>断电</option>
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
		<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>	
	<script type="text/javascript">
	$(top.hangge());
	
	</script>
</body>
</html>