<HTML>
<%@ page import="javax.sql.*,java.sql.*" %>
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

<%
        
	
	String pname,exitdate;
	

	Statement st=null;
        ResultSet rs=null;        
        
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:PrisonSYS");
         
        st =con.createStatement();
	rs=st.executeQuery("select distinct pname,exit from prisoner");

     %>    <h3><font face="arial" color="red">Release Diary </font></h3>
        <br>
       <center>
       <table border=1>
        <tr>
    	<th width=300><font face="times new roman" color="red">Prisoner Name
	    <th width=300><font face="times new roman" color="red">Release Date
             
</tr>
    
   <%	while(rs.next())
	{
		 pname=rs.getString(1);
		 exitdate=rs.getString(2);
		 
   %>   
	<tr>
	     <th align="center"><font face="arial" color="white"><%=pname%>
	     <th align="center"><font face="arial" color="white"><%=exitdate%>
	     
        </tr>

      <%
	}
	
	rs.close();
        st.close();
	con.close();

%>
 </table>
<center>
 <br><br><a href="jailorser.html"><font face="arial" color="green">Back to jailor services</a></center>
</center></center> <a href="jout.html"><font face="arial" color="white" size=2>Logout</font></a>

</body>
</html>

       