/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ingwa
 */
public class AjouterSemestre extends HttpServlet {

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
        String sem = request.getParameter("semestre");
        String debut = request.getParameter("debut");
        String fin = request.getParameter("fin");
        String bt = request.getParameter("bt");
        SimpleDateFormat format;
        format = new SimpleDateFormat("dd/MM/yyyy");
        java.util.Date parsed_de;
        java.util.Date parsed_ar;
        java.sql.Date date_de = null;
        java.sql.Date date_fi = null;
        try (PrintWriter out = response.getWriter()) {
            Gestion gestion = new Gestion();
            if (bt.equals("Enregistrer")) {
                try {
                    parsed_de = format.parse(debut);
                    date_de = new java.sql.Date(parsed_de.getTime());
                    parsed_ar = format.parse(fin);
                    date_fi = new java.sql.Date(parsed_ar.getTime());
                } catch (ParseException ex) {

                }
//                out.println(date_de);
//                out.println(date_fi);
                gestion.AjouterSemestre(Integer.valueOf(sem), date_de, date_fi);
                response.sendRedirect("Admin/Liste_semestre.jsp");
            } else {

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
