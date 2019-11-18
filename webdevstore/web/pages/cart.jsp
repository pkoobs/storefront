

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
        <h1>Cart</h1>

        <%@ page import="java.util.logging.Logger, mmp.business.*, java.util.*" %>

        <%
            Logger logger = Logger.getLogger(this.getClass().getName());
            User user = (User) session.getAttribute("user");
            String name = "Guest";
            String email = "not logged in";
            if (user != null) {
                logger.info("welcome back " + user.getName());
                name = user.getName();
                if (user.getEmail() != null && user.getEmail().length() != 0) {
                    email = "logged in as " + user.getEmail();
                }
            } else {
                logger.info("user is null");
            }

            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                cart.setItems(new ArrayList<Item>());
            }
            logger.info("cart size is " + cart.getTotalItemCount());
        %>

        <div class="thick">
            Cart size: <%= cart.getTotalItemCount()%>
        </div><br/>
        <div>
            Welcome <%= name%>
        </div>
        <div>
            <%= email%>
        </div><br/>
        <%
            if (cart.getTotalItemCount() == 0) {
        %>

        <div>Empty Cart</div><br/>
        <%
            }
        %>

        <c:forEach items="${cartItems}" var="item" >
            <div>
                <span><c:out value="${item.name}" /></span>

                <form action="/webdevstore/StoreController" method="post">

                    <c:if test="${item.getDvdQuantity() > 0}">
                        ${item.getDvdQuantity()}x
                        <input type="submit" name="action" value="Remove DVD">
                        <input type="hidden" name="movieCode" value="${item.name}">
                    </c:if>
                    <c:if test="${item.getBluRayQuantity() > 0}">
                        ${item.getBluRayQuantity()}x
                        <input type="submit" name="action" value="Remove Bluray">
                        <input type="hidden" name="movieCode" value="${item.name}">
                    </c:if>
                    <c:if test="${item.getDigitalQuantity() > 0}">
                        ${item.getDigitalQuantity()}x
                        <input type="submit" name="action" value="Remove Digital">
                        <input type="hidden" name="movieCode" value="${item.name}">
                    </c:if>

                </form>


            </div><br/>
        </c:forEach>

        <form action="/webdevstore/StoreController" method="post">
            <input type="hidden" name="action" value="catalog">    
            <input type="submit" value="catalog">
        </form><br/>

        <form action="/webdevstore/StoreController" method="post">
            <input type="hidden" name="action" value="checkout"> 
            <input type="submit" class="checkoutButton" value="checkout">
        </form><br/>

        <div class="thick">
            <a href="/webdevstore/index.jsp">Home</a>
        </div>
    </body>
</html>
