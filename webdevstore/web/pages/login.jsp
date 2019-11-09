
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/webdevstore/styles/main.css" type="text/css"/>
        <title>Login Page</title>
    </head>
    <body>
        <h1>Please Login or Create new Account</h1>

        <%@ page import="java.util.logging.Logger, mmp.business.*, java.util.*" %>

        <%
            Logger logger = Logger.getLogger(this.getClass().getName());

            User user = (User) session.getAttribute("user");

            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                cart.setItems(new ArrayList<Item>());
            }
            logger.info("cart size is " + cart.getItems().size());
        %>

        <div class="thick">
            <a href="pages/cart.jsp">Cart size: <%= cart.getTotalItemCount()%></a>
        </div>

        <form action="/webdevstore/StoreController" method="post">
            <fieldset>
                <legend>Login</legend>
                <label class="pad_top">Email:</label>
                <input type="email" name="email" ><br>
                <label class="pad_top">Password:</label>
                <input type="password" name="password" ><br>
                <input type="hidden" name="action" value="login"> 
                <input type="submit" value="Login" >
            </fieldset>
        </form>

        <form action="/webdevstore/StoreController" method="post">
            <fieldset>
                <legend>New User</legend>
                <label class="pad_top">Full Name:</label>
                <input type="text" name="fullname" ><br>
                <label class="pad_top">Email:</label>
                <input type="email" name="email" ><br>
                <label class="pad_top">Password:</label>
                <input type="password" name="password" ><br>
                <input type="hidden" name="action" value="register"> 
                <input type="submit" value="Register" >
            </fieldset>
        </form>

            <div class="thick">
                <a href="/webdevstore/index.jsp">Home</a>
            </div>
    </body>
</html>
