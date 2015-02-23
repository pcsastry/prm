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
if(request.getParameter("pid").length()!=0 &&
request.getParameter("rname").length()!=0 &&
request.getParameter("addr").length()!=0 &&
request.getParameter("days").length()!=0 &&
request.getParameter("date").length()!=0)

{
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:PrisonSYS");
		     	
	Statement st=con.createStatement();
		
	Integer pid=Integer.parseInt(request.getParameter("pid"));
	String rname=request.getParameter("rname");
	String addr=request.getParameter("addr");
        Integer days=Integer.parseInt(request.getParameter("days"));
        String date=request.getParameter("date");       
        
        int sn=0; 
        ResultSet rs=st.executeQuery("select pid from parole where pid="+pid);
        
       if(!rs.next())
         {
           sn= st.executeUpdate("insert into parole values("+pid+",'"+rname+"','"+addr+"',"+days+",'"+date+"')");
            %><jsp:forward page="sucess.html" />
      <% } 
         else
         { %>
         <br><br><font face="arial" color="white">The pid already exists 
         <a href="insertparole.html"><font face="arial" color="red">Try again</a>
        <% }   	
     
	st.close();
	con.close();
}
	
	
else
{
	out.println("<h3><font color=red><i><center>You must Enter Full Data");
%>
<br><br><input type=button value="Back" onclick="history.back()">
<%
}
%>
