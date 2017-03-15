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

<script src="static/echart/echarts.js"></script>

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
									    <input class="nav-search-input" id="starttime" name="starttime" value="${pd.starttime }">
									</div>
								</td>
								<td>
								 	<div class="nav-search">
									    <label style="margin-left:12px;">截止时间：</label>
										<input class="nav-search-input" id="endtime" name="endtime" value="${pd.endtime }">
									</div>
								</td>
								<td style="background-color:#ffffff;">&nbsp;&nbsp;查询方式：</td>
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
							<div id="strategy">
								<c:forEach items="${strategyList }" var="strategy" varStatus="vs">
									<h3 hidden="true">${strategy.name }</h3>
									<p hidden="true">${strategy.json}</p> 
									<div id="${vs.index}" title="${strategy.name }" style="height:400px;"></div>
								</c:forEach>
							</div>
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
	
	<script type="text/javascript">
		
		window.onload = function loadChart(){
			document.getElementById("starttime").flatpickr();
			document.getElementById("endtime").flatpickr();
			top.hangge();
			
            var div = document.getElementById("strategy");
            var jsons = div.getElementsByTagName("p"); //p节点存储了json的值获取所有p
            var names = div.getElementsByTagName("h3");
            for(var i=0;i<names.length;i++){
            	var jsonObj = $.parseJSON(jsons[i].innerHTML);
            	var x_data = new Array();
            	var series_data = new Array();
            	for(var j=0;j<jsonObj.t_i.length;j++){
            		x_data[x_data.length] = jsonObj.t_i[j].timestamp;
            		series_data[series_data.length] = jsonObj.t_i[j].intensity;
            	} 
            	
               	var myChart = echarts.init(document.getElementById(i)); 
                   // 指定图表的配置项和数据
                var option = {
                    title: {
                        text: names[i].innerHTML
                    },
                    tooltip: {},
                    xAxis: {
                        data: x_data
                    },
                    yAxis: {},
                    series: [{
                        name: names[i].innerHTML,
                        type: 'line',
                        data: series_data
                    }]
                };
                   
                myChart.setOption(option);          
            }
      
		 } 
		
		
    </script>
	<script src="src/jquery-2.1.1.min.js"></script>
	<script async src="static/datepicker/dist/flatpickr.js"></script>

</body>
</html>
