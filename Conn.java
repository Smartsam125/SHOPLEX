/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.connection;
import java.sql.*;
import java.sql.SQLException;
import java.sql.Connection;

/**
 *
 * @author hm
 */
public class Conn {
   
    public static Connection connection =null;
    public static Connection getConnection() throws ClassNotFoundException,SQLException{
        if(connection ==null){
            Class.forName("com.mysql.jdbc.Driver");
        connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/shoplex","root","samson");
            //System.out.println("connection successful");
        }
        return connection;
        
    }

}
