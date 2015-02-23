<%@ page language="java" import="java.sql.*,java.lang.*" %>

<HTML>
<head>
<title> Prison Management System </title>
</head>
<body background="bg-grid.jpg">
<br>
<center>
<img src="pms.bmp"> 
<font face="comic sans ms" color="red">
</center>

<% 	
if(request.getParameter("vname").length()!=0 &&
request.getParameter("pass").length()!=0 &&
request.getParameter("addr").length()!=0 &&
request.getParameter("ph").length()!=0)

{
	

       Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:PrisonSYS");
		     	
	Statement st=con.createStatement();
		
	String name=request.getParameter("vname");
	String pass=request.getParameter("pass");
	String addr=request.getParameter("addr");
	Integer ph=Integer.parseInt(request.getParameter("ph"));
        int sn=0; 
        ResultSet rs=st.executeQuery("select vname from vidpas where vname='"+name+"'");

	if(!rs.next())
         {
           sn= st.executeUpdate("insert into vidpas values('"+name+"','"+pass+"','"+addr+"',"+ph+")");
            %><jsp:forward page="created.html" />
      <% } 
        
         else
         { %>
         <br><br><center>The name already exists 
         <a href="vissign.html">Try again</a></center>
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