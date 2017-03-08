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
<%@ include file="../system/index/top.jsp"%>
<style type="text/css">
        .mytable{text-align: center; margin: 0 auto;width: 50%;margin-top: 100px;font-size: 20pt}
        th{color: white; text-align: center;}
        td{padding-left: 5px;padding-right: 5px;}

    </style>
</head>
<body class="no-skin">
<div style="width: 100%; height: 100%">
        <table border="1px" class="mytable">

                <tr>
                <th colspan="4" style="background-color:blue">分组/策略</th>
                <th colspan="4" style="background-color:red">状态列表</th>
                </tr>
                <tr>
                    <td>组数</td>
                    <td><a onclick="openFrame(336, '分组策略', 'status/strategy/getGroupList')">${groupAndStrategy.group_number }</a></td>
                    <td>策略数</td>
                    <td><a onclick="openFrame(336, '分组策略', 'status/strategy/getGroupList')">${groupAndStrategy.strategy_number}</a></td>
                    <td>网关数</td>
                    <td><a onclick="openFrame(337, '网关状态', 'state/street/listGateways.do')">${normalGateway.gnormal }/${totalGateway.gtotal }</a></td>
                    <td>路灯数</td>
                    <td><a onclick="openFrame(338, '路灯状态', 'state/lamp/listLamps.do')">${normalClient.cnormal }/${totalClient.ctotal }</a></td>
                </tr>
                <tr style="height: 20px">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <th colspan="4" style="background-color:peru">故障列表</th>
                    <th colspan="4" style="background-color: green">能耗状态</th>
                </tr>
                <tr>
                    <td>网关</td>
                    <td><a onclick="openFrame(339, '网关或断路器异常', 'fault/street/listGateways.do')")>${gatewayFault.fgateway }</a></td>
                    <td>路灯</td>
                    <td><a onclick="openFrame(340, '路灯异常', 'fault/street/listLamps.do')">${clientFault.fclient }</a></td>
                    <td>总功率</td>
                    <td><a onclick="openFrame(342, '能耗状态', 'power/street/graphPowers.do')">${todayPower.power }W</a></td>
                    <td>平均功率因数</td>
                    <td><a onclick="openFrame(342, '能耗状态', 'power/street/graphPowers.do')"></a></td>
                </tr>
                <tr>
                    <td>电压异常</td>
                    <td><a onclick="openFrame(341, '电压异常', 'fault/street/listVos.do')">${pressureFault}</a></td>
                    <td>断路器</td>
                    <td><a onclick="openFrame(339, '网关或断路器异常', 'fault/street/listGateways.do')">${cutoffFault.fgateway }</a></td>
                    <td>亮灯率</td>
                    <td><a onclick="openFrame(342, '能耗状态', 'power/street/graphPowers.do')"></a></td>
                    <td>——</td>
                    <td></td>
                </tr>

        </table>

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
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());
		function openFrame(id, name, url){
			top.mainFrame.tabAddHandler(id,name,url);
		}
	</script>

</body>
</html>
