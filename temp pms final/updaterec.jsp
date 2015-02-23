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

        ResultSet rs=st.executeQuery("select pid from prisoner where pid="+pid+"");
        
        if(rs.next())
        {
         
        int sn=0;
           sn= st.executeUpdate("update prisoner SET cid="+cid+",pname='"+pname+"',sex='"+sex+"',entry='"+entry+"',exit='"+exit+"',ht="+ht+",wt="+wt+",addr='"+addr+"',status='"+status+"' where rs="+pid);
            %><jsp:forward page="sucess.html" />
      <%   
        }
        else
         out.println("pid doesn't exist");
           
         %>
        <%   	
     
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