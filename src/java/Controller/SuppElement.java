/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Authentification;
import Model.Elimine;
import Model.Semester;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author akram
 */
public class SuppElement extends HttpServlet {

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
         String ideng = request.getParameter("ideng");
         String idcl = request.getParameter("idcl");
          String idut = request.getParameter("idur");
           String idens = request.getParameter("idense");
           String idut1 = request.getParameter("idur");
           String idet = request.getParameter("idet");
            String idmat = request.getParameter("idmat");
              String idmod = request.getParameter("idmod");
               String ids = request.getParameter("ids");
               
                  
               
                 
            String bt = request.getParameter("bt");
       
        
        try (PrintWriter out = response.getWriter()) {
              Gestion gestion = new Gestion();
            if (bt.equals("Enregistrer")) {
                gestion.SuppAbsEng(Integer.valueOf(ideng));
                response.sendRedirect("Admin/ListeAbsenceEnseignant.jsp");
            } else   if (bt.equals("suppclasse")) {
                gestion.Suppclasse(Integer.valueOf(idcl));
                response.sendRedirect("Admin/Liste_classe.jsp");
            }else   if (bt.equals("suppenseignant")) {
                 Iterator it_et1 = gestion.Authentification1(Integer.valueOf(idut));
             while (it_et1.hasNext()) {
                Authentification et = (Authentification) it_et1.next();
                gestion.SuppAuth(Integer.valueOf(et.getIdAuth()));
             }
                gestion.SuppEnseignant(Integer.valueOf(idens));
                gestion.SuppUtilisateur(Integer.valueOf(idut));
                response.sendRedirect("Admin/Liste_enseignants.jsp");
            }else   if (bt.equals("suppetudiant")) {
               
                gestion.SuppEtudiant(Integer.valueOf(idet));
                gestion.SuppUtilisateur(Integer.valueOf(idut1));
                response.sendRedirect("Admin/Liste_etudiants.jsp");
            }else   if (bt.equals("suppmatiere")) {
               
                gestion.SuppMatiere(Integer.valueOf(idmat));
                response.sendRedirect("Admin/Liste_matiere.jsp");
            }else   if (bt.equals("suppmod")) {
               
                gestion.SuppModule(Integer.valueOf(idmod));
                response.sendRedirect("Admin/Liste_module.jsp");
            }else   if (bt.equals("suppsemester")) {
               
                gestion.Suppsemes(Integer.valueOf(ids));
                response.sendRedirect("Admin/Liste_semestre.jsp");
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
