<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<%@ include file="../system/index/top.jsp"%>

<link rel="stylesheet" type="text/css"
	href="static/map/css/jquery-ui-1.10.4.custom.min.css" />
<link rel="stylesheet" type="text/css" href="static/map/css/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" href="static/map/css/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" href="static/map/css/admin-all1.css" />
<link rel="stylesheet" type="text/css" href="static/map/css/base.css" />
<link rel="stylesheet" type="text/css" href="static/map/css/formui.css" />
<link rel="stylesheet" type="text/css" href="static/map/css/chur.css" />
<link rel="stylesheet" type="text/css" href="static/map/css/bootstrap.min.css" />
<script type="text/javascript" src="static/map/js/jquery-2.1.4.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script> -->
<script type="text/javascript"
	src="static/map/js/jquery-ui-1.10.3.custom.min.js"></script>
<script type="text/javascript" src="static/map/js/grid.locale-cn.js"></script>
<script type="text/javascript" src="static/map/js/jquery.jqGrid.4.5.2.min.js"></script>
<script type="text/javascript" src="static/map/js/index.js"></script>
<script type="text/javascript" src="static/map/js/ChurAlert.min.js?skin=blue"></script>
<script type="text/javascript" src="static/map/js/chur-alert.1.0.js"></script>
<script type="text/javascript" src="static/map/js/mapContent.js"></script>
<script type="text/javascript" src="static/map/js/map.js"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=H0j9w4M81wm8pl1klUsAPQklDddKFqc9">
	
</script>
 <link rel="stylesheet" href="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.5/css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
 --><!-- <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.5/js/bootstrap-dialog.min.js"></script>
 -->
 <link rel="stylesheet" type="text/css" href="static/map/css/bootstrap-dialog.min.css" />
 <script type="text/javascript" src="static/map/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="static/map/js/bootstrap-dialog.min.js"></script>
 </head>
<body>
<div class="warp">
		<!--左边菜单开始-->
		<div class="left_c left">
			<div class="panel  panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">路灯列表</h3>
				</div>
			</div>
			<!-- <h1>路灯列表</h1> -->
			<div class="acc" >
			</div>
		</div>
		<!--左边菜单结束-->
		<!--右边框架开始-->
		<div class="searchdiv">
			<table class="tbform">
				<tbody>
					<tr>
						<td class="tdl"><span>组名:</span> <select class="ipt"
							id="groupname" onchange="changegroupname()">
								<option value=""></option>
						</select></td>
						<td class="tdl"><span>类型:</span> <select class="ipt"
							id="terminaltype" onchange="changeterminaltype()">
								<option value=""></option>
						</select></td>
						<td class="tdl"><span>地址:</span> <select class="ipt"
							id="address" onchange="changeAddress()">
								<option value=""></option>
						</select></td>
						<td class="tdl"><span>名称:</span> <select class="ipt"
							id="terminalname"  onchange="changeterminalname()">
								<option value=""></option>
						</select></td>
						<td class="tdl"><span>编号:</span> <select class="ipt"
							id="terminalid">
								<option value=""></option>
						</select></td>
						<td class="tdl" style="width: 15%;"><input class="btn btn-primary"
							id="check" type="button"  value="查    询" style="padding-left:15px;"/> <input class="btn btn-warning "
							id="reset" type="button" value="重   置" /></td>
					</tr>

				</tbody>
			</table>
		</div>
		<div class="right_c">
			<div class="nav-tip" onClick="javascript:void(0)">&nbsp;</div>
		</div>
		<div class="Conframe" id="inc">
			<iframe name="Conframe" id="Conframe" frameborder=0 src="map.jsp">
			</iframe>
		</div>
		<!--右边框架结束-->
		<!--底部开始-->
		<!--  <div class="bottom_c">地图</div> -->
		<!--底部结束-->
	</div>
	
	<%@ include file="../system/index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
</body>
<script type="text/javascript">
	$(top.hangge());
</script>
<script type="text/javascript">
var pagedata={page:1,rows:2,begin:0,end:0,havenest:true,termid:null};//分页的全局变量，很重要 
var mapTermpage= new Object();//分页的全局变量，很重要 
var mapTermpagein= new Object();//分页的全局变量，很重要 
function getmapTermpagein()
{
	var data=mapTermpagein;
	return data;
}
function gpsTObbdLfet_c(clientdata)
{

    			 var accdivpre = "<div class=\"panel-default\"><div class=\"panel-heading\"><a style=\"\" class=\"one\" id="+clientdata[0].termid+"><span style=\"font-size:14px;font-weight:normal; font-family:宋体\">"+clientdata[0].termname+"</span></a></div><ul class=\"kid\">";
				 for(var i=0;i<clientdata.length;i++){
					 if(clientdata[i].id!=null){
					 		var accdivli ="<li><b class=\"tip\"></b><a class=\"onekid\"  id="+clientdata[i].id+"><span style=\"font-size:12px;font-family:宋体\">"+clientdata[i].name+"</span></a></li>";
					 		accdivpre=accdivpre+accdivli;
					 }
					 else if(clientdata[i].havenest==true){
						 mapTermpage[clientdata[0].termid].havenest=true;
						 var accdivli ="<li id=\"moreli\"><b class=\"tip\"></b><a class=\"onekid\"  id="+"more"+">"+"....."+"</a></li>";
						 accdivpre=accdivpre+accdivli;
					 }
					 else {
						 mapTermpage[clientdata[0].termid].havenest=false;
					 }
				 }
				 var accdivaft= "</ul></div>"; 
				 accdivpre=accdivpre+accdivaft;
				 $('.acc').append(accdivpre);
}
function gpsTObbdMore(clientdata,termid,choseterm)
{/* 
	var arrpoints=[];
	for (var i = 0; i < clientdata.length; i++) {
		arrpoints.push( new BMap.Point(clientdata[i].xcoordinate,clientdata[i].ycoordinate));
	}
	 var convertor = new BMap.Convertor();
    convertor.translate(arrpoints, 1, 5, function (data){
    	if(data.status === 0) {
    		for (var i = 0; i < data.points.length; i++) {
        		clientdata[i].coordinate=data.points[i].lng+","+data.points[i].lat;
        		clientdata[i].xcoordinate=data.points[i].lng;
        		clientdata[i].ycoordinate=data.points[i].lat;
        		if(i+1>= data.points.length){ */
        			for(var i=0;i<clientdata.length;i++){
						 var accdivli
						 if(clientdata[i].id!=null){
						 	   accdivli ="<li><b class=\"tip\"></b><a class=\"onekid\"  id="+clientdata[i].id+"><span style=\"font-size:12px;font-family:宋体\">"+clientdata[i].name+"</span></a></li>";
						 	
						 }
						 else if(clientdata[i].havenest==true){
							  mapTermpage[termid].havenest=true;
							 
							  accdivli ="<li id=\"moreli\"><b class=\"tip\"></b><a class=\"onekid\"  id="+"more"+">"+"....."+"</a></li>";
						 } 
						 else {
							 
							 mapTermpage[termid].havenest=false;
							
						 }
						 choseterm.parent().parent().children("ul").append(accdivli);
						 accdivli="";
					 }
        		/* 	}
        		}
    		}
   	 }); */
    	
}

function gpsTObbdSearch(clientdata)
{
        			var accdivpre = "<div class=\"panel-default\"><div class=\"panel-heading\"><a class=\"one\" id=\"search\"><span style=\"font-size:14px;font-weight:normal;font-family:宋体\">"
						+ "搜索所得终端"
						+ "</span></a></div><ul class=\"kid\">";
        			for(var i=0;i<clientdata.length;i++){
        				var accdivli = "<li><b class=\"tip\"></b><a class=\"onekid\"  id="
							+ clientdata[i].id
							+ "><span style=\"font-size:12px;font-family:宋体\">"
							+ clientdata[i].name
							+ "</span></a></li>";
					     accdivpre = accdivpre+ accdivli;
					 }
        			var accdivaft = "</ul></div>";
					accdivpre = accdivpre + accdivaft;
					$('.acc').append(accdivpre);
        			
}
var choseterm;//表示选择的term；
//加载左边的列表
	$.ajax({
		url : "gomap/lefe_c",
		type : "POST",
		contentType : "application/json; charset=UTF-8",
		data : JSON.stringify(pagedata),
		dataType : "json",
		success : function(data) {
			if (data != null) {
				//console.log(data);
				 for(var key in data)   {
					 var pagedata1={page:1,rows:2,begin:0,end:0,havenest:false,termid:data[key][0].termid};///////////
					 var pagedata2={page:1,rows:2,begin:0,end:0,havenest:false,termid:data[key][0].termid};///////////
					 mapTermpage[data[key][0].termid]=pagedata2;
					 mapTermpagein[data[key][0].termid]=pagedata1;
					 //console.log(data[key]);
					// console.log("---------------------------------------");
					 gpsTObbdLfet_c(data[key]);
					/*  var accdivpre = "<div class=\"panel-info\"><div class=\"panel-heading\"><a class=\"one\" id="+data[key][0].termid+"><span style=\"font-size:14px;font-weight:normal;font-family:宋体\">"+data[key][0].termname+"</span></a></div><ul class=\"kid\">";
					 for(var i=0;i<data[key].length;i++){
						 if(data[key][i].coordinate!=null){
						 		var accdivli ="<li><b class=\"tip\"></b><a class=\"onekid\"  id="+data[key][i].coordinate+"><span style=\"font-size:12px;font-family:宋体\">"+data[key][i].name+"</span></a></li>";
						 		accdivpre=accdivpre+accdivli;
						 }
						 else if(data[key][i].havenest==true){
							 mapTermpage[data[key][0].termid].havenest=true;
							 var accdivli ="<li id=\"moreli\"><b class=\"tip\"></b><a class=\"onekid\"  id="+"more"+">"+"....."+"</a></li>";
							 accdivpre=accdivpre+accdivli;
						 }
						 else {
							 mapTermpage[data[key][0].termid].havenest=false;
						 }
					 }
					 var accdivaft= "</ul></div>"; 
					 accdivpre=accdivpre+accdivaft;
					 $('.acc').append(accdivpre); */
					 }
				 //console.log(mapTermpage);
				 for(var c in mapTermpage)   {
					 mapTermpage[c].begin= mapTermpage[c].begin+ mapTermpage[c].rows;
				 }
				 //console.log(mapTermpage);
				 
			} else {
			}
		},
		error : function() {
		}
	});

	/* 

	 jQuery.getJSON("map/lefe_c", function(data) {	
	 //console.log(data);
	 for(var key in data)   {
	 var accdivpre = "<div><a class=\"one\" id="+data[key][0].termid+">"+data[key][0].termname+"</a><ul class=\"kid\">";
	 for(var i=0;i<data[key].length;i++){
	 var accdivli ="<li><b class=\"tip\"></b><a class=\"onekid\"  id="+data[key][i].coordinate+">"+data[key][i].name+"</a></li>";
	 accdivpre=accdivpre+accdivli;
	 }
	 var accdivaft= "</ul></div>"; 
	 accdivpre=accdivpre+accdivaft;
	 $('.acc').append(accdivpre);
	 }
	 });
	 */
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 获取路灯搜索条件
	//加载组名
	jQuery.getJSON("gomap/getgroupname", function(data) {
		//console.log(data);
		for (var i = 0; i < data.length; i++) {
			$("#groupname").append(
					"<option value=" + data[i].id + ">" + data[i].name
							+ "</option>");
		}
	});
	//加载终端类型
	function changegroupname() {

		$("#terminaltype").empty();
		$("#address").empty();
		$("#terminalname").empty();
		$("#terminalid").empty();

		jQuery
				.getJSON("gomap/getTypenameByGroup/" + $("#groupname").val(),
						function(data) {
							$("#terminaltype").append(
									"<option  value=\"\"> </option>");
							for (var i = 0; i < data.length; i++) {
								$("#terminaltype").append(
										"<option  value=" + data[i].typeid + ">"
												+ data[i].typename
												+ "</option>");
							}
						});
	}

	//加载终端地址
	function changeterminaltype() {
		$("#address").empty();
		$("#terminalname").empty();
		$("#terminalid").empty();
		var condinate = {
			termid : $("#groupname").val(),
			typeid : $("#terminaltype").val()
		};
		$.ajax({
			url : "gomap/getAddressByType",
			type : "POST",
			contentType : "application/json; charset=UTF-8",
			data : JSON.stringify(condinate),
			dataType : "json",
			success : function(data) {
				if (data != null) {
					$("#address").append("<option  value=\"\"> </option>");
					for (var i = 0; i < data.length; i++) {
						$("#address").append(
								"<option  value=" + data[i].location + ">"
										+ data[i].location + "</option>");
					}
				} else {
				}
			},
			error : function() {
				BootstrapDialog.show({
	                type:  BootstrapDialog.TYPE_DANGER,
	                title: '提示信息 ',
	                message: '数据加载出错请刷新页面！',
	                buttons: [{
	                    label: '关闭',
	                    action: function(dialogItself){
	                        dialogItself.close();
	                    }
	                }]
	            }); 
			}
		});
	}
	//加载终端名稱	
	function changeAddress() {
		$("#terminalname").empty();
		$("#terminalid").empty();
		var condinate = {
			termid : $("#groupname").val(),
			typeid : $("#terminaltype").val(),
			location : $("#address").val()
		};
		$
				.ajax({
					url : "gomap/getClientnameByaddress",
					type : "POST",
					contentType : "application/json; charset=UTF-8",
					data : JSON.stringify(condinate),
					dataType : "json",
					success : function(data) {
						if (data != null) {
							$("#terminalname").append(
									"<option  value=\"\"> </option>");
							for (var i = 0; i < data.length; i++) {
								$("#terminalname").append(
										"<option  value=" + data[i].name + ">"
												+ data[i].name + "</option>");
							}
						} else {
						}
					},
					error : function() {
						BootstrapDialog.show({
			                type:  BootstrapDialog.TYPE_DANGER,
			                title: '提示信息 ',
			                message: '数据加载出错请刷新页面！',
			                buttons: [{
			                    label: '关闭',
			                    action: function(dialogItself){
			                        dialogItself.close();
			                    }
			                }]
			            }); 
					}
				});
	}
	function changeterminalname() {
		$("#terminalid").empty();
		var condinate = {
			termid : $("#groupname").val(),
			typeid : $("#terminaltype").val(),
			location : $("#address").val(),
			name : $("#terminalname").val()
		};
		$.ajax({
			url : "gomap/getClientigByname",
			type : "POST",
			contentType : "application/json; charset=UTF-8",
			data : JSON.stringify(condinate),
			dataType : "json",
			success : function(data) {
				if (data != null) {
					$("#terminalid").append("<option  value=\"\"> </option>");
					for (var i = 0; i < data.length; i++) {
						$("#terminalid").append(
								"<option  value=" + data[i].id + ">"
										+ data[i].id + "</option>");
					}
				} else {
				}
			},
			error : function() {
				BootstrapDialog.show({
	                type:  BootstrapDialog.TYPE_DANGER,
	                title: '提示信息 ',
	                message: '数据加载出错请刷新页面！',
	                buttons: [{
	                    label: '关闭',
	                    action: function(dialogItself){
	                        dialogItself.close();
	                    }
	                }]
	            }); 
			}
		});
	}
	/*
	 jQuery.getJSON("map/getterminalname/"+ $("#address").val(), function(data) {
	 for (var i = 0; i < data.length; i++) {$("#terminalname").append(
	 "<option value=" + data[i].terminalname + ">"+ data[i].terminalname + "</option>");
	 }
	 });
	 jQuery.getJSON("map/getterminalid/"+ $("#address").val(), function(data) {
	 for (var i = 0; i < data.length; i++) {$("#terminalid").append(
	 "<option value=" + data[i].terminalid + ">"+ data[i].terminalid + "</option>");
	 }
	 });
	 */
	var searchdata;//全局变量，很重要
	$(function() {
		init();
	});
</script>
</html>