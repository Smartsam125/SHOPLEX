<%-- 
    Document   : signUp
    Created on : Aug 5, 2022, 7:39:45 PM
    Author     : Kirabo Isaac Buyondo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        <link rel="stylesheets/css" href="design.css">
    </head>
    <body >
        
        
        <%
//            String userName = (String)session.getAttribute("userName");
////            String email = (String)session.getAttribute("email");
//            String password = (String)session.getAttribute("password");
                String userName = request.getParameter("userName");
                String errorMessage = request.getParameter("errorMessage");
                String email = request.getParameter("email");
        %>
        
        <h2><i><%=errorMessage%></i></h2>
        
        <div class="main">
            <div class='signup'>
                <form action="signUpContinued.jsp" method="post">
                <b>
                    User Name<br>
                    <input type="text" name="userName" placeholder="Input a user name" value="<%=userName%>" required><br><br>
                    
                    Email<br>
                    <input type="text" name="email" placeholder="Input a user name" value="<%=email%>" required><br><br>
                    
                    Password<br>
                    <input type="password" name="password" placeholder="*****" autofocus><br><br>
                    
                    Confirm Password<br>
                    <input type="password" name="password" placeholder="*****"><br><br>                    
                    
                    <input type="submit" value="Next">
                    
                </b>
                </form>
                
                
                
            </div>
            
            
        </div>
    </body>
</html>
