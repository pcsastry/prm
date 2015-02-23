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
if(request.getParameter("vname").length()!=0 &&
            request.getParameter("pname").length()!=0 &&
                request.getParameter("rdate").length()!=0)
{
	
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:PrisonSYS");
		     	
	Statement st=con.createStatement();
		
	String vname=request.getParameter("vname");
	String pname=request.getParameter("pname");
	String rdate=request.getParameter("rdate");
        String status;
        
        int sn=0; 
        ResultSet rs=st.executeQuery("select status from visitors where vname='"+vname+"' and rdate='"+rdate+"' and pname='"+pname+"'");

        if(rs.next())
       {
          status=rs.getString(1);
 
       %>
         <font face="arial"><h1><font face="arial" color="White"> Your status is <%=status%>
       <%
       }
        else
       { %>
        
        <center> <font face="arial" color="red"><h4><font face="arial" color="white"> Your request has been under processing or you are not registered.<br>
         Please try again later.<h4></font><br>
        <a href="visitorservices.html"><b><font face="arial" color="green"> Back to visitor services </a>

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
<br></h1><b>
<a href="visitorservices.html"><b><font face="arial" color="white">Backt to visitor services</a></center>
<a href="vout.html"><b><font face="arial" color="green">Log-out</font>
</body>
</html>