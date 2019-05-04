/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package  test;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBCon {
    private static Connection conn = null;

    public static Connection getCon() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String user = "root";
            String pwd = "111111";
            String url = "jdbc:mysql://localhost:3306/users";
            conn = DriverManager.getConnection(url, user, pwd);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}


