<%-- 
    Document   : loginIn
    Created on : Aug 6, 2022, 7:14:30 PM
    Author     : Kirabo Isaac Buyondo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h2><i>Login</i></h2>
        <div class="main">
            <div class="signup">
                
                <form action="login.jsp" method="post">
                    Email<br>
                    <input type="text" name="email" placeholder="Enter your email" required autofocus><br><br>
                    
                    Password<br>
                    <input type="password" name="password" placeholder="*****" required><br><br>
                    
                     <input type="submit" value="Login">
                </form>
                
            </div>
        </div>
        
        <%@include file="connection.jsp" %>
        <%
            
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
//            out.println("SELECT  Email, password FROM customers WHERE email = '"+email+"'");
            ResultSet rs = st.executeQuery("SELECT  Email, password FROM customers WHERE email = '"+email+"'");            
            rs.next();
            
            String storedPassword = rs.getString("password");
            
            
            if(password.equals(storedPassword)){
//            out.println("Equal");
                    session.setAttribute("Email", email);
                    response.sendRedirect("welcome.jsp");
                
            }
            
            else{
                    out.println("Please provide correct credentials");
            }
        %>
    </body>
</html>
