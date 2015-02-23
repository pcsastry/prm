<HTML>
<%@ page import="javax.sql.*,java.sql.*" %>
<%@ page session="true"%>
<HEAD>
<TITLE>Approved Visitors </TITLE>

</HEAD>

<BODY background="stripe.gif">
    

<%
 	     String pname,vname,rdate,status;
		 
         Statement st=null;
         ResultSet rs=null;
         
         Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:PrisonSYS");
         
         st =con.createStatement();

         String query="select vname,pname,rdate,status from visitors where status='Approved'"; 
         st=con.createStatement();
	     rs=st.executeQuery(query); %>

       <br><font color=green><h2>The list of Approved Visitors </font><br><br>
		<center>
<table>
<tr height=20>
    	<th width=200><u><i>VISITOR NAME
	<th width=400><u><i>PRISONER NAME  
        <th width=200><u><i>REGISTERED DATE
          
</tr>
 <br>

 <%        while(rs.next())
	{
         
		vname=rs.getString(1);
		pname=rs.getString(2);
                rdate=rs.getString(3);
                		
%>
<tr><font color="red">
	<th align="center"><%=vname%>
	<th align="center"><%=pname%>
        <th align="center"><%=rdate%>
	
</tr>

<%				
	}
	
	rs.close();
	st.close();

%>

<br><br>
</table><center>
<a href="visitorservices.html">Back to vistor services.</a>
 </body>
</html> 