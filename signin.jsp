
<%@page import="com.connection.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

 <%@page import="java.sql.DriverManager,java.sql.Statement,java.sql.ResultSet,java.sql.SQLException,java.sql.Connection" %>
<%@page import="java.util.*"%>
              <%! Connection conn=null;
    Statement  st=null;
    String    email;
    String    password;
    String em,ep;
                        
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
        <!-- Option 1: Include in HTML -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <title>signin</title>
    </head>
    
    
    <!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<style>
    
</style>
<body>
    
    
    <section class="h-100 gradient-form" style="background-color: grey;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-xl-10">
        <div class="card rounded-3 text-black" style="align-content:center;">
          <div class="row g-0">
            <div class="col-lg-6">
                <div class="card-body p-md-5 mx-md-4">

                <div class="text-center">
                    
                  
                  <h4 class="mt-1 mb-5 pb-1">Welcome To Shoplex</h4>
                </div>
                    
                   
                 <form action="/SHOPLEXMAIN/jsps/signin.jsp" method="GET">
                    <p class="h1" class="text" style="align-items:center">Log In</p>

                  <div class="form-outline mb-4" style="background">
                    <input type="email" id="form2Example11" class="form-control border border-sucess"
                      placeholder="email address"  name="email" />
                    <label class="form-label" for="form2Example11">Email</label>
                  </div>
                   
                  <div class="form-outline mb-4">
                       <div class="mb-4 input-group bg-color-muted">
                           <span class="input-group-text ">
                               <i class="bi bi-eye-slash " id="togglePassword"></i>
                           </span>
                    <input type="password" id="password" class="form-control" name="password"/>
                       </div>
                  </div>
                    <label class="form-label" for="password" >Password</label>
                     
                 

                  <div class="text-center pt-1 mb-5 pb-1">
                      <input type="submit" class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3"  name="button" value="LogIn">
                    <a class="text-muted" href="#!">Forgot password?</a>
                  </div>

                  <div class="d-flex align-items-center justify-content-center pb-4">
                    <p class="mb-0 me-2">Don't have an account?</p>
                    <button type="button" class="btn btn-outline-danger">Sign up</button>
                  </div>
                     <% email=request.getParameter("email");
                        password=request.getParameter("password");
                        try{
                        Class.forName("com.mysql.jdbc.Driver");
                      
                        try{
                       conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/shoplex","root","samson");
                       //out.println("Connected successfuly");
                        st =conn.createStatement();
                          String Query1 ="SELECT password,email from customers where"+" email="+"'"+email+"'"+"\t"+"and password="+"'"+password+"'"+";";
                         
                          
               ResultSet res= st.executeQuery(Query1);
               while(res.next()){
             
          ep=res.getString("password");
          em=res.getString("email");
        }
        //out.println(ep+em);
            if(ep!=null && em!=null){
              session = request.getSession();
              session.setAttribute("username",em);
            response.sendRedirect("/SHOPLEXMAIN/jsps/welcome.jsp");
                  }else{
                 //response.sendRedirect("/SHOPLEXMAIN/jsps/signin.jsp");
                  }
             
                         
                         
               
                 
               
                 }catch(SQLException k){out.println(k.getMessage());}
             
                  }catch(ClassNotFoundException e){
                out.println(e.getMessage());}
              
                  
               
             
              %>
              
              
                
                    
                 </form>
                    
               

              </div>
            </div>
           
                        
               
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
  

               
            
              <script>
                  var togglepassword=document.getElementById("togglePassword");
                  var password=document.getElementById("password");
                  togglepassword.addEventListener("click",click,false);
                  function click(){
                      var type=password.getAttribute("type")==="password"?"text":"password";
                      password.setAttribute("type",type);
                      this.classList.toggle("bi-eye");
                  }
                 // var form=document.querySelector("form");
                 // form.addEventListener('submit', function(e){
                   //   e.preventDefault();
                  //});
                  
                  
              </script>
</body>
   
</html>
