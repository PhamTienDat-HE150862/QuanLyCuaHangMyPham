/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AccountDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;

/**
 *
 * @author Admin
 */
public class SignUp extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountDBContext db = new AccountDBContext();
        ArrayList<Account> acc = db.getAcc();
        request.setAttribute("acc", acc);
        request.getRequestDispatcher("view/SignUp.jsp").forward(request, response);

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rePassword = request.getParameter("re-password");
        if (username.equals("") || password.equals("")) {
            request.setAttribute("error", "Vui lòng không để trống!");
            request.getRequestDispatcher("view/SignUp.jsp").forward(request, response);
        } else if (password.equals(rePassword) && new AccountDBContext().CheckUserName(username) == false) {
            new AccountDBContext().insertAccount(new Account(0, username, password, "ON", 0));
            response.sendRedirect("home");
        } else {
            request.setAttribute("error", "Vui lòng nhập lại!");
            request.getRequestDispatcher("view/SignUp.jsp").forward(request, response);
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
