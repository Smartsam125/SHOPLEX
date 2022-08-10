<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
<%@page import="java.sql.*" %>
<%@include file="connection.jsp" %>
<%@include file="navbar.jsp" %>
   <%String search = request.getParameter("searchitems");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <title></title>
    </head>
    <body>
         
       
        
        
         <%
           
       
            
    Statement st = connection.createStatement();
    ResultSet rs = st.executeQuery("SELECT COUNT(productId) FROM PRODUCTS WHERE productName REGEXP '"+search+"'");
    rs.next();
    
            
            if(rs.getInt("COUNT(productId)")>0){
            Statement stNew = connection.createStatement();         
            ResultSet rsNew = st.executeQuery("SELECT * FROM PRODUCTS WHERE productName REGEXP '"+search+"'");%>
             <div class="container">
                                <div class="card-header my-3 h1">HERE ARE YOUR SEARCH </div>
                                <div class="row">
            
         <%
            
            
            while(rsNew.next()){
                    %>
                  
                            <div class="col-md-3 my-3">
                                        <div class="card w-100" style="width:18rem;">
                                            <img class="card-img-top" src="/SHOPLEXMAIN/images/<%=rsNew.getString("imagesource")%>" alt="Car">
                                            <div class="card-body">
                                                <h5 class="card-title"><%=rsNew.getString("productName")%></h5>
                                                <h6 price="price">Price:UGX <%=rsNew.getString("unitPrice")%></h6>
                                                <div class="mt-3 d-flex justify-content-between">
                                                    <% if(username!=null){%>
                                                     <a href="/SHOPLEXMAIN/AddToCartServlet?id=<%=rsNew.getInt("productId")%>" class="btn btn-primary">AddToCart</a>
                                                     <a href="likes.jsp?productId=<%out.println(rsNew.getInt("productId"));%>" ><i class="bi bi-hand-thumbs-up">Like</i> </a>
                                                    <%} else{%>
                                                    <a href="/SHOPLEXMAIN/AddToCartServlet?id=<%=rsNew.getInt("productId")%>" class="btn btn-primary">AddToCart</a>
                                                   
                                                     <a href="likes.jsp?productId=<%out.println(rsNew.getInt("productId"));%> "id="disable"><i class="bi bi-hand-thumbs-up">Like</i></a><%
//                                                     session.setAttribute("productId",p.getId());
                                                   %>
                                                   <%}%>
                                                </div>
                                               
                                              
                                                
                                            </div>
                                            <!-- comment -->
                                        </div>
                                    </div>
                                               
                                        
                               
                              
                               

                   
                <%
                    }
               
         }
else{
    %>
      </div>
                                
                            </div>
                                     
    <center>
        <img src="noResultsFound.jpg" width="200px" height="200px" alt="alt"/>
        <h4 style="color: red"> Opps No Results found for the search "<%=search%>"</h4>
    </center>    
<%
}
%>

             
            
    </body>
</html>
