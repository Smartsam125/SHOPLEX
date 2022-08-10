/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import user.Cart;



public class InsertData extends HttpServlet {
 Connection conn=null;
 ResultSet res=null;
 Statement st=null;
 String query;
 
    

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
         String username=(String)request.getSession().getAttribute("username");
         String productName =request.getParameter("id");
         out.println(productName);
         
          SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
          java.util.Date date=new java.util.Date();
        if(username!=null){
            
        response.setContentType("text/html;charset=UTF-8");
        try  {
           Class.forName("com.mysql.jdbc.Driver");
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InsertData</title>");            
            out.println("</head>");
            out.println("<body>");
            if(username!=null){}
            try{
            conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/shoplex","root","samson");
           
            
             query="select customerId from customers where email ='"+username+"'";
             st =conn.createStatement();
         ResultSet res=st.executeQuery(query);
         while(res.next()){
             int quantityOfpdts =Integer.parseInt(request.getParameter("quantity"));
                //out.println(quantityOfpdts);
                if(quantityOfpdts<=0){
                    quantityOfpdts=1;
                }
              String  query2="insert into Orders(productName,customerId,quantity,date) values(?,?,?,?)";
             PreparedStatement rs =conn.prepareStatement(query2);
             rs.setString(1,productName );
             rs.setInt(2,res.getInt("customerId") );
             rs.setInt(3,quantityOfpdts);
             rs.setString(4,formatter.format(date));
             rs.executeUpdate();
             out.println("data inserted successfuly");
             
                 ArrayList<Cart> cart_list = (ArrayList<Cart>)request.getSession().getAttribute("cart-list");
                 
                     for(Cart c:cart_list){
                         
                             cart_list.remove(cart_list.indexOf(c));
                             break;
                         
                         
                     }
                     response.sendRedirect("jsps/orderForm.jsp");
                 
            
             
             
             //eresponse.sendRedirect("jsps/orderForm.jsp");
             
         }
             
            }catch(SQLException k){
                out.println(k.getMessage());
            }
           
            out.println("</body>");
            out.println("</html>");
        }catch(ClassNotFoundException e){
            out.println(e.getMessage());
        }
        }else{
            response.sendRedirect("jsps/signin.jsp");
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
