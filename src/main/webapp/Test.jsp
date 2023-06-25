<%-- 
    Document   : Test
    Created on : Jun 24, 2023, 1:07:26 PM
    Author     : bhaktisunilnarvekar
--%>

<%@page import="java.util.*"%>
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
            
        .hidden-score {
        display: none;
    }
        }
        </style>
        
            <script type="text/javascript">
        function updateTimer() {
            var timerDisplay = document.getElementById("timer");

            var currentTime = new Date();
            var hours = currentTime.getHours();
            var minutes = currentTime.getMinutes();
            var seconds = currentTime.getSeconds();

            // Add leading zeros if necessary
            hours = (hours < 10 ? "0" : "") + hours;
            minutes = (minutes < 10 ? "0" : "") + minutes;
            seconds = (seconds < 10 ? "0" : "") + seconds;

            timerDisplay.innerHTML = "Current Time: " + hours + ":" + minutes + ":" + seconds;
        }

        // Function to start the timer
        function startTimer() {
            updateTimer(); // Display initial time
            setInterval(updateTimer, 1000); // Update timer every second
        }

        // Execute the div and start the timer automatically
        window.onload = function() {
            var div = document.getElementById("myDiv");
            div.style.display = "block"; // Display the div

            // Start the timer
            startTimer();
        };
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
       
<div id="myDiv" style="display: none;">
    <%
    
    try{
            String Query="select * from quiz where sub='"+s+"' AND chp_name='"+selectedChapter+"' ";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12627744", "sql12627744", "aeUIku5cCL");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(Query);
            int count = 1;
            int score = 0;
            
            //String [] userSelection = {request.getParameter("r"+count)};
            List<String> answer = new ArrayList<>();
            List<String> selectedans = new ArrayList<>();
            while(rs.next())
            {
             int id = rs.getInt("id");
             String q = rs.getString("question");
             String o1 = rs.getString("option1");
             String o2 = rs.getString("option2");
             String o3 = rs.getString("option3");
             String o4 = rs.getString("option4");
             String a = rs.getString("correct_option");            
             answer.add(a);
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
                    int counter = 1;
                    for(int i=0;i<answer.size();i++)
                     {
                     selectedans.add(request.getParameter("r"+counter));
                     counter++;
                     }
            
                    for(int i =0;i<answer.size();i++)
                        {
                            for(int j =0;j<selectedans.size();j++)
                            {
                            if(answer.get(i).equals(selectedans.get(j)))
                            {
                                score++; 
                                break;
                            }
                            
                            }
                        }
            
//            if(score>0)
//            {
//                out.print("Your score "+score);
//                out.print(answer);
//                out.print(selectedans);
//            }
                
               String btn = request.getParameter("Submit");
               if(btn!=null)
                {
               if(btn.equals("Submit"))
               {
               out.print("Your score : "+score);
                }
                }
         

            
            rs.close();
            st.close();
            con.close();
        }
           catch(Exception e)
                    {
                    out.print(e);
                    }
    
%>

             <input type="submit" value="Submit" name="Submit" > 
 </div>
    </center>
    </div>
            
        </form>
    </body>
<!--<script>
    function toggleButtonVisibility() {
      var condiv = document.getElementByName("contentlist");
      var submitButton = document.getElementByName("Submit");

      if (condiv.value === "") {
        submitButton.style.display = "none";
      } else {
        submitButton.style.display = "block";
      }
    }
  </script>-->
</html>
