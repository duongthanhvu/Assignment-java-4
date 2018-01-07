/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Users;
import model.UsersService;
import services.MD5;
import services.MyEmail;

/**
 *
 * @author vudt9
 */
public class RegisterServlet extends HttpServlet {

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
        request.setCharacterEncoding("UTF8");

        String username, pwd, email, fullname;
        username = request.getParameter("username");
        pwd = request.getParameter("password");
        email = request.getParameter("email");
        fullname = request.getParameter("fullname");
        HttpSession session = request.getSession();

        Users user = UsersService.CheckUserExist(username, email);
        boolean isNotExist = (user == null);
        if (isNotExist) {
            user = new Users();
            user.setFullname(fullname);
            user.setUsername(username);
            user.setEmail(email);
            pwd = services.MD5.md5Encryption(pwd);
            user.setPwd(pwd);
            user.setCreateddate(new Date());
            user.setRoleid(3);
            user.setStatus(0);
            boolean rs = UsersService.insertUser(user);
            if (rs) {
                String host, port, mail, pass;
                ServletContext context = getServletContext();
                host = context.getInitParameter("host");
                port = context.getInitParameter("port");
                mail = context.getInitParameter("user");
                pass = context.getInitParameter("pass");

                try {
                    String confirmID = MD5.md5Encryption(username + "ma_bi_mat_1234");
                    MyEmail.sendEmail(host, port, mail, pass, "vudt.93@gmail.com", "Xác thực email",
                            "Truy cập vào link này để xác nhận tài khoản: localhost:8080/Assignment_java_4/XacThuc?username=" + username + "&confirmID=" + confirmID);
                } catch (MessagingException e) {
                    System.out.println(e.getMessage());
                }
                session.setAttribute("errorRegister", null);
                response.sendRedirect("index.jsp");
            } else {
                session.setAttribute("errorRegister", "Lỗi");
                response.sendRedirect("index.jsp");
            }
        } else {
            session.setAttribute("errorRegister", "Trùng username hoặc email");
            response.sendRedirect("index.jsp");
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
