<%-- 
    Document   : AdminGrid
    Created on : Jun 28, 2023, 2:03:21 PM
    Author     : bhaktisunilnarvekar
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            
            @import url("https://fontawesome.com/");
            @import url('https://fonts.googleapis.com/css2?family=Didact+Gothic&family=Jost:wght@100;200;300;400;500;600;700&family=Karla:wght@200;300;400;500;600;700&family=Montserrat:wght@300;400;500;600;700;800&family=PT+Sans+Caption:wght@400;700&display=swap');
            *{
                margin: 0px;
                padding: 0px;
                box-sizing: border-box;
                font-family: 'PT Sans Caption', sans-serif;
            }
            body {
              margin: 0;
              padding: 0;
            }

            #sidebar {
              width: 250px;
              background-color: #333;
              height: 100vh;
              position: fixed;
              left: 0;
              color: #fff;
              display: flex;
              flex-direction: column;
              align-items: center;
              padding-top: 20px;
            }

            #sidebar a{
                color:white;
                text-decoration: none;
            }

            #sidebar img {
              width: 100px;
              margin-bottom: 20px;
            }

            #content {
              margin-left: 250px;
              padding: 20px;
            }

            ul {
              list-style-type: none;
              padding: 0;
              margin: 0;
            }

            ul li {
              padding: 10px;
              cursor: pointer;
            }

            ul li:hover {
              background-color: #555;
            }

            .active {
              background-color: #555;
            }

            /* CSS for page content */
            h1 {
              color: #333;
            }
            
            body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            height: 100vh;
            margin: 0;
            padding: 0;
            background-color: rgb(238,247,247);
        }
        .form-div{
            margin-top: 100px;
        }

            table {
                border-collapse: collapse;
                width: 50%;
                margin-top: 100px;
            }

            th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: rgb(8, 135, 175);
                color: white;
            }
            h2 {
                background-color: rgb(232, 108, 58);
                color: white;
                padding: 10px;
            }

            form {
                display: inline;
            }
            input[type="text"] {
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
                margin-bottom: 10px;
                margin-top: 20px;
            }

            input[type="submit"] {
                padding: 8px 16px;
                background-color: rgb(8, 135, 175);
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: rgb(6, 109, 142);
            }
        </style>
    </head>

        
  <script>
    // JavaScript for sidebar active item
    function setActive(element) {
      var items = document.getElementsByClassName('active');
      for (var i = 0; i < items.length; i++) {
        items[i].classList.remove('active');
      }
      element.classList.add('active');
    }
  </script>
</head>
<body>
    <div id="sidebar">
      <h2>Hello Admin</h2><br>
    <img src="/LMS_EduMe/img/admin.png" alt="Admin Image">
    <ul>
        <li onclick="setActive(this)"><a href="AdminPanel.jsp">Dashboard</a></li>
        <li onclick="setActive(this)"><a href="AdminGrid.jsp">Manage Content</a></li>
        <li onclick="setActive(this)"><a href="fileup_1.jsp">Upload Content</a></li>
      <li onclick="setActive(this)"><a href="TeacherRD.jsp">Manage Teachers</a></li>
      <li onclick="setActive(this)"><a href="StudentRD.jsp">Manage Student</a></li>
      <li onclick="setActive(this)"><a href="#">Student Support</a></li>
      <li onclick="setActive(this)"><a href="?action=logout">Logout</a></li>
        <% 
    String action = request.getParameter("action");
    if (action != null && action.equals("logout")) 
    {
        response.sendRedirect("HomePage.jsp");
    }
     %>
    </ul>
  </div>
    <div class="form-div">
        <form action="" method="post" >
            <h2>Manage Content</h2>
            Enter Grade : <input type="text" name="t1" placeholder="Grade" required><br><!-- comment -->
            Enter Subject : <input type="text" name="t2" placeholder="Subject" required=><br><br>
            <input type="submit" value="Search Records">
        </form>
    </div>
    </body>
</html>
<%
    
    try
    {
        String g = request.getParameter("t1");
        String s = request.getParameter("t2");
        if(g!=null)
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12629246", "sql12629246", "nSsVYGGiJc");

    Statement st = con.createStatement();

    String sqlQuery = "SELECT * FROM content WHERE grade LIKE ? AND sub LIKE ?";

            PreparedStatement stmt = con.prepareStatement(sqlQuery);
            stmt.setString(1, "%" + g + "%");
            stmt.setString(2, "%" + s + "%");
            ResultSet rs = stmt.executeQuery();
            
            out.print("<table border=1 width=50%");
            out.print("<tr>");
            out.print("<th> Grade </th>");
            out.print("<th> Subject </th>");
            out.print("<th> chapter no </th>");
            out.print("<th> Chapter name </th>");
            out.print("<th> Video </th>");
            out.print("<th>Action</th>");
            out.print("</tr>");
            while (rs.next()) {

                int id = rs.getInt("id");
                g = rs.getString("grade");
                s = rs.getString("sub");
                String c = rs.getString("chp_no");
                String cn = rs.getString("chp_name");
                String v = rs.getString("video");



                out.print("<tr>");
                //out.print("<td>"+i+"</td>");
                out.print("<td>"+g+"</td>");
                out.print("<td>"+s+"</td>");
                out.print("<td>"+c+"</td>");
                out.print("<td>"+cn+"</td>");
                out.print("<td><video controls style=\"height:100px; width:150px;\""
                        + "<source src=/LMS_EduMe/videos/"+v+" type='video/mp4'></video></td>");
                //out.print("<td><input type='submit' value='Edit'>"+ ""+ "</td>");
                //out.print("<td><input type='submit' value='Delete'>" +""+"</td>");
                out.print("<td>"
                                + "<form action='edit.jsp' method='post'>"
                                + "<input type='hidden' name='id' value='" + id + "'>"
                                + "<input type='submit' value='Edit'>"
                                + "</form>"
                                + "<form action='' method=''>"
                                + "<input type='hidden' name='id' value='" + id + "'>"
                                + "<input type='submit' value='Delete'>"
                                + "</form>"
                                + "</td>");       
                out.print("</tr>");
            }
            out.print("</table>");

    rs.close();
    st.close();
    con.close();
        }
    }
    catch(Exception e)
    {
        out.print(e);
    }
    if (request.getMethod().equals("POST")) {
        try {
                String id = request.getParameter("id");
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12629246", "sql12629246", "nSsVYGGiJc");
                Statement st = con.createStatement();
                String sqlQuery = "DELETE FROM content WHERE id = ?";
                PreparedStatement stmt = con.prepareStatement(sqlQuery);
                stmt.setString(1, id);
                int rowsAffected = stmt.executeUpdate();

                if (rowsAffected > 0) {
                    out.println("Record deleted successfully!");
                } else {
                    out.println("Record not found or could not be deleted!");
                }

                st.close();
                con.close();
            } catch (Exception e) {
                out.print(e);
            }
    }
%>