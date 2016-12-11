<%--
  Created by IntelliJ IDEA.
  User: piotrpawlus
  Date: 11/12/2016
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Apteka</title>
</head>
<body>
<h1>Hello World!</h1>

<table>
    <tr>
        <th>Id</th>
        <th>email</th>
        <th>Profile</th>
        <th>Position</th>
    </tr>
    <c:forEach items="${users}" var="user">
        <tr>
            <td><c:out value="${user.id}"/></td>
            <td>e<c:out value="${user.email}"/></td>
            <td>p<c:out value="${user.profileID}"/></td>
            <td>d<c:out value="${user.positionID}"/></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
