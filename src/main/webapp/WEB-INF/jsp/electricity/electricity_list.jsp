﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../system/index/top.jsp"%>
<!-- jsp国际化文件 -->
<%@ include file="../international.jsp"%>
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
						<form action="electricity/retrieve.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td><%=serial_number %>：</td>
								<td>
									<div class="nav-search">
										<span class="input-icon">
											<input type="text" class="nav-search-input" id="nav-search-input" autocomplete="off" name="gateway_code" value="${pd.gateway_code }"/>
										</span>
									</div>
								</td>
								<!-- <td>&nbsp;&nbsp;名称：</td> -->
								<td>&nbsp;&nbsp;<%=name %>：</td>
								<td>
									<div class="nav-search">
										<span class="input-icon">
											<input type="text" class="nav-search-input" id="nav-search-input" autocomplete="off" name="name" value="${pd.name }"/>
										</span>
									</div>
								</td>
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="<%=search2 %>" style="padding: 3px 3px;"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								</c:if>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
									<th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" style="width:50px;"><%=number %></th>
									<th class="center"><%=device_number %></th>
									<th class="center"><%=device_name %></th>
									<th class="center"><%=location %></th>
									<th class="center"><%=up_electricity_time %></th>
									<th class="center"><%=blockout_time %></th>
									<th class="center"><%=operate %></th>
								</tr>
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty electricityList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${electricityList}" var="electricity" varStatus="vs">
										<tr>
											<td class='center'>
												<label class="pos-rel"><input type='checkbox' name='ids' value="${electricity.id}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class='center'>${electricity.gateway_code}</td>
											<td class='center'>${electricity.name}</td>
											<td class='center'>${electricity.location}</td>
											<td class='center'>${electricity.powerup}</td>
											<td class='center'>${electricity.powerdown}</td>
											<td class="center">
												<c:if test="${QX.edit != 1 && QX.del != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="<%=no_permission %>"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs btn-group">
													<%-- <c:if test="${QX.edit == 1 }">
													<a class="btn btn-xs btn-danger" onclick="setup('${electricity.id}');">
														<i class="ace-icon fa  fa-lightbulb-o bigger-120" title="上电" ></i>
													</a>
													</c:if>
													<c:if test="${QX.edit == 1 }">
													<a class="btn btn-xs btn-danger" onclick="cutoff('${electricity.id}');">
														<i class="ace-icon fa fa-power-off bigger-120" title="断电" ></i> 
													</a>
													</c:if> --%>
													<c:if test="${QX.edit == 1 }">
													<a class="btn btn-xs btn-success" title="<%=edit %>" onclick="editElectricity('${electricity.id}');">
														<!-- <i class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑"></i> -->
														<%=edit %>
													</a>
													</c:if>
													<%-- <c:if test="${QX.del == 1 }">
													<a class="btn btn-xs btn-danger" onclick="del('${npower.id}');">
														<i class="ace-icon fa fa-trash-o bigger-120" title="删除" ></i>
													</a>
													</c:if> --%>
												</div>
												<%-- <div class="hidden-md hidden-lg">
													<div class="inline pos-rel">
														<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
															<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
														</button>
			
														<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
															<c:if test="${QX.edit == 1 }">
															<li>
																<a style="cursor:pointer;" onclick="editNpower('${npower.id}');" class="tooltip-success" data-rel="tooltip" title="修改">
																	<span class="green">
																		<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if> 
															<c:if test="${QX.del == 1 }">
															<li>
																<a style="cursor:pointer;" onclick="del('${npower.id}');" class="tooltip-error" data-rel="tooltip" title="删除">
																	<span class="red">
																		<i class="ace-icon fa fa-trash-o bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if> 
														</ul>
													</div>
												</div> --%>
											</td>
										</tr>
									
									</c:forEach>
									</c:if>
									<c:if test="${QX.cha == 0 }">
										<tr>
											<td colspan="100" class="center"><%=you_have_no_permission %></td>
										</tr>
									</c:if>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center" ><%=no_relevant_data %></td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						<div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;">
									<%-- <c:if test="${QX.add == 1 }">
									<a class="btn btn-mini btn-success" onclick="add();">新增</a>
									</c:if> --%>
									<c:if test="${QX.edit == 1 }">
									<a class="btn btn-mini btn-danger" onclick="makeAll('<%=make_sure_up_and_down_electricity_for_select_device %>?');" ><%=up_and_down_electricity %></a>
<%-- 									<a class="btn btn-mini btn-danger" onclick="makeAll('确定要将选中的终端上电/断电?');" title="批量上电/断电" ><%=up_and_down_electricity %></a> --%>
									</c:if>
									<%-- <c:if test="${QX.edit == 1 }">
									<a class="btn btn-mini btn-danger" onclick="makeAll('确定要将选中的终端断电?');" title="批量断电" >断电</a>
									</c:if> --%>
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
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//检索
		function tosearch(){
			top.jzts();
			$("#Form").submit();
		}
		$(function() {
		
 			//日期框
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true
			});
			
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
		
		
		//修改
		function editElectricity(id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ='<%=set_up_and_down_electricity_time %>';
			 diag.URL = '<%=basePath%>electricity/goUpdate.do?id='+id;
			 diag.Width = 469;
			 diag.Height = 269;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					nextPage(${page.currentPage});
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
					for(var i=0;i < document.getElementsByName('ids').length;i++){
					  if(document.getElementsByName('ids')[i].checked){
					  	if(str=='') str += document.getElementsByName('ids')[i].value;
					  	else str += ',' + document.getElementsByName('ids')[i].value;
					  }
					}
					if(str==''){
						bootbox.dialog({
							message: "<span class='bigger-110'><%=you_have_not_choose_anything %>!</span>",
							buttons: 			
							{ "button":{ "label":"<%= make_sure%>", "className":"btn-sm btn-success"}}
						});
						$("#zcheckbox").tips({
							side:1,
				            msg:'<%=click_this_choose_all %>',
				            bg:'#AE81FF',
				            time:8
				        });
						return;
					}else{
						if(msg == '<%=make_sure_up_and_down_electricity_for_select_device %>?'){
							top.jzts();
							 var diag = new top.Dialog();
							 diag.Drag=true;
							 diag.Title ='<%=set_up_and_down_electricity_time %>';
							 diag.URL = '<%=basePath%>electricity/goSettime.do?DATA_IDS='+str;
							 diag.Width = 469;
							 diag.Height = 220;
							 diag.CancelEvent = function(){ //关闭事件
								 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
									nextPage(${page.currentPage});
								}
								diag.close();
							 };
							 diag.show();
						}
					}
				}
			});
		};
		
	</script>


</body>
</html>