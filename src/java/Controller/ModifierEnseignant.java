/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author akram
 */
public class ModifierEnseignant extends HttpServlet {

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
          String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String adresse = request.getParameter("adresse");
        String tel = request.getParameter("tel");
        String mail = request.getParameter("email");
        String mat = request.getParameter("matricule");
        String login = request.getParameter("login");
        String pwd = request.getParameter("pwd");
        
        String id_ens = request.getParameter("id_ens");
        String id_us = request.getParameter("id_ut");
         String id = request.getParameter("id_auth");

        String bt = request.getParameter("bt");
        try (PrintWriter out = response.getWriter()) {
           if (bt.equals("Enregistrer")) {
              Gestion gestion = new Gestion();
              
                gestion.Modifier_User(Integer.valueOf(id_us),nom, prenom, adresse, Integer.valueOf(tel), mail, 2);
                gestion.Modifier_Enseignant(Integer.valueOf(id_ens),mat,Integer.valueOf(id_us));
                gestion.Modifier_auth(Integer.valueOf(id),login, pwd,Integer.valueOf(id_us));
                response.sendRedirect("Admin/Liste_enseignants.jsp");

            }
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
