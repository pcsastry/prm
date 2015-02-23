<HTML>
<%@ page import="javax.sql.*,java.sql.*" %>
<%@ page session="true"%>
<head>
<title> Prison Management System </title>
</head>
<body background="bg.jpg">
<br>
<center>
<img src="TITLE1.bmp">
<font face="comic sans ms" color="red">
<h4><marquee>What's going on behind the walls ??? </marquee></h4></font>
</center>

<form action="details.jsp">
<%
 	     String pid;
		 String pname;
		 
         Statement st=null;
         ResultSet rs=null;
         
         Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:PrisonSYS");
         
         st =con.createStatement();

         String query="select pid,pname from prisoner"; 
         st=con.createStatement();
	     rs=st.executeQuery(query); %>
        <br><font color=green><h2>The list of prisoners details </font><br><br>
		<center>
<table>
<tr height=20>
    	<th width=200><u><i>PRISONER ID
	    <th width=400><u><i>PRISONER NAME  
</tr>
<br>
 <%        while(rs.next())
	{
         
		pid=rs.getString(1);
		pname=rs.getString(2);
		
		
%>
<tr>
	<th align="center"><%=pid%>
	<th align="center"><%=pname%>
	
</tr>

<%				
	}
	st.close();
	rs.close();
	

%>
</table>
<br><br><br><br>Pass the prisoner name here to get the details 
<input type="text" name="pname" size=20>
<INPUT TYPE="submit">

</body>
</html>