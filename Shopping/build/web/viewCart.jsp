<%-- 
    Document   : viewCart
    Created on : Jun 18, 2020, 10:21:51 AM
    Author     : Infinity
--%>

<%@page import="java.util.Map"%>
<%@page import="khoilhv.cart.CartObj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="p" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Store</title>
    </head>
    <body>
        <h1>Your cart</h1>
        <p:set var="cart" value="${sessionScope.CART}"/>
        <p:if test="${not empty cart.items}">
        <table border="1">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Title</th>
                    <th>Quantity</th>
                    <th>Action</th>
                </tr>
            </thead>
                        
                <tbody>
                     <form action="removeItem"> 
                    <p:forEach var="item" items="${cart.items}" varStatus="counter">
                    <tr>
                        <td>
                            ${counter.count}
                        </td>
                        <td>
                            ${item.key}
                        </td>
                        <td>
                            ${item.value}
                        </td>
                        <td><input type="checkbox" name="chkItem"  value="${item.key}"/>
                        </td>
                    </tr>
                    </p:forEach>        
                    <tr>
                        <td colspan="3">
                            <a href="shop"> Add more books to your cart</a>    
                        </td>
                        <td>
                            <input type="submit" value="Remove" name="btAction"/>
                        </td>
                    </tr>                 
                    </form>
                </tbody>
                     
        </table>
</p:if> 
       <p:if test="${empty cart.items}">
        <h2>
            No cart is existed!!!<br>
            <a href="shop"> Add more books to your cart</a>    
        </h2>
        </p:if>
    </body>
</html>
