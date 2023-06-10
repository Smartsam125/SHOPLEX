<%-- 
    Document   : buttonReallocation
    Created on : Aug 7, 2022, 11:34:55 AM
    Author     : Asa99
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.* " %>
<%@page import="java.util.* " %>


<%@page import="java.text.DecimalFormat" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  
         try{
    Class.forName("com.mysql.jdbc.Driver");// Driver to establish connection to the database
    Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/human_resource","root",""); //Create connection using your ID and Password
    Statement st1=con1.createStatement();
    
// COUNT ALL EMPLOYEES.
//To do, count number of employees in the staff table
              int totalEmployees=0;
              ResultSet Employees = st1.executeQuery("SELECT COUNT(staffID) as employees FROM staff ");
                while(Employees.next()){                
                totalEmployees = Employees.getInt("employees");                                                  
            }
            //out.println("Total Employees = " + totalEmployees);
            
            
            //    PROMPT MANAGER FOR THE MONTH HE WANTS USING A SEERVLET.
//    TO DO;,
// GET RATIO OF SALES 
    int month = 8;  
    
    
//    FOR PRODUCT CATEGORY LINE 1
//     SELECT SUM INSTEAD OF ADDING ___SELECT ONLY WHAT WE WANT

    ResultSet resultset = st1.executeQuery("SELECT SUM(totalSales) as TS FROM Sales WHERE EXTRACT(MONTH FROM date)='"+month+"' AND category_id ='1'");
    int sales1 = 0;
    while(resultset.next()){
    sales1 = resultset.getInt("TS");
      //out.println("Sales from PL1 = " +sales1 );
    }
    
//    FOR PRODUCT CATEGORY LINE 2
//     SELECT SUM INSTEAD OF ADDING ___SELECT ONLY WHAT WE WANT

    ResultSet resultset2 = st1.executeQuery("SELECT SUM(totalSales) as TS2 FROM Sales WHERE EXTRACT(MONTH FROM date)='"+month+"' AND category_id ='2'");
    int sales2 =0;
    while(resultset2.next()){
    sales2 = resultset2.getInt("TS2");
      //out.println("Sales from PL2 = " +sales2 );
    }
    
// PRODUCT CATEGORY LINE 3
    ResultSet resultset3 = st1.executeQuery("SELECT SUM(totalSales) as TS3 FROM Sales WHERE EXTRACT(MONTH FROM date)='"+month+"' AND category_id ='3'");
    int sales3 = 0;
    while(resultset3.next()){
    sales3 = resultset3.getInt("TS3");
      //out.println("Sales from PL3 = " +sales3 );
    }
    
//    FOR PRODUCT LINE 3
    ResultSet resultset4= st1.executeQuery("SELECT SUM(totalSales) as TS4 FROM Sales WHERE EXTRACT(MONTH FROM date)='"+month+"' AND category_id ='4'");
    int sales4 = 0;
    while(resultset4.next()){
     sales4= resultset4.getInt("TS4");
      //out.println("Sales from PL4 = " +sales4 );
    }   
    
    //    TO DO: GET NUMBER OF EMPLOYEES FROM RATIO

    
    int totalMonthlySales = sales1+sales2+sales3+sales4;
    //out.println("Total monthly Sales  = " + totalMonthlySales);
    
    //THESE ARE PRIORITIES, PUT IN AN ARRAY LIST
   float ApproximateEmp1 = ((float)sales1/totalMonthlySales)*totalEmployees;
   float ApproximateEmp2 = ((float)sales2/totalMonthlySales)*totalEmployees;
   float ApproximateEmp3 = ((float)sales3/totalMonthlySales)*totalEmployees;
   float ApproximateEmp4 = ((float)sales4/totalMonthlySales)*totalEmployees;
   
    ArrayList<Float> ApproxemployeeNumber_list = new ArrayList<Float>(Arrays.asList(ApproximateEmp1,ApproximateEmp2,ApproximateEmp3,ApproximateEmp4));
    out.println("This is the list of Approximate employees "+ApproxemployeeNumber_list);
    
    //    Get highest priority line and least priority line
  float hP = Collections.max(ApproxemployeeNumber_list);
    
   out.println("Approximate employees" + ApproximateEmp1+","+ApproximateEmp2+","+ApproximateEmp3+","+ApproximateEmp4 );
   int newNumberEmployees = Math.round(ApproximateEmp1)+Math.round(ApproximateEmp2)+Math.round(ApproximateEmp3)+Math.round(ApproximateEmp4);
   out.println("New number of employees " + newNumberEmployees);
   
   int finalEmp1 = Math.round(ApproximateEmp1);
   int finalEmp2 = Math.round(ApproximateEmp2);
   int finalEmp3 = Math.round(ApproximateEmp3);
   int finalEmp4 = Math.round(ApproximateEmp4);
   
   
    HashMap<Float,Integer> priorityMap = new HashMap<Float,Integer>();
    priorityMap.put(ApproximateEmp1,1);
    priorityMap.put(ApproximateEmp2,2);
    priorityMap.put(ApproximateEmp3,3);
    priorityMap.put(ApproximateEmp4,4);
 
    if(priorityMap.get(hP) == 1){
            finalEmp1 = finalEmp1+1;            
     }
     else if(priorityMap.get(hP) == 2 ){
            finalEmp2 = finalEmp2+1;
            }
     else if(priorityMap.get(hP) == 3 ){
            finalEmp3 = finalEmp3+1;
            }            
            else{
            finalEmp4 = finalEmp4+1;          
            
            }
    //   CASE 1 ----WE GET THE EXACT NUMBER OF AVAILABLE EMPLOYEES
    //Execute query to return 4 sets of staff IDs using Offset and limit clauses;
              //Create 4 arrraylists to hold the 4 sets of staff IdS              
              //Get staff id, update department at that point(Do this in a loop)
              ArrayList<Integer> staffIDS_productLine1 = new ArrayList<Integer>();
              ArrayList<Integer> staffIDS_productLine2 = new ArrayList<Integer>();
              ArrayList<Integer> staffIDS_productLine3 = new ArrayList<Integer>();
              ArrayList<Integer> staffIDS_productLine4 = new ArrayList<Integer>();

 
        if(newNumberEmployees==totalEmployees){
               //Ratio finalEmp1:finalEmp2:finalEmp3:finalEmp4
              //Execute query to return 4 sets of staff IDs using Offset and limit clauses;
              //Create 4 arrraylists to hold the 4 sets of staff IdS              
              //Get staff id, update department at that point(Do this in a loop)
              
              //Get the first finalEmp1 staff IDs to be assigned to product line 1
              ResultSet staff_productline1 = st1.executeQuery("SELECT staffID FROM staff ORDER BY staffID Limit " +finalEmp1+ " Offset 0");
              
              while(staff_productline1.next()){                
                int staffId_1 = staff_productline1.getInt("staffID");                 
                staffIDS_productLine1.add(staffId_1);                                     
            } 
            //out.println(staffIDS_productLine1); 
            
            //Skip the first two and get the one staff ID to be assigned to product line 2
             ResultSet staff_productline2 = st1.executeQuery("SELECT staffID FROM staff ORDER BY staffID Limit " +finalEmp2+ " Offset "+ finalEmp1+"");
             
              while(staff_productline2.next()){                
                int staffId_2 = staff_productline2.getInt("staffID");                 
                staffIDS_productLine2.add(staffId_2);                                     
            } 
            //out.println(staffIDS_productLine2);    
            
            //Skip the first 3, get next 2 staff IDs for PL3;
            ResultSet staff_productline3 = st1.executeQuery("SELECT staffID FROM staff ORDER BY staffID Limit "+finalEmp3+" Offset " +(finalEmp1+finalEmp2)+"");
             
              while(staff_productline3.next()){                
                int staffId_3 = staff_productline3.getInt("staffID");                 
                staffIDS_productLine3.add(staffId_3);                                     
            } 
            //out.println(staffIDS_productLine3);   
            
            //Skip the first 5, get next 5 staff IDs for PL4;
            ResultSet staff_productline4 = st1.executeQuery("SELECT staffID FROM staff ORDER BY staffID Limit "+finalEmp4+ " Offset "+ (finalEmp1+finalEmp2+finalEmp3)+"");
             
              while(staff_productline4.next()){                
                int staffId_4 = staff_productline4.getInt("staffID");                 
                staffIDS_productLine4.add(staffId_4);                                     
            } 
            //out.println(staffIDS_productLine4); 
                     
            }
//            CASE WHEN ITS LESS BY ONE, ADD ONE EMPLOYEE TO HIGHEST PRIORITY PL

            else if(newNumberEmployees<totalEmployees){

                ResultSet staff_productline1 = st1.executeQuery("SELECT staffID FROM staff ORDER BY staffID Limit " +finalEmp1+ " Offset 0");
              
              while(staff_productline1.next()){                
                int staffId_1 = staff_productline1.getInt("staffID");                 
                staffIDS_productLine1.add(staffId_1);                                     
            } 
            //out.println(staffIDS_productLine1); 
            
            //Skip the first two and get the one staff ID to be assigned to product line 2
             ResultSet staff_productline2 = st1.executeQuery("SELECT staffID FROM staff ORDER BY staffID Limit " +finalEmp2+ " Offset "+ finalEmp1+"");
             
              while(staff_productline2.next()){                
                int staffId_2 = staff_productline2.getInt("staffID");                 
                staffIDS_productLine2.add(staffId_2);                                     
            } 
            //out.println(staffIDS_productLine2);    
            
            //Skip the first 3, get next 2 staff IDs for PL3;
            ResultSet staff_productline3 = st1.executeQuery("SELECT staffID FROM staff ORDER BY staffID Limit "+finalEmp3+" Offset " +(finalEmp1+finalEmp2)+"");
             
              while(staff_productline3.next()){                
                int staffId_3 = staff_productline3.getInt("staffID");                 
                staffIDS_productLine3.add(staffId_3);                                     
            } 
            //out.println(staffIDS_productLine3);   
            
            //Skip the first 5, get next 5 staff IDs for PL4;
            ResultSet staff_productline4 = st1.executeQuery("SELECT staffID FROM staff ORDER BY staffID Limit "+finalEmp4+ " Offset "+ (finalEmp1+finalEmp2+finalEmp3)+"");
             
              while(staff_productline4.next()){                
                int staffId_4 = staff_productline4.getInt("staffID");                 
                staffIDS_productLine4.add(staffId_4);                                     
            } 
            //out.println(staffIDS_productLine4);                     
            }
            else{
            out.println("There's an error");
            }
            
            
             //Now we have the different staff Ids for the categories of product lines , execute updates for each seperately
//            
            int n_productLine1=0;
            int n_productLine2=0;
            int n_productLine3=0;
            int n_productLine4=0;
            // Assign product line 1 staff
            while(n_productLine1<staffIDS_productLine1.size()){
                st1.executeUpdate("UPDATE staff SET category_id = '1' WHERE staffID = '"+ staffIDS_productLine1.get(n_productLine1)+"'");           
                n_productLine1++;
            }
            
            //Assign product line 2 staff
            while(n_productLine2<staffIDS_productLine2.size()){
                st1.executeUpdate("UPDATE staff SET category_id = '2' WHERE staffID = '"+ staffIDS_productLine2.get(n_productLine2)+"'");           
                n_productLine2++;
            }
            
            //Assign product line 3 staff
            while(n_productLine3<staffIDS_productLine3.size()){
                st1.executeUpdate("UPDATE staff SET category_id = '3' WHERE staffID = '"+ staffIDS_productLine3.get(n_productLine3)+"'");           
                n_productLine3++;
            }
            
            //Assign product line 4 staff
            while(n_productLine4<staffIDS_productLine4.size()){
                st1.executeUpdate("UPDATE staff SET category_id = '4' WHERE staffID = '"+ staffIDS_productLine4.get(n_productLine4)+"'");           
                n_productLine4++;
            }  
            response.sendRedirect("hrm.jsp");
    
            }catch(Exception error){
    out.println(error);
}
        %>
    </body>
</html>
