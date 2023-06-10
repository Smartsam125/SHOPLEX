<%-- 
    Document   : autoReallocation
    Created on : Aug 7, 2022, 8:58:53 AM
    Author     : Asa99
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*,java.time.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <% 
       try{
       LocalDate today = LocalDate.now();
        int month = today.getMonthValue();
        //month - The current month
        LocalDate previousMonth = LocalDate.now().minusMonths(1);
        int PMonth = previousMonth.getMonthValue();
        //PMonth - The previous month
        
        Class.forName("com.mysql.jdbc.Driver");// Driver to establish connection to the database
        Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/human_resource","root",""); //Create connection using your ID and Password
        Statement st1=con1.createStatement();
        
    //Product category 1
    ArrayList<Integer> salesfromPL1Current = new ArrayList<Integer>();
    ArrayList<Integer> salesfromPL1Previous = new ArrayList<Integer>();
    
        ResultSet resultset = st1.executeQuery("SELECT * FROM sales WHERE EXTRACT(MONTH FROM date)='"+month+"' AND category_id ='1'");
        while(resultset.next()){
        int sales = resultset.getInt("totalSales");
        salesfromPL1Current.add(sales);
    }
        ResultSet resultset1 = st1.executeQuery("SELECT * FROM sales WHERE EXTRACT(MONTH FROM date)='"+PMonth+"' AND category_id ='1'");
    while(resultset1.next()){
    int sales1 = resultset1.getInt("totalSales");
    salesfromPL1Previous.add(sales1);
    }
    
//         out.println("This is the current: " +salesfromPL1Current );
//         out.println("This is the previous: " +salesfromPL1Previous );

         int sumCurrent = 0;
         for(int i=0; i<salesfromPL1Current.size();i++ ){
           sumCurrent += salesfromPL1Current.get(i);
         }
         //out.println(sumCurrent);

         int sumPrevious = 0;
         for(int i=0; i<salesfromPL1Previous.size();i++ ){
           sumPrevious += salesfromPL1Previous.get(i);
         }
         //out.println(sumPrevious);
         
         //    PRODUCT CATEGORY 2
 
     ArrayList<Integer> salesfromPL2Current = new ArrayList<Integer>();
    ArrayList<Integer> salesfromPL2Previous = new ArrayList<Integer>();
    ResultSet resultset2 = st1.executeQuery("SELECT * FROM sales WHERE EXTRACT(MONTH FROM date)='"+month+"' AND category_id ='2'");
    while(resultset2.next()){
    int sales2 = resultset2.getInt("totalSales");
    salesfromPL2Current.add(sales2);
    
    }
    ResultSet resultset22 = st1.executeQuery("SELECT * FROM sales WHERE EXTRACT(MONTH FROM date)='"+PMonth+"' AND category_id ='2'");
    while(resultset22.next()){
    int sales22 = resultset22.getInt("totalSales");
    salesfromPL2Previous.add(sales22);
    }
    
//    out.println("This is the current: " +salesfromPL2Current );
//    out.println("This is the previous: " +salesfromPL2Previous );
    
    int sumCurrent22 = 0;
    for(int i=0; i<salesfromPL2Current.size();i++ ){
      sumCurrent22 += salesfromPL2Current.get(i);
    }
   // out.println(sumCurrent22);
    
    int sumPrevious22 = 0;
    for(int i=0; i<salesfromPL2Previous.size();i++ ){
      sumPrevious22 += salesfromPL2Previous.get(i);
    }
    //out.println(sumPrevious22);
    
    // PRODUCT CATEGORY 3
    
    ArrayList<Integer> salesfromPL3Current = new ArrayList<Integer>();
    ArrayList<Integer> salesfromPL3Previous = new ArrayList<Integer>();
    ResultSet resultset3 = st1.executeQuery("SELECT * FROM sales WHERE EXTRACT(MONTH FROM date)='"+month+"' AND category_id ='3'");
    while(resultset3.next()){
    int sales3 = resultset3.getInt("totalSales");
    salesfromPL3Current.add(sales3);
    
    }
    ResultSet resultset33 = st1.executeQuery("SELECT * FROM sales WHERE EXTRACT(MONTH FROM date)='"+PMonth+"' AND category_id ='3'");
    while(resultset33.next()){
    int sales33 = resultset33.getInt("totalSales");
    salesfromPL3Previous.add(sales33);
    }
    
//    out.println("This is the current: " +salesfromPL3Current );
//    out.println("This is the previous: " +salesfromPL3Previous );
    
    int sumCurrent33 = 0;
    for(int i=0; i<salesfromPL3Current.size();i++ ){
      sumCurrent33 += salesfromPL3Current.get(i);
    }
    //out.println(sumCurrent33);
    
    int sumPrevious33 = 0;
    for(int i=0; i<salesfromPL3Previous.size();i++ ){
      sumPrevious33 += salesfromPL3Previous.get(i);
    }
    //out.println(sumPrevious33);
    
    // PRODUCT 4 
   
    ArrayList<Integer> salesfromPL4Current = new ArrayList<Integer>();
    ArrayList<Integer> salesfromPL4Previous = new ArrayList<Integer>();
    ResultSet resultset4 = st1.executeQuery("SELECT * FROM sales WHERE EXTRACT(MONTH FROM date)='"+month+"' AND category_id ='4'");
    while(resultset4.next()){
    int sales4 = resultset4.getInt("totalSales");
    salesfromPL4Current.add(sales4);
    
    }
    ResultSet resultset44 = st1.executeQuery("SELECT * FROM sales WHERE EXTRACT(MONTH FROM date)='"+PMonth+"' AND category_id ='4'");
    while(resultset44.next()){
    int sales44 = resultset44.getInt("totalSales");
    salesfromPL4Previous.add(sales44);
    }
//    out.println("This is the current: " +salesfromPL4Current );
//    out.println("This is the previous: " +salesfromPL4Previous );
    
    int sumCurrent44 = 0;
    for(int i=0; i<salesfromPL4Current.size();i++ ){
      sumCurrent44 += salesfromPL4Current.get(i);
    }    

   // out.println(sumCurrent44);
    
    int sumPrevious44 = 0;
    for(int i=0; i<salesfromPL4Previous.size();i++ ){
      sumPrevious44 += salesfromPL4Previous.get(i);
    }
    //out.println(sumPrevious44);
    
//TO DO; 1.Detrmining the change in demand, +/- for every product category;
//put in an array list 
//Determine minimum and maximum;

//Store in a hash map change:productline

   int change1 = sumCurrent - sumPrevious;
   int change2 = sumCurrent22 - sumPrevious22;
   int change3 = sumCurrent33 - sumPrevious33;
   int change4 = sumCurrent44 - sumPrevious44;
   
//   out.println("Change in 1: " + change1);
//   out.println("Change in 2: " + change2);
//   out.println("Change in 3: " + change3);
//   out.println("Change in 4: " + change4);
   
   ArrayList<Integer> changes = new ArrayList<Integer>();
   changes.add(change1);
   changes.add(change2);
   changes.add(change3);
   changes.add(change4);
   
   //out.println(changes);
   
   //   TO DO; FIND MINIMUM AND MAX

    int min = Collections.min(changes);
    int max = Collections.max(changes);
    
    //out.println("The min is "+ min + "The max is " + max);
    
    HashMap<Integer,Integer> changeMap = new HashMap<Integer,Integer>();
    changeMap.put(change1,1);
    changeMap.put(change2,2);
    changeMap.put(change3,3);
    changeMap.put(change4,4);
    
   // out.println(changeMap);
    
   //out.println("This is the least priority line:  "+ changeMap.get(min));
   //out.println("This is the highest priority line:  "+ changeMap.get(max));
   int lowestPriority= changeMap.get(min);
   int highestPriority= changeMap.get(max);
   
   // swap staff from the lowest categoty priority line to the highest category priority line 
    ResultSet s = st1.executeQuery("SELECT staffID FROM staff WHERE category_id ='"+lowestPriority+"'");
    ArrayList<Integer> staffIDS_lowestPriority = new ArrayList<Integer>();
              while(s.next()){                
                int staffIds = s.getInt("staffID");                 
              staffIDS_lowestPriority.add(staffIds);                                     
            } 
           // out.println(staffIDS_lowestPriority); 
   
            int n = 1;      
            while(n<staffIDS_lowestPriority.size()){
                        st1.executeUpdate("UPDATE staff SET category_id = '"+highestPriority+"' WHERE staffID = '"+ staffIDS_lowestPriority.get(n)+"'");           
                        n++;
                    }  
   
   
   
           
          } catch(Exception error){
    out.println(error);
}
       %>
    </body>
</html>
