/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khoilhv.user;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import khoilhv.utils.DbUtil;

/**
 *
 * @author Infinity
 */
public class AccountDAO implements Serializable {

    
    AccountDTO dto;

    public AccountDTO getDto() {
        return dto;
    }
    
    private List<AccountDTO> listAccounts;

    public List getAccountList() {
        return listAccounts;
    }

    public boolean checkLogin(String username, String password) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            con = DbUtil.makeConnection();
            if (con != null) {
                String sql = "select lastname from Account where username = ? "
                        + "and password = ?";
                pr = con.prepareStatement(sql);
                pr.setString(1, username);
                pr.setString(2, password);
                rs = pr.executeQuery();
                if (rs.next()) {            
                String lastname = rs.getString("lastname");
                dto = new AccountDTO(username, lastname);               
                    return true;
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pr != null) {
                pr.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public void searchLastname(String searchValue) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DbUtil.makeConnection();
            if (con != null) {
                String sql = "select username, password, lastname,role from "
                        + "Account where lastname like ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + searchValue + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    String fullname = rs.getString("lastname");
                    boolean role = rs.getBoolean("role");

                    AccountDTO dto = new AccountDTO(username, password, fullname, role);

                    if (this.listAccounts == null) {
                        this.listAccounts = new ArrayList<>();
                    }
                    this.listAccounts.add(dto);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public boolean deleteAccount(String username) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DbUtil.makeConnection();
            if (con != null) {
                String sql = "Delete from Account where username = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public boolean createAccount(AccountDTO dto) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DbUtil.makeConnection();
            if (con != null) {
                String sql = "insert into Account(username,password,lastname,role) values(?,?,?,?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, dto.getUsername());
                stm.setString(2, dto.getPassword());
                stm.setString(3, dto.getLastname());
                stm.setBoolean(4, dto.isRole());
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
   public boolean update(String username,String password,boolean role) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DbUtil.makeConnection();
            if (con != null) {
                String sql = "update Account set password = ?, role = ? where username = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, password);
                stm.setBoolean(2, role);
                stm.setString(3, username);            
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
   
   
   
}
