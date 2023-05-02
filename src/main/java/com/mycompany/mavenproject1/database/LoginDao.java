package com.mycompany.mavenproject1.database;

import com.mycompany.mavenproject1.service.LoginBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author NAM
 */
public class LoginDao {

    public boolean validate(LoginBean loginBean) {

        boolean status = false;
        PreparedStatement stm = null;
        Connection conn = null;
        String sql = "select * from user where userEmail = ? and userPass = ? ";
//        table login

        try {
            conn = JDBCConnection.getJDBCConnection();
            stm = conn.prepareCall(sql);
            stm.setString(1, loginBean.getUsername());
            stm.setString(2, loginBean.getPassword());
            
            ResultSet rs = stm.executeQuery();
            status = rs.next();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }
    
    
    
}
