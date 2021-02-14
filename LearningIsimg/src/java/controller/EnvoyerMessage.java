/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EnvoyerMessage extends HttpServlet {

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
        String titre = request.getParameter("titre");
        String message = request.getParameter("message");
        String id_destin = request.getParameter("id_user");
        String ty_destin = request.getParameter("ty_destin");
        String ty_exp = request.getParameter("ty_exp");
        String bt1 = request.getParameter("Envoyer1");
        SimpleDateFormat d = new SimpleDateFormat("dd/MM/yyyy");
        Date currentTime_1 = new Date();
        String dateActuel = d.format(currentTime_1);
        Editer edite = new Editer();
        try {
            if (bt1.equals("Envoyer")) {
                if (ty_exp.equals("2")) {
                    edite.EnvoyerMessage(titre, message, dateActuel, Integer.valueOf(id_destin), Integer.valueOf(LoginServlet.identifiantEtudiant), Integer.valueOf(ty_destin), Integer.valueOf(ty_exp), 0);
                    response.sendRedirect("MessagesEnvoyer.jsp");
                } else if (ty_exp.equals("1")) {
                    edite.EnvoyerMessage(titre, message, dateActuel, Integer.valueOf(id_destin), Integer.valueOf(LoginServlet.identifiantEnseignant), Integer.valueOf(ty_destin), Integer.valueOf(ty_exp), 0);
                    response.sendRedirect("Professeur/MessagesEnvoyer.jsp");
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
