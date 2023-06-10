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
        <h2><i>Fill in the details to create an account</i></h2>
        
        <div class="main">
            <div class='signup'>
                <form action="signUpContinued.jsp" method="post">
                <b>
                    User Name<br>
                    <input type="text" name="userName" placeholder="Input a user name" required><br><br>
                    
                    Email<br>
                    <input type="text" name="email" placeholder="Input a user name" required=><br><br>
                    
                    Password<br>
                    <input type="password" name="password" placeholder="*****"><br><br>
                    
                    Confirm Password<br>
                    <input type="password" name="password" placeholder="*****"><br><br>                    
                    
                    <input type="submit" value="Next">
                    
                </b>
                </form>
                
                
                
            </div>
            
            
        </div>
    </body>
</html>
