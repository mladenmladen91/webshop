<%@page import="java.util.Collections"%>
<%@page import="model.OrderList"%>
<%@page import="model.OrderDetails"%>
<%@page import="java.util.List"%>
<%
    List<OrderDetails>od = (List<OrderDetails>)request.getSession().getAttribute("orders"); 
    Collections.reverse(od);
    double sum2 = 0.0;
    
     if(request.getSession().getAttribute("status") == null){
        response.sendRedirect("index.jsp");
     }else{
         if(1 != (Integer)request.getSession().getAttribute("status")){
            response.sendRedirect("index.jsp");
         }
     }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="base.css">
	<link rel="stylesheet" type="text/css" href="orders.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
</head>
<body>
  <div><%@include file="nav.jsp" %></div>
	<div class="orders_header"><i class="fas fa-shipping-fast"></i></div>
   <div class="orders_content">
        <% for(OrderDetails d : od){  %>
   	   <div class="col-1-4 orders_details">
   	   	   <span>Narudžbina br: <%=d.getId()%></span>
   	   	   <span>Adresa: <%=d.getAddress()%></span>
   	   	  <div class="orders_item">
   	   	  	 <ul>
              <%  for(OrderList ol : d.getOl()) { %>
   	   	  	 	<li><%=ol.getName()%>, <%=ol.getPrice()%></li>
   	   	  	 	<% 
              sum2+=ol.getPrice();
               }
             %>
   	   	  	 </ul>
          </div>
          <span>Sum: <%=sum2%><% sum2= 0.0; %>€</span> 
   	   </div>
          <%  }   %>
   </div>
</body>
</html>
