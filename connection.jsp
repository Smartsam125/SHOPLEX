<%  
   Connection connection=null;
Class.forName("com.mysql.jdbc.Driver");
  connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/shoplex","root","samson");
 %>