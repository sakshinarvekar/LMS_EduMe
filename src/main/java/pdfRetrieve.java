/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bhaktisunilnarvekar
 */
@WebServlet(urlPatterns = {"/pdfRetrieve"})
public class pdfRetrieve extends HttpServlet {

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
            try {
                
            String grade = request.getParameter("t1");
            String subject = request.getParameter("t2");
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/EduMe","root","root");
            PreparedStatement pstmt = con.prepareStatement("SELECT * FROM pdf_files WHERE grade LIKE ? AND subject LIKE ?");
            pstmt.setString(1, "%" + grade + "%");
            pstmt.setString(2, "%" + subject + "%");
            ResultSet rs = pstmt.executeQuery();
            out.print("<center>");
            out.print("<body style='background-color:rgb(238,247,247); '>");
            out.print("<table border=1 width=50% style='border-collapse: separate;\n" +
"            border-spacing: 0;\n" +
"            border: 2px solid #ddd; text-align:center;'");
            out.print("<tr>");
            out.print("<th> Grade </th>");
            out.print("<th> Subject </th>");
            out.print("<th> Chapter name </th>");
            out.print("<th> File Name </th>");
            out.print("<th> File </th>");
            out.print("</tr>");
            
            while (rs.next()) {
                String g = rs.getString("grade");
                String s = rs.getString("subject");
                String c = rs.getString("chapter_name");
                String fn = rs.getString("file_name");
                String f = rs.getString("file");

                out.print("<tr>");
                out.print("<td>" + g + "</td>");
                out.print("<td>" + s + "</td>");
                out.print("<td>" + c + "</td>");
                out.print("<td>" + fn + "</td>");
                out.print("<td><a href='PdfDownloadServlet?file=" + f + "'>Download</a></td>");
                out.print("</tr>");
            }
            
            out.print("</table>");
            out.print("</body>");
            out.print("</center>");
            
            rs.close();
            pstmt.close();
            con.close();
        } catch (Exception e) {
            out.print(e);
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
