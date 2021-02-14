/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DownloadCours extends javax.servlet.http.HttpServlet implements
        javax.servlet.Servlet {

    static final long serialVersionUID = 1L;
    private static final int BUFSIZE = 4096;
    String filePath;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String ficher = request.getParameter("test");
        ServletContext servletContext = this.getServletContext();
        String path = servletContext.getInitParameter("file-upload");
        filePath = path + ficher;
        File file = new File(filePath);
        int length = 0;
        ServletOutputStream outStream = response.getOutputStream();
        response.setContentType("text/html");
        response.setContentLength((int) file.length());
        String fileName = (new File(filePath)).getName();
        response.setHeader("Content-Disposition", "attachment; filename=\""
                + fileName + "\"");

        byte[] byteBuffer = new byte[BUFSIZE];
        DataInputStream in = new DataInputStream(new FileInputStream(file));

        while ((in != null) && ((length = in.read(byteBuffer)) != -1)) {
            outStream.write(byteBuffer, 0, length);
        }

        in.close();
        outStream.close();
    }
}
