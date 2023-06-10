
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*,java.io.*,java.util.*"%>
<%!Connection connection=null;%>
<%!ResultSet set;%>
<%!String sql,sql2,sql3;%>
<%!Statement statement=null;%>
<% int[] arr={23,56,89,89,90,78,45,90,34,12};%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <!-- <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" /> -->
     <link rel="stylesheet" href="css/all.css"/>
     <link rel="stylesheet" href="css/webfonts"/>
     <link rel="stylesheet" href="css/styles.css">
    <title>Admin panel</title>
</head>

<body>
    <!-- DB CONNECTION-->
     <%
        try{
            Class.forName("com.mysql.jdbc.Driver");
//            out.println("Driver Registered");
            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/shoplex","root","1234");
            }catch(ClassNotFoundException e){
               out.println("Where is the Driver?");
               e.printStackTrace();
            }catch(SQLException e){
                 out.println("Connection failed Sir,try farming leave Netbeans alone");
                 e.printStackTrace();
            }
          if(connection!=null){
//           out.println("Connection was successful");
           
           String sqlI="INSERT INTO stud (stud_id,name,lastname,mark) VALUES ( 6,'JJUMBA','ERIC',90);";
           //int i=statement.executeUpdate(sqlI);
            sql="select count(*) from customers";
            sql2="select count(*) from products";
            sql3="select count(*) from staff";
            
         }
           %>
    <!-- DB CONNECTION END-->
    <div class="container">
        <jsp:include page="navBar.jsp" /><!-- Our navbar -->
        <jsp:include page="side.jsp" /><!-- Our Sidebar -->
        <div class="main">
            <div class="cards">
                <div class="card">
                    <div class="card-content">
                        <!--product Retrieval from database -->
                        <div class="number">
                            <%
                            statement=connection.createStatement();
                            ResultSet product=statement.executeQuery(sql2);//query for customer
                            product.next();
                            out.println(product.getInt("count(*)"));
                            %>
                        </div>
                        <div class="card-name">Total Products</div>
                    </div>
                    <div class="icon-box">
                        <i class="fa-brands fa-product-hunt"></i>
                    </div>
                </div>
                <!-- Orders -->
                <div class="card">
                    <div class="card-content">
                        <div class="number">124</div>
                        <div class="card-name">Orders</div>
                    </div>
                    <div class="icon-box">
                        <i class="fas fa-user-graduate"></i>
                    </div>
                </div>
                <!-- end -->
                <div class="card">
                    <div class="card-content">
                        
                        <!--Customer Retrieval from database -->
                        <div class="number">
                            <%
                            statement=connection.createStatement();
                            set=statement.executeQuery(sql);//query for customer
                            set.next();
                            out.println(set.getInt("count(*)"));
                        %>
                        </div>
                        <div class="card-name">Customers</div>
                    </div>
                    <div class="icon-box">
                        <i class="fas fa-chalkboard-teacher"></i>
                    </div>
                </div>
                <div class="card">
                    <div class="card-content">
                        <!--Staff Retrieval from database -->
                        <div class="number">
                         <%
                            statement=connection.createStatement();
                            set=statement.executeQuery(sql3);//query for customer
                            set.next();
                            out.println(set.getInt("count(*)"));
                        %>
                        </div>
                        <div class="card-name">Staff</div>
                    </div>
                    <div class="icon-box">
                        <i class="fas fa-users"></i>
                    </div>
                </div>
            </div>
            <div class="charts">
                <div class="chart">
                    <h2>Earnings (past 12 months)</h2>
                    <div>
                        <canvas id="lineChart"></canvas>
                    </div>
                </div>
                <div class="chart doughnut-chart">
                    <h2>Employees</h2>
                    <div>
                        <canvas id="doughnut"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="./chart.min.js"></script>
    <script>
        var ctx = document.getElementById("lineChart").getContext("2d");
        var myChart = new Chart(ctx, {
        type: 'line',
          data: {
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        datasets: [{
            label: 'Earnings in $',
            data: <%out.println(Arrays.toString(arr));%>,
            backgroundColor: [
                'rgba(85,85,85, 1)'

            ],
            borderColor: 'rgb(41, 155, 99)',

            borderWidth: 1
        }]
    },
    options: {
        responsive: true
    }
    });
    </script>
    <script>
        var ctx2 = document.getElementById('doughnut').getContext('2d');
var myChart2 = new Chart(ctx2, {
    type: 'doughnut',
    data: {
        labels: ['TECNO', 'IPHONE', 'ITEL', 'OTHERS'],

        datasets: [{
            label: 'Employees',
            data: [42, 12, 8, 6],
            backgroundColor: [
                'rgba(41, 155, 99, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(120, 46, 139,1)'

            ],
            borderColor: [
                'rgba(41, 155, 99, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(120, 46, 139,1)'

            ],
            borderWidth: 1
        }]

    },
    options: {
        responsive: true
    }
});
    </script>
</body>

</html>
