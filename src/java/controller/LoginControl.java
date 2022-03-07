/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import dal.AccountDBContext;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class LoginControl extends HttpServlet {

    
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/login.jsp").forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        AccountDBContext db = new AccountDBContext();
        System.out.println(db.checkExits(user, pass));
        if (db.checkExits(user, pass)) {
            request.getSession().setAttribute("account", new AccountDBContext().getAccountByName(user));
            request.getSession().setMaxInactiveInterval(60*60*10);
            response.sendRedirect("home");
        } else {
            request.setAttribute("ErrorLogin", "Lỗi: Tài khoản hoặc mật khẩu không chính xác!");
            request.getRequestDispatcher("view/login.jsp").forward(request, response);
        }
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
