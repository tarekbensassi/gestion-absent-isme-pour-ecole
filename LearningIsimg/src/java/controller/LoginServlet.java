/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Pojo.Enseignant;
import Pojo.Etudiant;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author BENAHMED
 */
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public static String identifiantEtudiant;
    public static String identifiantEnseignant;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String select = request.getParameter("TypeUser");
        String login = request.getParameter("login");
        String pwd = request.getParameter("pwd");
        String bt = request.getParameter("Connecter");
        Editer editer = new Editer();

        try {
            if ("Connecter".equals(bt)) {
                if (select.equals("Etudiant")) {
                    Iterator it = editer.AuthentifactionEtudiant(login, pwd,1);
                    int i = 0;
                    while (it.hasNext()) {
                        Etudiant etudiant = (Etudiant) it.next();
                        identifiantEtudiant = String.valueOf(etudiant.getIdEtudiant());
                        i++;
                    }
                    if (i > 0) {
                        Cookie loginCookie = new Cookie("user", login);
                        loginCookie.setMaxAge(30 * 60);
                        response.addCookie(loginCookie);
                        response.sendRedirect("indexEtudiant.jsp");

                    } else {
                        RequestDispatcher rd = getServletContext().getRequestDispatcher("/ErrorAuthentification.jsp");
                        rd.include(request, response);
                    }
                } else {
                    Iterator it = editer.AuthentifactionEnseignant(login, pwd,1);
                    int i = 0;
                    while (it.hasNext()) {
                        Enseignant enseignant = (Enseignant) it.next();
                        identifiantEnseignant = String.valueOf(enseignant.getIdEnseignant());
                        i++;
                    }
                    if (i > 0) {
                        Cookie loginCookie = new Cookie("user", login);
                        loginCookie.setMaxAge(30 * 60);
                        response.addCookie(loginCookie);
                        response.sendRedirect("Professeur/indexProf.jsp");

                    } else {
                        RequestDispatcher rd = getServletContext().getRequestDispatcher("/ErrorAuthentification.jsp");
                        rd.include(request, response);
                    }
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
