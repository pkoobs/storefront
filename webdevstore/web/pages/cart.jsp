

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Cart</title>
    </head>
    <body>
        <h1>Cart</h1>

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
            if (cart == null) {
                cart = new Cart();
                cart.setItems(new ArrayList<Item>());
            }
            logger.info("cart size is " + cart.getItems().size());
        %>

        <c:forEach items="${cartItems}" var="item" >
            <div>
                <span><c:out value="${item.name}" /></span>

                <form action="StoreController" method="post">

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
            </div>
        </c:forEach>

    <br/>
    <form action="../index.jsp" method="POST">
        <input type="submit" value="Return Home" style="border: 2px solid black;">
    </form>    
    </body>
</html>
