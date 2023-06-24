<%-- 
    Document   : Test
    Created on : Jun 24, 2023, 1:07:26 PM
    Author     : bhaktisunilnarvekar
--%>

<%@page import="java.security.interfaces.RSAKey"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test </title>
    </head>
    <body>
        <h1>Test</h1>
        <form action="" method="post">
            <div class="quizdropdown">
                <center>
                   
                    <select class="form-control1" name="subject"onchange="this.form.submit()" style="width:250px; height: 40px;">
                        <option value="-1" >Select Subject</option>
                        <%
                            String g = (String) session.getAttribute("Grade");
                            out.print(g);
                            
                            String selectedSubject = request.getParameter("subject");
                            
                            session.setAttribute("selectedsub", selectedSubject);

                            try {
                                String query = "select distinct sub from content";
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12627744", "sql12627744", "aeUIku5cCL");
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery(query);

                                while (rs.next()) {
                                String subject = rs.getString("sub");
//                                    out.print(subject);
//                                    
%>
           
                       <option value="<%=subject%>" <% if ("subject".equals(request.getParameter("subject"))) out.print("selected"); %>><%= subject%></option>        
                        <%                          }
                                rs.close();
                                st.close();
                                con.close();
                            } catch (Exception e) {
                                out.print(e);
                            }


                        %>
                    </select>

                    <select class="form-control2" name="chapters" style="width:250px; height: 40px;">
                        <option value="-1" >Select Chapter</option>
                        <%
                            String s = (String)session.getAttribute("selectedsub");
//                            out.print(s);
                            try {
                                String query = "select chp_name from content where grade='"+g+"' AND sub='"+s+"'";
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12627744", "sql12627744", "aeUIku5cCL");
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery(query);

                                while (rs.next()) {
//                                    String chaptername = rs.getString("chp_name");
//                                   out.print(chaptername);                                    
%>
                        <option value="<%= rs.getString("chp_name")%>"><%= rs.getString("chp_name")%></option>
                        <%
                                }
                                rs.close();
                                st.close();
                                con.close();
                            } catch (Exception e) {
                                out.print(e);
                            }
                        %>
                    </select>
                </center>
            </div>
        </form>
    </body>
</html>
