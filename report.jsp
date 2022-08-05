<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*" %>
<%!Connection connection=null;%>
<%!ResultSet set;%>
<%!String sql,sql2,sql3;%><!--String for Queries-->
<%!Statement statement=null;%>
<%!Integer line[] ={};%>
<%!Integer like[] ={};%>
<%!Integer dislike[] ={};%>
<%!String bar_label[] ={};%>
<%!String dislike_label[] ={};%>
<%!ArrayList<Integer> arrayList = new ArrayList<Integer>(Arrays.asList(line));%>
<%!ArrayList<Integer> arrayLike = new ArrayList<Integer>(Arrays.asList(like));%><!-- like -->
<%!ArrayList<Integer> arrayDisLike = new ArrayList<Integer>(Arrays.asList(dislike));%><!-- dislike -->
<%!ArrayList<String> x_dislike = new ArrayList<String>(Arrays.asList(dislike_label));%><!-- line label -->
<%!ArrayList<String> lineLabel = new ArrayList<String>(Arrays.asList(bar_label));%><!-- line label -->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/all.css"/>
        <link rel="stylesheet" href="css/webfonts"/>
        <link rel="stylesheet" href="css/register.css"/>
        <link rel="stylesheet" href="css/styles.css">
        <title>Report</title>
    </head>
    <body>
        <!--<!--Database quering for pie-chart -->
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
           
           
           //int i=statement.executeUpdate(sqlI);
            sql="select count(*) from customers where Line='long'";
            sql2="select * from products";
            sql3="select * from likes";
            
            statement=connection.createStatement();
            ResultSet product=statement.executeQuery(sql2);
            while(product.next()){ //resultset for bar graph
             int k=product.getInt("Quantity");
              lineLabel.add("'"+product.getString("productName")+"'");
              arrayList.add(k); 
          }
          
         //resultset for like part
         ResultSet LikeSet=statement.executeQuery(sql3);
         while(LikeSet.next()){
               arrayLike.add(LikeSet.getInt("llike"));
               arrayDisLike.add(LikeSet.getInt("dislike"));
               x_dislike.add("'"+LikeSet.getString("name")+"'");
            }
          //end of resultset for like part
            like=arrayLike.toArray(like);
            dislike=arrayDisLike.toArray(dislike);
            dislike_label=x_dislike.toArray(dislike_label);
            bar_label=lineLabel.toArray(bar_label);
            line = arrayList.toArray(line);
         }
           %>
    <div class="container">
            <jsp:include page="navBar.jsp" />
            <jsp:include page="side.jsp" />
        <div class="main">
          <div class="grid">
            <div class="chart doughnut-chart">
                <h2>Report1</h2>
                <div>
                    <canvas id="r1"></canvas>
                </div>
            </div>
            <div class="chart doughnut-chart">
                <h2> Report 2</h2>
               
                <div>
                    <canvas id="r2"></canvas>
                </div>
            </div>
            <div class="chart doughnut-chart">
                <h2>Report 3</h2>
                <div>
                    <canvas id="r3"></canvas>
                </div>
            </div>
          </div>
        </div>
        <script src="./js/chart.min.js"></script>
         <script>
            var ctx = document.getElementById("r1").getContext("2d");
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: <%out.println(Arrays.toString(bar_label));%>,//bar graph labels
        datasets: [{
            label: 'Total Sales',
            data:<%out.println(Arrays.toString(line));%>,
            backgroundColor: [
                'rgba(85,85,85, 1)'

            ],
            borderColor: 'rgb(41, 155, 99)',

            borderWidth: 1
        }]
    },
    options: {
        responsive: true,
        indexAxis: 'y',
        scales: {
      y: {
        ticks: {
          crossAlign: 'false'
        }
      }
    }
    }
});
// chart for report 2
</script>

<script>
  var ctx2 = document.getElementById('r2').getContext('2d');
var myChart2 = new Chart(ctx2, {
    type: 'pie',
    data: {
        labels: ['LONG', 'SHORT', 'MEDIUM'],

        datasets: [{
            label: 'Employees',
            data:<%out.println(Arrays.toString(line));%>,
            
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
        responsive: true,
        indexAxis: 'y',
        "maintainAspectRatio": false
    }
});
</script>
<%

%>
<script>
var ctx = document.getElementById("r3").getContext("2d");
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels:<% out.println(Arrays.toString(dislike_label));%> ,
        datasets: [{
            label: 'Like',
            data: <% out.println(Arrays.toString(like));%>,
            backgroundColor: [
                'rgba(0,255,0)'

            ],
            borderColor: 'rgb(41, 155, 99)',
            borderWidth: 1
        },
        {
            label: 'Dislike',
            data: <% out.println(Arrays.toString(dislike));%>,
            backgroundColor: [
                'rgba(255,0,0)'

            ],
            borderColor: 'rgb(41, 155, 99)',
            borderWidth: 1
        }
    ]
    },
    options: {
        responsive: true
    }
});
</script>
<% 
    //closin the arraylist because they reload with prevoius data if you dont clear();
 arrayLike.clear();
 arrayDisLike.clear();
 x_dislike.clear();
 arrayList.clear();
 lineLabel.clear();
%>
    </body>
</html>
