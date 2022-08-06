
<%--The code is okay regardless --%>



<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shoplex","root","");
Statement st = conn.createStatement();
%>