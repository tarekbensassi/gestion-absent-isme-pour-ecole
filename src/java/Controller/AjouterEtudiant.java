/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Matiere;
import Model.Module;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ingwa
 */
public class AjouterEtudiant extends HttpServlet {

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
        String mail = request.getParameter("mail");
        String carte = request.getParameter("carte");
        String classe = request.getParameter("classe");
        boolean res=true;

        String bt = request.getParameter("bt");
        try (PrintWriter out = response.getWriter()) {
            Gestion gestion = new Gestion();
            if (bt.equals("Enregistrer")) {
                
                gestion.AjouterUser(nom, prenom, adresse, Integer.valueOf(tel), mail, 3);
                gestion.AjouterEtudiant(carte, Integer.valueOf(classe), gestion.max_User());
              Iterator it_mod = gestion.listeModuleClasse(Integer.valueOf(classe));
                while (it_mod.hasNext()) {
                    Module module = (Module) it_mod.next();
                    Iterator it_at = gestion.listeMatiereModule(Integer.valueOf(module.getIdModule()));
                    while(it_at.hasNext()) {
                        Matiere mat = (Matiere) it_at.next();
                        gestion.AjouterListeSeance(gestion.max_Etudiant(),Integer.valueOf(mat.getIdMatiere()), 0, 0, 0,  Integer.valueOf(module.getIdSemester()));
                    }}
                
                
                

               
               
                response.sendRedirect("Admin/Liste_etudiants.jsp");
               
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
