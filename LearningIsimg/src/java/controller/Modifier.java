/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class Modifier extends HttpServlet {

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
        Editer edite = new Editer();
        String ty = request.getParameter("typeC");
        String numero = request.getParameter("numero");
        String nom = request.getParameter("nom");
        String description = request.getParameter("description");
        String type_user = request.getParameter("type_user");
        String matiere = request.getParameter("matiere");
        String filiere = request.getParameter("filiere");
        String niveau = request.getParameter("niveau");
        String type = request.getParameter("type");
        SimpleDateFormat d = new SimpleDateFormat("dd/MM/yyyy");
        Date currentTime_1 = new Date();
        String dateActuel = d.format(currentTime_1);
        ServletContext servletContext = this.getServletContext();
        String path = servletContext.getInitParameter("file-upload");
        final Part filePart = request.getPart("file");
        final String fileName = getFileName(filePart);
        OutputStream out = null;
        InputStream filecontent = null;
        final PrintWriter writer = response.getWriter();
        try {
            if (type_user.equals("prof")) {
                if (ty.equals("1")) {
                    edite.deleteCours(Integer.valueOf(numero));
                } else if (ty.equals("2")) {
                    edite.deleteTd(Integer.valueOf(numero));
                } else {
                    edite.deleteTp(Integer.valueOf(numero));
                }
                if (type.equals("Cours")) {
                    out = new FileOutputStream(new File(path + File.separator + "cour " + nom + " " + fileName));
                    filecontent = filePart.getInputStream();
                    int read = 0;
                    final byte[] bytes = new byte[1024];
                    while ((read = filecontent.read(bytes)) != -1) {
                        out.write(bytes, 0, read);
                    }
                    edite.AjouteCours(nom, "cour " + nom + " " + fileName, description, dateActuel, matiere, filiere, Integer.valueOf(niveau), Integer.valueOf(LoginServlet.identifiantEnseignant));
                    response.sendRedirect("Professeur/Liste Cours.jsp");
                } else if (type.equals("Traveaux Pratique")) {
                    out = new FileOutputStream(new File(path + File.separator + "TP " + nom + " " + fileName));
                    filecontent = filePart.getInputStream();
                    int read = 0;
                    final byte[] bytes = new byte[1024];
                    while ((read = filecontent.read(bytes)) != -1) {
                        out.write(bytes, 0, read);
                    }
                    edite.AjouteTraveauxPratique(nom, description, "TP " + nom + " " + fileName, dateActuel, matiere, filiere, Integer.valueOf(niveau), Integer.valueOf(LoginServlet.identifiantEnseignant));
                    response.sendRedirect("Professeur/Liste Traveaux Pratique.jsp");
                } else if (type.equals("Traveaux diriges")) {
                    out = new FileOutputStream(new File(path + File.separator + "TD " + nom + " " + fileName));
                    filecontent = filePart.getInputStream();
                    int read = 0;
                    final byte[] bytes = new byte[1024];
                    while ((read = filecontent.read(bytes)) != -1) {
                        out.write(bytes, 0, read);
                    }
                    edite.AjouteTraveauxDiriges(nom, description, "TD " + nom + " " + fileName, dateActuel, matiere, filiere, Integer.valueOf(niveau), Integer.valueOf(LoginServlet.identifiantEnseignant));
                    response.sendRedirect("Professeur/Liste Traveaux diriges.jsp");
                }
            } else if (type_user.equals("admin")) {
                if (ty.equals("1")) {
                    edite.deleteCours(Integer.valueOf(numero));
                } else if (ty.equals("2")) {
                    edite.deleteTd(Integer.valueOf(numero));
                } else {
                    edite.deleteTp(Integer.valueOf(numero));
                }
                if (type.equals("Cours")) {
                    out = new FileOutputStream(new File(path + File.separator + "cour " + nom + " " + fileName));
                    filecontent = filePart.getInputStream();
                    int read = 0;
                    final byte[] bytes = new byte[1024];
                    while ((read = filecontent.read(bytes)) != -1) {
                        out.write(bytes, 0, read);
                    }
                    edite.AjouteCours(nom, "cour " + nom + " " + fileName, description, dateActuel, matiere, filiere, Integer.valueOf(niveau), Integer.valueOf(LoginServlet.identifiantEnseignant));
                    response.sendRedirect("Sys__adminCours/Liste Cours.jsp");
                } else if (type.equals("Traveaux Pratique")) {
                    out = new FileOutputStream(new File(path + File.separator + "TP " + nom + " " + fileName));
                    filecontent = filePart.getInputStream();
                    int read = 0;
                    final byte[] bytes = new byte[1024];
                    while ((read = filecontent.read(bytes)) != -1) {
                        out.write(bytes, 0, read);
                    }
                    edite.AjouteTraveauxPratique(nom, description, "TP " + nom + " " + fileName, dateActuel, matiere, filiere, Integer.valueOf(niveau), Integer.valueOf(LoginServlet.identifiantEnseignant));
                    response.sendRedirect("Sys__adminCours/Liste Traveaux Pratique.jsp");
                } else if (type.equals("Traveaux diriges")) {
                    out = new FileOutputStream(new File(path + File.separator + "TD " + nom + " " + fileName));
                    filecontent = filePart.getInputStream();
                    int read = 0;
                    final byte[] bytes = new byte[1024];
                    while ((read = filecontent.read(bytes)) != -1) {
                        out.write(bytes, 0, read);
                    }
                    edite.AjouteTraveauxDiriges(nom, description, "TD " + nom + " " + fileName, dateActuel, matiere, filiere, Integer.valueOf(niveau), Integer.valueOf(LoginServlet.identifiantEnseignant));
                    response.sendRedirect("Sys__adminCours/Liste Traveaux diriges.jsp");
                }
            }

        } finally {
            out.close();
        }
    }

    private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");
        for (String content : part.getHeader("content-disposition").sp­lit(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
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
