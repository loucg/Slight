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
<%@include file="../international.jsp" %>
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
						<form action="strategy/listStrategys.do" method="post" name="strategyForm" id="strategyForm">
						<table style="margin-top:5px;">
							<tr>
							    <td><%=strategy_name %>：</td>
								<td>
									<div class="nav-search">
										<input type="text" class="nav-search-input" id="name-input" autocomplete="off" name="name" placeholder="<%=please_enter_strategy_name %>" value="${pd.name}"/>
									</div>
								</td>
								<td>&nbsp;&nbsp;<%=app_explain %>：</td>
								<td>
									<div class="nav-search">
										<input type="text" class="nav-search-input" id="explain-input" autocomplete="off" name="explain" placeholder="<%=please_enter_app_explain %>" value="${pd.explain}"/>
									</div>
								</td>
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px;">&nbsp;&nbsp;<a class="btn btn-light btn-xs" onclick="clearSearchs();"  title="<%=clear_search_ %>" style="padding: 4px 4px;"><i id="nav-clear-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon red"></i></a></td>
								</c:if>
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px;">&nbsp;&nbsp;<a class="btn btn-light btn-xs" onclick="searchs();"  title="<%=search2 %>" style="padding: 4px 4px;"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								</c:if>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover"  style="margin-top:5px;">
							<thead>
								<tr>
									<th class="center" style="width:50px"><%=number %></th>
									<th class="center"><%=strategy_name %></th>
									<th class="center"><%=app_explain %></th>
									<th class="center" style="width:100px"><%=device_group_number %></th>
									<th class="center" style="width:100px"><%=status %></th>
									<th class="center"><%=time_and_brightness_2 %></th>
									<th class="center" style="width:120px"><%=operate %></th>
								</tr>
							</thead>
													
							<tbody>
								
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty strategyList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${strategyList}" var="strategy" varStatus="vs">
												
										<tr>
											<td class='center'>${vs.index+1+(page.currentPage-1)*page.showCount}</td>
											<td class="center">${strategy.name }</td>
											<td class="center">${strategy.explain }</td>
											<td class="center"><a onclick="viewStrategyGroups('${strategy.id}')" style="cursor:pointer;">${strategy.number }</a></td>
											<td class="center">${strategy.status }</td>
											<td class="center"  >
											<table class="table-striped table-bordered table-hover" height=100% width=100% border=1>
											<c:choose>
											<%-- <c:when test="${not empty strategy.timestamp}">
											<c:forEach items="${strategy.timestamp}" var="timestamp" varStatus="vs1">
											<tr>
											<td class="center" width=50%>${timestamp}</td>
											<td class="center" width=50%>${strategy.intensity[vs1.index]}%</td>
											</tr>
											</c:forEach>
											</c:when> --%>
											<c:when test="${not empty strategy.t_i}">
											<c:forEach items="${strategy.t_i}" var="t_i" varStatus="vs1">
											<tr>
											<td class="center" width=50%>${t_i.timestamp}</td>
											<td class="center" width=50%>${t_i.intensity}%</td>
											</tr>
											</c:forEach>
											</c:when>
											</c:choose>
											</table>
											</td>
											<td class="center">
												<c:if test="${QX.edit != 1 && QX.del != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="<%=no_permission %>"></i></span>
												</c:if>
												<div class="btn-group">
													<c:if test="${QX.edit == 1 }">
													<a class="btn btn-mini btn-info" title="<%=modify_strategy %>" onclick="editStrategy('${strategy.id}');">
														<%=modify %>
													</a>
													</c:if>
													<c:if test="${QX.edit == 1 }">
													<a class="btn btn-warning btn-mini" title="<%=add_app_group %>" onclick="addGroup('${strategy.id}');">
														<%=add2 %>
													</a>
													</c:if>
													<c:if test="${QX.del == 1 }">
													<a class="btn btn-xs btn-danger" title="<%=keck_delete_app_group %>" onclick="delGroup('${strategy.id}');">
														<%=kick_delete %>
													</a>
													</c:if>
												</div>
											</td>
										</tr>
									
									</c:forEach>
									</c:if>
									<c:if test="${QX.cha == 0 }">
										<tr>
											<td colspan="10" class="center"><%=you_have_no_permission %></td>
										</tr>
									</c:if>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="10" class="center"><%=no_relevant_data %></td>
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
								<a class="btn btn-mini btn-success" onclick="addStrategy();"><%=add_strategy %></a>
								</c:if>
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
	<%@ include file="../system/index/foot.jsp"%>
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

//清空检索条件
function clearSearchs(){
	$("#name-input").val("");
	$("#explain-input").val("");
}

//检索
function searchs(){
	top.jzts();
	$("#strategyForm").submit();
}

//新增策略
function addStrategy(){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=false;
	 diag.Title ="<%=add_strategy %>";
	 diag.URL = '<%=basePath%>strategy/goAddS.do';
	 diag.Width = 469;
	 diag.Height = 510;
	 diag.CancelEvent = function(){ //关闭事件
		 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			 if('${page.currentPage}' == '0'){
				 top.jzts();
				 setTimeout("self.location=self.location",100);
			 }else{
				 nextPage('${page.currentPage}');
			 }
		}
		diag.close();
	 };
	 diag.show();
}

//新增应用组
function addGroup(id){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="<%=add_app_group %>";
	 diag.URL = '<%=basePath%>strategyGroup/listOthers.do?id='+id;
	 diag.Width = 1200;
	 diag.Height = 600;
	 diag.Modal = true;				//有无遮罩窗口
	 diag. ShowMaxButton = true;	//最大化按钮
     diag.ShowMinButton = true;		//最小化按钮
	 diag.CancelEvent = function(){ //关闭事件
		 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			 if('${page.currentPage}' == '0'){
				 top.jzts();
				 setTimeout("self.location=self.location",100);
			 }else{
				 nextPage('${page.currentPage}');
			 }
		}
		diag.close();
	 };
	 diag.show();
}

//踢删应用组
function delGroup(id){
	top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="<%=keck_delete_app_group %>";
	 diag.URL = '<%=basePath%>strategyGroup/listGroups.do?id='+id;
	 diag.Width = 1200;
	 diag.Height = 600;
	 diag.Modal = true;				//有无遮罩窗口
	 diag. ShowMaxButton = true;	//最大化按钮
     diag.ShowMinButton = true;		//最小化按钮
	 diag.CancelEvent = function(){ //关闭事件
		 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			 if('${page.currentPage}' == '0'){
				 top.jzts();
				 setTimeout("self.location=self.location",100);
			 }else{
				 nextPage('${page.currentPage}');
			 }
		}
		diag.close();
	 };
	 diag.show();
}

//查看终端组
function viewStrategyGroups(id){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="<%=device_group_list %>";
	 diag.URL = '<%=basePath%>strategyGroup/listGroups.do?id='+id;
	 diag.Width = 1200;
	 diag.Height = 600;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
}

//修改策略
function editStrategy(strategy_id){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=false;
	 diag.Title ="<%=modify_strategy %>";
	 diag.URL = '<%=basePath%>strategy/goEditS.do?id='+strategy_id;
	 diag.Width = 469;
	 diag.Height = 510;
	 diag.CancelEvent = function(){ //关闭事件
		 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			nextPage('${page.currentPage}');
		}
		diag.close();
	 };
	 diag.show();
}

//批量操作
function makeAll(msg){
	bootbox.confirm(msg, function(result) {
		if(result) {
			var str = '';
			var emstr = '';
			var phones = '';
			var username = '';
			for(var i=0;i < document.getElementsByName('ids').length;i++)
			{
				  if(document.getElementsByName('ids')[i].checked){
				  	if(str=='') str += document.getElementsByName('ids')[i].value;
				  	else str += ',' + document.getElementsByName('ids')[i].value;
				  	
				  	if(emstr=='') emstr += document.getElementsByName('ids')[i].id;
				  	else emstr += ';' + document.getElementsByName('ids')[i].id;
				  	
				  	if(phones=='') phones += document.getElementsByName('ids')[i].alt;
				  	else phones += ';' + document.getElementsByName('ids')[i].alt;
				  	
				  	if(username=='') username += document.getElementsByName('ids')[i].title;
				  	else username += ';' + document.getElementsByName('ids')[i].title;
				  }
			}
			if(str==''){
				bootbox.dialog({
					message: "<span class='bigger-110'><%=you_have_not_choose_anything %></span>",
					buttons: 			
					{ "button":{ "label":"<%=make_sure %>", "className":"btn-sm btn-success"}}
				});
				$("#zcheckbox").tips({
					side:3,
		            msg:'<%=click_this_choose_all %>',
		            bg:'#AE81FF',
		            time:8
		        });
				
				return;
			}else{
				if(msg == '<%=make_sure_delete2_data %>'){
					top.jzts();
					$.ajax({
						type: "POST",
						url: '<%=basePath%>user/deleteAllU.do?tm='+new Date().getTime(),
				    	data: {USER_IDS:str},
						dataType:'json',
						//beforeSend: validateData,
						cache: false,
						success: function(data){
							 $.each(data.list, function(i, list){
									nextPage('${page.currentPage}');
							 });
						}
					});
				}
			}
		}
	});
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

	
	//复选框全选控制
	var active_class = 'active';
	$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
		var th_checked = this.checked;//checkbox inside "TH" table header
		$(this).closest('table').find('tbody > tr').each(function(){
			var row = this;
			if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
			else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
		});
	});
});

		
</script>
</html>
