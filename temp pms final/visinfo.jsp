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
<form method="post" action="givestatus.jsp">

<%
             
         String vname,pname,rdate,rel,status;
         Statement st=null;
         ResultSet rs=null;
         
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:PrisonSYS");         

         st =con.createStatement();

         String query="select * from visitors";
         st=con.createStatement();
	 rs=st.executeQuery(query);
 
     %> <h3><font face="arial" color="green">Visitors details </font></h3>
        <br>
        <center>
        <table border=1>
        <tr>
    	
	    <th width=200><font face="times new roman" color="red">VISITOR NAME
            <th width=200><font face="times new roman" color="red">PRISONER NAME
            <th width=200><font face="times new roman" color="red">REGISTERED DATE
            <th width=200><font face="times new roman" color="red">STATUS  
</tr>
    
   <%	while(rs.next())
	{
		 vname=rs.getString(1);
		 pname=rs.getString(2);
		 rdate=rs.getString(3);
                 status=rs.getString(4);
		
	%>   
	<tr>
	     <th align="center"><font face="arial" color="white"><%=vname%>
	     <th align="center"><font face="arial" color="white"><%=pname%>
	     <th align="center"><font face="arial" color="white"><%=rdate%>
             <th align="center"><font face="arial" color="white"><%=status%> 
</tr>

      <%
	}
	
	rs.close();
        st.close();
	con.close();

%>
 </table>
<br>
<center>
<font face="arial" color="green"><h3> Give the status to requesting visitors </h3></font><br>
<table width=400>
<tr><td><span class="style2">Visitor name </td><td><input type="Text" size=20 name="vname"></td></tr>
<tr><td><span class="style2">Prisoner name</td><td><input type="Text" size=20 name="pname"></td><tr>
<tr><td><span class="style2">Registered date</td><td><input type="Text" size=20 name="rdate"></td></tr>
<tr><td><span class="style2">Set Status </td><td><input type="Text" size=20 name="status"></td></tr>
<tr><td></td><td><input type="submit" value="Give status"> <input type="reset"></td></tr>
</table>
 <br><br><a href="jailorser.html"><font face="arial" color="green">Back to jailor services</a></center>
</center><a href="jout.html"><font face="arial" color="white" size=2>Logout</font></a>

</body>
</html>
