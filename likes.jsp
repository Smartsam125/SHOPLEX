<%-- 
    Document   : likes
    Created on : Aug 5, 2022, 6:53:11 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%--<%@page import="com.connection.Conn"%>--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Likes</title>
    </head>
    <body>
        

<!--        <form action="/Shoplex/likes.jsp" method="get">
            <input type="submit" value="Like">
        </form>-->
        <%@include file="connection.jsp" %>
        
        <%
            int productId = Integer.parseInt(request.getParameter("productId"));
        Statement st=connection.createStatement();
       
        
        ResultSet rs = st.executeQuery("SELECT likes FROM products WHERE productId = "+productId);
        rs.next();
        int NewLikes = rs.getInt(1)+1;
        
        st.executeUpdate("UPDATE products SET likes = "+NewLikes+" WHERE productId = "+productId);
        response.sendRedirect("welcome.jsp");
        %>
        
        
    </body>
</html>
