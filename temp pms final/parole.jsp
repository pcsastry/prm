<HTML>
<%@ page import="javax.sql.*,java.sql.*" %>
<%@ page session="true"%>


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
   
   Integer pid,days;
   String rname,addr,lastvisit;
         Statement st=null;
         ResultSet rs=null;
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:PrisonSYS");

         st =con.createStatement();
 		 
	 rs=st.executeQuery("select * from parole");
         
 %>
 <br><font color=green><h2>The Parole register </font><br><br>
		<center>
<table border=1>
<tr height=20>
    	<th width=200><font face="times new roman" color=red>PRISONER ID
	    <th width=400><font face="times new roman" color=red>REFEREE NAME 
		<th width=400><font face="times new roman" color=red>REFEREE ADDRESS
     	<th width=400><font face="times new roman" color=red>REMAND FREQUENCY DAYS
		<th width=400><font face="times new roman" color=red>LAST VISIT
</tr>
<br>
 <%        while(rs.next())
	{
         
		pid=Integer.parseInt(rs.getString(1));
		rname=rs.getString(2);
		addr=rs.getString(3);
		days=Integer.parseInt(rs.getString(4));
		lastvisit=rs.getString(5);
		
		
%>
<tr>
	<th align="center"><font face="arial" color="white"><%=pid%>
	<th align="center"><font face="arial" color="white"><%=rname%>
	<th align="center"><font face="arial" color="white"><%=addr%>
	<th align="center"><font face="arial" color="white"><%=days%>
	<th align="center"><font face="arial" color="white"><%=lastvisit%>
	
</tr>


<%				
	}
	
	rs.close();
	st.close();

%>
</table>
<center>
<br><br><a href="jailorser.html"><font face="arial" color="red">Back to jailor services</a></center>
</center></center><a href="jout.html"><font face="arial" color="white" size=2>Logout</font></a>
</body>
</html>
