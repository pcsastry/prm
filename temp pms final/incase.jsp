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
if(request.getParameter("cid").length()!=0 &&
request.getParameter("desc").length()!=0 &&
request.getParameter("ctype").length()!=0 )

{
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:PrisonSYS");
		     	
	Statement st=con.createStatement();
		
	Integer cid=Integer.parseInt(request.getParameter("cid"));
	String desc=request.getParameter("desc");
	String ctype=request.getParameter("ctype");
       
        int sn=0; 
        ResultSet rs=st.executeQuery("select cid from case where cid="+cid);

	if(!rs.next())
         {
           sn= st.executeUpdate("insert into case values("+cid+",'"+desc+"','"+ctype+"')");
            %><jsp:forward page="sucess.html" />
      <% } 
         else
         { %>
         <br><br><font face="arial" color="white">The cid already exists 
         <a href="insertcase.html"><font face="arial" color="green">Try again</a>
        <% }   	
     
	st.close();
	con.close();
}
	
	
else
{
	
     out.println("<h3><font color=green><i><center>You must Enter Full Data");
%>
<br><br><input type=button value="Back" onclick="history.back()">
<%
}
%>