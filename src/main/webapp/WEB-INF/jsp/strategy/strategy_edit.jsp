<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
	<!-- 时间 -->
	<link rel="stylesheet" href="static/ace/css/bootstrap-timepicker.css" />
	<script type="text/javascript">
	var jsessionid = "<%=session.getId()%>";  //勿删，uploadify兼容火狐用到
	</script>
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
					
					<form action="strategy/${msg }.do" name="strategyForm" id="strategyForm" method="post">
						<input type="hidden" value="no" id="hasTp1" />
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr style="display:none">
						   		 <td><input type="text" name="ID" id="id" value="${pd.id }" /></td>
						    </tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;"><span style="color:red;">*</span>策略名称:</td>
								<td><input type="text" name="NAME" id="name" value="${pd.name }" maxlength="100" title="名称" style="width:98%;" /></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;"><span style="color:red;">*</span>应用说明:</td>
								<td><input type="text" name="EXPLAIN" id="explain" value="${pd.explain }" maxlength="100" title="简述" style="width:98%;" /></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;"><span style="color:red;">*</span>状态:</td>
								<td>
									<select class="chosen-select form-control" name="STATUS" id="status" maxlength="100" title="状态" style="vertical-align:top;width:98%;">
										<option value="">请选择状态</option>
										<option value="1" <c:if test="${pd.status == '1' }">selected</c:if> >有效</option>
										<option value="2" <c:if test="${pd.status == '2' }">selected</c:if> >无效</option>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;"><span style="color:red;">*</span>奇偶天:</td>
								<td>
									<select class="chosen-select form-control" name="ODD_EVEN" id="odd_even" maxlength="100" title="奇偶天" style="vertical-align:top;width:98%;">
										<option value="">请选择奇偶天</option>
										<option value="0" <c:if test="${pd.status == '1' }">selected</c:if> >奇</option>
										<option value="1" <c:if test="${pd.status == '2' }">selected</c:if> >偶</option>
									</select>
								</td>
							</tr>
							</table>
							<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
							<td style="text-align: center;">请输入时间(24小时制)：</td>
							<td style="text-align: center;">请选择亮度(%)：</td>
							<td style="text-align: center;">操作</td>
							</tr>
							<tr>
      						<td style="text-align: center;"><input class="span10 time-picker" type="text" name="TIMESTAMP" id="timestamp" maxlength="100" title="时间" style="text-align: center;width:98%;" placeholder="例：6:00(24小时制)"/></td>
	  						<td style="text-align: center;"><select id="intensity" ></select></td>
      						<td style="text-align: center;"><a class="btn btn-mini btn-success" onclick="addSort();" id="addSort">添加</a></td>
							</tr>
  							<tbody id="sortList" >
        					<tr>
          					<td style="text-align: center;">时间(24小时制)</td>
		  					<td style="text-align: center;">亮度(%)</td>
          					<td style="text-align: center;">操作</td>
        					</tr>
  							</tbody>
							</table>
							
							
						<table id="table_report" class="table table-striped table-bordered table-hover">	
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
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


	<!-- 页面底部js¨ -->
	<%@ include file="../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!-- 时间 -->
	<script src="static/ace/js/date-time/bootstrap-timepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		
		//保存
		function save(){
			if($("#name").val()==""){
				$("#name").tips({
					side:3,
		            msg:'输入策略名称',
		            bg:'#AE81FF',
		            time:3
		        });
				$("#name").focus();
				return false;
			}
			if($("#explain").val()==""){
				$("#explain").tips({
					side:3,
		            msg:'输入应用说明',
		            bg:'#AE81FF',
		            time:3
		        });
				$("#explain").focus();
				return false;
			}
			
			if($("#status").val()==""){
				$("#status").tips({
					side:3,
		            msg:'选择状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#status").focus();
				return false;
			}
			if($("#odd_even").val()==""){
				$("#odd_even").tips({
					side:3,
		            msg:'选择奇偶天',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#odd_even").focus();
				return false;
			}
			
				$("#strategyForm").submit();
				$("#zhongxin").hide();
				$("#zhongxin2").show();
			
		}
		
		$(function() {
			//时间框
			$('.time-picker').timepicker();
			$('.time-picker').val("");
			//下拉框填充1-100
			var obj=document.getElementById('intensity'); 
			obj.options.add(new Option("请选择亮度",""));
			for (var i=1;i<101;i++)
			{
				obj.options.add(new Option(i,i));
			}
		});

			//清除空格
		String.prototype.trim=function(){
		     return this.replace(/(^\s*)|(\s*$)/g,'');
		};
		
		function addSort(){
			if($("#timestamp").val()==""){
				$("#timestamp").tips({
					side:3,
		            msg:'输入时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#timestamp").focus();
				return false;
			}
			if($("#intensity").val()==""){
				$("#intensity").tips({
					side:3,
		            msg:'选择亮度',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#intensity").focus();
				return false;
			}
            var timestampInput = document.getElementById('timestamp');
			var intensityInput = document.getElementById('intensity');
			//遍历表格   
	        var s3 = document.getElementById("sortList"); //获取第一个表格  
	        if(s3.rows.length >= 13){
	        	$("#timestamp").tips({
					side:3,
		            msg:'每个策略最多有12条时间及亮度值关系！',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#timestamp").focus();
				return false;
	        }
	        for(var i=1;i<s3.rows.length;i++){//过滤表头  
	        	if(s3.rows[i].cells[0].innerHTML == timestampInput.value){
	    				$("#timestamp").tips({
	    					side:3,
	    		            msg:'时间重复！',
	    		            bg:'#AE81FF',
	    		            time:2
	    		        });
	    				$("#timestamp").focus();
	    				return false;
	        	} 
	        }    
            var row = document.createElement("tr");
            var cell1 = document.createElement("td");
            cell1.setAttribute("style","text-align: center"); 
            var timestampNode = document.createTextNode(timestampInput.value);
            cell1.appendChild(timestampNode);
            row.appendChild(cell1);
			var cell2 = document.createElement("td");
			cell2.setAttribute("style","text-align: center"); 
			var intensityNode = document.createTextNode(intensityInput.value);
		    cell2.appendChild(intensityNode);
			row.appendChild(cell2);
            var deleteButton = document.createElement("a");
            deleteButton.setAttribute("class","btn btn-xs btn-danger"); 
            deleteButton.innerHTML = '删除';
            deleteButton.onclick = function (){deleteSort(this);};
            var cell3 = document.createElement("td");
            cell3.setAttribute("style","text-align: center"); 
            cell3.appendChild(deleteButton);
            row.appendChild(cell3);
            document.getElementById("sortList").appendChild(row);
            timestampInput.value = "";
			intensityInput.value = "";
		}
  function deleteSort(node){
      var rowToDelete = node.parentNode.parentNode;
      var sortList = document.getElementById("sortList");
      sortList.removeChild(rowToDelete);
  }
  
		</script>
</body>
</html>