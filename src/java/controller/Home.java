/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AccountDBContext;
import dal.CategoryDBContext;
import dal.ProductDBContext;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class Home extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //lay userName de hien thi(taiKhoan-Home.jsp)
        request.setAttribute("account", new AccountDBContext().getAccountByName("user"));
        
        //listProduct: lay tt cua sp (Home.jsp)
        if (request.getParameter("categoryID") != null) {
            request.setAttribute("listProduct", new ProductDBContext().getProductByCategoryID(Integer.parseInt(request.getParameter("categoryID"))));
        } else {
            request.setAttribute("listProduct", new ProductDBContext().getProduct());
        }
        
        //listCategory: lay tt cua category trong db (header.jsp)
        request.setAttribute("listCategory", new CategoryDBContext().getCategory());
        
        request.getRequestDispatcher("view/Home.jsp").forward(request, response);

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
