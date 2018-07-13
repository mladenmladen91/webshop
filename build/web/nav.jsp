
<%@page import="model.StaticList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="java.lang.Integer"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="java.util.List"%>
<%@page import="model.Producttype"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Session"%>
<%@page import="model.HibernateUtil"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   Session sesija = HibernateUtil.createSessionFactory().openSession();
   Transaction tx = null;
   List<Producttype>products = null;
   try{
   if(tx == null){
       tx = sesija.beginTransaction();
        Criteria c = sesija.createCriteria(Producttype.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
          products = c.list();
        tx.commit();
   }
   }catch(Exception ex){
        if(tx != null){
           tx.rollback();
        }  
   
   }finally{
       sesija.close();
       request.getSession().setAttribute("productTypes", products);
   }
   
   
   
   List<Producttype>produkts =(List<Producttype>)request.getSession().getAttribute("productTypes");
   
   
   List<Product>bucket = new ArrayList();
   if(request.getSession().getAttribute("bucketlist") != null){
   bucket = (List<Product>)request.getSession().getAttribute("bucketlist");
   }
   
   double sum = 0.0;
   
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width= device-width, initial-scale= 1.0">
    <link rel="stylesheet" type="text/css" href="base.css">
    <link rel="stylesheet" type="text/css" href="style2.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="nav.js"></script>
    
</head>
<body>
    <header>
      <div class="nav_logo"><a href="index.jsp"><img src="img/logo.png" height="100" width="300"></a></div> 
      
      <div class="nav_ham">
        <span class="nav_ham_line"></span>
      </div>
      
      <nav class="nav">
        <a class="nav_link" href="index.jsp"><i class="fas fa-home"></i></a>
        <div class="nav_cat">
            <a class="nav_link droplist_top">Kategorije <span class="nav_arrow"><i class="fas fa-angle-down"></i></span></a>
            <div class="nav_droplist">
                <% for(Producttype produkt: produkts){ %>  
                  <a class="nav_link droplist_link" href="ProductServlet?id=<%=produkt.getId()%>" ><%=produkt.getName()%></a>
                <% } %>
            </div>
        </div>
        <a class="nav_link" href="placanje.jsp">Plaćanje</a>
        <a class="nav_link" href="kontakt.jsp">Kontakt</a>
      </nav>
      
      <div class="bucket">
       <div class="bucket_size">
            <i class="fas fa-shopping-cart"></i>
              <% if(bucket == null){ %>
                <span class="bucket_size_span">0</span>
              <% }else{ %>
                <span class="bucket_size_span"><%=bucket.size()%></span>
              <% } %>
        
        <div class="bucket_list">
            <% if(bucket.isEmpty() || bucket == null) { %>
               <span>Bucket is empty</span>
             <% }else{ %>
            <ul>
                 <% for(Product p : bucket) { %>
                   <li><%=p.getName()%>,<%=p.getPrice() %>€  <span><a href="RemoveServlet?out=<%=p.getId()%>">&times;</a></span></li>
                 <% sum+=p.getPrice();  } %>
           </ul>
            <div class="bucket_sum">Sum: <%=Math.ceil(sum)%>€</div>
            <% } %>
            <div class="bucket_btn_container">
                <% if(bucket.isEmpty() || bucket == null){ 
                }else{
                %>
                  <button class="bucket_btn"  onclick="window.location= './buyingdetails.jsp'">Nastavi</button>
            </div>
                <% } %>
        </div>
       </div>
      
    </header>
    
</body>  
</html>