<%@ page language = 'java' contentType = "text/html; charSet = ISO-8859-1" pageEncoding = "ISO-8859-1" %>
<%@ page import = "java.sql., java.util." %>

<%
        String userName = request.getParameter("username");
        String password = request.getParameter("password");

        try{

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3360/users", "root", "");
            PreparedStatement ps = con.prepareStatement("select * from userdata where username = ?");
            ps.setString(1, userName);
            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                String check = rs.getString("password");
                if(check.equals(password))
                    out.println("Welcome Back..!"+ rs.getString("username"));
                else
                    out.println("Invalid password..!");
            }
            else{
                out.println("Invalid User.....");
            }
        }
        catch(Exception e){
            System.out.print(e);
            e.printStackTrace();
        }
%>