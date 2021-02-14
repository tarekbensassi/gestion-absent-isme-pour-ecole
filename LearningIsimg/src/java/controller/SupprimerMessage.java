/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Wael
 */
public class SupprimerMessage extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        String id_msg = request.getParameter("id_msg");
        String msg_recus = request.getParameter("msg_recus");
        String bt1 = request.getParameter("Envoyer1");
        Editer edite = new Editer();
        try {

            if (bt1.equals("Oui")) {
                if (msg_recus.equals("msg_recus_admin")) {
                    edite.deleteMessage(Integer.valueOf(id_msg));
                    response.sendRedirect("Sys__adminCours/MessagesRecus.jsp");
                } else if (msg_recus.equals("msg_recus_ens")) {
                    edite.deleteMessage(Integer.valueOf(id_msg));
                    response.sendRedirect("Professeur/MessagesRecus.jsp");
                } else if (msg_recus.equals("msg_recus_et")) {
                    edite.deleteMessage(Integer.valueOf(id_msg));
                    response.sendRedirect("MessagesRecus.jsp");
                } else if (msg_recus.equals("msg_envoyer_admin")) {
                    //out.println(Integer.valueOf(id_msg));
                    edite.deleteMessage(Integer.valueOf(id_msg));
                    response.sendRedirect("Sys__adminCours/MessagesEnvoyer.jsp");
                } else if (msg_recus.equals("msg_envoyer_ens")) {
                    edite.deleteMessage(Integer.valueOf(id_msg));
                    response.sendRedirect("Professeur/MessagesEnvoyer.jsp");
                } else if (msg_recus.equals("msg_envoyer_et")) {
                    edite.deleteMessage(Integer.valueOf(id_msg));
                    response.sendRedirect("MessagesEnvoyer.jsp");
                }

            }
        } finally {
            out.close();
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
