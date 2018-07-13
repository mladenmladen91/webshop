<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="model.Sign"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%
  List<Product>lp =(List<Product>)request.getSession().getAttribute("productList");
  
  int status = 0;
  Sign s = new Sign();
  
    if(request.getSession().getAttribute("signuser") != null && request.getSession().getAttribute("status") != null){
        status = (Integer)request.getSession().getAttribute("status");
            s = (Sign)request.getSession().getAttribute("signuser");
        
        }
        
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width= device-width, initial-scale= 1.0">
	<link rel="stylesheet" type="text/css" href="base.css">
        <link rel="stylesheet" type="text/css" href="result.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="jquery-3.2.1.js"></script>
        <script src="js/js.js"></script>
	
        <title>Rezultati</title>
</head>
<body>
   <div class="includer"><%@include file="nav.jsp" %></div>
   <% if(0 == status){ %>   
   <div class="login_content"><span class="login_content_left"><a href="login.jsp">Log in</a></span> <span class="login_content_left"><a href="signup.jsp">Sign up</a></span></div>    
          <% } %>
   <% if(1 == status || 2 == status){ %>  
        <div class="login_content"><span class="login_content_left">Welcome <%=s.getUsername()%></span><span class="login_content_right"><a href="SignOut?signout=1">Sign out</a></span></div>
        <% } %> 
  	
  <div class="result_content">
    <% for(Product p: lp) { %>
  	<div class="col-1-3 result">
  		<div class="result_front">
  			<img src="<%=p.getPicturepath()%>" alt="<%=p.getName() %>">
  			<span><%=p.getName() %></span>
  			<span><%=p.getPrice()%></span>
  		</div>
                
  		<div class="result_back">
  			<div class="result_back_content">
                           <% if(0 == status) { %>
                             <span>Ostalo je još: <%=p.getStock()%> komada</span>
                           <% } %>
           
                           <% if(2 == status) { %>
                                <% if(0 < p.getStock() ) { %>
  			          <span>Ostalo je još: <%=p.getStock()%> komada</span>
                                  <a class="bucket_btn" href="BasketServlet?pid=<%=p.getId()%>">Kupi</a>
                                <% }else{ %>
                                  <span>Artikl više nije dostupan</span>
                                <% } %>   
                           <% } %>
            
                           <% if(1 == status) { %>
                                 <span>Ostalo je još: <%=p.getStock()%> komada</span>
                                 <a class="bucket_btn" href="refill.jsp?pid=<%=p.getId()%>">Dodaj</a>
                           <% } %>
  			</div>
  		</div>
  	</div>
    <% } %>
           
    <% if(lp.isEmpty() || lp == null){ %>    
        <div class="result_content_nothing">Nemamo traženi artikl</div>
    <%  } %>   
  </div>
  
  <div><%@include file="footer.jsp" %></div>
</body>
</html>

