/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khoilhv.cart;

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
public class cartDAO {
    
    
   public List<ProductDTO> loadProduct() throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        List<ProductDTO> result = new ArrayList<>();
        try {
            con = DbUtil.makeConnection();
            if (con != null) {
                String sql = "select productName from product  ";                     
                pr = con.prepareStatement(sql);
                rs = pr.executeQuery();
                while (rs.next()) {  
                String productName = rs.getString("productName");
                ProductDTO dto = new ProductDTO(productName);
                result.add(dto);
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
        return result;
    }
}
