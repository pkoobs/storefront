

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Survey Page</title>
        <link rel="stylesheet" href="styles/main.css" type="text/css"/>
    </head>
    <body>
        <h1>Survey</h1>
        <%@ page import="java.util.logging.Logger, mmp.business.*, java.util.*" %>

        <form action="../StoreController" method="post">
            <input type="hidden" name="action" value="Survey">      

            <fieldset>
                <legend>Selection Quality (5 is highest)</legend>
                <input type="radio" id="selection1" name="selection" value="1" >
                <input type="radio" id="selection2" name="selection" value="2" >
                <input type="radio" id="selection3" name="selection" value="3" checked>
                <input type="radio" id="selection4" name="selection" value="4" >
                <input type="radio" id="selection5" name="selection" value="5" >
            </fieldset>

            <fieldset>
                <legend>Shipping Speed (5 is highest)</legend>
                <input type="radio" id="shipping1" name="shipping" value="1" >
                <input type="radio" id="shipping2" name="shipping" value="2" >
                <input type="radio" id="shipping3" name="shipping" value="3" checked>
                <input type="radio" id="shipping4" name="shipping" value="4" >
                <input type="radio" id="shipping5" name="shipping" value="5" >
            </fieldset>

            <input type="submit" value="Submit Survey">
        </form>
    <br/>
    <form action="../index.jsp" method="POST">
        <input type="submit" value="Return Home" style="border: 2px solid black;">
    </form>
    </body>
</html>
