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
                request.getParameter("rel").length()!=0 ||
                      request.getParameter("date").length()!=0 ||
                           request.getParameter("addr").length()!=0 )



{
	
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:PrisonSYS");
		     	
	Statement st=con.createStatement();
		
	String vname=request.getParameter("vname");
	String pname=request.getParameter("pname");
	String relation=request.getParameter("rel");
	String rdate=request.getParameter("date");
        String addr=request.getParameter("addr"); 
        String status="Pending";
        int sn=0; 
        ResultSet rs=st.executeQuery("select rdate from visitors where vname='"+vname+"'");
         if(!rs.next())
         {
           sn= st.executeUpdate("insert into visitors values('"+vname+"','"+pname+"','"+rdate+"','"+status+"')");
            %><jsp:forward page="entered.html" />
      <% } 
        
         else
         { %>
         <br><br><font face="arial" color="white">The date u you entered is already registered 
         <a href="register.html"><font face="arial" color="green">Try again</a>
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