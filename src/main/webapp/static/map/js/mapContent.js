function init() {

	$("#check")
			.click(
					function() {
						var termid = $("#groupname").val();
						if (termid == "") {
							termid = null;
						}
						var typeid = $("#terminaltype").val();
						if (typeid == "") {
							typeid = null;
						}
						var location = $("#address").val();
						if (location == "") {
							location = null;
						}
						var name = $("#terminalname").val();
						if (name == "") {
							name = null;
						}
						var id = $("#terminalid").val();
						if (id == "") {
							id = null;
						}

						var postSearchData = {
							"termid" : termid,
							"typeid" : typeid,
							"location" : location,
							"name" : name,
							"id" : id
						};
						//console.log(postSearchData);
						$
								.ajax({
									url : "gomap/getSearchClient",
									type : "POST",
									contentType : "application/json; charset=UTF-8",
									data : JSON.stringify(postSearchData),
									dataType : "json",
									success : function(data) {
										if (data != null) {
											searchdata = data;// //全局变量，很重要/////////////////////////////////////
											Conframe.window
													.changePreMakerdata(data);

											$("#search").remove();
											var accdivpre = "<div class=\"panel-info\"><div class=\"panel-heading\"><a class=\"one\" id=\"search\"><span style=\"font-size:14px;font-weight:normal;font-family:宋体\">"+"搜索所得终端"+"</span></a></div><ul class=\"kid\">";
											
											for (var i = 0; i < data.length; i++) {
												var accdivli = "<li><b class=\"tip\"></b><a class=\"onekid\"  id="
														+ data[i].coordinate
														+ "><span style=\"font-size:12px;\">"
														+ data[i].name
														+ "</span></a></li>";
												accdivpre = accdivpre
														+ accdivli;
											}
											var accdivaft = "</ul></div>";
											accdivpre = accdivpre + accdivaft;
											$('.acc').append(accdivpre);

											Conframe.window.cleanAllMaker();
											Conframe.window
													.addClientMaker(data);
											$('body').alert({
												type : 'success',
												title : '提示',
												content : '搜索成功，具体列表请查看左侧！',
												modal : true,
												draggabled : false,
												even : 'click',
												buttons : [ {
													id : 'yes',
													name : '确定',
													callback : function() {
													}
												} ]
											});
										} else {
											$('body').alert({
												type : 'primary',
												title : '提示',
												content : '查询的终端不存在！',
												btntext : '确定',
												modal : true,
												draggabled : false,
												even : 'click'
											});
										}
									},
									error : function() {
										alert('查询出错');
									}
								});
					});
	$("#reset").click(function() {
		$("#groupname").val("");
		$("#terminaltype").val("");
		$("#address").val("");
		$("#terminalname").val("");
		$("#terminalid").val("");
	});
}
