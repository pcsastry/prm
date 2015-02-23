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
<body background="stripe.gif">
<center>
<img src="pms.bmp">
<font face="arial" color="red">

<% 	
if(request.getParameter("vname").length()!=0 ||
request.getParameter("pname").length()!=0 ||
request.getParameter("rdate").length()!=0 ||
request.getParameter("status").length()!=0)

{
	
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:PrisonSYS");
		     	
	Statement st=con.createStatement();
		
	String vname=request.getParameter("vname");
	String pname=request.getParameter("pname");
	String rdate=request.getParameter("rdate");
	String status=request.getParameter("status");
        int sn=0; 
        ResultSet rs=st.executeQuery("select vname from visitors where vname='"+vname+"'");
                
        
        sn= st.executeUpdate("update visitors set status='"+status+"' where vname='"+vname+"'");
        if(sn!=0)
{
      
       %><center><font face="arial"><h4>

       status set sucessfully</h4></font><br>
       <a href="jailorser.html"><font face="arial" color="green">Back to jailor services </a>
       <%
       }
       else
       { %>
        <center><font face="arial" color="red"><h4>
       Set the status properly </h4></font><br>
       <a href="visinfo.jsp"><font face="arial" color="white">Set the status</a>
       <%
       }
        
	
         st.close();
 }
else
{
	out.println("<h3><font color=red><i><center>You must Enter Full Data");
%>
<br><br><input type=button value="Back" onclick="history.back()">
<%
 }
%>

