
 
       
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
 <% //session=request.getSession();
     String username = (String)session.getAttribute("username");
     
   %>
     

        <nav class="navbar navbar-expand-lg navbar-light bg-light ">
            
            
            <div class="container">
                <a href="#" class="navbar-brand">
                    <span class="fw-bold text-secondary ">
                        <h3 style="color: green;">SHOPLEX&copy</h3>
                    </span>
                </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#main-nav"aria-controls="main-nav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-brand-icon"></span>
                    </button>
                    
                    <div class="collapse navbar-collapse justify-content-end align-center" id="main-nav">
                        <ul class="navbar-nav ml-auto">
                             <li class="nav-item">
                                 <a class="nav-link" href="SAMSon"></a></li>
                            <%if(username!= null){%>
                               <li class="nav-item">
                                <a href="/SHOPLEXMAIN/jsps/welcome.jsp" id="samson" class="nav-link" target="blank">Home</a>
                            </li>
                                   
                             <li class="nav-item">
                                 <a href="/SHOPLEXMAIN/jsps/orderForm.jsp" class="nav-link"> <i class="bi bi-cart">Cart</i><span class="badge badge-light" style="color:red;">${cart_list.size()}</span></a>
                            </li>
                              <li class="nav-item">
                                <a href="/SHOPLEXMAIN/logout" class="nav-link">LogOut</a>
                            </li>
<!--                             <li class="nav-item">
                                <a href="search.jsp" class="nav-link">search</a>
                            </li>-->
<form class="form-inline my-2 my-lg-0" action="search.jsp" method="GET">
    <div class="input-group">
        <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="search" name="searchitems">
    <div class="input-group-prepend">
        <input class="btn btn-outline-warning my-2 my-sm-0" type="submit" value="SEARCH">
    </div>
    </div>
</form>
                            <%} else{%>
                              <li class="nav-item">
                                <a href="/SHOPLEXMAIN/jsps/welcome.jsp" id="samson" class="nav-link" target="blank">Home</a>
                            </li>
                                   
                           
                            
                            <li class="nav-item">
                                <a href="/SHOPLEXMAIN/jsps/signin.jsp" id="samson" class="nav-link" target="blank"><i class="bi bi-person">Account</i></a>
                            </li>
                                     <li class="nav-item">
                                         <a href="/SHOPLEXMAIN/jsps/orderForm.jsp" class="nav-link"> <i class="bi bi-cart">Cart</i><span class="badge badge-light" style="color:red;">${cart_list.size()}</span></a>
                            </li>
     <form class="form-inline my-2 my-lg-0" action="search.jsp" method="GET">
    <div class="input-group">
        <input class="form-control mr-sm-2" type="text"  name="searchitems" >
    <div class="input-group-prepend">
        <input class="btn btn-outline-warning my-2 my-sm-0" type="submit" value="SEARCH">
    </div>
    </div>
</form>
       

                            <%}%>
                            
                           
                            
                        </ul>
                            
                        
                    </div>
                
            </div>
            
        </nav>
                    