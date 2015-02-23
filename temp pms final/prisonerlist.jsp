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
<font face="comic sans ms" color="red">
<a href="jailorser.html"><font face="arial" color="green"><div align="left">Back</div></a>
 <a href="jout.html"><font face="arial" color="white" size=2><div align="right">Logout</div></font></a>
<form action="details.jsp">
<%
 	     Integer pid;
	    String pname;
		 
         
         ResultSet rs=null;
         
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:PrisonSYS");
         
        

         String query="select pid,pname from prisoner"; 
        
         
         PreparedStatement pst=con.prepareStatement(query);
	     rs=pst.executeQuery(); %>
        <br>
            <font color=green><h2>The list of prisoners details </font>		<center>
<table border=1>
<tr height=20>
    	<th width=200><b><font face="times newroman" color="red">PRISONER ID
	    <th width=400><b><font face="times newroman" color="red">PRISONER NAME  
</tr>
<br>
 <%        while(rs.next())
	{
         
		pid=Integer.parseInt(rs.getString(1));
		pname=rs.getString(2);
		
		
%>
<tr>
	<th align="center"><font face="arial" color="white"><%=pid%>
	<th align="center"><font face="arial" color="white"><%=pname%>
	
</tr>

<%				
	}
	
	rs.close();
        pst.close();
	

%>
</table>
<br><br><font face="arial" color="white"><h3>Pass the prisoner name here to get the details 
<input type="text" name="pname" size=20>
<INPUT TYPE="submit" value="submit">
<br><br>

</body>
</html>