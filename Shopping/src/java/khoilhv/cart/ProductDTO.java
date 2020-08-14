/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khoilhv.cart;

/**
 *
 * @author Infinity
 */
public class ProductDTO {
    private String productName;

    public ProductDTO() {
    }

    public ProductDTO(String productName) {
        this.productName = productName;
    }

    
    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }
    
}
