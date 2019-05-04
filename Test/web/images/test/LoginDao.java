/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package  test;

import java.sql.*;


import test.DBCon;
import test.UserInfo;

public class LoginDao {
    private static LoginDao instance = null;

    public static LoginDao getInstance() {
        if (instance == null) {
            instance = new LoginDao();
        }
        return instance;
    }

    // 保存用户注册信息
    public boolean saveUser(UserInfo user) {
        Connection conn = null;
        try {
            conn = DBCon.getCon(); // 建立数据库连接
            String sql = "insert into userinfo(userName,userPwd,userSex,userAge,email) values(?,?,?,?,?)"; // insert
                                                                                                            // SQL语句=
            PreparedStatement pstmt = conn.prepareStatement(sql); // 创建用户操作执行SQL语句的PreparedStatement对象
            pstmt.setString(1, user.getUserName());
            pstmt.setString(2, user.getUserPwd());
            pstmt.setString(3, user.getUserSex());
            pstmt.setInt(4, user.getUserAge());
            pstmt.setString(5, user.getEmail());
            pstmt.executeUpdate(); // 编译执行insert语句
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }
}
