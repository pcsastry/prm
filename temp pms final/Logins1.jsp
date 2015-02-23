<%@ page language="java" import="java.sql.*,java.lang.*" %>
<HTML>

<head>
<title> Prison Management System </title>
<style type="text/css">
<!--
.style1 {color: #FF0000}
.style2 {color: #99CCFF}
-->
</style>
</head>
<body background="bg-grid.jpg">
<center>
<img src="pms.bmp">
<font face="arial" color="red">

<%

try{
       


         String login=request.getParameter("id");
         String pwd=request.getParameter("pass");

         System.out.println("login..."+login);
         System.out.println("password..."+pwd);
         

         Statement st=null;
         ResultSet rs=null;
         out.println("one");
         Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:PrisonSYS");
         out.println("two");
         st =con.createStatement();

         String query="select * from vidpas where vname='"+login+"' and pass='"+pwd+"'";
         st=con.createStatement();
	 rs=st.executeQuery(query);
	
	if(rs.next())
	{
%>
		<jsp:forward page="visitorservices.html" />
<%
	}
	else
	{
%>
		 <jsp:forward page="vislogfail.html" />
<%
	}
	}
	catch(Exception e)
	{
		System.out.println("ERROR>>>>>Database Not Availble");
		e.printStackTrace();
	}
%>
</body>
</html>