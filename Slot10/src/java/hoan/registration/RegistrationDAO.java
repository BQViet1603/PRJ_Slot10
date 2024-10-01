/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoan.registration;

import hoan.utils.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author Teacher
 */
public class RegistrationDAO implements Serializable{
    
    private List<RegistrationDTO> accounts;
    public boolean checkLogin (String username, String password)
            throws SQLException, ClassNotFoundException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            //1. Connect DB
            con = DBHelper.makeConnection();
            if(con!=null){
                //2. Create SQL String
                String sql="Select username "
                        + "FROM Registration "
                        + "WHERE username = ? "
                        + "AND password = ?";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                //4. Excute Query
                rs = stm.executeQuery();
                //5. Process Result
                if(rs.next()){
                    return true;
                }
            }
        }
        finally{
            if(rs != null){
                rs.close();
            }
            if(stm != null){
                stm.close();
            }
            if(con != null){
                con.close();
            }
        }
        return false;
    }

    public List<RegistrationDTO> getAccounts() {
        return accounts;
    }
    public void searchLastname(String searchValue)
             throws SQLException, ClassNotFoundException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            //1. Connect DB
            con = DBHelper.makeConnection();
            if(con!=null){
                //2. Create SQL String
                String sql="Select username, password, fullname,role "
                        + "FROM Registration "
                        + "WHERE fullname LIKE ?";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1,"%" + searchValue + "%");
                //4. Excute Query
                rs = stm.executeQuery();
                //5. Process Result
                while(rs.next()){
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    String fullName = rs.getString("fullname");
                    boolean role = rs.getBoolean("role");
                    RegistrationDTO dto = new RegistrationDTO(username, password, fullName, role);
                    if(this.accounts == null){
                        this.accounts =new ArrayList<>();
                    }//end accounts are not exited
                    this.accounts.add(dto);
                }// end traverse Result Set

            }
        }
        finally{
            if(rs != null){
                rs.close();
            }
            if(stm != null){
                stm.close();
            }
            if(con != null){
                con.close();
            }
        }
    }
    
    public boolean deleteRecord(String pk)
        throws SQLException, ClassNotFoundException{
        Connection con = null;
        PreparedStatement stm = null;
        try{
            //1. Connect DB
            con = DBHelper.makeConnection();
            if(con!=null){
                //2. Create SQL String
                String sql="Delete FROM Registration "
                        +"WHERE username = ?";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, pk);
                //4. Excute Query
                int row = stm.executeUpdate();
                if(row > 0){
                    return true;
                }
            }
        }
        finally{
            if(stm != null){
                stm.close();
            }
            if(con != null){
                con.close();
            }
        }
        return false;
    }
    
    public boolean updatePassRole(String username, String password, boolean role)
            throws SQLException, ClassNotFoundException{
        Connection con = null;
        PreparedStatement stm = null;
        try{
            //1. Connect DB
            con = DBHelper.makeConnection();
            if(con!=null){
                //2. Create SQL String
                String sql="Update Registration "
                        + "SET password = ?, role = ? "
                        + "WHERE username = ?";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, password);
                stm.setBoolean(2, role);
                stm.setString(3, username);
                //4. Excute Query
                int row = stm.executeUpdate();
                if(row > 0){
                    return true;
                }
            }
        }
        finally{
            if(stm != null){
                stm.close();
            }
            if(con != null){
                con.close();
            }
        }
        return false;
    }
    
    public boolean insertRecord(String username, String password, String fullname, boolean role) 
            throws SQLException, ClassNotFoundException{
        Connection con = null;
        PreparedStatement stm = null;
        try{
            //1. Connect DB
            con = DBHelper.makeConnection();
            if(con!=null){
                //2. Create SQL String
                String sql="Insert INTO Registration(username,password,fullname,role) "
                        + "VALUES(?,?,?,?)";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                stm.setString(3, fullname);
                stm.setBoolean(4, role);
                //4. Excute Query
                int row = stm.executeUpdate();
                if(row > 0){
                    return true;
                }
            }
        }
        finally{
            if(stm != null){
                stm.close();
            }
            if(con != null){
                con.close();
            }
        }
        return false;
    }
    
}
