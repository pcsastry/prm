<HTML>
<%@ page import="javax.sql.*,java.sql.*" %>
<%@ page session="true"%>




<HEAD>
<TITLE>Login Document </TITLE>

</HEAD>

<BODY>

<%

try{
       


         String login=request.getParameter("id");
         String pwd=request.getParameter("pass");

         System.out.println("login..."+login);
         System.out.println("password..."+pwd);
         

         Statement st=null;
         ResultSet rs=null;
         out.println("one");
         Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	 Connection con = DriverManager.getConnection("jdbc:odbc:PrisonSYS");
         out.println("two");
         st =con.createStatement();

         String query="select * from jailor where name='"+login+"' and password='"+pwd+"'";
         st=con.createStatement();
	 rs=st.executeQuery(query);
	
	if(rs.next())
	{
%>
		<jsp:forward page="jailorser.html" />
<%
	}
	else
	{
%>
		 <jsp:forward page="Admlogfail.html" />
<%
	}
	}
	catch(Exception e)
	{
		System.out.println("ERROR>>>>>Database Not Availble");
		e.printStackTrace();
	}
%>
</body>
</html>