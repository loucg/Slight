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
			if($("#number").val()==""){
				$("#number").tips({
					side:3,
		            msg:'请输入终端编号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#number").focus();
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

					<form action="config/${msg }" name="Form" id="Form" method="post">
						<input type="hidden" name="id" id="id" value="${pd.id}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:96px;text-align: right;padding-top: 13px;">*终端编号:</td>
								<td><input style="width:95%;" type="text" name="number" id="number" value="${pd.number}" maxlength="500" placeholder="这里输入终端编号" title="终端编号"/></td>
							</tr>
							<tr>
								<td style="width:96px;text-align: right;padding-top: 13px;">*终端名称:</td>
								<td><input style="width:95%;" type="text" name="name" id="name" value="${pd.name}" maxlength="500" placeholder="这里输入终端名称" title="终端名称"/></td>
							</tr>
							<tr>
								<td style="width:96px;text-align: right;padding-top: 13px;">*终端类型:</td>
								<td>
									<select class="chosen-select form-control" name="typeid" id="typeid" data-placeholder="请选择终端类型" style="float:left;padding-left: 12px;width:95%;">
										<option value="1" <c:if test="${pd.typeid==1}">selected</c:if>>一体化电源</option>
										<option value="2" <c:if test="${pd.typeid==2}">selected</c:if>>单灯控制器</option>
										<option value="3" <c:if test="${pd.typeid==3}">selected</c:if>>网关</option>
										<option value="4" <c:if test="${pd.typeid==4}">selected</c:if>>断路器</option>
										<option value="6" <c:if test="${pd.typeid==6}">selected</c:if>>终端组合</option>
								  	</select>
								 </td>
							</tr>

							<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">位置:</td>
								<td><input style="width:95%;" type="text" name="location" id="locationE" value="${pd.location}" maxlength="500" placeholder="这里输入位置" title="位置"/></td>
							</tr>
							<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">坐标:</td>
								<td><input style="width:95%;" type="text" name="coordinate" id="coordinate" value="${pd.coordinate}" maxlength="500" placeholder="这里输入坐标" title="坐标"/></td>
							</tr>
							<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">电话号码:</td>
								<td>
								 	<select class="chosen-select form-control" name="mobile" id="mobile" data-placeholder="请选择电话号码" style="float:left;padding-left: 12px;width:95%;">
									<c:forEach items="${simList}" var="role">
										<option value="${role.id}"><c:if test="${pd.id==role.id}">selected</c:if>${role.mobile }</option>
									</c:forEach>
								  	</select>
								</td>
							</tr>
							<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">电源规格:</td>
								<td>
								 	<select class="chosen-select form-control" name="power" id="power" data-placeholder="请选择电源规格" style="float:left;padding-left: 12px;width:95%;">
									<c:forEach items="${powerList}" var="role">
										<option value="${role.id}" <c:if test="${pd.id==role.id}">selected</c:if>>${role.name}</option>
									</c:forEach>
								  	</select>
								</td>
							</tr>
							<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">灯规格:</td>
								<td>
								 	<select class="chosen-select form-control" name="lamp" id="lamp" data-placeholder="请选择灯规格" style="float:left;padding-left: 12px;width:95%;">
									<c:forEach items="${lampList}" var="role">
										<option value="${role.id}" <c:if test="${pd.id==role.id}">selected</c:if>>${role.name}</option>
									</c:forEach>
								  	</select>
								</td>
							</tr>
							<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">传感器规格:</td>
								<td>
								 	<select class="chosen-select form-control" name="sensor" id="sensor" data-placeholder="请选择传感器规格" style="float:left;padding-left: 12px;width:95%;">
									<c:forEach items="${sensorList}" var="role">
										<option value="${role.id}" <c:if test="${pd.id==role.id}">selected</c:if>>${role.name}</option>
									</c:forEach>
								  	</select>
								</td>
							</tr>
							<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">电线杆:</td>
								<td>
								 	<select class="chosen-select form-control" name="pole" id="pole" data-placeholder="请选择电线杆" style="float:left;padding-left: 12px;width:95%;">
									<c:forEach items="${poleList}" var="role">
										<option value="${role.id }" <c:if test="${pd.id==role.id}">selected</c:if>>${role.name}</option>
									</c:forEach>
								  	</select>
								</td>
							</tr>
							<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">电杆号:</td>
								<td><input style="width:95%;" type="text" name="polenumber" id="polenumber" value="${pd.polenumber}" maxlength="500" placeholder="这里输入电杆号" title="电杆号"/></td>
							</tr>
							<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">密码:</td>
								<td><input style="width:95%;" type="text" name="password" id="password" value="${pd.password}" maxlength="500" placeholder="这里输入密码" title="密码"/></td>
							</tr>
							<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">备注:</td>
								<td><input style="width:95%;" type="text" name="comment" id="comment" value="${pd.comment}" maxlength="500" placeholder="这里输入备注" title="备注"/></td>
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
