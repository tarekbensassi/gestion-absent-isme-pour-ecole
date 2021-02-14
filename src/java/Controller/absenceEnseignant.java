/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author akram
 */
public class absenceEnseignant extends HttpServlet {

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
         SimpleDateFormat format;
        format = new SimpleDateFormat("dd/MM/yyyy");
        java.util.Date dat_seance = new Date();
        java.sql.Date date_s = new java.sql.Date(dat_seance.getTime());
         String bt = request.getParameter("bt");
        String nb_et = request.getParameter("nb");
        String id_ens="";
         String abs="";
        
        boolean res=true;
        try (PrintWriter out = response.getWriter()) {
             if (bt.equals("Enregistrer")) {
              Gestion gestion = new Gestion();
              for (int i = 0; i < Integer.valueOf(nb_et); i++) {
               
                   id_ens = request.getParameter("nom".concat(String.valueOf(i)));
                    abs = request.getParameter("et".concat(String.valueOf(i)));
                  
                      if(request.getParameter("et".concat(String.valueOf(i)))==null){
                      
                       }else if(Integer.valueOf(abs)==1){
                           gestion.absenceenseignant(Integer.valueOf(id_ens), date_s);
                           
                       }
                 
                   }
          
                 response.sendRedirect("Admin/Accueil.jsp");
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
