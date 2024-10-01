/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoan.utils;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Teacher
 */
public class DBHelper implements Serializable{
    public static Connection makeConnection() throws ClassNotFoundException, SQLException{
        //1. Load Driver
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        //2. Create Connection String
        String url="jdbc:sqlserver:"
                + "//localhost:1433"
                + ";databaseName=Store;encrypt=true;trustServerCertificate=true";
        //3. Open Connection
        Connection con=DriverManager.getConnection(url,"sa","123456");
        return con;
    }
}
