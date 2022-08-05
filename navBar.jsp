<%-- 
    Document   : navBar
    Created on : Aug 4, 2022, 5:54:30 PM
    Author     : KGM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
           <div class="topbar">
            <div class="logo">
                <h2>Shoplex</h2>
            </div>
            <div class="search">
                <input type="text" name="search" placeholder="search here">
                <label for="search"><i class="fas fa-search"></i></label>
            </div>
            <i class="fas fa-bell"></i>
            <div class="user">
                <img src="img/user.png" alt="">
            </div>
        </div>
    </body>
</html>
