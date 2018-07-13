
<%

    if(request.getSession().getAttribute("status") == null){
        response.sendRedirect("index.jsp");
     }else{
         if(1 != (Integer)request.getSession().getAttribute("status") || 2 != (Integer)request.getSession().getAttribute("status")){
            response.sendRedirect("index.jsp");
         }
     }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Kupovina:</h1>
        <div>
            <span>Obavili ste kupovinu!</span>
            </div>
        <div><a href="index.jsp">Početna</a></div>
    </body>
</html>
