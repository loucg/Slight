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

.anchorBL {
	display: none
}
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
	map.setDefaultCursor("url('bird.cur')"); //设置地图默认的鼠标指针样式
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
	}/* , {
		text : '不要点，缩小',
		callback : function() {
			map.zoomOut();
			CircleAndRectangle.removeContextMenu(menu);
			map.removeOverlay(CircleAndRectangle);
			CircleAndRectangle = null;
		}
	} */, {
		text : '清除',
		callback : function() {
			CircleAndRectangle.removeContextMenu(menu);
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
	function getClientsData(mapTermpage2) {
		$.ajax({
			url : "gomap/addClientMaker",
			type : "POST",
			contentType : "application/json; charset=UTF-8",
			data : JSON.stringify(mapTermpage2),
			dataType : "json",
			success : function(clientdata) {
				if (clientdata != null) {
					preMakerdata = clientdata;
					addClientMaker(clientdata);
				} else {
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
		});
	}
	//添加覆盖物 
	var infoWindow;//全局变量，相当重要/////////////////////////////////////////////////////
	function addClientMaker(data) {
		for (var i = 0; i < data.length; i++) {
			var markerpoint = new BMap.Point(data[i].xcoordinate,
					data[i].ycoordinate);
			var mySquare = new SquareOverlay(markerpoint, 25, data[i]);
			map.addOverlay(mySquare);
			//8、 为自定义覆盖物添加点击事件      
			(function(k) {
				mySquare.addEventListener('click', function(e) {//这里是自定义覆盖物的事件   
					choseMaker = this;//this.style.backgroundImage = "url('map/img/light_red.png')";
					choseMakerdata = data[k];
					getMakerIconAndInfo(choseMaker, choseMakerdata);/////////////////////////////
					var sContent = getInfoContent(data[k]);
					var opts = {
						width : 304, // 信息窗口宽度
						height : 204, // 信息窗口高度
					};
					infoWindow = new BMap.InfoWindow(sContent, opts); // 创建信息窗口对象
					infoWindow.enableCloseOnClick();
					map.addEventListener('click', fo);
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
				maxYcoordinate);//设置zoom大小
		changeCenter(centerdata);//设置中心点
	}

	map.addEventListener("click",closeinfowindow);
	function closeinfowindow(){
		  if(infoWindow.isOpen())map.removeOverlay(infoWindow);
		  
	}
	//叠加层点击事件       
	function fo(e) {
		map.removeEventListener("click", fo); //这里取消绑定。
		var point = new BMap.Point(e.point.lng, e.point.lat);
		map.openInfoWindow(infoWindow, point); //开启信息窗口     
		//map.removeEventListener("click", fo); //这里取消绑定。                
	}
	//0.5秒后改变地图的展示中心       
	function changeCenter(data) {
		//console.log(data.xcoordinate, data.ycoordinate);
		setTimeout(function() {
			map.panTo(new BMap.Point(data.xcoordinate, data.ycoordinate)); //两秒后移动到第一个点
		}, 500);

	}
	//改变地图的zoom大小    
	function changeZoom(center, minx, miny, maxx, maxy) {
		for (var i = 19; i > 0; i--) {
			map.centerAndZoom(new BMap.Point(center.xcoordinate,
					center.ycoordinate), i);
			var bs = map.getBounds(); //获取可视区域
			var bssw = bs.getSouthWest(); //可视区域左下角
			var bsne = bs.getNorthEast(); //可视区域右上角
			if (bssw.lng < minx && bssw.lat<miny&&bsne.lng>maxx
					&& bsne.lat > maxy)
				break;
			//console.log("当前地图可视范围是：" + bssw.lng + "," + bssw.lat + "到" + bsne.lng + "," + bsne.lat);
			//console.log(i)
		}
	}
	//清除所有覆盖物   
	function cleanAllMaker() {
		map.clearOverlays();
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
		//console.log(preMakerdata.length);
		for(var i=0;i<preMakerdata.length;i++){
			var judgepoint = new BMap.Point(preMakerdata[i].xcoordinate,
					preMakerdata[i].ycoordinate);
			if(bound.containsPoint(judgepoint))
				{
				console.log(preMakerdata[i].id);
				}
			
		}
		
	}
	function TurnOnLight() {
		if (choseMakerdata.brightness != 0) {
			 BootstrapDialog.show({
	                type:  BootstrapDialog.TYPE_DANGER,
	                title: '提示信息 ',
	                message: '路灯已开启',
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
								//choseMaker.style.backgroundImage = "url('map/img/light_green.png')";
								cleanAllMaker();//清除所有覆盖物
								var a = parent.getmapTermpagein()[choseMakerdata.termid];
								//console.log(a);
								getClientsData(a);
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
                message: '路灯已关闭',
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
								var a = parent.getmapTermpagein()[choseMakerdata.termid];
								//console.log(a);
								getClientsData(a);
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
					var a = parent.getmapTermpagein()[choseMakerdata.termid];
					//console.log(a);
					getClientsData(a);
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
		if (data != null) {
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
                message: '暂时没有数据',
                buttons: [{
                    label: '关闭',
                    action: function(dialogItself){
                        dialogItself.close();
                    }
                }]
            });
		}
	});

	$(function() {
		//getClientsData(1);
	});
</script>
<script type="text/javascript"> 
function searchsuccess() {
	BootstrapDialog
	.show({
		type : BootstrapDialog.TYPE_PRIMARY,
		title : '提示信息 ',
		message : '搜索成功，具体列表请查看左侧！',
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
		message : '查询的终端不存在或查询出错！',
		buttons : [ {
			label : '关闭',
			action : function(dialogItself) {
				dialogItself.close();
			}
		} ]
	});
}
 function PolicyControl() {
	 BootstrapDialog.show({
         title: '策略控制',
        // message:$('<div></div>').load('remote.html'),
        message:"跳转到策略控制页面吗",
         buttons: [{
             label: '确定',
             action: function(dialogItself) {
            	 dialogItself.close();
            	 window.parent.location.href="strategy/listStrategys.do";
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
