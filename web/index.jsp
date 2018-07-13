
<%
     int status = 0;
     if(request.getSession().getAttribute("status") != null){
          status = (Integer)request.getSession().getAttribute("status");
     }
%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
	<meta name="viewport" content="width= device-width, initial-scale= 1.0">
	<link rel="stylesheet" type="text/css" href="base.css">
	<link rel="stylesheet" type="text/css" href="style.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="jquery-3.2.1.js"></script>
     <script src="js.js"></script>


	<title>Početna</title>
</head>
<body>

    <%@include file="nav.jsp" %>
       
	<% if(1== status) { %>
         <a class="orderer" href="ListServlet?add=1">Porudžbine</a>
         <a class="orderer" href="newproduct.jsp">Novi proizvod</a>
        <% } %>
	
<div class="slider">
	<div class="slide_container">
		<div class="slide">
			<span class="slide_title">Laptopovi</span>
			<img srcset="img/mac.png" width="55%" height="300">
		</div>
		<div class="slide">
			<span class="slide_title">Tableti</span>
			<img srcset="img/tablet.jpg" width="55%" height="300">
		</div>
		<div class="slide">
			<span class="slide_title">Televizori</span>
			<img srcset="img/tv.jpg" width="55%" height="300">
		</div>
		<div class="slide">
			<span class="slide_title">Mobilni telefoni</span>
			<img srcset="img/telefon.jpg" width="55%" height="300">
		</div>
	</div>
	<div class="arrow">
			<span class="arrow_previous"><i class="fas fa-caret-left"></i></span>
			<span class="arrow_next"><i class="fas fa-caret-right"></i></span>
		</div>
	<div class="numerate">
		 <div class="numerate_container">	   
			<div class="numerate_item"></div>
			<div class="numerate_item"></div>
			<div class="numerate_item"></div>
			<div class="numerate_item"></div>
		 </div>	
		</div>
</div>

<div class="index_content">
   	<div class="index_news">
		<div class="col-1-3 index_column">
			<h3>Otvaranje nove prodavnice</h3>
			<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s. </p>
		</div>
		<div class="col-1-3 index_column">
			<h3>Popusti do 20%</h3>
			<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s. </p>

		</div>
		<div class="col-1-3 index_column">
			<h3>Nove stvari u ponudi</h3>
			<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s. </p>

		</div>
	</div>
</div>
<div id="footer"><%@include file="footer.jsp" %></div>
</body>
</html>