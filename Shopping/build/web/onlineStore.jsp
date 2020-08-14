<%-- 
    Document   : onlineStore
    Created on : Jul 15, 2020, 9:40:52 AM
    Author     : Infinity
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="p" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>      
            <form action="cart">     
                Choose book <select name="cboBook">              
                    <p:set var="result" value="${requestScope.ALLPRODUCT}"/>
                    <p:forEach var="dto" items="${result}">
                        <option>${dto.productName}</option>
                    </p:forEach>
                </select><br/>
    <input type="submit" value="Add book to your cart" name="btAction" />
    <input type="submit" value="View your cart" name="btAction" />
    </form>
</body>
</html>
