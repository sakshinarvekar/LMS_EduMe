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
        <style>
            .chapter {
            color: #08578F;
            font-size: 24px;
            font-weight: bold;
        }

        .chapter-link {
            color: #087DAF;
            font-size: 22px;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .chapter-link:hover {
            color: #ff6347;
        }
        .contentlist{
            margin-left: 150px;
            background-color: white;
            width:500px;
            height:max-content;
            text-align: center;
            border-radius: 30px;
            box-shadow: 0 2px 5px 0 rgb(0 0 0 / 5%), 0 2px 10px 0 rgb(0 0 0 / 5%);
        }
        
            </style>
             <script type="text/javascript">
        var timerDisplay = document.getElementById("timer");
        var totalSeconds = 420; // 7 minutes (7 * 60 seconds)

        function updateTimer() {
            var minutes = Math.floor(totalSeconds / 60);
            var seconds = totalSeconds % 60;

            // Add leading zeros if necessary
            var minutesString = (minutes < 10 ? "0" : "") + minutes;
            var secondsString = (seconds < 10 ? "0" : "") + seconds;

            timerDisplay.innerHTML = "Time Remaining: " + minutesString + ":" + secondsString;

            if (totalSeconds === 0) {
                // Time is up, abandon the test
                clearInterval(timerInterval);
                document.getElementById("testForm").submit();
            } else {
                totalSeconds--;
            }
        }

        function startTimer() {
            updateTimer();
            timerInterval = setInterval(updateTimer, 1000);
        }
    </script>
    </head>
    <body>
        <h1>Test</h1>
        <form id="testForm" action="" method="post">
            <div class="quizdropdown">
                <center>
                   
                    <select class="form-control1" name="subject"  onchange="this.form.submit()" style="width:250px; height: 40px;">
                        <option value=""<% if ("".equals(session.getAttribute("selectedsub"))) out.print("selected"); %> >Select Subject</option>
                        <%
                            String g = (String) session.getAttribute("Grade");
                            //out.print(g);
                            
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
           <%-- if ("subject".equals(request.getParameter("subject"))) out.print("selected"); --%>
                       <option value="<%=subject%>"<% if (subject.equals(request.getParameter("subject"))) { %>selected="selected"<% } %>><%= subject%></option>        
                        <%                          }
                                rs.close();
                                st.close();
                                con.close();
                            } catch (Exception e) {
                                out.print(e);
                            }


                        %>
                    </select>

                    <select class="form-control2" name="chapters"  onchange="this.form.submit()"  style="width:250px; height: 40px;">
                        <option  value="">Select Chapter</option>
                        
                        <%
                            String selectedChapter = request.getParameter("chapters");                            
                            String s = (String)session.getAttribute("selectedsub");
                            session.setAttribute("selectedChapter", selectedChapter);
                            String c = (String)session.getAttribute("selectedChapter");

                            try {
                                String query = "select chp_name from content where grade='"+g+"' AND sub='"+selectedSubject+"'";
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12627744", "sql12627744", "aeUIku5cCL");
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery(query);

                                while (rs.next()) {
                                    String chaptername = rs.getString("chp_name");
                                    //out.print(chaptername);                                    
%>
                        <option value="<%= chaptername %>" <% if (chaptername.equals(request.getParameter("chapters"))) { %>selected="selected"<% } %>><%= chaptername %></option>
                        
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
                   
    <%
    //String selectedChapter = request.getParameter("chapters");
    //String selectedSub = request.getParameter("subject");
    out.print("Selected Subject: " + s + "<br>");
    out.print("Selected Chapter: " + selectedChapter);
    out.print("<br>");
%>
  <script type="text/javascript">
                    window.onload = function() {
                        startTimer();
                    };
                </script>      

    <%
    
    try{
            String Query="select * from quiz where sub='"+s+"' AND chp_name='"+selectedChapter+"' ";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12627744", "sql12627744", "aeUIku5cCL");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(Query);
            int count = 1;
            while(rs.next())
            {
             int id = rs.getInt("id");
             String q = rs.getString("question");
             String o1 = rs.getString("option1");
             String o2 = rs.getString("option2");
             String o3 = rs.getString("option3");
             String o4 = rs.getString("option4");
             //String a = rs.getString("correct_option");
             
             out.print("<div class='contentlist' >");
             out.print("<strong class='chapter'>Q."+id+"</strong>");
             out.print("<h3 class='chapter'>"+q+"</h3>");
             out.print("<br>");
             out.print("<input type='radio' name='r"+count+"' value='"+o1+"'>"+o1+"");
             out.print("<br>");
             out.print("<input type='radio' name='r"+count+"' value='"+o2+"'>"+o2+"");
             out.print("<br>");
             out.print("<input type='radio' name='r"+count+"' value='"+o3+"'>"+o3+"");
             out.print("<br>");
             out.print("<input type='radio' name='r"+count+"' value='"+o4+"'>"+o4+"");
             out.print("<br>");
             out.print("<hr style='width:95%; margin-left:12px;'/></div>");
             count++;
            }
            %>
          <input type="submit" value="Submit Test">
          <%
            rs.close();
            st.close();
            con.close();
}
            catch(Exception e)
                    {
                    out.print(e);
                    }
            
%>

    </center>
            </div>
        </form>
    </body>
</html>
