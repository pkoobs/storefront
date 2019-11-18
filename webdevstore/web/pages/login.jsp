
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

            String cookieEmail = "";
            if (session.getAttribute("cookieEmail") != null) {
                cookieEmail = (String) session.getAttribute("cookieEmail");
            }
        %>

        <div class="thick">
            <a href="/webdevstore/pages/cart.jsp">Cart size: <%= cart.getTotalItemCount()%></a>
        </div><br/>

        <form action="/webdevstore/StoreController" method="post">
            <fieldset>
                <legend>Login</legend>
                <label class="pad_top">Email:</label>
                <input type="email" name="email" value="<%= cookieEmail%>" required><br>
                <label class="pad_top">Password:</label>
                <input type="password" name="password" required><br>
                <input type="hidden" name="action" value="login"> 
                <input type="submit" value="Login" >
            </fieldset>
        </form>
        <br>
        <form action="/webdevstore/StoreController" method="post">
            <fieldset>
                <legend>New User</legend>
                <label class="pad_top">Full Name:</label>
                <input type="text" name="fullname" required><br>
                <label class="pad_top">Email:</label>
                <input type="email" name="email" required><br>
                <label class="pad_top">Password:</label>
                <input type="password" name="password" required><br>
                <label class="pad_top">Address:</label>
                <input type="text" name="address" required><br>
                <label class="pad_top">City:</label>
                <input type="text" name="city" required><br>
                <label class="pad_top">State:</label>
                <input type="text" name="state" pattern="[A-Z]{2}" title="XX" required><br>
                <label class="pad_top">Zip:</label>
                <input type="text" name="zip" pattern="[0-9]{5}" required><br>
                <label class="pad_top">Phone:</label>
                <input type="tel" name="phone" required><br>     

                <fieldset>
                    <legend>CC Info (Optional)</legend>
                    <label class="pad_top">Credit Card Type: Visa Only</label>
                    <label class="pad_top">Credit Card Number:</label>
                    <input type="text" name="ccNum" pattern="[0-9]{16}"title="16 digit Visa" ><br>
                    <label class="pad_top">Exp Date (MM/YY):</label>
                    <input type="text" name="ccExp" ><br>
                </fieldset>
                <input type="hidden" name="action" value="register"> 
                <input type="submit" value="Register" >
            </fieldset>
        </form><br/>

        <div class="thick">
            <a href="/webdevstore/index.jsp">Home</a>
        </div>
    </body>
</html>
