<%-- 
    Document   : signUpContinued
    Created on : Aug 5, 2022, 10:46:00 PM
    Author     : Kirabo Isaac Buyondo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
    </head>
    <body>
        <div class="main">
            <div class='signup'>
                
                <%
                    java.util.Date d = new java.util.Date();
                out.println(d.toString());
                
                    String userName = request.getParameter("userName");
                    String email = request.getParameter("email");
                    String password1 = request.getParameter("password1");
                    String password2 = request.getParameter("password2");
                    
                    String emailExist = null;
                    
                    
                    session.setAttribute("userName",userName);
                    session.setAttribute("email",email);
                    session.setAttribute("password",password1);
                    
//                    response.sendRedirect("signUpContinued");
            %>
                
            <%@include file="connection.jsp" %>
            <%
                ResultSet rs = st.executeQuery("SELECT  COUNT(email) FROM customers WHERE email = '"+email+"'");
                
                rs.next();
                if(rs.getInt(1)>0){
                    %>
                    <jsp:forward page="signUPRedirect.jsp">
                        <jsp:param name="userName" value="${userName}"/>
                        <jsp:param name="errorMessage" value="The email is already registered"/>
                    </jsp:forward>
                        
                <%
                }
                if(password1!=password2){%>
                        <jsp:forward page="signUPRedirect.jsp">
                        <jsp:param name="userName" value="${userName}"/>
                        <jsp:param name="email" value="${email}"/>
                        <jsp:param name="errorMessage" value="The passwords are not matching"/>
                    </jsp:forward>
                        
                   <%     
                }
            %>
                

            <i><h4>Hello <%=userName%>, complete registration by filling the details here</h4></i>
                <form action="signUpInsertion.jsp" method="post">
                <b>
                    Gender<br>
                    <input type="radio" name="gender" value="M">Male
                    <input type="radio" name="gender" value="F">Female <br><br>
                    
                    
                    Date of Birth<br>
                    <input type="date" name="dob" placeholder="Date of birth"><br><br>
                    
                    Where do you stay?<br>
                    <input type="text" name="location" placeholder="Enter where you stay"><br><br> 
                    
                    
                    <input type="submit" value="Register">
                </b>
                </form>
            
            </div>
        </div>    
    </body>
</html>
