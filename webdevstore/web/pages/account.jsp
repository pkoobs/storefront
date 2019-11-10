
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/webdevstore/styles/main.css" type="text/css"/>
        <title>Account</title>
    </head>
    <body>
        <h1>Account Settings</h1>

        <%@ page import="java.util.logging.Logger, mmp.business.*, java.util.*" %>

        <%
            Logger logger = Logger.getLogger(this.getClass().getName());

            User user = (User) session.getAttribute("user");
            String name = "";
            String email = "";
            String phone = "";
            String address = "";
            String zip = "";
            String ccNum = "";
            String ccExp = "";
            String state = "";
            String city = "";
            if (user != null) {
                log("user: " + user);
                name = user.getName();
                email = user.getEmail();

                if (user.getPhoneNumber() != null && user.getPhoneNumber().length() != 0) {
                    phone = user.getPhoneNumber();
                }
                if (user.getAddress() != null && user.getAddress().length() != 0) {
                    address = user.getAddress();
                }
                if (user.getZip() != null && user.getZip().length() != 0) {
                    zip = user.getZip();
                }
                if (user.getCcNumber() != null && user.getCcNumber().length() != 0) {
                    ccNum = user.getCcNumber();
                }
                if (user.getCcExp() != null && user.getCcExp().length() != 0) {
                    ccExp = user.getCcExp();
                }
                if (user.getState() != null && user.getState().length() != 0) {
                    state = user.getState();
                }
                if (user.getCity() != null && user.getCity().length() != 0) {
                    city = user.getCity();
                }
            }
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
        </div>
        <br>
        <form action="/webdevstore/StoreController" method="post">
            <fieldset>
                <legend>New User</legend>
                <label class="pad_top">Full Name:</label>
                <input type="text" name="fullname" value="<%= name%>" required><br>
                <label class="pad_top">Email:</label>
                <input type="email" name="email" value="<%= email%>" required><br>
                <label class="pad_top">Password:</label>
                <input type="password" name="password" required><br>
                <label class="pad_top">Address:</label>
                <input type="text" name="address" value="<%= address%>" required><br>
                <label class="pad_top">City:</label>
                <input type="text" name="city" value="<%= city%>" required><br>
                <label class="pad_top">State:</label>
                <input type="text" name="state" pattern="[A-Z]{2}" title="XX" value="<%= state%>" required><br>
                <label class="pad_top">Zip:</label>
                <input type="text" name="zip" pattern="[0-9]{5}" value="<%= zip%>" required><br>
                <label class="pad_top">Phone:</label>
                <input type="tel" name="phone" value="<%= phone%>" required><br>     

                <fieldset>
                    <legend>CC Info (Optional)</legend>
                    <label class="pad_top">Credit Card Type: Visa Only</label>
                    <label class="pad_top">Credit Card Number:</label>
                    <input type="text" name="ccNum" pattern="[0-9]{16}"title="16 digit Visa" value="<%= ccNum%>" ><br>
                    <label class="pad_top">Exp Date (MM/YY):</label>
                    <input type="text" name="ccExp" value="<%= ccExp%>"><br>
                </fieldset>
                <input type="hidden" name="action" value="updateAccount"> 
                <input type="submit" value="Update" >
            </fieldset>
        </form>
        <br>
        <fieldset>
            <legend>Order History</legend>
            <p>coming soon</p>
        </fieldset>

        <div class="thick">
            <a href="/webdevstore/index.jsp">Home</a>
        </div>
    </body>
</html>
