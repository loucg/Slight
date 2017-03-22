<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>保存结果</title>
<base href="<%=basePath%>">
<meta name="description" content="overview & stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="static/ace/js/bootbox.js"></script>
<script src="static/ace/js/bootstrap.js"></script>
<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>

</head>
<body>
	<div id="zhongxin"></div>
	<script type="text/javascript">
		var msg = "${msg}";
		if(msg=="success" || msg==""){
			document.getElementById('zhongxin').style.display = 'none';
			top.Dialog.close();
		}else if(msg=="errorPassword"){
			document.getElementById('zhongxin').style.display = 'none';
			alert("原始密码错误！");
			top.Dialog.close();
		}
		else if("addSuccess"==msg){
			/* bootbox.confirm("Hello world!", function (result) {  
                if(result) {  
                    alert('点击了确认按钮');  
                } else {  
                    alert('点击了取消按钮');  
                }  
            }); */
            alert("新增成功！");
			document.getElementById('zhongxin').style.display = 'none';
			top.Dialog.close();
		}
		else if("editSuccess"==msg){
			document.getElementById('zhongxin').style.display = 'none';
			alert("修改成功！");
			top.Dialog.close();
		}
		else if("resetSuccess"==msg){
			document.getElementById('zhongxin').style.display = 'none';
			alert("重置成功！");
			top.Dialog.close();
		}
		else{
			top.Dialog.close();
		}
	</script>
</body>
</html>