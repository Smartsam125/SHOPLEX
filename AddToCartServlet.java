/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package user;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;


/**
 *
 * @author hm
 */
public class AddToCartServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            //out.println("<%include file='/SHOPLEXMAIN/jsps/navbar.jsp'%>");
            out.println("<head>");
            out.println("<title>Servlet AddToCartServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            //Array list to store product items as session
            ArrayList<Cart> cartList =new ArrayList<>();
            
            int id= Integer.parseInt(request.getParameter("id"));
            Cart cart =new Cart();
            cart.setId(id);
            //set quantity to default
            cart.setQuantity(1);
       
            HttpSession  session = request.getSession();
            session.getAttribute("cart-list");
            //access cartlist products from a session
            
            
            ArrayList<Cart> cart_list=(ArrayList<Cart>)session.getAttribute("cart-list");
            if(cart_list==null){
                //if session is empty access add item to cart prooduct
                cartList.add(cart);
                session.setAttribute(("cart-list"), cartList);
                out.println("Product Added to the Cart");
                 response.sendRedirect("/SHOPLEXMAIN/jsps/welcome.jsp");
                
            }else{
                //out.println("cartlist exists");
                cartList =cart_list;
                //check whether there products in the cartlIST SESSION
                boolean exist=false;
                
               for(Cart c:cart_list){
                    if(c.getId()==id){
                        exist=true;
                        out.println("<h3 style='color:magenta;text-align:center;'>Item Already Exists<a href='/SHOPLEXMAIN/jsps/welcome.jsp'>BackToHomePage</a></h3>");
                        response.sendRedirect("jsps/welcome.jsp");
                    }
              }
               if(!exist){
                        cartList.add(cart);
                        response.sendRedirect("/SHOPLEXMAIN/jsps/welcome.jsp");
                    }
            }
          
           
                       
            out.println("</body>");
            out.println("</html>");
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
