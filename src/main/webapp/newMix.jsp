<%-- 
    Document   : newMix
    Created on : Jul 4, 2023, 6:38:31 PM
    Author     : bhaktisunilnarvekar
--%>


<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login Form</title>
    <script src="https://kit.fontawesome.com/c807f93a6d.js" crossorigin="anonymous"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ECF2FF;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 80%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
            padding-left: 35px;
            background-color: #ECF2FF;
        }

        input[type="text"]::placeholder,
        input[type="email"]::placeholder,
        input[type="password"]::placeholder {
            color: #aaa;
             
        }

        .icon {
            position: relative;
        }

        .icon i {
            position: absolute;
            top: 50%;
            left: 10px;
            transform: translateY(-50%);
            color: #aaa;
        }

        input[type="submit"] {
/*            display: block;*/
            width: 30%;
            padding: 10px;
            background-color: #4CAF50;
            color: #ffffff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
        hr {
      border: 3px solid #0954aa;
      margin: 5px 5px 0px 5px;
    }

    .container h2 {
      color: #0954aa;
      position: relative;
    }

    .container h2::after {
      content: '';
      width: 30px;
      height: 4px;
      border-radius: 3px;
      background: #3E54AC;
      position: absolute;
      bottom: -12px;
      left: 50%;
      transform: translateX(-50%);
    }
    </style>


   <script>
    function handleFormSubmission() {
        // Perform validation or AJAX requests here

        // If validation fails, return false to prevent form submission
        // Otherwise, return true to allow the form submission

        return true;
    }
</script>
    
</head>

<body>
    <div class="container">
        <br><!-- comment -->
        <hr>
        <h2 style="font-family: 'PT Sans Caption', sans-serif">SignUp Form</h2>
        <form method="post" action="" onsubmit="return handleFormSubmission()">
            <div class="form-group">
                <input type="radio" name="userType" value="student" onclick="showForm('studentForm')"> Student
                <input type="radio" name="userType" value="teacher" onclick="showForm('teacherForm')"> Teacher
            </div>
            <div class="form-group" id="studentForm" style="display: none;">
                <label>Username:</label>
                <div class="icon"><i class="fa-solid fa-user-tie"></i><input type="text" name="studentId" required="Enter your username" pattern="^(?=.*[A-Za-z])[A-Za-z0-9._]{5,15}$" minlength="5" maxlength="15" title="Username should include atleast one chracter and should not use sepacial charaters except . _. And should be minimum 5 and maximum 15 characters only." placeholder="Username"></div>
                <label>Email:</label>
                <div class="icon"><i class="fa-solid fa-envelope"></i><input type="email" name="gmail" required=true email=true placeholder="Email" title="Please enter valid email address."></div>
                <label>Password:</label>
                <div class="icon"><i class="fa-solid fa-unlock-keyhole"></i><input type="password" name="password" required="true" id="password" onkeyup="checkPasswordMatch();" placeholder="Password" ></div>
                <br>
                
                <label>Confirm Password:</label>
                <div class="icon"><i class="fa-solid fa-unlock-keyhole"></i><input type="password" name="confirmPassword" id="confirmPassword" onkeyup="checkPasswordMatch();" placeholder="Confirm Password"></div>
                  <span id='message'></span>
                <label>Mobile Number:</label>
                <div class="icon"><i class="fa-solid fa-mobile"></i><input type="text" name="mobileNumber"  pattern="[0-9]{10}" required title="Please enter a 10-digit mobile number" maxlength="10" minlength="10" placeholder="Mobile Number"></div>
                <br>
                <input type="submit" value="Submit">
            </div>
            <div class="form-group" id="teacherForm" style="display: none;">
                <label>Username:</label>
                <div class="icon"><i class="fa-solid fa-user-tie"></i><input type="text" name="studentId" placeholder="Username" required="Enter your username" pattern="^(?=.*[A-Za-z])[A-Za-z0-9._]{5,15}$" minlength="5" maxlength="15" title="Username should include atleast one chracter and should not use sepacial charaters except . _. And should be minimum 5 and maximum 15 characters only."></div>
                <label>Email:</label>
                <div class="icon"><i class="fa-solid fa-envelope"></i><input type="email" name="gmail" placeholder="Email" required=true email=true></div>
                <label>Password:</label>
                <div class="icon"><i class="fa-solid fa-unlock-keyhole"></i><input type="password" name="password" required="true" id="password2" onkeyup="checkPasswordMatch2();" placeholder="Password"></div>
                <label>Confirm Password:</label>
                 <span id='message2'></span>
                <div class="icon"><i class="fa-solid fa-unlock-keyhole"></i><input type="password" name="confirmPassword" id="confirmPassword2" onkeyup="checkPasswordMatch2();" required="true" placeholder="Confirm Password"></div>
                <label>Mobile Number:</label>
                <div class="icon"><i class="fa-solid fa-mobile"></i><input type="text" name="mobileNumber" pattern="[0-9]{10}" required title="Please enter a 10-digit mobile number" maxlength="10" minlength="10" placeholder="Mobile Number"></div>
                <br>
                <input type="submit" value="Submit">
            </div>
<!--            <div class="form-group">
                <input type="submit" value="Submit">
            </div>-->
        </form>
    </div>

    <script>
        function showForm(formId) {
            var forms = document.getElementsByClassName("form-group");
            for (var i = 0; i < forms.length; i++) {
                forms[i].style.display = "none";
            }
            document.getElementById(formId).style.display = "block";
        }
    </script>

    <%-- Retrieve the form data --%>
    <%
        String userType = request.getParameter("userType");
        String studentId = request.getParameter("studentId");
        String teacherId = request.getParameter("teacherId");

        // JDBC connection details
        String dbURL = "jdbc:mysql://sql12.freesqldatabase.com:3306/sql12629246";
        String dbUsername = "sql12629246";
        String dbPassword = "nSsVYGGiJc";

        // Establish the database connection
        Connection conn = null;
        try {
         String un = request.getParameter("studentId");
         String em=request.getParameter("gmail");
         String pass=request.getParameter("password");
         String cpass = request.getParameter("confirmPassword");
         String mob=request.getParameter("mobileNumber");
         
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
            Statement st = conn.createStatement();
            
            // Perform login processing based on user type
            if (userType != null && userType.equals("student")) {
               st.execute("insert into SignUp values('"+un+"','"+em+"','"+pass+"','"+cpass+"','"+mob+"');");              
//               out.print("value inserted");
               out.println("<script type=\"text/javascript\">"); // Start the script tag 
               out.println("alert('Registered successfully!!');"); // JavaScript code to generate an alert box 
               out.println("window.location.href = 'sign.html';");
               out.println("</script>");
               st.close();
               conn.close();
               
            } else if (userType != null && userType.equals("teacher")) {
               Statement stm = conn.createStatement();
               st.execute("insert into Teachers values(default,'" + un + "','" + pass + "','" + cpass + "','" + mob + "','" + em + "');");
               out.println("<script type=\"text/javascript\">");
               out.println("alert('Registered successfully!!');");
               out.println("window.location.href = '/LMS_EduMe/TeacherLogin.jsp';");
               out.println("</script>");

            stm.close();
            conn.close();
                
            }
               
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close the database connection
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>

</body>
<script>

function checkPasswordMatch() {
    var password = document.getElementById('password').value;
    var confirmPassword = document.getElementById('confirmPassword').value;
    var message = document.getElementById('message');

    if (password === confirmPassword) {
        message.style.color = 'green';
        message.innerHTML = 'Matching';
    } else {
        message.style.color = 'red';
        message.innerHTML = 'Not Matching';
    }
}
</script>
<script>
function checkPasswordMatch2() {
    var password2 = document.getElementById('password2').value;
    var confirmPassword2 = document.getElementById('confirmPassword2').value;
    var message2 = document.getElementById('message2');

    if (password2 === confirmPassword2) {
        message2.style.color = 'green';
        message2.innerHTML = 'Matching';
    } else {
        message2.style.color = 'red';
        message2.innerHTML = 'Not Matching';
    }
}
</script>

</html>

