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
</center>

<%
   String name=request.getParameter("pname");
   Integer pid;
   String pname;
   Integer cid;
   String sex;
   String entrydate;
   String exitdate;
   Integer height;
   Integer weight;
   String address;
   String status;
   
        
         ResultSet rs=null;
         Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:PrisonSYS");
         
        String query="select * from prisoner where pname='"+name+"'";
        PreparedStatement pst =con.prepareStatement(query);
	 rs=pst.executeQuery();
         
 %>

 <%        if(rs.next())
	{
         
		pid=Integer.parseInt(rs.getString(1)); 
                cid=Integer.parseInt(rs.getString(2));
		pname=rs.getString(3);
		sex=rs.getString(4);
		entrydate=rs.getString(5);
		exitdate=rs.getString(6);
		height=Integer.parseInt(rs.getString(7));
		weight=Integer.parseInt(rs.getString(8));
		address=rs.getString(9);
		status=rs.getString(10);
		
%>

<center>
<font face="arial" color="green"><h2><b>
<%=name%>'s nominal roll </h2></font>
    <table border=1 >
	   <caption> <font face="arial" color="red"><b>Details </caption>
	   <tr> <td width=200 align=center><font face="arial" color="white"><b> Prisoner Id		
	   <td align=center><font face="arial" color="white"><%=pid%>  </tr>
	   <tr> <td align=center><font face="arial" color="white"> Prisoner Name	    
	   <td align=center><font face="arial" color="white"><%=pname%> </tr>
	   <tr> <td align=center><font face="arial" color="white"> Case Id		  
	   <td align=center><font face="arial" color="white"><%=cid%></tr>
	   <tr> <td align=center><font face="arial" color="white"> Sex				
	   <td align=center><font face="arial" color="white"><%=sex%></tr>
	   <tr> <td align=center><font face="arial" color="white"> Entry Date			
	   <td align=center><font face="arial" color="white"><%=entrydate%></tr>
	   <tr> <td align=center><font face="arial" color="white"> Exit Date			
	   <td align=center><font face="arial" color="white"><%=exitdate%></tr>
	   <tr> <td align=center><font face="arial" color="white"> Height (cms)				
	   <td align=center><font face="arial" color="white"><%=height%></tr>
       <tr> <td align=center><font face="arial" color="white"> Weight (kgs)
	   <td align=center><font face="arial" color="white"><%=weight%></tr>
	   <tr> <td align=center><font face="arial" color="white"> Adderss			
	   <td align=center><font face="arial" color="white"><%=address%></tr>
       <tr> <td align=center><font face="arial" color="white"> status
	   <td align=center><font face="arial" color="white"><%=status%></tr>

<%				
	}  
        else
        { %>
         <center><br><font face="arial" color="white">Give the valid prisoner name<br><br>
         <a href="prisonerlist.jsp"><font face="arial" color="green"> Back to prisoners list</a>
         <br>
     <% }  
	
	rs.close();
        pst.close();
	con.close();

%>
</table>
<center><br>
<a href="jailorser.html"><font face="arial" color="green"> Back to jailor services</a>
<br></center></center>
<a href="jout.html"><font face="arial" color="white" size=2>Logout</font></a>
 </body>
 </html>