/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.News;
import model.NewsService;
import model.Users;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author vudt9
 */
public class SuaTin extends HttpServlet {

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
        boolean isMultiPath;
        String filePath;
        int maxMemSize = 10000 * 1028;
        int maxFileSize = 10000 * 1028;
        File file;
        //
        int id = 0;
        String title = "", shortDescription = "", content = "", fileName = "";
        String folderupload = getServletContext().getInitParameter("file-upload");
        String rootpath = getServletContext().getRealPath("/");
        filePath = rootpath + folderupload;

        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(maxMemSize);
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setSizeMax(maxFileSize);
        try {
            List fileItems = upload.parseRequest(request);
            Iterator i = fileItems.iterator();
            while (i.hasNext()) {
                FileItem fi = (FileItem) i.next();
                if (!fi.isFormField()) {
                    fileName = fi.getName();
                    //change file name
                    //fileName = FileService.ChangeFileName(fileName);
                    if (fileName.lastIndexOf("\\") >= 0) {
                        file = new File(filePath + fileName.substring(fileName.lastIndexOf("\\")));
                    } else {
                        file = new File(filePath + "/" + fileName.substring(fileName.lastIndexOf("\\") + 1));
                    }
                    fi.write(file);
                }
                if (fi.isFormField()) {
                    if (fi.getFieldName().equalsIgnoreCase("title")) {
                        title = fi.getString("UTF-8");
                    } else if (fi.getFieldName().equalsIgnoreCase("shortdescription")) {
                        shortDescription = fi.getString("UTF-8");
                    } else if (fi.getFieldName().equalsIgnoreCase("description")) {
                        content = fi.getString("UTF-8");
                    } else if (fi.getFieldName().equalsIgnoreCase("id")) {
                        id = Integer.parseInt(fi.getString("UTF-8"));
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        News news = new News();
        news.setIdnews(id);
        news.setTitle(title);
        news.setDescription(content);
        news.setShortDescription(shortDescription);
        news.setFeatureimg(fileName);
        HttpSession session = request.getSession();
        Users usr = new Users();
        usr.setIdusers(Integer.parseInt(session.getAttribute("userid").toString()));
        news.setUsers(usr);
        news.setStatus(1);
        boolean rs = NewsService.InsertNews(news);
        if (rs) {
            response.sendRedirect("news.jsp?newsid="+news.getIdnews());
        } else {
            getServletContext().getRequestDispatcher("editnews.jsp").forward(request, response);
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
