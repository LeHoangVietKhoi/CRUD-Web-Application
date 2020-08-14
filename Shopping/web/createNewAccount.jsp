<%-- 
    Document   : createNewAccount
    Created on : Jul 6, 2020, 10:52:23 AM
    Author     : Infinity
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="p" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create account page</title>
    </head>
    <body>
        <form action="createAccount" method="POST">
            <p:set var="error" value="${requestScope.CREATEERROR}"/>
            Username <input type="text" name="txtUsername" value="${param.txtUsername}" />(6 - 30 chars)<br/>
            <p:if test="${not empty error.usernameLengthErr}">
                <font color="red">
                ${error.usernameLengthErr}
                </font><br/>
            </p:if>
            Password <input type="password" name="txtPassword" value="" />(6 - 30 chars)<br/>
            <p:if test="${not empty error.passwordLengthErr}">
                <font color="red">
                ${error.passwordLengthErr}
                </font><br/>
            </p:if>
            Confirm  <input type="password" name="txtConfirm" value="" />(6 - 30 chars)<br/>
            <p:if test="${not empty error.confirmNotMatchErr}">
                <font color="red">
                ${error.confirmNotMatchErr}
                </font><br/>
            </p:if>
                Full name <input type="text" name="txtFullname" value="${param.txtFullname}" /><br/>
            <p:if test="${not empty error.fullnameLengthErr}">
                <font color="red">
                ${error.fullnameLengthErr}
                </font><br/>
            </p:if>
            <input type="submit" value="Create new account" name="btAction" />(2 - 50 chars)<br/>
            <input type="reset" value="Reset" />
        </form>
            <p:if test="${not empty error.usernameIsExisted}">
                <font color="red">
                ${error.usernameIsExisted}
                </font><br/>
            </p:if>
    </body>
</html>
