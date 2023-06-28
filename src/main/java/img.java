/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Abhishek
 */
@WebServlet(urlPatterns = {"/img"})
@MultipartConfig
public class img extends HttpServlet {

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
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet img</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet img at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
               out.print("Hello");
               
               
//               int i = Integer.parseInt(request.getParameter("id"));
               String g = request.getParameter("grade");
               String s = request.getParameter("sub");
               String c = request.getParameter("chapterno");
               String cn = request.getParameter("chaptername");
               Part file = request.getPart("video");
               String imageFileName=file.getSubmittedFileName();
               
               out.println("File:"+imageFileName);
               out.println("Grade : "+g);
               out.println("Subject : "+s);
               out.println("Chapter no. : "+c);
               out.println("Chapter name : "+cn);
               
               
               String uploadPath="/Users/sakshi/NetBeansProjects/demo/LMS_EduMe-master/src/main/webapp/videos/"+imageFileName;  // upload path where we have to upload our actual image
               out.println("Upload Path : "+uploadPath);
               
               
               try
		{
		
		FileOutputStream fos=new FileOutputStream(uploadPath);
		InputStream is=file.getInputStream();
		
		byte[] data=new byte[is.available()];
		is.read(data);
		fos.write(data);
		fos.close();
		
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
               
               try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12629246","sql12629246","nSsVYGGiJc");
                        Statement st = con.createStatement();
                        st.execute("insert into content values(default,'"+g+"','"+s+"','"+c+"','"+cn+"','"+imageFileName+"')");
                        out.println("<script type=\"text/javascript\">"); // Start the script tag 
                        out.println("alert('Video inserted successfully!!');"); // JavaScript code to generate an alert box 
                        out.println("window.location.href = 'fileup_1.jsp';");
                        out.println("</script>");
                        st.close();
                        con.close();               
			
		}
		catch (Exception e)
		{
			out.println(e);
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
