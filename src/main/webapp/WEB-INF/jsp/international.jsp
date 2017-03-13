<%@page import="java.util.Properties"%>  
<%@page import="java.io.FileInputStream"%>  
<%@page import="java.io.FileNotFoundException" %>
<%@page import="java.io.IOException" %>
<% 
//国际化
	String language = (String)session.getAttribute("session_language"); 
	Properties properties = new Properties();
	try {
		FileInputStream fis = new FileInputStream(this.getClass().getClassLoader().getResource("/").getPath()+"slight_"+language+".properties");
		try {
			properties.load(fis);
			fis.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	} catch (FileNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		System.out.println("没找到");
	} 

%>