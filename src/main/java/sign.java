/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import java.util.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author rupal
 */
@WebServlet(urlPatterns = {"/sign"})
public class sign extends HttpServlet {

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
            String un, pass;
            String dbun = "";
            String dbpass = "";
            
           
            un=request.getParameter("t1");
            pass=request.getParameter("t2");
            try
            {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/EduMe","root","root");
                Statement st= con.createStatement();
                ResultSet rs = st.executeQuery("select * from SignUp where username = '"+un+"' And pass= '"+pass+"'; ");
                 
                while(rs.next())
                {                 
                 dbun = rs.getString(1);
                 dbpass = rs.getString(3); 
                }
               
                if(dbun.equals(un) && dbpass.equals(pass))
                {              
                    HttpSession session = request.getSession();
                    session.setAttribute("username", un);
                    response.sendRedirect("/LMS_EduMe/HomePage.jsp");
  
                }
                else if(un.equals("admin")&& pass.equals("admin"))
                {
                    response.sendRedirect("/LMS_EduMe/AdminPanel.jsp");
                }
                else
                {
                    out.println("<label style='color: red;'>Incorrect username or password!</label>");
                   
                }
                 
                st.close();
                con.close();
               }
            catch(Exception e)
            {
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
