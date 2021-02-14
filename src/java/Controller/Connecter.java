/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Authentification;
import Model.Utilisateur;
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
public class Connecter extends HttpServlet {

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
         String user = request.getParameter("user");
        String pwd = request.getParameter("pwd");
        String type = request.getParameter("type");
        try (PrintWriter out = response.getWriter()) {
            Gestion editer = new Gestion();
            if (type.equals("Enseignant")) {
                boolean res=false;
                Iterator it1 = editer.Authentification();
                while (it1.hasNext()) {
                    Authentification user1 = (Authentification) it1.next();
                if (user1.getLogin().equals(user) && user1.getPwd().equals(pwd) ) {
                    Iterator it2=editer.listuser(Integer.valueOf(user1.getIdUtilisateur()));
                     while (it2.hasNext()) {
                    Utilisateur user2 = (Utilisateur) it2.next();
                    if( user2.getIdUtilisateur()==user1.getIdUtilisateur())
                    {    res=true;
                        response.sendRedirect("Proffeseur/Accueil.jsp?nom="+user2.getNom()+"&&prenom="+user2.getPrenom() +""); 
                    }
                  
                } 
                     
                }}
             if(res==false){ response.sendRedirect("login.jsp");}
           
            }
            else  if (type.equals("Administrateur")) {
                 boolean res=false;
                Iterator it1 = editer.Authentification();
                while (it1.hasNext()) {
                    Authentification user1 = (Authentification) it1.next();
                if (user1.getLogin().equals(user) && user1.getPwd().equals(pwd) ) {
                    res=true;
                  response.sendRedirect("Admin/Accueil.jsp");
                } 
                }
                 if(res==false){ response.sendRedirect("login.jsp");}
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
