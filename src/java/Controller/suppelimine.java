/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Elimine;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author akram
 */
public class suppelimine extends HttpServlet {

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
          String idet1 = request.getParameter("idet1");
                String idmat1 = request.getParameter("idmat1");
                String idel = request.getParameter("idelim");
                String idabs = request.getParameter("idabs");
                String idsems = request.getParameter("idsems");
                
               
            String bt = request.getParameter("bt");
              Gestion gestion = new Gestion();
        try (PrintWriter out = response.getWriter()) { 
            if (bt.equals("suppelimine")) {
               
                  Iterator it_se = gestion.listeSeance(Integer.valueOf(idet1), Integer.valueOf(idmat1), Integer.valueOf(idsems));
                      
                        while (it_se.hasNext()) {
                            Elimine sea = (Elimine) it_se.next();
                            if ( sea.getNdAbscr() != 0) {
                                gestion.Modifier_Absence_cours(sea.getIdElimine(), sea.getNdAbscr()-1, 0);
                            } else if (sea.getNdAbstp() != 0) {
                                gestion.Modifier_Absence_Tp(sea.getIdElimine(), sea.getNdAbstp()-1, 0);
                            } else if ( sea.getNdAbstd() != 0) {
                                gestion.Modifier_Absence_Td(sea.getIdElimine(), sea.getNdAbstd()-1, 0);
                            }
                        }
               
                 gestion.SuppAbsEt(Integer.valueOf(idabs));
                 
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
