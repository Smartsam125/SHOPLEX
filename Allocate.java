/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package HumanResource;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import java.io.PrintWriter;

//import HumanResource.DatabaseConnection;

public class Allocate extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException{
        PrintWriter out = resp.getWriter();
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/human_resource","root", "");
            
            String fname = req.getParameter("fname");
            String lname = req.getParameter("lname");
            String tel = req.getParameter("tel");
            String line = req.getParameter("line");
            String set = req.getParameter("set");
            
            Statement s = c.createStatement();
          String q = "INSERT INTO staff (firstname,lastname,contact,product_line,Product) VALUES('"+fname+"','"+lname+"','"+tel+"','"+line+"','"+set+"')";
            //out.println(q);
            s.executeUpdate(q);
            //out.println("Successful");
            
            //resp.sendRedirect("hrm");
            
        } catch (SQLException e){
            out.println("There is an error in statement");
            e.printStackTrace();
        }catch(ClassNotFoundException c){
            c.getMessage();
        }
        
    }
    
}
