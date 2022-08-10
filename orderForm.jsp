<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%@page import="com.connection.Conn" %>
<%@page import="connectionObect.*" %>
<%@page import="user.Cart,user.product,user.AddToCartServlet" %>
<%@page import="java.util.*" %>

<% 
     ArrayList<Cart> cart_list =(ArrayList<Cart>)session.getAttribute("cart-list");
     List<Cart> cartProduct =null;
  
     if(cart_list !=null){
     QuerryProducts Items =new QuerryProducts(Conn.getConnection());
       cartProduct = Items.getCartProducts(cart_list);
       double total =Items.getTotalPrice(cart_list);
       request.setAttribute("cart_list",cart_list);
       request.setAttribute("total",total);
       
     
     }
   %>
   <%@include file="navbar.jsp"%>
     
<!DOCTYPE html> 
         
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">
    .table tbody td{
        vertical-align: middle;
        
    }
    .btn-decre .btn-decre{
        box-shadow: none;
        font-size: 25px;
        
    }
</style>

        <title>Cart</title>
        
    </head>
    <body>
        
       
         
         <div class="container">
           
                 <div class="d-flex py-3">
                     <h3>TotalPrice:UGX${(total>0)?total:0}</h3>
                    
                       
                         
                           <a href="/SHOPLEXMAIN/CheckOut"class="mx-3 btn btn-primary">CompletePurchase</a>
                 </div>
                 <table class="table table-longt">
                     <thead class="thead-dark">
                         <tr>
                            
                             <th scope="col">Name</th>
                             <th scope="col">Photo</th>
                             <th scope="col">Price</th>
                             <th></th>
<!--                             <th scope="col">BuyNow</th>-->
                             <th scope="col">Cancel</th>
                         </tr> 
                     </thead>
                     <tbody>
                     <%if(cart_list!=null){ 
                     for(Cart c:cartProduct){%>
                      <tr>
                     <td><%=c.getProductName()%></td>
                     <td><img src="/SHOPLEXMAIN/images/<%=c.getImagesource()%>" height='150px' width="150px" alt=""></td>
                     <td><%=c.getUnitprice()%></td>
                     
                     <td>
                         <form action="/SHOPLEXMAIN/InsertData" method="post" class="form-inline">
                             <input type="hidden" name="id" value="<%=c.getProductName()%>" class="form-iput"><!-- comment -->
                             <div class="form-group d-flex justify-content-between w-50">
                                 <a class="btn btn-sm btn-decre" href="/SHOPLEXMAIN/CheckButtons?action=dec&id=<%=c.getId()%>"><i class="fas fa-minus-square"></i></a>
                                 <input type="number" name="quantity" class="form-control w-50" value="<%=c.getQuantity()%>" readOnly/>
                                 <a class="btn btn-sm btn-incre" href="/SHOPLEXMAIN/CheckButtons?action=inc&id=<%=c.getId()%>"><i class="fa fa-plus-square" aria-hidden="true"></i></a>
                                 <button type="submit" class="btn btn-secondary btn-sm" style="border-radius:25px;">BUY</button>
                                 
                             </div>
                             
                         </form>
                     </td>
                     <td ><a href="/SHOPLEXMAIN/RemoveFromCart?id=<%=c.getId()%>" class="btn btn-sm btn-success display-1">UnDO</a></td>
                     <!-- comment -->
                         </tr>
                        <% } %>
                      
                        <%
                         }%>
                        
                     
                     </tbody>
                 </table>
                 
             
             
         </div>
         
         
         
        
        
       
     
        <a href="welcome.jsp"></a>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/js/all.min.js" integrity="sha512-8pHNiqTlsrRjVD4A/3va++W1sMbUHwWxxRPWNyVlql3T+Hgfd81Qc6FC5WMXDC+tSauxxzp1tgiAvSKFu1qIlA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    </body>
</html>
