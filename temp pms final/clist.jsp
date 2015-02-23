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
<font face="arial" color="green">

<%
        Integer id=Integer.parseInt(request.getParameter("caseid"));
	
        Integer cid;
        String descr,ctype;
	

	Statement st=null;
        ResultSet rs=null;        
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:PrisonSYS");
         
        st =con.createStatement();
	rs=st.executeQuery("select * from case where cid="+id);
    
	if(rs.next())
	{
		 cid=Integer.parseInt(rs.getString(1));
		 descr=rs.getString(2);
		 ctype=rs.getString(3);
                 		
     %>  <br><br><font face="arial black" color="red">Case Details are..</font> 
	<br><br><br>
	<center>
        <table border=1>
	<tr> <td width=200 align=left><font face="arial" color="white"> Case Id		
	   <td align=center><font face="arial" color="white"><%=cid%>  </tr>
	<tr> <td width=200 align=left><font face="arial" color="white"> Description		
	   <td align=center><font face="arial" color="white"><%=descr%>  </tr>
	 <tr> <td width=200 align=left> <font face="arial" color="white">Case Type	
	   <td align=center><font face="arial" color="white"><%=ctype%>  </tr>
        

      <%
	}
       else
       { %>
        <center><br><br><br><font face="comic sans ms" color="white">Please enter the valid case id <br>
        <a href="casereg.html"><font face="comic sans ms" color="red">Re-enter</a>   
       <%
       }
	
	rs.close();
	st.close();
        con.close();

%>
</table>
 <br><br><a href="jailorser.html"><font face="comic sans ms" color="red">Back to jailor services</a></center>
</center><a href="jout.html"><font face="arial" color="white" size=2>Logout</font></a>
 

</body>
</html>
