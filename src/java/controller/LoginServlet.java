/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import services.MD5;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.*;

/**
 *
 * @author vudt9
 */
public class LoginServlet extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        String uOrE, password;
        uOrE = request.getParameter("username");
        password = request.getParameter("password");
        Users user = UsersService.CheckUserExist(uOrE, uOrE);
        HttpSession session = request.getSession();
        if (user == null) {
            session.setAttribute("error", "Email hoặc tên đăng nhập không tồn tại");
            response.sendRedirect("index.jsp");
            return;
        }
        password = MD5.md5Encryption(password);
        if (user.getPwd().equals(password) == false) {
            session.setAttribute("error", "Mật khẩu không đúng");
            response.sendRedirect("index.jsp");
            return;
        }
        if (user.getStatus() == null || user.getStatus() != 1) {
            session.setAttribute("error", "Tài khoản này chưa được xác nhận");
            response.sendRedirect("index.jsp");
            return;
        }
        session.setAttribute("userid", user.getIdusers());
        Cookie cookie = new Cookie("username", user.getUsername());
        cookie.setMaxAge(60 * 60); //Store cookie for 1 hour
        response.addCookie(cookie);
        cookie = new Cookie("roleid", String.valueOf(user.getRoleid()));
        cookie.setMaxAge(60 * 60);
        response.addCookie(cookie);
        session.setAttribute("error", null);
        response.sendRedirect("index.jsp");
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
