/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package HumanResource;

import java.sql.Connection;
import java.sql.DriverManager;
import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import java.io.PrintWriter;

public class DatabaseConnection extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req,HttpServletResponse resp)
        throws ServletException, IOException {
        PrintWriter out  = resp.getWriter();
        try{
        Class.forName("com.mysql.jdbc.Driver");
        DriverManager.getConnection("jdbc:mysql://localhost:3306/human_resource","root","");
        out.println("Successful");
           }
        catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        catch(SQLException s){
            s.getMessage();
        }
    }
  }
     