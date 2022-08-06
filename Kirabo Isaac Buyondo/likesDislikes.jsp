<%-- 
    Document   : likesDislikes
    Created on : Aug 5, 2022, 6:53:11 AM
    Author     : Kirabo Isaac Buyondo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Likes Dislikes</title>
    </head>
    <body>
        <form action="/Shoplex/likesDislikes.jsp" method="get">
            <input type="submit" value="Like">
            <input type="submit" value="Dislike">
        </form>
        
        <%@include file="connection.jsp" %>
        <%            
        ResultSet rs = st.executeQuery("SELECT Likes FROM products WHERE productId = 1");
        rs.next();
        int NewLikes = rs.getInt(1)+1;
        st.executeUpdate("UPDATE products SET Likes = "+NewLikes+" WHERE productId = 1");
        %>
        
        
    </body>
</html>
