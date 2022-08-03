<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.sql.*,java.io.*" %>
<%!Connection c = null;%>
<%!ResultSet r1,r2,r3;%>
<%!String qry1,qry2,qry3;%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HR</title>
        <style>
            body {
	color: #fff;
	background: #63738a;
	font-family: 'Roboto', sans-serif;
            }
            .form-control {
	height: 40px;
	box-shadow: none;
	color: #969fa4;
            }
            .form-control:focus {
	border-color: #5cb85c;
            }
            .form-control, .btn {        
	border-radius: 3px;
            }
            .signup-form {
	width: 450px;
	margin: 0 auto;
	padding: 30px 0;
  	font-size: 15px;
            }
            .signup-form h2 {
	color: #636363;
	margin: 0 0 15px;
	position: relative;
	text-align: center;
            }
            .signup-form h2:before, .signup-form h2:after {
	content: "";
	height: 2px;
	width: 30%;
	background: #d4d4d4;
	position: absolute;
	top: 50%;
	z-index: 2;
            }	
            .signup-form h2:before {
	left: 0;
            }
            .signup-form h2:after {
	right: 8;
            }
            .signup-form form {
	color: #999;
	border-radius: 3px;
	margin-bottom: 15px;
	background: #f2f3f7;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
            }   
            .signup-form .row div:first-child {
	padding-right: 10px;
            }
            .signup-form .row div:last-child {
	padding-left: 10px;
            }  
            .signup-form .btn {        
	font-size: 16px;
	font-weight: bold;		
	min-width: 140px;
	outline: none !important;
            }            
        </style>
    </head>
    <body>
        <div style="display: flex " >
        <div>
            <div class="signup-form">
            <form action="db"  method="GET">
                <h2>Staff Registration</h2>
                <table>
                <tr>
                    <td>First Name:</td>
                    <td><input type="text" name="fname" class="form-control"> </td></tr></div>
                    <tr><div >
                    <td>Last Name:</td>
                    <td><input type="text" name="lname" class="form-control"> </td></tr></div>
                <tr><div>
                    <td>Contact:</td>
                    <td><input type="text" name="tel" class="form-control"></td></tr></div>
                    <div class="row"><div class="col">
                      <tr>
                          <td>Product-Set:</td>
                          <td><select name="set" class="form-control">
                            <option>Tecno</option>
                            <option>Samsung</option>
                            <option>Iphone</option>
                            <option>Itel</option>
                              </select></td></tr></div>
                        <div class="col">
                 <tr>
                    <td>
                        Product-Line:
                    <td><select name="line"class="form-control">
                            <option>Short</option>
                            <option>Medium</option>
                            <option>Long</option>
                        </select></td>
                 </tr></div></div>
                <div class="btn btn-success btn-lg btn-block">
                <tr>
                    <td>
                        <button type="submit">Register Now</button></td></tr></div>
            </table>
        </form>
            </div><br><br/>
        
          <!-- Database connection-->
          <%
          try{
           Class.forName("com.mysql.jdbc.Driver");
           c = DriverManager.getConnection("jdbc:mysql://localhost:3306/human_resource", "root","");
              }catch(ClassNotFoundException t){
              out.println("Error");
              t.printStackTrace();
              }catch(SQLException e){
                 e.printStackTrace();
            }
            if(c != null){
             try{ 
            qry1 = "SELECT * FROM staff WHERE product_line='Short'";
            qry2 = "SELECT * FROM staff WHERE product_line='Medium'";
            qry3 = "SELECT * FROM staff WHERE product_line='Long'";
            
            Statement stmt = null;
            stmt = c.createStatement();
            
            r1 = stmt.executeQuery(qry1); //result for query for short-term
            //r1.next();
            Statement st = c.createStatement();
            r2 = st.executeQuery(qry2); //result for query for medium-term
            //r2.next();
            Statement smt = c.createStatement();
            r3 = smt.executeQuery(qry3); //result for query for long-term
            //r3.next();
              } catch(SQLException q){
              out.println("Another error bro");
              q.getMessage();
              }
              }
          %>
          <div>
        Short-time:
        <table>
            <tr>
                <td>Staff Name</td>
                <td>Product</td>
                 <td>Contact</td>
            <%
    try{
        while(r1.next()) { %>
            <tr>
                <td><%=r1.getString("firstname")%></td>
                <td><%=r1.getString("product_line")%></td>
                 <td><%=r1.getString("contact")%></td>
            </tr>
            <% } 
                }catch(SQLException o){
                out.println("ERROR");
                o.printStackTrace();
            }%>
        </table><br/>
        Medium-term:
        <table>
             <td>Staff Name</td>
                <td>Product</td>
                 <td>Contact</td>
                <% try{
                while(r2.next()){ %>
            <tr>
                <td><%=r2.getString("firstname")%></td>
                <td><%=r2.getString("product_line")%></td>
                 <td><%=r2.getString("contact")%></td>
            </tr>
            <%}
               }catch(SQLException n){
                out.println("Hey i gat a problem here");
               n.getMessage();}
            %>
        </table><br/>
        Long-term:
        <table>
            <td>Staff Name</td>
                <td>Product</td>
                 <td>Contact</td>
                <%while(r3.next()){ %>
            <tr>
                <td><%=r3.getString("firstname")%></td>
                <td><%=r3.getString("product_line")%></td>
                 <td><%=r3.getString("contact")%></td>
            </tr>
            <%}
            c.close();%>
        </table><br/>
        </div>
        </div>
    </body>
</html>
