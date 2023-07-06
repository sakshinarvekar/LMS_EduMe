/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bhaktisunilnarvekar
 */
@WebServlet(urlPatterns = {"/RetrieveVideo2"})
@MultipartConfig
public class RetrieveVideo2 extends HttpServlet {

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
            out.println("heloo");
            
             int id = Integer.parseInt(request.getParameter("t1"));
            try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/EduMe","root","root");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from content where id ='"+id+"'");
            
           
            out.print("Id : "+id);
            out.print("<table border=1 width=50%");
            out.print("<tr>");
            out.print("<th> Id</th>");
            out.print("<th> Grade </th>");
            out.print("<th> Subject </th>");
            out.print("<th> chapter no </th>");
            out.print("<th> Chapter name </th>");
            out.print("<th> Video </th>");
            out.print("</tr>");
            
            while(rs.next())
            {
                int i = rs.getInt("id");
                String g = rs.getString("grade");
                String s = rs.getString("sub");
                String c = rs.getString("chp_no");
                String cn = rs.getString("chp_name");
                String f = rs.getString("video");
                //out.print(id+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+ n +"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+ ne +"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+l);
                
                out.print("<tr>");
                out.print("<td>"+i+"</td>");
                out.print("<td>"+g+"</td>");
                out.print("<td>"+s+"</td>");
                out.print("<td>"+c+"</td>");
                out.print("<td>"+cn+"</td>");
                out.print("<td><video controls style=\"height:600px; width:700px;\""
                        + "<source src=/LMS_EduMe/videos/"+f+" type='video/mp4'></video></td>");
//                out.print("<td><img src=/FaltuTrial/img/"+f+"></td>");
//                out.print("<td><img src=/img/png ></td>");
                out.print("</tr>");
            }
            
            out.print("</table>");
            
            st.close();
            con.close();
             
            
        }
        catch (Exception e)
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
