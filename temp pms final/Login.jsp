



<HTML>
<%@ page import="javax.sql.*,java.sql.*" %>
<%@ page session="true"%>




<HEAD>
<TITLE>Login Document </TITLE>

</HEAD>

<BODY BGCOLOR="#FFddbb">

<%

try{
         String login=request.getParameter("id");
         String password=request.getParameter("pass");
         System.out.println("login..."+login);
         System.out.println("password..."+password);
         System.out.println("1111111111");

         Statement st=null;
         ResultSet rst=null;

         Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:PrisonSYS");
         st =con.createStatement();
         System.out.println("Connected");


         rst=st.executeQuery("select name,password from jailor");
         out.println("Connected");

while (rst.next())
{
 out.println("333333333333333");
 String loginname=rst.getString("name");
 String pass=rst.getString("password");
if(loginname.equalsIgnoreCase(login)&& pass.equalsIgnoreCase(password))
{   
 out.println("inside if.........");
  System.out.println("Sucessful.");
  break;
}
else
{ 
 System.out.println("Not success");
}
}
}catch(Exception e){out.println(e);}
%>
