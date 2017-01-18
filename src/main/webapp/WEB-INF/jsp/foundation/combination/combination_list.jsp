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
						<form action="config/getDeviceList" method="post" name="Form" id="Form">
						<input type="hidden" name="itype" id="itype" value="4">
						<table style="margin-top:5px;">
							<tr>
								
								<td>
									<div class="nav-search">
									    <label>终端编号：</label>
										<input class="nav-search-input" autocomplete="off" id="nav-search-input" type="text" name="number" value="${pd.number}" placeholder="这里输入终端编号" />
									</div>
								</td>
								<td >
								 	<div class="nav-search">
									    <label style="margin-left:12px;">终端名称：</label>
										<input class="nav-search-input" autocomplete="off" id="nav-search-input" type="text" name="name" value="${pd.name }" placeholder="这里输入终端名称" />
									</div>
								</td>
								<td >
								 	<select class="chosen-select form-control" name="type" id="type" data-placeholder="请选择终端类型" style="height:30px;width: 160px;margin-left:20px;border-width:1px;border-color:'#fff';border-radius:4px">
								 		<option value=""  <c:if test="${pd.itype==4}">selected</c:if>>终端组合</option>
										<option value="1" <c:if test="${pd.itype==1}">selected</c:if>>一体化电源</option>
										<option value="2" <c:if test="${pd.itype==2}">selected</c:if>>单灯控制器</option>
										<option value="3" <c:if test="${pd.itype==3}">selected</c:if>>网关</option>
										<option value="4" <c:if test="${pd.itype==3}">selected</c:if>>断路器</option>
										<option value="5" <c:if test="${pd.itype==3}">selected</c:if>>普通断路器</option>
										
								  	</select>
								</td>
								<td>
								 	<select class="chosen-select form-control" name="status" id="status" data-placeholder="请选择状态" style="height:30px;width: 160px;margin-left:20px;border-width:1px;border-color:'#fff';border-radius:4px">
								 		<option value="">全部</option>
										<option value="1" <c:if test="${pd.status==1}">selected</c:if>>有效</option>
										<option value="2" <c:if test="${pd.status==2}">selected</c:if>>无效</option>
								  	</select>
								</td>
								<td style="vertical-align:top;padding-left:2px;"><button class="btn btn-mini btn-light" onclick="search();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></button></td>
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-mini btn-light" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icon" class="ace-icon fa fa-download bigger-110 nav-search-icon blue"></i></a></td>
								</c:if>
							</tr>
						</table>
						<!-- 检索  -->

						<table id="simple-table" class="table table-striped table-bordered table-hover"  style="margin-top:5px;">
							<thead>
								<tr>

									<th class="center" style="width: 50px;">序号</th>
									<th class="center" >终端编号</th>
									<th class="center" >终端名称</th>
									<th class="center" >终端类型</th>
									<th class="center" >位置</th>
									<th class="center" >坐标</th>
									<th class="center" >电话号码</th>
									<th class="center">电源规格</th>
									<th class="center">灯规格</th>
									<th class="center">传感器规格</th>
									<th class="center">电线杆</th>
									<th class="center">电杆号</th>
									<th class="center">密码</th>
									<th class="center">备注</th>
									<th class="center">操作</th>

								</tr>
							</thead>

							<tbody>

							<!-- 开始循环 -->
							<c:choose>
								<c:when test="${not empty deviceList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${deviceList}" var="var" varStatus="vs">
										<tr>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
													<td class="center">${var.number}</td>
													<td>${ fn:substring(var.name ,0,50)}</td>
													<td class="center">${var.type}</td>
													<td class="center">${var.location}</td>
													<td class="center">${var.coordinate}</td>
													<td class="center">${var.mobile}</td>
													<td class="center">${var.power}</td>
													<td class="center">${var.lamp}</td>
													<td class="center">${var.sensor}</td>
													<td class="center">${var.pole}</td>
													<td class="center">${var.polenumber}</td>
													<td class="center">${var.password}</td>
													<td class="center">${var.comment}</td>
													<!--  <td class="center">${var.CREATETIME}</td>
													<td style="width: 60px;" class="center">
														<c:if test="${var.STATUS == '2' }"><span class="label label-important arrowed-in">无效</span></c:if>
														<c:if test="${var.STATUS == '1' }"><span class="label label-success arrowed">有效</span></c:if>
													</td>
													-->
											<td class="center">
												<div class='hidden-phone visible-desktop btn-group'>

													<c:if test="${QX.edit == 1 }">
													<a style="cursor:pointer;" class="green" onclick="edit('${var.id}','${var.typeid}');" title="编辑">
														<i class="ace-icon fa fa-pencil bigger-130"></i>
													</a>
													</c:if>

												</div>
											</td>
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
								<c:if test="${QX.add == 1 }">
								<a class="btn btn-sm btn-success" onclick="add();">新增</a>
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
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());

		//检索
		function search(){
			top.jzts();
			$("#Form").submit();
		}

		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>config/goDeviceCreate';
			 diag.Width = 650;
			 diag.Height = 650;
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
		function edit(Id, type){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>config/goDeviceEdit?id='+Id+'&typeid='+type;
			 diag.Width = 650;
			 diag.Height = 650;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}

		
		
		//导出excel
		function toExcel(){
			window.location.href='<%=basePath%>combination/excel.do';
		}
		</script>

</body>
</html>
