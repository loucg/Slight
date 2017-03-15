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
	<%@ include file="../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
	<!-- 时间 -->
	<link rel="stylesheet" href="static/ace/css/bootstrap-timepicker.css" />

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
					
					<form action="electricity/${msg }.do" name="electricityForm" id="electricityForm" method="post">
						<input type="hidden" value="no" id="hasTp1" />
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr style="display:none">
						   		 <td><input type="text" name="DATA_IDS" id="DATA_IDS" value="${pd.DATA_IDS }" /></td>
						    </tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">上电时间:</td>
								<td><input class="span10 time-picker" type="text" name="powerup" id="powerup" value="6:00 PM" maxlength="100" title="上电时间" style="width:98%;" placeholder="18:00(24小时制)"/></td>
<%-- 								<td><input class="span10 time-picker" type="text" name="powerup" id="powerup" value="${pd.powerup }" maxlength="100" title="上电时间" style="width:98%;" placeholder="18:00(24小时制)"/></td> --%>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">断电时间:</td>
								<td><input class="span10 time-picker" type="text" name="powerdown" id="powerdown" value="6:00 AM" maxlength="100" title="断电时间" style="width:98%;" placeholder="6:00(24小时制)"/></td>
							</tr>
							
							<!-- <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">时间:</td>
								<td><input class="span10 time-picker" type="text" data-toggle="datepicker"></td>
							</tr> -->
								
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
	<!-- /.main-content -->
</div>
<!-- /.main-container -->

	<!-- 页面底部js¨ -->
	<%@ include file="../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!-- 时间 -->
	<script src="static/ace/js/date-time/bootstrap-timepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		
		//保存
		function save(){
			var time = /^(([1-9]{1})|([0-1][0-9])|([1-2][0-3])):([0-5][0-9])$/;
			
			/* if(!time.test($("#powerup").val())){
				$("#powerup").tips({
					side:3,
		            msg:'时间格式不正确',
		            bg:'#AE81FF',
		            time:3
		        });
				$("#powerup").focus();
				return false;
			} */
			/* if(!time.test($("#powerdown").val())){
				$("#powerdown").tips({
					side:3,
		            msg:'时间格式不正确',
		            bg:'#AE81FF',
		            time:3
		        });
				$("#powerdown").focus();
				return false;
			}else */{
				$("#electricityForm").submit(); 
				$("#zhongxin").hide();
				$("#zhongxin2").show();
			}
			
		}
		
		$(function() {
			//日期框
			$('.time-picker').timepicker();
			
		});

			//清除空格
		String.prototype.trim=function(){
		     return this.replace(/(^\s*)|(\s*$)/g,'');
		};
		</script>
</body>
</html>