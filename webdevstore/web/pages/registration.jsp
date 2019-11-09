

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Registration</h1>

        <form action="/webdevstore/StoreController" method="post">
            <input type="hidden" name="action" value="Register">    
            <label class="pad_top">Name:</label>
            <input type="text" name="fullName" required><br>
            <label class="pad_top">Email:</label>
            <input type="email" name="email" required><br>
            <label class="pad_top">Password:</label>
            <input type="password" name="password" required><br>
            <input type="submit" value="Register">
        </form>

        <div class="thick">
            <a href="/webdevstore/index.jsp">Home</a>
        </div>
    </body>
</html>
