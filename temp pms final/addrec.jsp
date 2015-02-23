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
<body background="bg-grid.jpg">

<img src="pms.bmp">
<font face="arial" color="green">

<% 	
if(request.getParameter("pid").length()!=0 &&
request.getParameter("cid").length()!=0 &&
request.getParameter("pname").length()!=0 &&
request.getParameter("sex").length()!=0 && 
request.getParameter("entry").length()!=0 &&
request.getParameter("exit").length()!=0 &&
request.getParameter("ht").length()!=0 &&
request.getParameter("wt").length()!=0 &&
request.getParameter("addr").length()!=0 &&
request.getParameter("status").length()!=0 )

{
	

        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:PrisonSYS");
		     	
	Statement st=con.createStatement();
		
	Integer pid=Integer.parseInt(request.getParameter("pid"));
	Integer cid=Integer.parseInt(request.getParameter("cid"));
	String pname=request.getParameter("pname");
	String sex=request.getParameter("sex");
        String entry=request.getParameter("entry");
	String exit=request.getParameter("exit");
	Integer ht=Integer.parseInt(request.getParameter("ht"));
	Integer wt=Integer.parseInt(request.getParameter("wt"));
        String addr=request.getParameter("addr");
	String status=request.getParameter("status");

        int sn=0; 
        ResultSet rs=st.executeQuery("select pid from prisoner where pid="+pid);

	if(!rs.next())
         {
           sn= st.executeUpdate("insert into prisoner values("+pid+","+cid+",'"+pname+"','"+sex+"','"+entry+"','"+exit+"',"+ht+","+wt+",'"+addr+"','"+status+"')");
            %>
            <jsp:forward page="sucess.html" />
      <% } 
         else
         { %>
         <br><br><font face="arial" color="green">The pid already exists 
         <a href="inserpris.html">Try again</a>
        <% }   	
     
	st.close();
	con.close();
}
	
	
else
{
	out.println("<h3><i><center>You must Enter Full Data");
%>
<br><br><input type=button value="Back" onclick="history.back()">
<%
}
%>