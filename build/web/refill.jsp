
<%
     String id = request.getParameter("pid"); 

     if(request.getSession().getAttribute("status") == null){
        response.sendRedirect("index.jsp");
     }else{
         if(1 != (Integer)request.getSession().getAttribute("status")){
            response.sendRedirect("index.jsp");
         }
     }
     
    
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="form.css">
        <title>Dodaj</title>
    </head>
    <body>
        
        <form action="RefillServlet" method="post">
                 <h1>Dodaj zalihu:</h1>
                <input type="number" name="quantity" required>
                <label>Dodajte količinu:</label>
                <input type="hidden" name="id" value="<%=id%>">
                <input type="submit" id="log_submit" value="Dodaj">
        </form>
        
      <c:if test="${success==1}">
            <span class="info">Successfully inserted</span>
      </c:if>
      <c:if test="${success==2}">
            <span class="info">Error in saving</span>
      </c:if> 
      <a class="orderer" href="index.jsp">Početna strana</a>
    </body>
</html>
