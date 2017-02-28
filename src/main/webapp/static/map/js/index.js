$(function () {
    //日历
    $("#datepicker").datepicker();
    //左边菜单
    $('.one').live("click",function () {
        $('.one').removeClass('one-hover');
        $(this).addClass('one-hover');
        choseterm=$(this);
        if($(this).attr("id")!="search"){
        Conframe.window.cleanAllMaker();//清除所有覆盖物
        //console.log(mapTermpagein[$(this).attr("id")]);
        Conframe.window.getClientsData(mapTermpagein[$(this).attr("id")]);//加载对应组的终端maker
        }else{
        Conframe.window.cleanAllMaker();//清除所有覆盖物
        Conframe.window.addClientMaker(searchdata);
        }
       // console.log($(this).attr("id"));
        $('.kid').hide();
     // $(this).parent().find('.kid').toggle();
        $(this).parent().parent().find('.kid').toggle();
    });
    
    $('.onekid').live("click",function () {
        $('.onekid').removeClass('one-hover');
        $(this).addClass('one-hover');
        var str=$(this).attr("id");
       // console.log($(this).attr("id"));
        if(str!="more"){
        	var coordinate= new Array(); //定义一数组 
        	coordinate=str.split(","); //字符分割 
        	var centerdata={xcoordinate:coordinate[0],ycoordinate:coordinate[1]};
        	Conframe.window.changeCenter(centerdata);
        }else{
        	$(this).parent().remove();
        	var termid=choseterm.attr("id");
           	//Conframe.window.getClientsData(mapTermpage[termid]);//加载对应组的终端maker/////////////////////////
        	$.ajax({
        		url : "gomap/lefe_cnext",
        		type : "POST",
        		contentType : "application/json; charset=UTF-8",
        		data : JSON.stringify(mapTermpage[termid]),
        		dataType : "json",
        		success : function(data) {
        			if (data != null) {
        				//console.log(data);
        					 for(var i=0;i<data.length;i++){
        						 var accdivli
        						 if(data[i].coordinate!=null){
        							   
        						 	   accdivli ="<li><b class=\"tip\"></b><a class=\"onekid\"  id="+data[i].coordinate+">"+data[i].name+"</a></li>";
        						 	
        						 }
        						 else if(data[i].havenest==true){
        							  mapTermpage[termid].havenest=true;
        							  accdivli ="<li id=\"moreli\"><b class=\"tip\"></b><a class=\"onekid\"  id="+"more"+">"+"....."+"</a></li>";
        						 } 
        						 else {
        							 mapTermpage[termid].havenest=false;
        						 }
        						 choseterm.parent().parent().children("ul").append(accdivli);
        						 accdivli="";
        					 }
        					 mapTermpage[termid].begin= mapTermpage[termid].begin+ mapTermpage[termid].rows;
        					 mapTermpagein[termid].rows= mapTermpagein[termid].rows+ mapTermpagein[termid].rows;
        					 Conframe.window.cleanAllMaker();//清除所有覆盖物
        					 //console.log(mapTermpagein[termid]);
        				     Conframe.window.getClientsData(mapTermpagein[termid]);//加载对应组的终端maker
        			} else {
        			}      			
        		},
        		error : function() {
        		}
        	});
        	
        }
    });
    
    //影藏菜单
    var l = $('.left_c');
    var r = $('.right_c');
    var c = $('.Conframe');
    var s = $('.searchdiv');
    $('.nav-tip').click(function () {
        if (l.css('left') == '8px') {
            l.animate({
                left: -300
            }, 500);
            r.animate({
                left: 21
            }, 500);
            c.animate({
                left: 29
            }, 500);
            s.animate({
                left: 29
            }, 500);
            $(this).animate({
                "background-position-x": "-12"
            }, 300);
        } else {
            l.animate({
                left: 8
            }, 500);
            r.animate({
                left: 260
            }, 500);
            c.animate({
                left: 268
            }, 500);
            s.animate({
                left: 268
            }, 500);
            $(this).animate({
                "background-position-x": "0"
            }, 300);
        };
    });
    //横向菜单
    $('.top-menu-nav li').click(function () {
        $('.kidc').hide();
        $(this).find('.kidc').show();
        
    });
    $('.kidc').bind('mouseleave', function () {
        $('.kidc').hide();
    }); 

});
