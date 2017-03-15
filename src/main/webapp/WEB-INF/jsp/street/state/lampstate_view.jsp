<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<script type="text/javascript" src="static/ace/js/jquery.js"></script>
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
					
					<form name="groupForm" id="groupForm" method="post">
						<input type="hidden" value="no" id="hasTp1" />
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">组名:</td>
								<td><input type="text" name="" id="" value="${pd.term_name}" maxlength="50" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">终端编号:</td>
								<td><input type="text""name="" id="" value="${pd.client_code}" maxlength="50" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">终端名称:</td>
								<td><input type="text" name="" id="" value="${pd.name}" maxlength="50" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">位置:</td>
								<td><input type="text" name="" id="" value="${pd.location}" maxlength="50" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">灯杆号:</td>
								<td><input type="text" name="" id="" value="${pd.lamp_pole_num}" maxlength="50" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
								<td><input type="text" name="" id="" value="${pd.comment}" maxlength="50" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">所属网关:</td>
								<td><input type="text" name="" id="" value="${pd.gateway_name}" maxlength="50" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">灯杆:</td>
								<td><input type="text" name="" id="" value="${pd.lamp_name}" maxlength="50" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">电源:</td>
								<td><input type="text" name="" id="" value="${pd.power_name}" maxlength="50" style="width:98%;"/></td>
							</tr>
						</table>
						
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">状态:</td>
								<td><input type="text" name="" id="" value="${pd.status}" maxlength="50" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">功率:</td>
								<td><input type="text" name="" id="" value="${pd.power}" maxlength="50" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">功率因数:</td>
								<td><input type="text" name="" id="" value="${pd.power_factor}" maxlength="50" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">最大电压:</td>
								<td><input type="text" name="" id="" value="${pd.Vmax}" maxlength="50" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">最大电流:</td>
								<td><input type="text" name="" id="" value="${pd.Imax}" maxlength="50" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">温度:</td>
								<td><input type="text" name="" id="" value="${pd.temperature}" maxlength="50" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">输出电压:</td>
								<td><input type="text" name="" id="" value="${pd.Vo}" maxlength="50" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">输出电流:</td>
								<td><input type="text" name="" id="" value="${pd.Io}" maxlength="50" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">亮度值:</td>
								<td><input type="text" name="" id="" value="${pd.brightness}" maxlength="50" style="width:98%;"/></td>
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
	<!-- /.main-content -->
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());

		//清除空格
		String.prototype.trim=function(){
		     return this.replace(/(^\s*)|(\s*$)/g,'');
		};
		</script>
</body>
</html>