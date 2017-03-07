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
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, user-scalable=yes">
<link rel="stylesheet" type="text/css" href="static/datepicker/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="static/datepicker/css/htmleaf-demo.css">
<link rel="stylesheet" type="text/css" href="static/datepicker/assets/site.css">
<link rel="stylesheet" id=cal_style type="text/css" href="static/datepicker/dist/flatpickr.min.css">

<script async src="static/datepicker/assets/prettify.js?skin=none" onload="prettyPrint()"></script>
<script async src="static/datepicker/assets/table-of-contents.js"></script>
<script async src="static/datepicker/assets/themer.js"></script>
<script async id="locale_script"></script>
<script async src="static/datepicker/assets/localizr.js"></script>
<script async>
	
function fp_ready(){
	document.getElementById("starttime").flatpickr();
	document.getElementById("endtime").flatpickr();
	top.hangge()
}
</script>

<script type="text/javascript" src="static/zhexiantu/jquery.min.js"></script>
<script type="text/javascript" src="static/zhexiantu/jquery.pista.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="static/zhexiantu/normalize.css"/>
<link rel="stylesheet" type="text/css" href="static/zhexiantu/style.css"/>


<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../system/index/top.jsp"%>

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
						<form action="status/strategy/getGroupList" method="post" name="Form" id="Form">
						<input type="hidden" id="excel" name="excel" value="0"/>
						<table style="margin-top:5px;">
							<tr>
								
								<td>
									<div class="nav-search">
									    <label>开始时间：</label>
									    <input class="nav-search-input" id="starttime" name="starttime" value="${starttime }">
									</div>
								</td>
								<td>
								 	<div class="nav-search">
									    <label style="margin-left:12px;">截止时间：</label>
										<input class="nav-search-input" id="endtime" name="endtime" value="${endtime }">
									</div>
								</td>
								<td valign="middle">&nbsp;&nbsp;查询方式：</td>
								<td >
								 	<select class="chosen-select form-control" name="type" id="type" data-placeholder="请选择终端类型" style="height:30px;width: 160px;border-width:1px;border-color:'#fff';border-radius:4px">
										<option value="1" <c:if test="${pd.type==1}">selected</c:if>>按日</option>
										<option value="2" <c:if test="${pd.type==2}">selected</c:if>>按月</option>
								  	</select>
								</td>
								<c:if test="${QX.cha == 1 }"><td style="vertical-align:top;padding-left:2px;"><button class="btn btn-light btn-xs" onclick="search();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></button></td></c:if>
							</tr>
						</table>
						<!-- 检索  -->
						<c:choose>
							<c:when test="${not empty groupList}">
								<c:if test="${QX.cha == 1 }">
								<c:forEach items="${groupList}" var="table" varStatus="vvs">
									<table id="simple-table"  class="table table-striped table-bordered table-hove"  style="margin-top:5px;">
										<tbody>
											<th class="center" style="width:9%;">功能/组名</th>
											<c:forEach items="${table}" var="item" varStatus="vs">
												<td class="center" style="width:9%;">${item.name}</td>											
											</c:forEach>
										</thead>
										<tbody>
											<th class="center">亮灯率</th>
											<c:forEach items="${table}" var="item" varStatus="vs">
												<td class="center">${item.per }</td>
											</c:forEach>
										</tbody>
										<tbody>
											<th class="center">总功率</th>
											<c:forEach items="${table}" var="item" varStatus="vs">
												<td class="center">${item.power }</td>
											</c:forEach>
										</tbody>
										<tbody>
											<th class="center">控制策略</th>
											<c:forEach items="${table}" var="item" varStatus="vs">
												<td class="center">${item.strategy }</td>
											</c:forEach>
										</tbody>
									</table>
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
						<c:if test="${QX.cha==1 }">
							<h3>策略折线图</h3>
							<div id="multi"></div>
						</c:if>
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
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	
	<script src="src/jquery-2.1.1.min.js"></script>
	<script async src="static/datepicker/dist/flatpickr.js" onload="fp_ready()"></script>
	<script type="text/javascript">
	/* $(document).ready(function(){
		
		var strateList = ${strateList}
		var data = new Array();
		for(var i=0;i<strategyList.length;i++){
			var json = strategyList[i][json];
			var jsondata = JSON.stringify(json).data;
			var newdata = new Object();
			for(var j=0;j<jsondata.length;j++){
				var time = jsondata[j][time];
				var value = jsondata[j][value];
				newdata[date] = time;
				newdata[value] = value;
			}
			data[i] = newdata;
			
		}
		
		/* 
		var data= [   { name:"first",
		      data:[
		          {value:12, date:"12/14/2014"},
		          {value:32, date:"12/15/2014"},
		          {value:56, date:"12/17/2014"},
		          {value:45, date:"12/19/2014"}
		        
		        ]
		      },
		      { name:"second",
		      data:[
		          {value:13, date:"12/13/2014"},
		          {value:30, date:"12/15/2014"},
		          {value:26.6, date:"12/18/2014"},
		          {value:33, date:"12/19/2014"}
		        
		        ]
		      }
		    ] */
		    // Multiple lines
		    options={
		        height: 300,
		        width: 900,
		     }
		     $("#multi").pista(data, options);
	}) */
	</script>
</body>
</html>
