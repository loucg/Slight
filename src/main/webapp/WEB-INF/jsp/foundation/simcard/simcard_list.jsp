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
<%@include file="../../international.jsp"%>  <!--国际化标签  -->
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
						<form action="sim/getSimList" method="post" name="Form" id="Form">
						<input type="hidden" id="excel" name="excel" value="0"/>
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
									    <label>ICCID：</label>
										<input class="nav-search-input" autocomplete="off" id="nav-search-input" type="text" name="iccid" value="${pd.iccid }" />
									</div>
								</td>
								<td > 
								 	<div class="nav-search">
									    <label style="margin-left:12px;">电话号码：</label>
										<input class="nav-search-input" autocomplete="off" id="nav-search-input" type="text" name="mobile" value="${pd.mobile }" />
									</div>
								</td>
								<td>&nbsp;&nbsp;类型：</td>
								<td> 
								 	<select class="chosen-select form-control" name="type" id="type" data-placeholder="请选择类型" style="height:30px;width: 160px;border-width:1px;border-color:'#fff';border-radius:4px">
								 		<option value="">全部</option>
										<option value="1" <c:if test="${pd.type==1}">selected</c:if>>捷布</option>
										<option value="2" <c:if test="${pd.type==2}">selected</c:if>>自备</option>
								  	</select>
								</td>
								<td>&nbsp;&nbsp;状态：</td>
								<td> 
								 	<select class="chosen-select form-control" name="status" id="status" data-placeholder="请选择状态" style="height:30px;width: 160px;border-width:1px;border-color:'#fff';border-radius:4px">
								 		<option value="">全部</option>
										<option value="1" <c:if test="${pd.status==1}">selected</c:if>>测试</option>
										<option value="2" <c:if test="${pd.status==2}">selected</c:if>>等启用</option>
										<option value="3" <c:if test="${pd.status==3}">selected</c:if>>正常</option>
										<option value="4" <c:if test="${pd.status==4}">selected</c:if>>欠费</option>
										<option value="5" <c:if test="${pd.status==5}">selected</c:if>>停机</option>
										<option value="6" <c:if test="${pd.status==6}">selected</c:if>>销号</option>
								  	</select>
								</td>
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								<c:if test="${QX.toExcel == 1 }"><td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icon" class="ace-icon fa fa-download bigger-110 nav-search-icon blue"></i></a></td></c:if>
								<c:if test="${QX.FromExcel == 1 }"><td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="fromExcel();" title="从EXCEL导入"><i id="nav-search-icon" class="ace-icon fa fa-cloud-upload bigger-110 nav-search-icon blue"></i></a></td></c:if>
								</c:if>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover"  style="margin-top:5px;">
							<thead>
								<tr>
									 
									<th class="center" style="width: 50px;">序号</th>
									<th class="center" >ICCID</th>
									<th class="center" >电话号码</th>
									<th class="center" >类型</th>
									<th class="center" >状态</th>
									<th class="center" >余额</th>
									<th class="center">备注</th>
									<th class="center">操作</th>
									
								</tr>
							</thead>
													
							<tbody>
								
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty simList}">
									<c:if test="${QX.cha == 1 }">
									<c:forEach items="${simList}" var="var" varStatus="vs">
										<tr>
											
											<td class='center' style="width: 30px;">${vs.index+1+(page.currentPage-1)*page.showCount}</td>
											<td class="center">${var.iccid}</td>
											<td class="center">${ fn:substring(var.mobile,0,50)}</td>
											<!--  <td class="center">${var.CREATETIME}</td> -->
											<td style="width: 60px;" class="center">
												<c:if test="${var.type == '1' }"><span class="label label-important arrowed-in">捷布</span></c:if>
												<c:if test="${var.type == '2' }"><span class="label label-success arrowed">自备</span></c:if>
											</td>
											<td style="width: 60px;" class="center">
												<c:if test="${var.status == '1' }"><span class="label label-important arrowed-in">测试</span></c:if>
												<c:if test="${var.status == '2' }"><span class="label label-success arrowed">等启用</span></c:if>
												<c:if test="${var.status == '3' }"><span class="label label-success arrowed">正常</span></c:if>
												<c:if test="${var.status == '4' }"><span class="label label-success arrowed">欠费</span></c:if>
												<c:if test="${var.status == '5' }"><span class="label label-success arrowed">停机</span></c:if>
												<c:if test="${var.status == '6' }"><span class="label label-success arrowed">消号</span></c:if>
											</td>
											<td class="center">${var.money}</td>
											<td class="center">${var.comment}</td>
											<td class="center" style="width:50px;">
												<c:if test="${QX.edit != 1 && QX.del != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs btn-group">
													<c:if test="${QX.edit == 1 }">
													<a class="btn btn-xs btn-success" onclick="edit('${var.id}');">编辑</a>
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
		function searchs(){
			top.jzts();
			$("#Form").submit();
		}
		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>sim/goSimCreate';
			 diag.Width = 650;
			 diag.Height = 264;
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
		function edit(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>sim/goSimEdit?id='+Id;
			 diag.Width = 650;
			 diag.Height = 264;
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
			$("#excel").val("1");
			$("#Form").submit();
		}
		
		//打开上传excel页面
		function fromExcel(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="EXCEL 导入到数据库";
			 diag.URL = '<%=basePath%>sim/goUploadExcel';
			 diag.Width = 300;
			 diag.Height = 150;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location.reload()",100);
					 }else{
						 nextPage(${page.currentPage});
					 }
				}
				diag.close();
			 };
			 diag.show();
		}	
		</script>
		
</body>
</html>

