<%-- 
    Document   : welcome
    Created on : Aug 3, 2022, 8:04:40 PM
    Author     : hm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.connection.Conn"%>
<%@page import="connectionObect.QuerryProducts"%>
<%@page import="user.product"%>
<%@page import="java.util.*"%>
<%@page import="user.*" %>


<%   //out.println(Conn.getConnection());
    
    //String username=(String)session.getAttribute("username");
    
QuerryProducts pdts =new QuerryProducts(Conn.getConnection());
List<product>  products = pdts.getAllProducts();
 ArrayList<Cart> cart_list =(ArrayList<Cart>)session.getAttribute("cart-list");
   
  
     if(cart_list !=null){
      
       request.setAttribute("cart_list",cart_list);
    }
%>
<!DOCTYPE html>

<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="navbar.jsp" %>
        

        <title>products</title>
    </head>
    <body>
        
        <!-- Querrying user results from the database -->                        
                            <div class="container bg-muted">
                                <div class="card-header my-3 ">CURRENT PRODUCTS </div>
                                <div class="row">
                                    <% if(!products.isEmpty()){
                                    for(product p:products){
                                        %>
                                    <div class="col-md-3 my-3">
                                        <div class="card w-100  border-0 bg-muted" style="width:18rem;outline: none;">
                                            <img class="card-img-top" src="/SHOPLEXMAIN/images/<%=p.getImagesource()%>" alt="<%=p.getProductName()%>">
                                            <div class="card-body">
                                                <h5 class="card-title"><%=p.getProductName()%></h5>
                                                <h6 price="price">Price:UGX <%=p.getUnitprice()%></h6>
                                                <h7><%=p.getDescription()%></h7>
                                                <div class="mt-3 d-flex justify-content-between">
                                                    <% if(username!=null){%>
                                                     <a href="/SHOPLEXMAIN/AddToCartServlet?id=<%=p.getId()%>" class="btn btn-primary">AddToCart</a>
                                                     <a href="likes.jsp?productId=<%out.println(p.getId());%>" ><i class="bi bi-hand-thumbs-up" >Like</i></a>
                                                    <%} else{%>
                                                    <a href="/SHOPLEXMAIN/AddToCartServlet?id=<%=p.getId()%>" class="btn btn-primary">AddToCart</a>
                                                   
                                                     <a href="likes.jsp?productId=<%out.println(p.getId());%> "id="disable"><i class="bi bi-hand-thumbs-up">Like</i></a><%
//                                                     session.setAttribute("productId",p.getId());
                                                   %>
                                                   <%}%>
                                                </div>
                                               
                                              
                                                
                                            </div>
                                            <!-- comment -->
                                        </div>
                                    </div>
                                        <%}}%>
                               
                                </div>
                                
                            </div>
                                        <script>
                                            var button=document.getElementById("disable");
                                            button.addEventListener("click",Dis,false);
                                            function Dis(){
                                                button.disabled=true;
                                            }
                                            
                                        </script>
      
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    </body>
</html>
