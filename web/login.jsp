<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="form.css">
	<title></title>
</head>
<body>
   <form action="LoginServlet" method="post">
   	     <h1>Ulogujte se:</h1>
               <div class="form_group">
                <input type="text" id="log_username" placeholder="username"  name="username" required>
                <label for="log_username">Unesite username:</label>
               </div>
               <div class="form_group"> 
                <input type="password" id="log_password" placeholder="password" name="password" required>
                <label for="log_password">Unesite password:</label>
               </div> 
                <input type="submit" id="log_submit" value="Login"><br>
            </form>
</body>
</html>
