<%-- 
    Document   : buyingdetails
    Created on : Jun 2, 2018, 11:13:59 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="form.css">
        <title>Detalji</title>
    </head>
    <body>
        <form action="OrderServlet" method="get">
            <h1>Unesite adresu:</h1>
            <input type="text" name="address" required>
            <label>Unesite adresu:</label>
            <input type="text" name="contact" required>
            <label>Unesite telefon:</label>
            <input type="submit" id="log_submit" value="kupi">
       </form>
    </body>
</html>
