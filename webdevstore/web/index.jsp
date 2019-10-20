<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>MMP Movie Entertainment</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styles/main.css" type="text/css"/>
    </head>
    <body>
        <div class="header">
            <p>Store Front</p>
        </div>

        <h1>MMP Movie Entertainment</h1>

        <%@ page import="java.util.logging.Logger, mmp.business.*, java.util.*" %>

        <%
            Logger logger = Logger.getLogger(this.getClass().getName());
            User user = (User) session.getAttribute("user");
            if (user != null) {
                logger.info("welcome back " + user.getName());
            } else {
                logger.info("user is null");
            }

            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null)
            {
                cart = new Cart();
                cart.setItems(new ArrayList<Item>());
            }
            logger.info("cart size is " + cart.getItems().size());
        %>

        
        <div class="thick">
            Cart size: <%= cart.getItems().size()%>
        </div>
        
        <form action="pages/cart.jsp" method="post">
            <input type="submit" value="cart">
        </form>
        <form action="pages/catalog.jsp" method="post">
            <input type="submit" value="catalog">
        </form>
        <form action="pages/checkout.jsp" method="post">
            <input type="submit" value="checkout">
        </form>
        <form action="pages/registration.jsp" method="post">
            <input type="submit" value="registration">
        </form>
        <form action="pages/survey.jsp" method="post">
            <input type="submit" value="survey">
        </form>

        <form action="StoreController" method="post">
            <input type="hidden" name="action" value="login">    

            <fieldset>
                <legend>Login</legend>
                <label class="pad_top">Email:</label>
                <input type="email" name="email" required><br>
                <label class="pad_top">Password:</label>
                <input type="password" name="password" required><br>
                <input type="submit" value="Login" >
            </fieldset>

        </form>

    </body>
</html>