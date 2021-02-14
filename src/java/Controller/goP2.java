/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

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
 * @author ingwa
 */
public class goP2 extends HttpServlet {

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
        String Clas = request.getParameter("SelectClasse");
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
       
        String IdModule = request.getParameter("IdModule");
        String Type_seance = request.getParameter("Type_seance");
        int Type = 0;
         String Clase = request.getParameter("IdClasse");
        String IdMatiere = request.getParameter("IdMatiere");
        String bt = request.getParameter("bt");
        String nb_et = request.getParameter("nb_et");
        String id_etudiant;
        String etat_absent;
        
        SimpleDateFormat format;
        format = new SimpleDateFormat("dd/MM/yyyy");
        java.util.Date dat_seance = new Date();
        java.sql.Date date_s = null;
        java.util.Date date_debut_sem1 = null;
        java.util.Date date_fin_sem1 = null;
        java.util.Date date_debut_sem2 = null;
        java.util.Date date_fin_sem2 = null;
        int id_semestre = 0;
        try (PrintWriter out = response.getWriter()) {
            if (bt.equals("1")) {
                response.sendRedirect("Proffeseur/Pointages2.jsp?id_class=" + Clas + "&&nom=" + nom + "&&prenom=" + prenom + "");
            } else if (bt.equals("2")) {
                response.sendRedirect("Proffeseur/Pointages3.jsp?id_module=" + IdModule + "&&id_class=" + Clase + "&&nom=" + nom + "&&prenom=" + prenom + "");
            } else if (bt.equals("3")) {
                response.sendRedirect("Proffeseur/Pointages4.jsp?id_class=" + Clase + "&&id_module=" + IdModule + "&&Type_seance=" + Type_seance + "&&IdMatiere=" + IdMatiere + "&&nom=" + nom + "&&prenom=" + prenom + "");
            } else if (bt.equals("4")) {
                Gestion gestion = new Gestion();
                date_s = new java.sql.Date(dat_seance.getTime());
                  Iterator it_sem = gestion.listeSem();
                 while (it_sem.hasNext()) {
                    Semester sem = (Semester) it_sem.next();
                    if ((dat_seance.before(sem.getDatefinSemester()) && (dat_seance.after(sem.getDatedebutSemester())))) {
                        id_semestre = sem.getIdSemester();
                    }
                }
               
                
                
               
                if (Type_seance.equals("Cours")) {
                    Type = 1;
                } else if (Type_seance.equals("Tp")) {
                    Type = 2;
                } else if (Type_seance.equals("Td")) {
                    Type = 3;
                }
  gestion.AjouterSeance(Integer.valueOf(IdMatiere),Integer.valueOf(Clase), Type, date_s, 1, id_semestre);
                for (int i = 0; i < Integer.valueOf(nb_et); i++) {
                    id_etudiant = request.getParameter("nom".concat(String.valueOf(i)));
                    etat_absent = request.getParameter("et".concat(String.valueOf(i)));
                    if (null == etat_absent) {
                        Iterator it_se = gestion.listeSeance(Integer.valueOf(id_etudiant), Integer.valueOf(IdMatiere), Integer.valueOf(id_semestre));
                        
                        while (it_se.hasNext()) {
                            Elimine sea = (Elimine) it_se.next();
                            if (Type == 1) {
                                gestion.Modifier_Absence_cours(sea.getIdElimine(), sea.getNdAbscr(), Type);
                            } else if (Type == 2) {
                                gestion.Modifier_Absence_Tp(sea.getIdElimine(), sea.getNdAbstp(), Type);
                            } else if (Type == 3) {
                                gestion.Modifier_Absence_Td(sea.getIdElimine(), sea.getNdAbstd(), Type);
                            }
                        }
                    } else if (Integer.valueOf(etat_absent) == 1) {
                         gestion.Ajouteabsence(Integer.valueOf(id_etudiant), Integer.valueOf(IdMatiere), date_s, id_semestre);
                        Iterator it_se = gestion.listeSeance(Integer.valueOf(id_etudiant), Integer.valueOf(IdMatiere), Integer.valueOf(id_semestre));
                        
                        while (it_se.hasNext()) {
                            Elimine sea = (Elimine) it_se.next();
                            if (Type == 1) {
                                gestion.Modifier_Absence_cours(sea.getIdElimine(), sea.getNdAbscr() + 1, Type);
                            } else if (Type == 2) {
                                gestion.Modifier_Absence_Tp(sea.getIdElimine(), sea.getNdAbstp() + 1, Type);
                            } else if (Type == 3) {
                                gestion.Modifier_Absence_Td(sea.getIdElimine(), sea.getNdAbstd() + 1, Type);
                            }
                        }
                    }
                    
                }
                response.sendRedirect("Proffeseur/Accueil.jsp?nom=" + nom + "&&prenom=" + prenom + "");
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
