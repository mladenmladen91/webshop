<%-- 
    Document   : kontakt.jsp
    Created on : Jul 12, 2018, 10:38:25 AM
    Author     : User
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width= device-width, initial-scale= 1.0">
	<link rel="stylesheet" type="text/css" href="base.css">
        <link rel="stylesheet" type="text/css" href="result.css">
        <title>Plaćanje</title>
    </head>
    <body>
       <div class="includer"><%@include file="nav.jsp" %></div>
       <c:if test="${buy == 1}">
         <div class="result_content_nothing">Kupovina izvršena uspješno</div>  
       </c:if>
       <c:if test="${buy == 0}">
         <div class="result_content_nothing">Greška u kupovini</div>  
       </c:if>  
       
    </body>
</html>
