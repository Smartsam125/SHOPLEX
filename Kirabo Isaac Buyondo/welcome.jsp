<%-- 
    Document   : welcome
    Created on : Aug 6, 2022, 8:05:38 PM
    Author     : Kirabo Isaac Buyondo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
    </head>
    <body>
        <%
            String loggedInEmail = session.getAttribute("Email").toString();
        %>
        
        <h1>Welcome:</h1>
        <h2><%=loggedInEmail%></h2>
    </body>
</html>
