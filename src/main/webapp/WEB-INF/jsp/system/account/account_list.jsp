<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
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
						<!-- 检索  -->
						<form action="account/listAccounts.do" method="post" name="accountForm" id="accountForm">
						<table style="margin-top:5px;">
							<tr>
								
								<td>姓名：</td>
								<td>
									<div class="nav-search">
										<input type="text" class="nav-search-input" id="nav-search-input" autocomplete="off" name="name" placeholder="请输入姓名"/>
									</div>
								</td>
								<td>&nbsp;&nbsp;登录名：</td>
								<td>
									<div class="nav-search">
										<input type="text" class="nav-search-input" id="nav-search-input" autocomplete="off" name="username" placeholder="请输入登录名"/>
									</div>
								</td>
								<td>&nbsp;&nbsp;公司：</td>
								<td >
							    <select class="chosen-select form-control" name="company" id="company" data-placeholder="请选择公司" style="margin-left:20px; width: 152px;">
									<option value=""></option>
									<option value="">全部</option>
									<c:forEach items="${companyList}" var="company">
										<option value="${company.COMPANY }" <c:if test="${pd.company==company.COMPANY}">selected="selected"</c:if>>${company.NAME }</option>
									</c:forEach>
								  	</select>
								</td>
								<td>&nbsp;&nbsp;角色：</td>
								<td style="vertical-align:top;padding-left:2px;margin-left:20px;">
								 	<select class="chosen-select form-control" name="ROLE_ID" id="role_id" data-placeholder="请选择角色" style="margin-left:20px;width: 152px;">
									<option value=""></option>
									<option value="">全部</option>
									<c:forEach items="${roleList}" var="role">
										<option value="${role.ROLE_ID }">${role.ROLE_NAME }</option>
									</c:forEach>
								  	</select>
								</td>
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px;">&nbsp;&nbsp;<a class="btn btn-light btn-xs" onclick="searchs();"  title="检索" style="padding: 4px 4px;"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								<!-- 
								<c:if test="${QX.toExcel == 1 }"><td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icon" class="ace-icon fa fa-download bigger-110 nav-search-icon blue"></i></a></td></c:if>
								<c:if test="${QX.FromExcel == 1 }"><td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="fromExcel();" title="从EXCEL导入"><i id="nav-search-icon" class="ace-icon fa fa-cloud-upload bigger-110 nav-search-icon blue"></i></a></td></c:if>
								-->
								</c:if>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover"  style="margin-top:5px;">
							<thead>
								<tr>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">公司名称</th>
									<th class="center">部门名称</th>
									<th class="center">登录名</th>
									<th class="center">姓名</th>
									<th class="center">联系地址</th>
									<th class="center">手机</th>
									<th class="center">邮箱</th>
									<th class="center">职务</th>
									<th class="center">语言</th>
									<th class="center">角色</th>
									<th class="center">状态</th>
									<th class="center">操作</th>
								</tr>
							</thead>
													
							<tbody>
								
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty accountList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${accountList}" var="account" varStatus="vs">
										<tr>
											<td class='center' style="width: 30px;">${vs.index+1+(page.currentPage-1)*page.showCount}</td>
											<td class="center">${account.COMPANY }</td>
											<td class="center">${account.DEPARTMENT }</td>
											<!-- <td class="center"><a onclick="viewUser('${user.USERNAME}')" style="cursor:pointer;">${user.USERNAME }</a></td> -->
											<td class="center">${account.USERNAME }</td>
											<td class="center">${account.NAME }</td>
											<td class="center">${account.ADDRESS }</td>
											<td class="center">${account.PHONE }</td>
											<td class="center"><%-- <a title="发送电子邮件" style="text-decoration:none;cursor:pointer;" <c:if test="${QX.email == 1 }">onclick="sendEmail('${user.EMAIL }');"</c:if>> --%>${account.EMAIL }<!-- &nbsp;<i class="ace-icon fa fa-envelope-o"></i></a> --></td>
											<td class="center">${account.POSITION }</td>
											<td class="center">${account.LANGUAGE}</td>
											<td class="center">${account.ROLE_NAME }</td>
											<td class="center">${account.STATUSNAME}</td>
											<td class="center">
												<c:if test="${QX.edit != 1 && QX.del != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs btn-group">
												    <!-- 修改 -->
													<c:if test="${QX.edit == 1 }">
													<a class="btn btn-mini btn-info" onclick="editAccount('${account.USER_ID}');">修改</a>
													<!-- 图标
													<a class="btn btn-xs btn-success" title="修改" onclick="editUser('${user.USER_ID}');">
														<i class="ace-icon fa fa-pencil-square-o bigger-120" title="修改"></i>
													</a>
													-->
													</c:if>
													<!-- 密码重置  -->
													<c:if test="${QX.edit == 1 }">
													<a class="btn btn-mini btn-danger" onclick="resetPassword('${account.USER_ID}');">密码重置</a>
													<!-- 图标
													<a class="btn btn-xs btn-success" title="密码重置" onclick="editUser('${user.USER_ID}');">
														<i class="ace-icon fa fa-pencil-square-o bigger-120" title="密码重置"></i>
													</a>
													-->
													</c:if>
												</div>
											</td>
										</tr>
									
									</c:forEach>
									</c:if>
									<c:if test="${QX.cha == 0 }">
										<tr>
											<td colspan="13" class="center">您无权查看</td>
										</tr>
									</c:if>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
									<!-- colspan表示列数 -->
										<td colspan="13" class="center">没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						
					<div class="page-header position-relative">
					<table style="width:100%;">
						<tr>
							<td style="vertical-align:top;">
								<c:if test="${QX.add == 1 }">
								<a class="btn btn-mini btn-success" onclick="add();">新增</a>
								</c:if>
								<!--  
								<c:if test="${QX.FHSMS == 1 }"><a title="批量发送站内信" class="btn btn-mini btn-info" onclick="makeAll('确定要给选中的用户发送站内信吗?');"><i class="ace-icon fa fa-envelope-o bigger-120"></i></a></c:if>
								<c:if test="${QX.email == 1 }"><a title="批量发送电子邮件" class="btn btn-mini btn-primary" onclick="makeAll('确定要给选中的用户发送邮件吗?');"><i class="ace-icon fa fa-envelope bigger-120"></i></a></c:if>
								<c:if test="${QX.sms == 1 }"><a title="批量发送短信" class="btn btn-mini btn-warning" onclick="makeAll('确定要给选中的用户发送短信吗?');"><i class="ace-icon fa fa-envelope-o bigger-120"></i></a></c:if>
								<c:if test="${QX.del == 1 }">
								<a title="批量删除" class="btn btn-mini btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" ><i class='ace-icon fa fa-trash-o bigger-120'></i></a>
								</c:if>
								-->
							</td>
							<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
						</tr>
					</table>
					</div>
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

		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	</body>

<script type="text/javascript">
$(top.hangge());

//检索
function searchs(){
	top.jzts();
	$("#accountForm").submit();
}

//密码重置
function resetPassword(user_id){
	top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="密码重置";
	 diag.URL = '<%=basePath%>account/goResetP.do?USER_ID='+user_id;
	 diag.Width = 351;
	 diag.Height = 103;
	 diag.CancelEvent = function(){ //关闭事件
		 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			nextPage(${page.currentPage});
		}
		diag.close();
	 };
	 diag.show();
}

//新增
function add(){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="新增帐号";
	 diag.URL = '<%=basePath%>account/goAddA.do';
	 diag.Width = 351;
	 diag.Height = 520;
	 diag.CancelEvent = function(){ //关闭事件
		 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			 if('${page.currentPage}' == '0'){
				 top.jzts();
				 setTimeout("self.location=self.location",100);
			 }else{
				 nextPage(${page.currentPage});
			 }
		}
		diag.close();
	 };
	 diag.show();
}

//修改
function editAccount(user_id){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="修改帐号";
	 diag.URL = '<%=basePath%>account/goEditA.do?USER_ID='+user_id;
	 diag.Width = 351;
	 diag.Height = 520;
	 diag.CancelEvent = function(){ //关闭事件
		 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			nextPage(${page.currentPage});
		}
		diag.close();
	 };
	 diag.show();
}

$(function() {
	//日期框
	$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
	
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

//查看用户
function viewUser(USERNAME){
	if('admin' == USERNAME){
		bootbox.dialog({
			message: "<span class='bigger-110'>不能查看admin用户!</span>",
			buttons: 			
			{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
		});
		return;
	}
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="资料";
	 diag.URL = '<%=basePath%>account/view.do?USERNAME='+USERNAME;
	 diag.Width = 469;
	 diag.Height = 380;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
}
		
</script>
</html>
