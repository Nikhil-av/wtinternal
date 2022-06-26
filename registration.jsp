<%@ page session = "true"  language = "java" contentType = "text/html" %>
<%@ page import = "java.io.*,java.sql.*, java.util.*" %>

<%
    String userName = request.getParameter("username");
    String email = request.getParameter("email");
    String mobileNo = request.getParameter("mobileno");
    String password = request.getParameter("password");
    try{

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cse1", "root","");
            Statement st = con.createStatement();
            int up = st.executeUpdate("insert into userdata(username, email, mobileno, password) values ('"+userName+"', '"+email+"', '"+mobileNo+"', '"+password+"')");
    session.setAttribute("u_name","username"); 
            out.println("Data is successfully inserted.......");
%>
sessionStorage.setItem("Email","data");
            <jsp:forward page="login.html"/>
<%
    }
    catch(Exception e){
        out.println(e);
        e.printStackTrace();
    }
    finally{
        out.close();
    }

%>