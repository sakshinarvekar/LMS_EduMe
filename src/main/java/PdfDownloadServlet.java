/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bhaktisunilnarvekar
 */
@WebServlet(urlPatterns = {"/PdfDownloadServlet"})
public class PdfDownloadServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

       
        String fileName = request.getParameter("file");

if (fileName != null && !fileName.isEmpty()) {
    String filePath = "/Users/sakshi/NetBeansProjects/demo/LMS_EduMe-master/src/main/webapp/resources/" + fileName;
    File pdfFile = new File(filePath);

    if (pdfFile.exists()) {
        response.setContentType("application/pdf");
        response.addHeader("Content-Disposition", "attachment; filename=" + pdfFile.getName());

        try (FileInputStream fileInputStream = new FileInputStream(pdfFile);
             OutputStream outputStream = response.getOutputStream()) {

            response.setContentLengthLong(pdfFile.length());

            byte[] buffer = new byte[(int) pdfFile.length()];
            int bytesRead = 0;

            while ((bytesRead = fileInputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }

            outputStream.flush(); // Flush the output stream to ensure all data is written
        } catch (IOException e) {
            response.getWriter().println("Error occurred while downloading the file.");
        }
    } else {
        response.getWriter().println("File not found");
    }
} else {
    response.getWriter().println("Invalid file");
}
    
        
//        String fileName = request.getParameter("file");
//out.print(fileName);
//
//if (fileName != null && !fileName.isEmpty()) {
//    String filePath = "/Users/sakshi/NetBeansProjects/demo/LMS_EduMe-master/src/main/webapp/resources/" + fileName;
//    File pdfFile = new File(filePath);
//    out.print(pdfFile);
//
//    if (pdfFile.exists()) {
//        response.setContentType("application/pdf");
//        response.setHeader("Content-Disposition", "attachment; filename=\"" + pdfFile.getName() + "\"");;
//
//        long fileSizeBytes = pdfFile.length();  // Get the file size in bytes
//
//        // Convert file size to a more readable format
//        String fileSizeString = " ";
//        if (fileSizeBytes < 1024) {
//            fileSizeString = fileSizeBytes + " bytes";
//        } else if (fileSizeBytes < 1048576) {
//            fileSizeString = fileSizeBytes / 1024 + " KB";
//        } else if (fileSizeBytes < 1073741824) {
//            fileSizeString = fileSizeBytes / 1048576 + " MB";
//        } else {
//            fileSizeString = fileSizeBytes / 1073741824 + " GB";
//        }
//
//        out.print("File Size: " + fileSizeString + "\n");
//
//        try (FileInputStream fileInputStream = new FileInputStream(pdfFile);
//             OutputStream outputStream = response.getOutputStream()) {
//            byte[] buffer = new byte[4096];
//            int bytesRead;
//
//            while ((bytesRead = fileInputStream.read(buffer)) != -1) {
//                outputStream.write(buffer, 0, bytesRead);
//            }
//        }
//    } else {
//        response.getWriter().println("File not found");
//    }
//} else {
//    response.getWriter().println("Invalid file");
//}

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
        String fileName = request.getParameter("file");
        
        if (fileName != null && !fileName.isEmpty()) {
            String filePath = "/LMS_EduMe/resources/" + fileName; // Replace with the actual path to your files
            File file = new File(filePath);
            
            if (file.exists()) {
                response.setContentType("application/octet-stream");
                response.setContentLength((int) file.length());
                response.setHeader("Content-Disposition", "attachment; filename=\"" + file.getName() + "\"");
                
                try (InputStream inputStream = new FileInputStream(file);
                     OutputStream outputStream = response.getOutputStream()) {
                    byte[] buffer = new byte[4096];
                    int bytesRead;
                    
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }
                }
                
                // Read file contents
                String fileContents = readFile(filePath);
                System.out.println("File contents:\n" + fileContents);
            } else {
                response.getWriter().println("File not found");
            }
        } else {
            response.getWriter().println("Invalid file");
        }
    }
    
    private String readFile(String filePath) throws IOException {
        StringBuilder fileContent = new StringBuilder();
        
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            
            while ((line = reader.readLine()) != null) {
                fileContent.append(line).append("\n");
            }
        }
        
        return fileContent.toString();
    
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
