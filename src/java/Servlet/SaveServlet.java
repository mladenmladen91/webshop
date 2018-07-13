/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.HibernateUtil;
import model.Product;
import model.Producttype;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author User
 */
@WebServlet(name = "SaveServlet", urlPatterns = {"/SaveServlet"})
 @MultipartConfig  
public class SaveServlet extends HttpServlet {

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
           
           Part photo = request.getPart("photo");
           String root = "C:/Users/User/Documents/NetBeansProjects/WebStore/web/";
           String random = UUID.randomUUID().toString();
           String picname = photo.getSubmittedFileName();
           String fullPicName = random + picname;
           String path = root+fullPicName;
            FileOutputStream fos = new FileOutputStream(path); 
            InputStream fis = photo.getInputStream();
           int bajt = 0;
           String name = request.getParameter("name");
           int quantity = Integer.parseInt(request.getParameter("quantity"));
           
           int type = Integer.parseInt(request.getParameter("producttype"));
           Double price = 0.0;
         
           try{
               price =Double.parseDouble(request.getParameter("price"));
               while((bajt= fis.read()) != -1){
                  fos.write(bajt);
               }
             fos.close();
              
               Product prod = new Product();
               prod.setName(name);
               prod.setStock(quantity);
               prod.setPrice(price);
               prod.setPicturepath(fullPicName);
               while((bajt = fis.read()) != -1){
               fos.write(bajt);
           }
               fos.close();
               
               Session sesija = HibernateUtil.createSessionFactory().openSession();
               Transaction tx = null;
               try{
                   tx = sesija.beginTransaction();
                   Producttype p = (Producttype) sesija.get(Producttype.class, type);
                   prod.setProductType(p);
                   sesija.save(prod);
                   tx.commit();
                }catch(Exception e){
                    if(tx != null){
                    tx.rollback();
                  }
                  request.setAttribute("success",2);
                  request.getRequestDispatcher("newproduct.jsp").forward(request, response); 
                    
                }finally{
                  sesija.close(); 
               }
             request.setAttribute("success",1);
             request.getRequestDispatcher("newproduct.jsp").forward(request, response);    
          }catch(Exception ex){
             request.setAttribute("success",0);
             request.getRequestDispatcher("newproduct.jsp").forward(request, response);
          }
           
          
           
           
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
