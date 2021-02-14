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
 * @author ingwa
 */
public class ListeEtudiant extends HttpServlet {

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
        String classe = request.getParameter("SelectClasse");
        String IdModule = request.getParameter("IdModule");
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String IdMatiere = request.getParameter("IdMatiere");
        String IdSemestre = request.getParameter("IdSemestre");
        String bt = request.getParameter("bt");
        String module = "";
        String semestre = "";

        try (PrintWriter out = response.getWriter()) {
//            out.print(IdModule);
            if (bt.equals("1")) {
                response.sendRedirect("Proffeseur/Listeetudiants2.jsp?id_class=" + classe + "&&nom=" + nom + "&&prenom=" + prenom + "");
            } else if (bt.equals("2")) {
                if (null == IdModule) {

                } else {
                    String[] parts = IdModule.split(";");
                    module = parts[0]; // 004
                    semestre = parts[1]; // 034556
//            IdModule = null;
                }
                response.sendRedirect("Proffeseur/Listeetudiants3.jsp?id_class=" + classe + "&&id_module=" + module + "&&id_sem=" + semestre + "&&nom=" + nom + "&&prenom=" + prenom + "");
//            out.print(semestre);
            } else if (bt.equals("3")) {
//                out.print(semestre);
                response.sendRedirect("Proffeseur/Listeetudiants4.jsp?id_class=" + classe + "&&id_module=" + IdModule + "&&IdMatiere=" + IdMatiere + "&&id_sem=" + IdSemestre + "&&nom=" + nom + "&&prenom=" + prenom + "");
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
