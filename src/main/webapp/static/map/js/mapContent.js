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
											Conframe.window.changePreMakerdata(data);

											$("#search").parent().parent().remove();
											gpsTObbdSearch(data);
											/*var accdivpre = "<div class=\"panel-info\"><div class=\"panel-heading\"><a class=\"one\" id=\"search\"><span style=\"font-size:14px;font-weight:normal;font-family:宋体\">"
													+ "搜索所得终端"
													+ "</span></a></div><ul class=\"kid\">";

											for (var i = 0; i < data.length; i++) {
												var accdivli = "<li><b class=\"tip\"></b><a class=\"onekid\"  id="
														+ data[i].coordinate
														+ "><span style=\"font-size:12px;font-family:宋体\">"
														+ data[i].name
														+ "</span></a></li>";
												accdivpre = accdivpre
														+ accdivli;
											}
											var accdivaft = "</ul></div>";
											accdivpre = accdivpre + accdivaft;
											$('.acc').append(accdivpre);*/
											Conframe.window.cleanAllMaker();
											var arrpoints=[];
											for (var i = 0; i < data.length; i++) {
												arrpoints.push( new BMap.Point(data[i].xcoordinate,data[i].ycoordinate));
											}
											//console.log(arrpoints);
											Conframe.window.gpsTObbd(arrpoints,data);
											Conframe.window.searchsuccess();
											
										} else {
											Conframe.window.searcherr();
										}
									},
									error : function() {
										Conframe.window.searcherr();
									}
								});
					});
	$("#reset").click(function() {
		$("#groupname").val("");
		$("#terminaltype").empty();$("#terminaltype").append("<option  value=\"\"> </option>");
		$("#address").empty();$("#address").append("<option  value=\"\"> </option>");
		$("#terminalname").empty();$("#terminalname").append("<option  value=\"\"> </option>");
		$("#terminalid").append("<option  value=\"\"> </option>");
	});
}
