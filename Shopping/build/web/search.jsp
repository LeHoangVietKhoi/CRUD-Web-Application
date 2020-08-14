<%-- 
    Document   : search
    Created on : Jun 28, 2020, 3:32:18 PM
    Author     : Infinity
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="p" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>
    </head>
    <body>
        <p:set var="name" value="${sessionScope.LASTNAME}"/>
        <p:if test="${not empty name}">
            Welcome:
            <font color="red">
            ${sessionScope.LASTNAME}
            </font><br>

            <p:url var="logoutLink" value="logout"/>           
            <a href="${logoutLink}">Logout</a>
            <h1>Search page</h1>

            <form action="search">
                Search value <input type="text" name="txtSearchValue" value="${param.txtSearchValue}" /><br>
                <input type="submit" value="Search" name="btAction" />
            </form><br>
            <p:set var="error" value="${requestScope.CREATEERROR}"/>
            <p:if test="${not empty error.passwordLengthErr}">
                <font color="red">
                ${error.passwordLengthErr}
                </font>
            </p:if>

            <p:set var="searchValue" value="${param.txtSearchValue}"/>
            <p:if test="${not empty searchValue}">
                <p:set var="result" value="${requestScope.SEARCH_RESULT}"/>
                <p:if test="${not empty result}">
                    <table border="1">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Username</th>
                                <th>Password</th>
                                <th>Full name</th>
                                <th>Role</th>
                                <th>Delete</th>
                                <th>Update</th>
                            </tr>
                        </thead>
                        <tbody>
                            <p:forEach var="dto" items="${result}" varStatus="counter">
                            <form action="updateAccount">
                                <tr>
                                    <td>
                                        ${counter.count}
                                    </td>
                                    <td>
                                        ${dto.username}
                                        <input type="hidden" name="txtUsername" value="${dto.username}" />
                                    </td>
                                    <td>
                                        <input type="text" name="txtPassword" value="${dto.password}" />
                                    </td>
                                    <td>
                                        ${dto.lastname}
                                        <input type="hidden" name="txtFullname" value="${dto.lastname}" />
                                    </td>
                                    <td>
                                        <input type="checkbox" name="chkAdmin" value="ON"
                                               <p:if test="${dto.role}">
                                                   checked="checked"
                                               </p:if>
                                               />
                                    </td>
                                    <td>
                                        <p:url var="deleteLink" value="deleteAccount">
                                            <p:param name="selectUsername" value="${dto.username}"/>
                                            <p:param name="lastSearchValue" value="${searchValue}"/>
                                            <p:param name="loginUser" value="${sessionScope.LOGINUSER}"/>
                                        </p:url>
                                        <a href="${deleteLink}">Delete</a>
                                    </td>
                                    <td>
                                        <input type="submit" value="Update" name="btAction" />
                                        <input type="hidden" name="lastSearchValue" value="${searchValue}" />
                                    </td>
                                </tr>
                            </form>
                        </p:forEach>
                    </tbody>
                </table>               
            </p:if>

            <p:if test="${empty result}">
                <h2>No record is matched!!!</h2>
            </p:if>
        </p:if>
    </p:if>
    <p:if test="${empty name}">
    <p:redirect url="loginPage"/>
</p:if>
</body>
</html>
