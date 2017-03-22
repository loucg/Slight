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
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>地图</title>

<link rel="stylesheet" type="text/css"
	href="static/map/css/jquery-ui-1.10.4.custom.min.css" />
<link rel="stylesheet" type="text/css"
	href="static/map/css/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css"
	href="static/map/css/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css"
	href="static/map/css/admin-all.css" />
<link rel="stylesheet" type="text/css" href="static/map/css/base.css" />
<link rel="stylesheet" type="text/css" href="static/map/css/formui.css" />
<link rel="stylesheet" type="text/css" href="static/map/css/chur.css" />
<link rel="stylesheet" type="text/css"
	href="static/map/css/bootstrap.min.css" />
<script type="text/javascript" src="static/map/js/jquery-1.7.2.js"></script>
<script type="text/javascript"
	src="static/map/js/jquery-ui-1.10.3.custom.min.js"></script>
<script type="text/javascript" src="static/map/js/grid.locale-cn.js"></script>
<script type="text/javascript"
	src="static/map/js/jquery.jqGrid.4.5.2.min.js"></script>
<script type="text/javascript" src="static/map/js/index.js"></script>
<script type="text/javascript"
	src="static/map/js/ChurAlert.min.js?skin=blue"></script>
<script type="text/javascript" src="static/map/js/chur-alert.1.0.js"></script>
<script type="text/javascript" src="static/map/js/mapContent.js"></script>
<script type="text/javascript" src="static/map/js/map.js"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=H0j9w4M81wm8pl1klUsAPQklDddKFqc9">
</script>
<!-- <script type="text/javascript"
	src="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.js"></script>
<link rel="stylesheet"
	href="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.css" /> -->
	<script type="text/javascript" src="static/map/js/DrawingManager_min.js"></script>
	<link rel="stylesheet" type="text/css" href="static/map/css/DrawingManager_min.css" />
	<base href="<%=basePath%>">
	   <!--  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet" type="text/css" />--> <!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.5/css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" /> -->
 <script type="text/javascript" src="static/map/js/jquery-2.1.4.min.js"></script>
<!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.5/js/bootstrap-dialog.min.js"></script>-->
  <link rel="stylesheet" type="text/css" href="static/map/css/bootstrap-dialog.min.css" />
 <script type="text/javascript" src="static/map/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="static/map/js/bootstrap-dialog.min.js"></script>
 <style type="text/css">
html {
	height: 100%
}

body {
	height: 100%;
	margin: 0px;
	padding: 0px
}

#container {
	height: 100%
}
/* 不出现百度logo */
.anchorBL {
	display: none
}
/* 让弹出框背景不变暗 */
.modal-backdrop {
  opacity: 0 !important;
  filter: alpha(opacity=0) !important;
}
/* 让弹出框不出现蓝色边框 */
*{outline:none;}
</style>
</head>
<body>
	<div id="container"></div>
</body>
<script type="text/javascript">
	var choseMaker;//全局变量很重要////////////////////////////////////////////////////////////////
	var choseMakerdata;//全局变量很重要////////////////////////////////////////////////////////////
	var preMakerdata;//全局变量很重要////////////////////////////////////////////////////////////
	// 定义自定义覆盖物的构造函数  
	function SquareOverlay(center, length, data) {
		this._center = center;
		this._length = length;
		this._data = data;
	}
	// 继承API的BMap.Overlay    
	SquareOverlay.prototype = new BMap.Overlay();
	//实现初始化方法  
	SquareOverlay.prototype.initialize = function(map) {
		// 保存map对象实例   
		this._map = map;
		// 创建div元素，作为自定义覆盖物的容器   
		var div = document.createElement("div");
		div.style.position = "absolute";
		// 可以根据参数设置元素外观   
		div.style.width = this._length + "px";
		div.style.height = this._length + "px";
		var statuscolor;
		var clienttype;

		if ("正常" == this._data.status) {
			statuscolor = "green";
		} else if ("异常" == this._data.status) {
			statuscolor = "red";
		} else if ("断电" == this._data.status) {
			statuscolor = "grey";
		} else {
			statuscolor = "green";
		}
		//clienttype = "light_";
		if ( this._data.aliastypename.indexOf("灯" ) >=0) {
			clienttype = "light_";
		} else if (this._data.aliastypename.indexOf("断路器" ) >=0) {
			clienttype = "breaker_";
		} else if (this._data.aliastypename.indexOf("网关") >= 0) {
			clienttype = "gateway_";
		} else {
			clienttype = "light_";
		}
		var backgroundimage = "url('static/map/img/" + clienttype + statuscolor
				+ ".png')";
		div.style.backgroundImage = backgroundimage;
		// 将div添加到覆盖物容器中   
		map.getPanes().markerPane.appendChild(div);
		/* div.onclick = function() {
		 alert("您点击了标注2");
		 } 
		 div.addEventListener('click', function(e) {
		 //alert('touched');
		 console.log(e);
		 })
		 */

		// 保存div实例   
		this._div = div;
		// 需要将div元素作为方法的返回值，当调用该覆盖物的show、   
		// hide方法，或者对覆盖物进行移除时，API都将操作此元素。   
		return div;
	}
	//实现绘制方法   
	SquareOverlay.prototype.draw = function() {
		// 根据地理坐标转换为像素坐标，并设置给容器    
		var position = this._map.pointToOverlayPixel(this._center);
		this._div.style.left = position.x - this._length / 2 + "px";
		this._div.style.top = position.y - this._length + "px";
	}

	//显示和隐藏覆盖物  
	// 实现显示方法    
	SquareOverlay.prototype.show = function() {
		if (this._div) {
			this._div.style.display = "";
		}
	}
	// 实现隐藏方法    
	SquareOverlay.prototype.hide = function() {
		if (this._div) {
			this._div.style.display = "none";
		}
	}

	//添加其他覆盖物方法  
	SquareOverlay.prototype.hello = function() {
		if (this._div) {
			console.log("hello");
		}
	}

	//自定义覆盖物添加事件方法   
	SquareOverlay.prototype.addEventListener = function(event, fun) {
		this._div['on' + event] = fun;
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	var map = new BMap.Map("container", {
		//minZoom : 15,
		enableMapClick : false
	});// 创建地图实例   构造底图时，关闭底图可点功能
	//map.centerAndZoom("杭州", 15);// 初始化地图，设置中心点坐标和地图级别
	var top_left_navigation = new BMap.NavigationControl(); //左上角，添加默认缩放平移控件
	map.addControl(top_left_navigation);
	map.enableScrollWheelZoom(true);//启用滚轮放大缩小
	//map.setDefaultCursor("url('bird.cur')"); //设置地图默认的鼠标指针样式
	map.setDefaultCursor("default"); //设置地图默认的鼠标指针样式
	map.disableDoubleClickZoom(true);

	var menu = new BMap.ContextMenu();
	var CircleAndRectangle = null;
	var txtMenuItem = [ {
		text : '需求没说，做个放大吧',
		callback : function() {
			map.zoomIn();
			CircleAndRectangle.removeContextMenu(menu);
			map.removeOverlay(CircleAndRectangle);
			CircleAndRectangle = null;
		}
	}, {
		text : '清除',
		callback : function() {
			CircleAndRectangle.removeContextMenu(menu);
			parent.cleardrawdata();//删除原有的左边框选列表
			map.removeOverlay(CircleAndRectangle);
			CircleAndRectangle = null;
		}
	}  ];
	for (var i = 0; i < txtMenuItem.length; i++) {
		menu.addItem(new BMap.MenuItem(txtMenuItem[i].text,
				txtMenuItem[i].callback, 100));
	}

	var drawingManager = new BMapLib.DrawingManager(map, {
		isOpen : false, //是否开启绘制模式
		enableDrawingTool : true, //是否显示工具栏
		drawingToolOptions : {
			anchor : BMAP_ANCHOR_TOP_RIGHT, //位置
			offset : new BMap.Size(5, 5), //偏离值
			scale : 0.8, //工具栏缩放比例
			drawingModes : [ BMAP_DRAWING_CIRCLE, BMAP_DRAWING_RECTANGLE ]
		}
	//, rectangleOptions: styleOptions //矩形的样式

	});
	drawingManager.addEventListener('circlecomplete', function(e, overlay) {
		//	circlecomplete
		if (CircleAndRectangle != null) {
			CircleAndRectangle.removeContextMenu(menu);
		}
		map.removeOverlay(CircleAndRectangle);
		CircleAndRectangle = overlay;
		overlay.addContextMenu(menu);
		map.addContextMenu(menu);
		map.addOverlay(overlay);
		var radius = parseInt(e.getRadius());
		var center = e.getCenter();
		var bound = e.getBounds();
		judgeSelection(bound);
		drawingManager.close();
	});
	drawingManager.addEventListener('rectanglecomplete', function(e, overlay) {
		//	circlecomplete
		if (CircleAndRectangle != null) {
			CircleAndRectangle.removeContextMenu(menu);
		}
		map.removeOverlay(CircleAndRectangle);
		CircleAndRectangle = overlay;
		overlay.addContextMenu(menu);
		map.addOverlay(overlay);
		//var radius = parseInt(e.getRadius());
		var bound = e.getBounds();
		judgeSelection(bound);
		drawingManager.close();
	});
	//map.addEventListener("click", showInfo);
	function getClientsData(mapTermpage2,mapcenter,mapzoom) {
		$.ajax({
			url : "gomap/addClientMaker",
			type : "POST",
			contentType : "application/json; charset=UTF-8",
			data : JSON.stringify(mapTermpage2),
			dataType : "json",
			success : function(clientdata) {
				if (clientdata.length!=0) {
				//console.log(clientdata);
					map.clearOverlays();
					var arrpoints=[];
					for (var i = 0; i < clientdata.length; i++) {
						arrpoints.push( new BMap.Point(clientdata[i].xcoordinate,clientdata[i].ycoordinate));
					}
					preMakerdata = clientdata;//记录当前展示的数据
					gpsTObbd(arrpoints,clientdata,mapcenter,mapzoom);//////坐标转换
				} else {
					//preMakerdata = [];
					//map.centerAndZoom("杭州", 14);
					BootstrapDialog.show({
		                type:  BootstrapDialog.TYPE_INFO,
		                title: '提示信息 ',
		                message: '该分组没有终端',
		                buttons: [{
		                    label: '关闭',
		                    action: function(dialogItself){
		                        dialogItself.close();
		                    }
		                }]
		            });
				}
			},
			error : function() {
				BootstrapDialog.show({
	                type:  BootstrapDialog.TYPE_DANGER,
	                title: '提示信息 ',
	                message: '查询出错',
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
	 
		function gpsTObbd(arrpoints,clientdata,mapcenter,mapzoom) {
		 	var len = arrpoints.length;//所有点的长度  
	        var points = [];//将大数组分成小数组存放。  50个一组
	        var endPoints = [];//将大数组分成小数组存放。  50个一组
	        var ajaxId = 0;//第几组请求  
	        var i = 0 ;  
	        var j = 0 ;  
	        var ajaxLen =0;//要发起几次请求。  
	  
	        //数组分装  
	        for (; i < len; i++) {     
	            if(i%10 == 0){  //分成小数组
	                ajaxId = Math.floor(i/10);  
	                points[ajaxId] = [];  
	            }  
	            points[ajaxId].push(arrpoints[i]);    
	        }  
	  
	        ajaxLen = points.length;  //一共有几个小数组就有几次请求
	        //闭包和回调。  
	        for (; j < ajaxLen; j++) {  
	            (function() {  
	                var jj = j;  //记录第几次转换
	                //回调函数，添加marker。  
	                var callback = function(data){  
	                    var ajaxId = jj;   
	                    var len = arrpoints.length,i,maker;   
	                    var base = ajaxId * 10; //本数组在原始大数组中的起始位。  
	                    if(data.status === 0) {  
	                        var dateLen = data.points.length;   
	                        for(i=0;i <dateLen;i++){  
	                            //marker = new BMap.Marker(data.points[i]);   
	                           // map.addOverlay(marker);
	                           clientdata[base+i].coordinate=data.points[i].lng+","+data.points[i].lat;
        					   clientdata[base+i].xcoordinate=data.points[i].lng;
        		               clientdata[base+i].ycoordinate=data.points[i].lat;   
	                           endPoints[base+i]=data.points[i];  
	                            if(arrpoints.length == endPoints.length){//加载完毕。  
	                            	addClientMaker(clientdata,mapcenter,mapzoom); 
	                            }  
	                        }  
	                    } else{
	                    	alert("有脏数据，坐标转换失败！");
	                    } 
	                    callback = null;//清理内存。  
	                    jj = null;  
	                }  
	                posTrans(points[j],callback);//坐标转换新的数据图标添加到地图上。  
	            })();         
	        }  
	  
		}
	//坐标转换  
    function posTrans(points,callback){  
        var BdPoints = [],len = points.length,i;  
        for (i = 0; i < len; i++) {  
            BdPoints.push(new BMap.Point(points[i].lng,points[i].lat))  
        }  
        var convertor = new BMap.Convertor();  
        convertor.translate(BdPoints, 1, 5, callback);//百度的坐标转换接口。  
    } 
	
	//添加覆盖物 
	//var infoWindow;//全局变量，相当重要/////////////////////////////////////////////////////
	function addClientMaker(data,mapcenter,mapzoom) {
		for (var i = 0; i < data.length; i++) {
			var markerpoint = new BMap.Point(data[i].xcoordinate,
					data[i].ycoordinate);
			var mySquare = new SquareOverlay(markerpoint, 25, data[i]);
			map.addOverlay(mySquare);
			//8、 为自定义覆盖物添加点击事件      
			(function(k) {
				mySquare.addEventListener('mouseover', function(e) {//这里是自定义覆盖物的事件   		
					map.setDefaultCursor("pointer");
				});
				mySquare.addEventListener('mouseout', function(e) {//这里是自定义覆盖物的事件   		
					map.setDefaultCursor("default"); //设置地图默认的鼠标指针样式
				});
				mySquare.addEventListener('click', function(e) {//这里是自定义覆盖物的事件   
					//choseMaker = mySquare;
					choseMakerdata = data[k];
					
					var sContent = getInfoContent(data[k]);
					var opts = {
						width : 304, // 信息窗口宽度
						height : 204, // 信息窗口高度
					};
					var infoWindow = new BMap.InfoWindow(sContent, opts); // 创建信息窗口对象
					infoWindow.enableCloseOnClick();
					var point = new BMap.Point(data[k].xcoordinate, data[k].ycoordinate);
					map.openInfoWindow(infoWindow, point); //开启信息窗口    
					//map.addEventListener('click', fo);
				});
			}(i));
		}
		var Xcoordinate = 0;
		var Ycoordinate = 0;
		var minXcoordinate = data[0].xcoordinate;
		var minYcoordinate = data[0].ycoordinate;
		var maxXcoordinate = data[0].xcoordinate;
		var maxYcoordinate = data[0].ycoordinate;
		for (var i = 0; i < data.length; i++) {
			Xcoordinate = Xcoordinate + data[i].xcoordinate
			Ycoordinate = Ycoordinate + data[i].ycoordinate
			if (data[i].xcoordinate < minXcoordinate) {
				minXcoordinate = data[i].xcoordinate
			}
			if (data[i].xcoordinate > maxXcoordinate) {
				maxXcoordinate = data[i].xcoordinate
			}
			if (data[i].ycoordinate < minYcoordinate) {
				minYcoordinate = data[i].ycoordinate
			}
			if (data[i].ycoordinate > maxYcoordinate) {
				maxYcoordinate = data[i].ycoordinate
			}

		}
		Xcoordinate = Xcoordinate / data.length;
		Ycoordinate = Ycoordinate / data.length;
		//console.log(Xcoordinate);
		//console.log(Ycoordinate);
		var centerdata = {
			xcoordinate : Xcoordinate,
			ycoordinate : Ycoordinate
		};
		changeZoom(centerdata, minXcoordinate, minYcoordinate, maxXcoordinate,
				maxYcoordinate,mapcenter,mapzoom);//设置zoom大小
	}
///////////////////////////////////////////////////////////////////////////////////////////
	map.addEventListener("click",closeinfowindow);
	function closeinfowindow(){
		//setTimeout(function() {map.closeInfoWindow();}, 300);
		  
	}
	//叠加层点击事件    ////已经没有用了   
	function fo(e) {
		infoWindow.enableCloseOnClick();
		setTimeout(function() {map.removeEventListener("click", fo);}, 300); //这里取消绑定。         
		var point = new BMap.Point(e.point.lng, e.point.lat);
		map.openInfoWindow(infoWindow, point); //开启信息窗口    
		infoWindow=null;
		setTimeout(function() {map.removeEventListener("click", fo);}, 300); //这里取消绑定。                
	}
	//0.5秒后根据id改变地图的展示中心       
	function changeCenterByid(id) {
		var data;
		for(var i=0;i<preMakerdata.length;i++){
			if(id==preMakerdata[i].id)
				{
				data=preMakerdata[i];
				var x=preMakerdata[i].xcoordinate;
				var y=preMakerdata[i].ycoordinate;
				setTimeout(function() {
					map.panTo(new BMap.Point(x,y)); 
					//map.setZoom(19);
				}, 300);
				setTimeout(function() {
					map.setZoom(19);
				}, 1000);
				
				}
			
		}
		CenterMarker(data);
	}
	function CenterMarker(data) {
		var point = new BMap.Point(data.xcoordinate, data.ycoordinate);
		var marker = new BMap.Marker(point);  // 创建标注
		map.addOverlay(marker);               // 将标注添加到地图中
		marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
		setTimeout(function() {map.removeOverlay(marker);
		}, 2000);
	}
	//0.3秒后根据Point改变地图的展示中心       
	function changeCenter(data) {
		//console.log(data.xcoordinate, data.ycoordinate);setTimeout(function() {}, 300);
		setTimeout(function() {
			map.panTo(new BMap.Point(data.xcoordinate, data.ycoordinate)); //两秒后移动到第一个点
		}, 300);
		

	}
	//改变地图的zoom大小    
	function changeZoom(center, minx, miny, maxx, maxy,mapcenter,mapzoom) {
		if(mapcenter!=null && mapzoom!=null){
			map.centerAndZoom(mapcenter,mapzoom);
		}else{
			for (var i = 19; i > 0; i--) {
				map.centerAndZoom(new BMap.Point(center.xcoordinate,
					center.ycoordinate), i);
				var bs = map.getBounds(); //获取可视区域
				var bssw = bs.getSouthWest(); //可视区域左下角
				var bsne = bs.getNorthEast(); //可视区域右上角
				if (bssw.lng < minx && bssw.lat<miny&&bsne.lng>maxx
					&& bsne.lat > maxy)
				break;
			
			}
		}
	}
	//清除所有覆盖物   
	function cleanAllMaker() {
		///map.clearOverlays();
	}
	//得到选择的哪一个点
	function getMakerIconAndInfo(div, data) {
		//console.log(div);
		//console.log(data);
		//infoWindow.setContent(content: String | HTMLElement);
		//infoWindow.redraw()	;

	}
	//改变PreMakerdata，用于searchdata
	function changePreMakerdata(data) {
		preMakerdata=data;
	}
	//判断是否在选择框内
	function judgeSelection(bound) {
		var drawtata=[];
		var drawid=[];
		for(var i=0;i<preMakerdata.length;i++){
			var judgepoint = new BMap.Point(preMakerdata[i].xcoordinate,preMakerdata[i].ycoordinate);
			if(bound.containsPoint(judgepoint))
				{
				 drawid.push(preMakerdata[i].id);
				 preMakerdata[i].searchconditions=null;
				 drawtata.push(preMakerdata[i]);
				}
		}
		for(var i=0;i<drawtata.length;i++){
			var a=drawtata[i];
			a.drawid=drawid;
		}
		if(drawtata.length>0){
			parent.cleardrawdata();//删除原有的左边框选列表
			parent.setmapTermpage(-2,drawtata[0]);
			//parent.changedrawdata(drawtata);//用于再次点击时可以加载出来
			parent.gpsTObbddrawing(drawtata);//添加左边框选列表
		}
		else{alert("没有框中任何数据");}
	}
	function TurnOnLight() {
		if (choseMakerdata.brightness != 0) {
			 BootstrapDialog.show({
	                type:  BootstrapDialog.TYPE_DANGER,
	                title: '提示信息 ',
	                message: '路灯已是开启状态',
	                buttons: [{
	                    label: '关闭',
	                    action: function(dialogItself){
	                        dialogItself.close();
	                    }
	                }]
	            });  
		} else {
			//console.log(choseMakerdata);
			$.ajax({
						url : "gomap/updateClientAttr_status",
						type : "POST",
						contentType : "application/json; charset=UTF-8",
						data : JSON.stringify(choseMakerdata),
						dataType : "json",
						success : function(data) {
							if (data.status == "SUCCESS") {
								//choseMaker.style.backgroundImage = "url('map/img/light_green.png')";
								cleanAllMaker();//清除所有覆盖物
								var a;
								var mapcenter=map.getCenter();
								var mapzoom=map.getZoom();
								if(choseMakerdata.searchconditions!=null)
									{a=choseMakerdata.searchconditions;getClientsData(a,mapcenter,mapzoom);setTimeout(function() {parent.changesearchdata(preMakerdata);}, 1000);}
								else if(choseMakerdata.drawid.length!=0)
									{ a=choseMakerdata;getClientsData(a,mapcenter,mapzoom);setTimeout(function() {parent.changedrawdata(preMakerdata);}, 1000);}
								else
									{a = parent.getmapTermpagein()[choseMakerdata.termid];getClientsData(a,mapcenter,mapzoom);}
								 BootstrapDialog.show({
						                type:  BootstrapDialog.TYPE_PRIMARY,
						                title: '提示信息 ',
						                message: '路灯开启成功',
						                buttons: [{
						                    label: '关闭',
						                    action: function(dialogItself){
						                        dialogItself.close();
						                    }
						                }]
						            }); 
								//infoWindow.setContent("11111");
								//infoWindow.redraw()	;

							} else {
								BootstrapDialog.show({
					                type:  BootstrapDialog.TYPE_DANGER,
					                title: '提示信息 ',
					                message: '路灯开启失败',
					                buttons: [{
					                    label: '关闭',
					                    action: function(dialogItself){
					                        dialogItself.close();
					                    }
					                }]
					            }); 
							}

						},
						error : function() {
							BootstrapDialog.show({
				                type:  BootstrapDialog.TYPE_DANGER,
				                title: '提示信息 ',
				                message: '路灯开启失败',
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

	}
	function TurnOffLight() {
		if (choseMakerdata.brightness == 0) {
			BootstrapDialog.show({
                type:  BootstrapDialog.TYPE_DANGER,
                title: '提示信息 ',
                message: '路灯已是关闭状态',
                buttons: [{
                    label: '关闭',
                    action: function(dialogItself){
                        dialogItself.close();
                    }
                }]
            }); 
		} else {
			$
					.ajax({
						url : "gomap/updateClientAttr_status",
						type : "POST",
						contentType : "application/json; charset=UTF-8",
						data : JSON.stringify(choseMakerdata),
						dataType : "json",
						success : function(data) {
							if (data.status == "SUCCESS") {
								//choseMaker.style.backgroundImage = "url('map/img/light_grey.png')";
								cleanAllMaker();//清除所有覆盖物
								var a;
								var mapcenter=map.getCenter();
								var mapzoom=map.getZoom();
								if(choseMakerdata.searchconditions!=null)
								{a=choseMakerdata.searchconditions;getClientsData(a,mapcenter,mapzoom);setTimeout(function() {parent.changesearchdata(preMakerdata);}, 1000);}
							else if(choseMakerdata.drawid.length!=0)
								{ a=choseMakerdata;getClientsData(a,mapcenter,mapzoom);setTimeout(function() {parent.changedrawdata(preMakerdata);}, 1000);}
							else
									{a = parent.getmapTermpagein()[choseMakerdata.termid];getClientsData(a,mapcenter,mapzoom);}
								
								 BootstrapDialog.show({
						                type:  BootstrapDialog.TYPE_PRIMARY,
						                title: '提示信息 ',
						                message: '路灯关闭成功',
						                buttons: [{
						                    label: '关闭',
						                    action: function(dialogItself){
						                        dialogItself.close();
						                    }
						                }]
						            }); 

							} else {
								BootstrapDialog.show({
					                type:  BootstrapDialog.TYPE_DANGER,
					                title: '提示信息 ',
					                message: '路灯关闭失败',
					                buttons: [{
					                    label: '关闭',
					                    action: function(dialogItself){
					                        dialogItself.close();
					                    }
					                }]
					            }); 
							}

						},
						error : function() {
							BootstrapDialog.show({
				                type:  BootstrapDialog.TYPE_DANGER,
				                title: '提示信息 ',
				                message: '路灯关闭失败',
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

	}

	function change_bright(bright) {
		choseMakerdata.brightness = bright;
		console.log(bright);
		$.ajax({
			url : "gomap/updateClientAttr_brightness",
			type : "POST",
			contentType : "application/json; charset=UTF-8",
			data : JSON.stringify(choseMakerdata),
			dataType : "json",
			success : function(data) {
				if (data.status == "SUCCESS") {
					cleanAllMaker();//清除所有覆盖物
					var a;
					var mapcenter=map.getCenter();
					var mapzoom=map.getZoom();
					if(choseMakerdata.searchconditions!=null)
					{a=choseMakerdata.searchconditions;getClientsData(a,mapcenter,mapzoom);setTimeout(function() {parent.changesearchdata(preMakerdata);}, 1000);}
				else if(choseMakerdata.drawid.length!=0)
					{ a=choseMakerdata;getClientsData(a,mapcenter,mapzoom);setTimeout(function() {parent.changedrawdata(preMakerdata);}, 1000);}
				else
						{a = parent.getmapTermpagein()[choseMakerdata.termid];getClientsData(a,mapcenter,mapzoom);}
					
					BootstrapDialog.show({
		                type:  BootstrapDialog.TYPE_PRIMARY,
		                title: '提示信息 ',
		                message: '路灯亮度值更新成功',
		                buttons: [{
		                    label: '关闭',
		                    action: function(dialogItself){
		                        dialogItself.close();
		                    }
		                }]
		            }); 

				} else {
					BootstrapDialog.show({
		                type:  BootstrapDialog.TYPE_DANGER,
		                title: '提示信息 ',
		                message: '路灯亮度值更新失败',
		                buttons: [{
		                    label: '关闭',
		                    action: function(dialogItself){
		                        dialogItself.close();
		                    }
		                }]
		            });
				}

			},
			error : function() {
				BootstrapDialog.show({
	                type:  BootstrapDialog.TYPE_DANGER,
	                title: '提示信息 ',
	                message: '路灯亮度值更新失败',
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
</script>
<script type="text/javascript">
	jQuery.getJSON("gomap/getFirstTermId/", function(data) {
		if (data != -1000) {
			//alert(data);
			var mapTermpage2 = {
				page : 1,
				rows : 2,
				begin : 0,
				end : 0,
				havenest : false,
				termid : data
			};
			;
			getClientsData(mapTermpage2);
		} else {
			BootstrapDialog.show({
                type:  BootstrapDialog.TYPE_INFO,
                title: '提示信息 ',
                message: '暂时没有任何分组数据',
                buttons: [{
                    label: '关闭',
                    action: function(dialogItself){
                        dialogItself.close();
                    }
                }]
            });
		}
	});
</script>
<script type="text/javascript"> 
function searchsuccess() {
	BootstrapDialog
	.show({
		type : BootstrapDialog.TYPE_PRIMARY,
		title : '提示信息 ',
		message : '搜索成功，请查看左侧搜索结果！',
		buttons : [ {
			label : '关闭',
			action : function(dialogItself) {
				dialogItself.close();
			}
		} ]
	});
}
function searcherr() {
	BootstrapDialog
	.show({
		type : BootstrapDialog.TYPE_DANGER,
		title : '提示信息 ',
		message : '查询的终端不存在！',
		buttons : [ {
			label : '关闭',
			action : function(dialogItself) {
				dialogItself.close();
			}
		} ]
	});
}
function searchConerr() {
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
 function PolicyControl() {
	 BootstrapDialog.show({
         title: '策略控制',
         /* cssClass :'dialog', */
       /*   draggable: true, */
        // message:$('<div></div>').load('remote.html'),
        message:"跳转到策略控制页面吗",
         buttons: [{
             label: '确定',
             action: function(dialogItself) {
            	 dialogItself.close();
            	// window.parent.location.href="strategy/listStrategys.do";
             }
         },{
             label: '取消',
             action: function(dialogItself) {
            	 dialogItself.close();
             }
         }]
     });
} 
</script>
</html>
