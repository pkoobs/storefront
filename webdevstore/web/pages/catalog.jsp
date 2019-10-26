

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Catalog</h1>
        <%@ page import="java.util.logging.Logger, mmp.business.*, java.util.*" %>

        <%
            User user = (User) session.getAttribute("user");
        %>


        <%
            Logger logger = Logger.getLogger(this.getClass().getName());
            List<Item> catalog = (List<Item>) session.getAttribute("catalog");
            if (catalog != null) {
                for (Item item : catalog) {
                    logger.info("item " + item.getName());
                }

            }
        %>

        <div class="thick">
            <%
                if (user != null) {
            %>

            Welcome back <%= user.getEmail()%>!
            <%
                }
            %>
        </script>
    </div>


    <!-- We need to add boxes Fields digital, BR, or DVD -->
    <c:forEach items="${catalog}" var="item" >
        <div>
            <span><c:out value="${item.name}" /></span>

            <form action="StoreController" method="post">

                <c:if test="${item.getDvdQuantity() > 0}">
                    <input type="submit" name="action" value="Add DVD">
                    <input type="hidden" name="movieCode" value="${item.name}">
                </c:if>
                <c:if test="${item.getBluRayQuantity() > 0}">
                    <input type="submit" name="action" value="Add Bluray">
                    <input type="hidden" name="movieCode" value="${item.name}">
                </c:if>
                <c:if test="${item.getDigitalQuantity() > 0}">
                    <input type="submit" name="action" value="Add Digital">
                    <input type="hidden" name="movieCode" value="${item.name}">
                </c:if>

            </form>
        </div>
    </c:forEach>



</body>
</html>
