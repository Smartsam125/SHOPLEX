

import com.connection.Conn;
import connectionObect.Orders;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;

import java.util.Date;
import user.CompleteOrder;
import java.text.SimpleDateFormat;

public class BuyNow extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
      
        
       
         PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        try {
           
    Statement st=null;
    Connection conn =null;
    
           Class.forName("com.mysql.jdbc.Driver");
         conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/shoplex","root","samson");
         String username=(String)request.getSession().getAttribute("username");
          String query="select customerId from customers where email ='"+username+"'";
          st =conn.createStatement();
         ResultSet res=st.executeQuery(query);
         while(res.next()){
             
            
          
         
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BuyNow</title>");            
            out.println("</head>");
            out.println("<body>");
           
             
          
           
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
                 Date date=new Date();
                 
            if(username!=null){
             
            String productName =request.getParameter("id");
            out.println(productName);
            int name =res.getInt("customerId");
            out.println(name);
            //out.println(productId);
            
              int quantityOfpdts =Integer.parseInt(request.getParameter("quantity"));
                //out.println(quantityOfpdts);
                if(quantityOfpdts<=0){
                    quantityOfpdts=1;
                }
                CompleteOrder Order = new CompleteOrder();
                Order.setPdtName(productName);
                Order.setCustomerId(res.getInt("customerId"));
                Order.setQuantity(quantityOfpdts);
                Order.setDate(formatter.format(date));
                
                Orders enterOrders =new Orders(Conn.getConnection());
               
                
                
               boolean result = enterOrders.insertOrders(Order);
               if(result){
                   response.sendRedirect("jsps/Cart.jsp");
               }else{
                   out.println("failed to place order");
               }
           }
            else{
                response.sendRedirect("jsps/signin.jsp");
            }}
           
            
             out.println("</body>");
            out.println("</html>"); 
         }catch(Exception  e){ out.println(e.getMessage());}
                
                
               
          
                
            
                
            }
            
        

    

    
    
//    protected void processResponse(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException
//        {
//            processRequest(request,response);
//        }

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
