/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.HibernateUtil;
import model.OrderDetails;
import model.OrderList;
import model.Product;
import model.StaticList;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author User
 */
@WebServlet(name = "CompleteOrder", urlPatterns = {"/CompleteOrder"})
public class CompleteOrder extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
             
        String address = (String) request.getSession().getAttribute("address");
        String contact = (String) request.getSession().getAttribute("phone");
        
       System.out.println(address);
        
        int id = 0;
        OrderDetails od = new OrderDetails();
        Session sesija = HibernateUtil.createSessionFactory().openSession();
         Transaction t = null;
               Criteria c = sesija.createCriteria(OrderDetails.class);
                c.add(Restrictions.eq("address", address));
                c.add(Restrictions.eq("contact", contact));
           try{
              t = sesija.beginTransaction();
               
                od = (OrderDetails) c.uniqueResult();
                t.commit();
           }catch(Exception e){
               if(t != null){ t.rollback();}
               request.setAttribute("buy", 0);
               request.getRequestDispatcher("completed.jsp").forward(request, response);
           }finally{
             sesija.close();
           }
           request.setAttribute("buy", 1);
           request.getRequestDispatcher("completed.jsp").forward(request, response);
           
           
           
            
           
          
           
         List<Product>bucket = new ArrayList();
        if(request.getSession().getAttribute("bucketlist") != null){
            bucket = (List<Product>)request.getSession().getAttribute("bucketlist");
        } 
      
         
         Iterator<Product>it = bucket.iterator();
         while(it.hasNext()){
             OrderList ol = new OrderList();
         Session sesija2 = HibernateUtil.createSessionFactory().openSession();
         Transaction tx = null;
           try{
              tx = sesija2.beginTransaction();
              Product p = it.next();
              ol.setName(p.getName());
              ol.setPrice(p.getPrice());
              ol.setOrderdetails(od);
              sesija2.save(ol);
              tx.commit();  
           }catch(Exception e){
               if(tx != null){ tx.rollback();}
           }finally{
             sesija2.close();
            
           }
           
         }
         
          List<Product>bucket2 = new ArrayList();
        if(request.getSession().getAttribute("bucketlist") != null){
            bucket2 = (List<Product>)request.getSession().getAttribute("bucketlist");
        }
         
         Iterator<Product>it2 = bucket2.iterator();
          while(it2.hasNext()){
          Product p = it2.next();
         Session sesija2 = HibernateUtil.createSessionFactory().openSession();
         Transaction tx = null;
           try{
              tx = sesija2.beginTransaction();
              Product pr = (Product) sesija2.get(Product.class, p.getId());
                if(pr.getStock() > 0){
                    pr.setStock(pr.getStock() - 1);
                    sesija2.update(pr);
                }else{
                 continue;
                }
                tx.commit();
           }catch(Exception e){
               if(tx != null){ tx.rollback(); }
           }finally{
             sesija2.close();
              
               
           }
           
          
                   
           
         }
          StaticList.list.clear();
           bucket.clear();
           
           response.sendRedirect("finish.jsp");
          
         
         
         
         
         
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
