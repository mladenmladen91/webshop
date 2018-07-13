<%-- 
    Document   : newproduct
    Created on : May 25, 2018, 9:44:23 PM
    Author     : User
--%>
<%@page import="java.util.Iterator"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="model.Producttype"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="model.HibernateUtil"%>
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
   }}catch(Exception ex){
        if(tx != null){
           tx.rollback();
        }  
   
   }finally{
       sesija.close();
   }
   
   
   request.getSession().setAttribute("productTypes", products);
   Iterator it = products.iterator();
   
   if(request.getSession().getAttribute("status") == null){
        response.sendRedirect("index.jsp");
     }else{
         if(1 != (Integer)request.getSession().getAttribute("status")){
            response.sendRedirect("index.jsp");
         }
     }
   
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="form.css">
        <title>New Product</title>
    </head>
    <body>
        
        <form action="SaveServlet" method="post" enctype="multipart/form-data">
            <h1>Enter new product:</h1>
            
            <input type="text" name="name" required/>
            <label>Unesi ime:</label>
            <input type="number" name="quantity" required/>
            <label>Unesi količinu:</label><br>
            <input type="text" name="price" required/>
            <label>Unesi cijenu:</label><br>
            <select  name="producttype"/>
            <% while(it.hasNext()){
                Producttype p = (Producttype)it.next();
            %>
                <option value="<%=p.getId()%>"><%=p.getName()%></option>
            <% } %>
        </select><br>
            <label>Unesi vrstu proizvoda:</label>
            
            <input type="file" name="photo" required/>
            <label>Uploaduj fotografiju:</label>
            <input type="submit" id="log_submit" value="sačuvaj"/>
        </form>
        <c:if test="${success==1}">
            <span class="info">Uspješno sačuvano</span>
        </c:if>
         <c:if test="${success==0}">
            <span class="info">Upišite tačan format cijene</span>
        </c:if> 
        <c:if test="${success==2}">
            <span class="info">Greška u čuvanju</span>
        </c:if>    
            <div class="orderer"><a href="index.jsp">Početna strana</a></div> 
       
    </body>
</html>
