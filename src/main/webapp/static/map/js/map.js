	function getInfoContent(data) {
		 //路灯
        var sContent_light =   
        "<html>"+
        "<head>"+
        "<meta charset='UTF-8'>"+
        "<title>"+"Insert title here"+"</title>"+
        "<link rel='styleSheet' type='text/css' href='static/map/css/base.css' />"+
        "<link rel='styleSheet' type='text/css' href='static/map/css/content_light.css' />"+
        "</head>"+
        "<body>"+
        	"<div id= 'main'>"+
        		"<div class = 'head'>"+
        			"<p>"+data .name+"</p>"+
        		"</div>"+
        		"<div class = 'mid'>"+
        			"<div class='introduction'>"+
        				"<ul >"+
        					"<li>"+
        						"<a>"+"编号："+ data.id+"</a>"+
        					"</li>"+
        					"<li>"+
        						"<a>"+"名称："+ data.name+"</a>"+
        					"</li>"+
        					"<li>"+
        						"<a>"+"灯杆："+ data.lamppolenum+"</a>"+
        					"</li>"+
        					"<li >"+
        						"<a>"+"位置："+ data.location+"</a>"+
        					"</li>"+
        					"<li >"+
    							"<a>"+"组名："+ data.termname+"</a>"+
    						"</li>"+
    						"<li >"+
								"<a>"+"亮度值："+ data .brightness+"</a>"+
						"</li>"+
        				"</ul>"+
        			"</div>"+
        			"<div class='image'>"+
        				"<img src='static/map/img/light1.png' />"+
        			"</div>"+
        		"</div>"+
        		"<div class='bottom'>"+
	        		"<div class='b1' onclick ='TurnOnLight()'>"+
						"<div class='bimg1'>"+
							"<img src='static/map/img/bulb_on.png'>"+
						"</div>"+
						"<div class='btx1'>"+
							"<a href='javascript:void(0)' >开灯</a>"+
						"</div>"+
					"</div>"+
					"<div class='b2' onclick ='TurnOffLight()'>"+
						"<div class='bimg2'>"+
								"<img src='static/map/img/bulb_off.png'>"+
						"</div>"+
						"<div class='btx2'>"+
							"<a href='javascript:void(0)' >关灯</a>"+
						"</div>"+
					"</div>"+
					"<div class='b3' onclick ='PolicyControl()'>"+
						"<div class='bimg3'>"+
								"<img src='static/map/img/policy_control.png'>"+
						"</div>"+
						"<div class='btx3'>"+
							"<a href='javascript:void(0)' >策略控制</a>"+
						"</div>"+
					"</div>"+
					"<div class='btx4'>"+
						"<h2 class='sh'>"+"亮度值"+":</h2>"+
						"<select class='s1'  onchange='change_bright(this.options[this.options.selectedIndex].value)'>"+
							"<option value='0'>"+"0"+"</option>"+
							"<option value='50'>"+"50"+"</option>"+
							"<option value='100'>"+"100"+"</option>"+
				    	"</select>"+
				    "</div>"+
    			"</div>"+
        	"</div>"+
        "</body>"+
        "</html>";
        
        
       //断路器
        var sContent_Breaker =   
	        "<html>"+
	        "<head>"+
	        "<meta charset='UTF-8'>"+
	        "<title>"+"Insert title here"+"</title>"+
	        "<link rel='styleSheet' type='text/css' href='static/map/css/base.css' />"+
	        "<link rel='styleSheet' type='text/css' href='static/map/css/content_breaker.css' />"+
	        "</head>"+
	        "<body>"+
	        	"<div id= 'main'>"+
	        		"<div class = 'head'>"+
	        			"<p>"+data.name+"</p>"+
	        		"</div>"+
	        		"<div class = 'mid'>"+
	        			"<div class='introduction'>"+
	        				"<ul >"+
	        					"<li>"+
	        						"<a>"+"编号："+ data .id+"</a>"+
	        					"</li>"+
	        					"<li>"+
	        						"<a>"+"名称："+ data .name+"</a>"+
	        					"</li>"+
	        					"<li>"+
	        						"<a>"+"灯杆："+ data .lamppolenum+"</a>"+
	        					"</li>"+
	        					"<li >"+
	        						"<a>"+"位置："+ data .location+"</a>"+
	        					"</li>"+
	        					"<li >"+
        							"<a>"+"断电时间："+ data .powerdown+"</a>"+
        						"</li>"+
        						"<li >"+
    								"<a>"+"通电时间："+ data .powerup+"</a>"+
    						"</li>"+
	        				"</ul>"+
	        			"</div>"+
	        			"<div class='image'>"+
	        				"<img src='static/map/img/breaker.png' />"+
	        			"</div>"+
	        		"</div>"+
	        	"</div>"+
	        "</body>"+
	        "</html>";
	        var op="";
        if(data.cclientgateway!=null){
      
        	for(var i = 0; i < data.cclientgateway.length; i++){
        		op=op+"<option value='1'>"+data.cclientgateway[i]+"</option>";
        	}
        	  //console.log(op);
        }
	        //网关
	        var sContent_Gateway =   
		        "<html>"+
		        "<head>"+
		        "<meta charset='UTF-8'>"+
		        "<title>"+"Insert title here"+"</title>"+
		        "<link rel='styleSheet' type='text/css' href='static/map/css/base.css' />"+
		        "<link rel='styleSheet' type='text/css' href='static/map/css/content_gateway.css' />"+
		        "</head>"+
		        "<body>"+
		        	"<div id= 'main'>"+
		        		"<div class = 'head'>"+
		        			"<p>"+ data .name+"</p>"+
		        		"</div>"+
		        		"<div class = 'mid'>"+
		        			"<div class='introduction'>"+
		        				"<ul >"+
		        					"<li>"+
		        						"<a>"+"编号："+ data .id+"</a>"+
		        					"</li>"+
		        					"<li>"+
		        						"<a>"+"名称："+ data .name+"</a>"+
		        					"</li>"+
		        					"<li>"+
		        						"<a>"+"灯杆："+ data .lamppolenum+"</a>"+
		        					"</li>"+
		        					"<li >"+
		        						"<a>"+"位置："+ data .location+"</a>"+
		        					"</li>"+
		        					"<li >"+//+JSON.stringify(data.cclientgateway)+
		        						"<a>"+"成员列表："+"</a>"+
		        					"</li>"+
			        					"<select class='s2'>"+
											op+
							    	    "</select>"+		
	        						"</li>"+
		        				"</ul>"+
		        			"</div>"+
		        			"<div class='image'>"+
		        				"<img src='static/map/img/gateway.png' />"+
		        			"</div>"+
		        		"</div>"+
		        	"</div>"+
		        "</body>"+
		        "</html>";
	        if(data.aliastypename.indexOf("灯" ) >=0){
	        	return sContent_light;
	        }else if(data.aliastypename.indexOf("断路器" ) >=0){
	        	return sContent_Breaker;
	        }else if(data.aliastypename.indexOf("网关") >= 0){
	        	return sContent_Gateway;
	        }else {
	        	return "无";
	        }
	        	
	}