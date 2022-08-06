<%-- 
    Document   : signUpInsertion
    Created on : Aug 6, 2022, 1:28:21 PM
    Author     : Kirabo Isaac Buyondo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.time.*,java.time.format.DateTimeFormatter,java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up</title>
    </head>
    <body> 
         <%@include file="connection.jsp" %>
        <%
                   // picking data from the sessions set at second form of data input in first form
                    String userName = session.getAttribute("userName").toString();
                    String email = session.getAttribute("email").toString();
                    String password = session.getAttribute("password").toString();
                    
                    String gender = request.getParameter("gender");
                    String dob = request.getParameter("dob");
                    String location = request.getParameter("location");
                    
                    
                    LocalDateTime ldt = LocalDateTime.now();
                 String creationDate =   DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.ENGLISH).format(ldt);

//            out.println(request.getParameter("gender")+"<br>");
//            out.println(request.getParameter("dob")+"<br>");
//            out.println(request.getParameter("location")+"<br>");
//            out.println(userName+"<br>");
//            out.println(email+"<br>");
//            out.println(password+"<br>");
//            

               
               
               if(st.executeUpdate("INSERT INTO customers(customerName, password, Gender, Location, Email, Date_of_Birth, creationDate) VALUES('"+userName+"','"+password+"','"+gender+"','"+location+"','"+email+"','"+dob+"','"+creationDate+"')") >0){
                out.println("Dear "+userName+" your account is created successfully");
            }
              
               
          
        %>
       
        
        
    </body>
</html>
