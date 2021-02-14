/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Matiere;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfWriter;
import java.awt.Desktop;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javassist.tools.web.Viewer;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.adobe.acrobat.*;
import com.itextpdf.text.*;
import com.lowagie.text.Cell;
import com.lowagie.text.pdf.PdfContentByte;
import java.awt.Color;
import java.awt.Toolkit;
import com.lowagie.text.Image;
import com.lowagie.text.Table;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import tarekbensassilfim3.Mailer;



/**
 *
 * @author akram
 */
public class PDF extends HttpServlet {

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
            throws ServletException, IOException, DocumentException, BadElementException {
        response.setContentType("text/html;charset=UTF-8");
         String Clase = request.getParameter("IdClasse");
        String IdMatiere = request.getParameter("IdMatiere");
         String bt = request.getParameter("bt");
          String nb_et = request.getParameter("nb");
         
        try (PrintWriter out = response.getWriter()) {
             if (bt.equals("4")) {
            
                 
                  Image image = Image.getInstance("C:/tp/entete.jpg"); 
             Document doc=new Document(); 
               
                 //  PdfWriter.getInstance(doc,new FileOutputStream("C:/tp/Liste.pdf"));
            PdfWriter pdfWriter = PdfWriter.getInstance(doc, new FileOutputStream("C:/tp/Liste.pdf"));
             pdfWriter.setViewerPreferences(PdfWriter.PageLayoutTwoColumnLeft);
               String mat="";
                        Gestion gestion = new Gestion();
                Iterator it_mat = gestion.listeMatiere();
                 while (it_mat.hasNext()) {
                 Matiere matiere = (Matiere) it_mat.next();
                 if(matiere.getIdMatiere()==Integer.valueOf(IdMatiere)){
                     mat=matiere.getLibelle();
                 }
                 }
              
              doc.open();
             
               image.scaleToFit(600, 130);
               image.setAbsolutePosition(10, 700);
               doc.add(image);
               
                doc.add(new Paragraph("  "));
                 doc.add(new Paragraph("  "));
                  doc.add(new Paragraph("  ")); 
                  doc.add(new Paragraph("  "));
                  char F= Clase.charAt(1);
                 
                   doc.add(new Paragraph("  "));
                    doc.add(new Paragraph("  "));
                     doc.add(new Paragraph("  "));
                                    
                   doc.add(new Paragraph("                                            Specialité/Niveau:"+Clase ));
               
                    
                  doc.add(new Paragraph("                                              Matiere :"+ mat ));
                  
                  
         Table tbl = new Table(3);//nbre de colonnes
         tbl.setWidth(100);
         
         tbl.setBorderColor(new Color(255,255,255));
         tbl.setBorderWidth(0f);
         tbl.setPadding(0);
         tbl.setSpacing(0);
 
         Cell cell = new Cell("Nom");
         cell.setHeader(true);
         cell.setWidth(2);
         cell.setHorizontalAlignment(1);
         cell.setVerticalAlignment(1);
     	 cell.setRowspan(2);
    	 cell.setBorder(15);
    	 tbl.addCell(cell);
         
    	 cell = new Cell("Prenom");
         cell.setWidth(10);
         cell.setHorizontalAlignment(1);
         cell.setVerticalAlignment(1);
     	 cell.setRowspan(2);
    	 cell.setBorder(15);
    	 tbl.addCell(cell);
         
    	 cell = new Cell("Nombre D'absence");
         cell.setWidth(88);
         cell.setHorizontalAlignment(1);
         cell.setVerticalAlignment(1);
     	 cell.setRowspan(2);
    	 cell.setBorder(15);
    	 tbl.addCell(cell);
    	 tbl.endHeaders();
         
                   
     
      for(int i = 0; i < Integer.valueOf(nb_et); i++) {
          
               String  nom = request.getParameter("nom".concat(String.valueOf(i)));
               String  pre = request.getParameter("pre".concat(String.valueOf(i)));
               String  nb = request.getParameter("nb".concat(String.valueOf(i)));
           //   String  mail = request.getParameter("mail".concat(String.valueOf(i)));
              //  CH=mail+",";
             
         Cell cell1 = new Cell(nom);
         cell1.setHeader(true);
         cell1.setWidth(2);
         cell1.setHorizontalAlignment(1);
         cell1.setVerticalAlignment(1);
     	 cell1.setRowspan(2);
    	 cell1.setBorder(15);
    	 tbl.addCell(cell1);
         
    	  Cell cell2 = new Cell(pre);
         cell2.setWidth(10);
         cell2.setHorizontalAlignment(1);
         cell2.setVerticalAlignment(1);
     	 cell2.setRowspan(2);
    	 cell2.setBorder(15);
    	 tbl.addCell(cell2);
         
    	 Cell cell3 = new Cell(nb);
         cell3.setWidth(88);
         cell3.setHorizontalAlignment(1);
         cell3.setVerticalAlignment(1);
     	 cell3.setRowspan(2);
    	 cell3.setBorder(15);
    	 tbl.addCell(cell3);
    	 tbl.endHeaders();
               
           
             }
          doc.add(tbl);  
          doc.close(); 
          
    
          // Runtime.getRuntime().exec("C:/Program Files (x86)/Internet Explorer/iexplore.exe" + "C:/tp/Liste.pdf"); 
          File file = new File("C:/tp/Liste.pdf");
    if (file.toString().endsWith(".pdf")) 
        Runtime.getRuntime().exec("rundll32 url.dll,FileProtocolHandler " + file);
    else {
        Desktop desktop = Desktop.getDesktop();
        desktop.open(file);
}
       // String ch = CH.substring(0, CH.length()-1);
       // Mailer.Send(ch,"Vous été Eliminée a "+ mat);
 
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
        try {
            processRequest(request, response);
        } catch (DocumentException ex) {
            Logger.getLogger(PDF.class.getName()).log(Level.SEVERE, null, ex);
        } catch (BadElementException ex) {
            Logger.getLogger(PDF.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (DocumentException ex) {
            Logger.getLogger(PDF.class.getName()).log(Level.SEVERE, null, ex);
        } catch (BadElementException ex) {
            Logger.getLogger(PDF.class.getName()).log(Level.SEVERE, null, ex);
        }
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
