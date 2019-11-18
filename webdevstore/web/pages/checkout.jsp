

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/webdevstore/styles/main.css" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Checkout</h1>

        <%@ page import="java.util.logging.Logger, mmp.business.*, java.util.*" %>

        <%
            Logger logger = Logger.getLogger(this.getClass().getName());
            User user = (User) session.getAttribute("user");
            String name = "Guest";
            String email = "not logged in";
            String ccNum = "";
            String ccExp = "";
            if (user != null) {
                logger.info("welcome back " + user.getName());
                name = user.getName();
                if (user.getEmail() != null && user.getEmail().length() != 0) {
                    email = "logged in as " + user.getEmail();
                }
                if (user.getCcNumber() != null) {
                    ccNum = user.getCcNumber();
                    log("ccNum: " + ccNum);
                }
                if (user.getCcExp() != null) {
                    ccExp = user.getCcExp();
                    log("ccExp: " + ccExp);
                }
            } else {
                logger.info("user is null");
            }

            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                cart.setItems(new ArrayList<Item>());
            }
            logger.info("cart size is " + cart.getItems().size());
        %>

        <div class="thick">
            <a href="/webdevstore/pages/cart.jsp">Cart size: <%= cart.getTotalItemCount()%></a>
        </div><br/>
        <div>
            Welcome <%= name%>
        </div>
        <div>
            <%= email%>
        </div><br/>
        <form action="/webdevstore/StoreController" method="post">
            <fieldset>
                <legend>Payment Details</legend>
                <label class="pad_top">Credit Card Type: Visa Only</label>
                <label class="pad_top">Credit Card Number:</label>
                <input type="text" name="ccNum" value="<%= ccNum%>" required><br>
                <label class="pad_top">Exp Date (MM/YY):</label>
                <input type="text" name="ccExp" value="<%= ccExp%>" required><br>
            </fieldset><br/>

            <input type="hidden" name="action" value="submitOrder">    
            <input type="submit" value="Submit Order">

        </form><br/>
        <div class="thick">
            <a href="/webdevstore/index.jsp">Home</a>
        </div>
    </body>
</html>
