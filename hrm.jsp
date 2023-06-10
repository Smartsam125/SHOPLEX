<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.sql.*,java.io.*" %>
<%!Connection c = null;%>
<%!ResultSet r1,r2,r3,r4,r5;%>
<%!String qry1,qry2,qry3,qry4,qry5;%>
<%! Integer n1,n2,n3,n4, short1, short2, short3, short4;%> 
<%! Integer med1, med2, med3, med4, lng1, lng2, lng3, lng4;%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HR</title>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
  
       <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
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
        <jsp:include page="autoReallocation.jsp" />
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
                    <td><input type="text" name="fname" class="form-control" required> </td></tr></div>
                    <tr><div >
                    <td>Last Name:</td>
                    <td><input type="text" name="lname" class="form-control" required> </td></tr></div>
                <tr><div>
                    <td>Contact:</td>
                    <td><input type="text" name="tel" class="form-control" required></td></tr></div>
                    <div class="row"><div class="col">
                            <tr><td>CategoryID: Tecno-1, Samsung-2, Iphone-3, Itel-4</td></tr>
                      <tr>
                          <td>Product-LineID:</td>
                          <td><select name="line" class="form-control" required>
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                              </select></td></tr></div>
<!--                        <div class="col">
                 <tr>
                    <td>
                        Product-Line:
                    <td><select name="line"class="form-control">
                            <option>Short</option>
                            <option>Medium</option>
                            <option>Long</option>
                        </select></td>
                 </tr></div></div>-->
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
            qry1 = "SELECT * FROM staff ";
            
            qry2 = "select count(*) from staff where category_id = '1' ";
            qry3 = "select count(*) from staff where category_id = '2' ";
            qry4 = "select count(*) from staff where category_id = '3' ";
            qry5 = "select count(*) from staff where category_id = '4' ";
              
            Statement stmt1 = null;
            stmt1 = c.createStatement();
            r1 = stmt1.executeQuery(qry1); // result for query
            
            //Results for the Different product Lines
            Statement stmt2 = c.createStatement();
            r2 = stmt2.executeQuery(qry2);
            r2.next();
            n1 = r2.getInt("count(*)");       // Calculate the staff in each category under Tecno
            short1 = Math.round((1/7)*n1);
            med1 = Math.round((2/7)*n1);
            lng1 = Math.round((4/7)*n1);
            
            }catch(SQLException x){
              out.println("GGGGGG");
              x.getMessage();
              }
              try{
            Statement stmt3 = c.createStatement();
            r3 = stmt3.executeQuery(qry3); 
            r3.next();
            n2 = r3.getInt("count(*)");        // Calculate the staff in each category under Samsung 
            short2 = Math.round((1/7)*n2);
            med2 = Math.round((2/7)*n2);
            lng2 = Math.round((4/7)*n2);
            
            Statement stmt4 = c.createStatement();
            r4 = stmt4.executeQuery(qry4);
            r4.next();
            n3 = r4.getInt("count(*)");        // Calculate the staff in each category under Iphone
            short3 = Math.round((1/7)*n3);
            med3 = Math.round((2/7)*n3);
            lng3 = Math.round((4/7)*n3);
            
            Statement stmt5 = c.createStatement();
            r5 = stmt5.executeQuery(qry5); 
            r5.next();
            n4 = r5.getInt("count(*)");         // Calculate the staff in each category under Itel
            short4 = Math.round((1/7)*n4);
            med4 = Math.round((2/7)*n4);
            lng4 = Math.round((4/7)*n4);
            
              } catch(SQLException q){
              out.println("Another error bro");
              q.printStackTrace();
              }
              }
          %>
          <div>
        Staff
        <table id="table1">
            <tr>
                <td>FirstName</td>
                 <td>LastName</td>
                <td>Contact</td>
                 <td>LineID</td>
            <%
    try{
        while(r1.next()) { %>
            <tr>
                <td><%=r1.getString("firstname")%></td>
                 <td><%=r1.getString("lastname")%></td>
                <td><%=r1.getString("contact")%></td>
                 <td><%=r1.getString("category_id")%></td>
            </tr>
            <% } 
                }catch(SQLException o){
                out.println("ERROR");
                o.printStackTrace();
            }%>
        </table><br/>
        </div></div>
        <script>
                $(document).ready( function () {
                 $('table1').DataTable();
                    } );
            </script>
        
            <div display="flex" >
        <h3>Product-line staff in each category</h3>
        <table>
            <tr>
                <th> </th>
                <th>Short-term</th>
                <th>Medium-term</th>
                <th>Long-term</th>
            </tr>
            <tr>
                <td>Tecno</td>
                <td><%out.println(short1); %></td>
                <td><% out.println(med1);%></td>
                 <td><%out.println(lng1); %></td>
            </tr>
             <tr>
                <td>Samsung</td>
                <td><%out.println(short2); %></td>
                <td><%out.println(med2); %></td>
                 <td><%out.println(lng2); %></td>
            </tr>
             <tr>
                <td>Iphone</td>
                <td><%out.println(short3); %></td>
                <td><%out.println(med3); %></td>
                 <td><%out.println(lng3); %></td>
            </tr>
             <tr>
                <td>Itel</td>
                <td><%out.println(short4); %></td>
                <td><%out.println(med4); %></td>
                 <td><%out.println(lng4);%></td>
            </tr>
        </table>
            </div>  
            <div>
                <form action="buttonReallocation.jsp" method="POST" >
                    <button type="submit">ReAllocate</button>
                </form>
            </div>
    </body>
</html>
