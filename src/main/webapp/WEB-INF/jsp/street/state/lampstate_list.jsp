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
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
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
						<form action="state/lamp/listLamps.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td>组名：</td>
								<td>
									<div class="nav-search">
										<span class="input-icon">
											<input type="text" class="nav-search-input" id="nav-search-input" autocomplete="off" name="tname" value="${lampState.tname }"/>
										</span>
									</div>
								</td>
								<td>&nbsp;&nbsp;名称：</td>
								<td>
									<div class="nav-search">
										<span class="input-icon">
											<input type="text" class="nav-search-input" id="nav-search-input" autocomplete="off" name="cname" value="${lampState.cname }"/>
										</span>
									</div>
								</td>
								<td>&nbsp;&nbsp;编号：</td>
								<td>
									<div class="nav-search">
										<span class="input-icon">
											<input type="text" class="nav-search-input" id="nav-search-input" autocomplete="off" name="ccode" value="${lampState.ccode }"/>
										</span>
									</div>
								</td>
								<td>&nbsp;&nbsp;位置：</td>
								<td>
									<div class="nav-search">
										<span class="input-icon">
											<input type="text" class="nav-search-input" id="nav-search-input" autocomplete="off" name="location" value="${lampState.location }"/>
										</span>
									</div>
								</td>
								<td>&nbsp;&nbsp;状态：</td>
								<td style="vertical-align:top;padding-left:2px;"> 
								 	<select class="chosen-select form-control" name="lstatus" id="lstatus" data-placeholder=" " style="vertical-align:top;width: 130px;">
									<option value=""></option>
									<option value="">全部</option>
									<option value="1" <c:if test="${lampState.lstatus == '1' }">selected</c:if> >正常</option>
									<option value="2" <c:if test="${lampState.lstatus == '2' }">selected</c:if> >过压</option>
									<option value="3" <c:if test="${lampState.lstatus == '3' }">selected</c:if> >过温</option>
									<option value="4" <c:if test="${lampState.lstatus == '4' }">selected</c:if> >开路</option>
									<option value="5" <c:if test="${lampState.lstatus == '5' }">selected</c:if> >短路</option>
									<option value="6" <c:if test="${lampState.lstatus == '6' }">selected</c:if> >异常</option>
									<option value="7" <c:if test="${lampState.lstatus == '7' }">selected</c:if> >断电</option>
									</select>
								</td>
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
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
									<th class="center" style="width:50px;">序号</th>
									<th class="center">组名</th>
									<th class="center">终端编号</th>
									<th class="center">终端名称</th>
									<th class="center">位置</th>
									<th class="center">灯杆号</th>
									<th class="center">温度</th>
									<th class="center">输出电压</th>
									<th class="center">功率因数</th>
									<th class="center">工作状态</th>
									<th class="center">备注</th>
									<th class="center">时间</th>
								</tr>
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty lampStateList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${lampStateList}" var="lampState" varStatus="vs">
										<tr>
											<td class='center'>
												<label class="pos-rel"><input type='checkbox' name='ids' value="${var.FHFILE_ID}" class="ace" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class='center'>${lampState.tname}</td>
											<td class='center'><a onclick="viewLampDetail('${lampState.client_code}')" style="cursor:pointer;">${lampState.client_code }</a></td>
											<%-- <td class='center'>${lampState.client_code}</td> --%>
											<td class='center'>${lampState.cname}</td>
											<td class='center'>${lampState.location}</td>
											<td class='center'>${lampState.lamp_pole_num}</td>
									        <td class='center'>${lampState.temperature}</td>
									        <td class='center'>${lampState.Vo}</td>
									        <td class='center'>${lampState.power_factor}</td>
									        <td class='center'>${lampState.status}</td>
									        <td class='center'>${lampState.comment}</td>
									        <td class='center'>${lampState.tdate}</td>
										</tr>
									</c:forEach>
									</c:if>
									<c:if test="${QX.cha == 0 }">
										<tr>
											<td colspan="100" class="center">您无权查看</td>
										</tr>
									</c:if>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center" >没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						<div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;">
									<c:if test="${QX.edit == 1 }">
									<a class="btn btn-mini btn-danger" onclick="makeAll('确定要开灯吗?');" title="开灯" >开灯</a>
									</c:if>
									<c:if test="${QX.edit == 1 }">
									<a class="btn btn-mini btn-danger" onclick="makeAll('确定要开灯吗?');" title="关灯" >关灯</a>
									</c:if>
									<c:if test="${QX.edit == 1 }">
									<a class="btn btn-mini btn-danger" onclick="makeAll('确定要调节亮度吗?');" title="亮度调节" >亮度调节</a>
									</c:if>
									<c:if test="${QX.edit == 1 }">
									<a class="btn btn-mini btn-danger" onclick="makeAll('确定要调节策略吗?');" title="策略调节" >策略调节</a>
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
	<%@ include file="../../system/index/foot.jsp"%>
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
		
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var onlamp = '';
					var offlamp = '';
					var bright = '';
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++)
					{
						  if(document.getElementsByName('ids')[i].checked){
						  	if(onlamp=='') onlamp += document.getElementsByName('ids')[i].id;
						  	else onlamp += ';' + document.getElementsByName('ids')[i].id;
						  	
						  	if(offlamp=='') offlamp += document.getElementsByName('ids')[i].alt;
						  	else offlamp += ';' + document.getElementsByName('ids')[i].alt;
						  	
						  	if(bright=='') bright += document.getElementsByName('ids')[i].title;
						  	else bright += ';' + document.getElementsByName('ids')[i].title;
						  	
						  	if(str=='') str += document.getElementsByName('ids')[i].value;
						  	else str += ',' + document.getElementsByName('ids')[i].value;
						  }
					}
					if(str==''){
						bootbox.dialog({
							message: "<span class='bigger-110'>您没有选择任何内容!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
						$("#zcheckbox").tips({
							side:3,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						
						return;
					}else{
						if(msg == '确定要开灯吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>state/lamp/openLight.do',
						    	data: {USER_IDS:onlamp},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
											nextPage(${page.currentPage});
									 });
								}
							});
						}else if(msg == '确定要关灯吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>state/lamp/offLight.do',
						    	data: {USER_IDS:offlamp},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
											nextPage(${page.currentPage});
									 });
								}
							});
						}else if(msg == '确定要调节亮度吗?'){
							adjustBrt(bright);
						}else if(msg == '确定要调节策略吗?'){
							adjudtStr(str);
						}
					}
				}
			});
		}	
		
		//去调节亮度界面
		function adjustBrt(bright){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="亮度调节";
			<%--  diag.URL = '<%=basePath%>state/lamp/goAdjustBrt.do?DATA_IDS='+ bright; --%>
			 diag.Width = 469;
			 diag.Height = 200;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//去调节策略界面
		function adjustStr(bright){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="计划调节亮度";
			 <%-- diag.URL = '<%=basePath%>state/lamp/goAdjustStr.do?DATA_IDS='+ str; --%>
			 diag.Width = 469;
			 diag.Height = 200;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//查看灯的详细信息
		function viewLampDetail(lamp_code){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="详细信息";
			 diag.URL = '<%=basePath%>state/lamp/goViewDetail.do?lamp_code='+lamp_code; 
			 diag.Width = 800;
			 diag.Height = 400;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
		
	</script>


</body>
</html>