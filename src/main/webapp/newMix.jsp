<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
    </head>
    <body>
        <form method="post" action="newMix.jsp">
            <div class="container">
                <br><!-- comment -->
                <hr>
                <h2 style="font-family: 'PT Sans Caption', sans-serif">Login Form</h2>

                <div class="form-group">
                    <input type="radio" name="userType" value="student" onclick="showForm('studentForm')"> Student
                    <input type="radio" name="userType" value="teacher" onclick="showForm('teacherForm')"> Teacher
                </div>
                <div class="form-group" id="studentForm" style="display: none;">
                    <label>Username:</label>
                    <div class="icon"><i class="fa-solid fa-user-tie"></i><input type="text" name="studentId" placeholder="Username" maxlength="12" oninput="validateUsername()"></div>
                    <span style="color: red; font-size: 14px;" id="usernameMessage" class="validation-message"></span>
                    <label>Email:</label>
                    <div class="icon"><i class="fa-solid fa-envelope"></i><input type="email" name="gmail" placeholder="Email" title="Enter a valid email address" oninput="validateEmail()"></div>
                    <span style="color: red; font-size: 14px;" id="emailMessage" class="validation-message"></span>
                    <label>Password:</label>
                    <div class="icon"><i class="fa-solid fa-unlock-keyhole"></i><input type="password" name="password" id="password" placeholder="Password" oninput="validatePassword()"></div>
                    <span style="color: red; font-size: 14px;" id="passwordMessage" class="validation-message"></span>
                    <label>Confirm Password:</label>
                    <div class="icon"><i class="fa-solid fa-unlock-keyhole"></i><input type="password" name="confirmPassword" id="confirmPassword" placeholder="Confirm Password" oninput="validateConfirmPassword()"></div>
                    <span style="color: red; font-size: 14px;" id="confirmPasswordMessage" class="validation-message"></span>
                    <label>Mobile Number:</label>
                    <div class="icon"><i class="fa-solid fa-mobile"></i><input type="text" name="mobileNumber" id="mobileNumber" placeholder="Mobile Number"  oninput="validateMobile()" maxlength="10"></div>
                    <span style="color: red; font-size: 14px; margin-bottom: 25px;" id="mobileMessage" class="validation-message"></span>
                    --><br>
                    <input type="submit" value="Submit" onclick="return validateForm()">
                </div>
                <div class="form-group" id="teacherForm" style="display: none;">
                    <label>Username:</label>
                    <div class="icon"><i class="fa-solid fa-user-tie"></i><input type="text" name="teacherId" placeholder="Username" maxlength="12" oninput="validateTeacherUsername()"></div>
                    <span style="color: red; font-size: 14px;" id="teacherUsernameMessage" class="validation-message"></span>
                    <label>Email:</label>
                    <div class="icon"><i class="fa-solid fa-envelope"></i><input type="email" name="teacherEmail" placeholder="Email" title="Enter a valid email address" oninput="validateTeacherEmail()"></div>
                    <span style="color: red; font-size: 14px;" id="teacherEmailMessage" class="validation-message"></span>
                    <label>Password:</label>
                    <div class="icon"><i class="fa-solid fa-unlock-keyhole"></i><input type="password" name="teacherPassword" id="teacherPassword" placeholder="Password" oninput="validateTeacherPassword()"></div>
                    <span style="color: red; font-size: 14px;" id="teacherPasswordMessage" class="validation-message"></span>
                    <label>Confirm Password:</label>
                    <div class="icon"><i class="fa-solid fa-unlock-keyhole"></i><input type="password" name="teacherConfirmPassword" id="teacherConfirmPassword" placeholder="Confirm Password" oninput="validateTeacherConfirmPassword()"></div>
                    <span style="color: red; font-size: 14px;" id="teacherConfirmPasswordMessage" class="validation-message"></span>
                    <label>Mobile Number:</label>
                    <div class="icon"><i class="fa-solid fa-mobile"></i><input type="text" name="teacherMobileNumber" id="teacherMobileNumber" placeholder="Mobile Number" maxlength="10"></div>
                    <span style="color: red; font-size: 14px; margin-bottom: 25px;" id="mobileMessage" class="validation-message"></span>
                    <br>
                    <input type="submit" value="Submit" onclick="return validateTeacherForm()">
                </div>

            </div>
        </form>


        <script>
            function showForm(formId) {
                var studentForm = document.getElementById("studentForm");
                var teacherForm = document.getElementById("teacherForm");

                if (formId === "studentForm") {
                    studentForm.style.display = "block";
                    teacherForm.style.display = "none";
                } else if (formId === "teacherForm") {
                    studentForm.style.display = "none";
                    teacherForm.style.display = "block";
                }
            }

            function validateUsername() {
                var usernameInput = document.getElementsByName("studentId")[0];
                var usernameMessage = document.getElementById("usernameMessage");
                var username = usernameInput.value;
                var usernameRegex = /^[A-Z][a-zA-Z]*$/;

                if (!usernameRegex.test(username)) {
                    usernameMessage.textContent = "Username must start with a capital letter and must contain only 12 characters.";
//                    usernameInput.classList.add("invalid");
                } else {
                    usernameMessage.textContent = "";
//                    usernameInput.classList.remove("invalid");
                }
            }

            function validateEmail() {
                var emailInput = document.getElementsByName("gmail")[0];
                var emailMessage = document.getElementById("emailMessage");
                var email = emailInput.value;
                var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

                if (!emailRegex.test(email)) {
                    emailMessage.textContent = "Please enter a valid email address.";
                } else {
                    emailMessage.textContent = "";
                }
            }


            function validatePassword() {
                var passwordInput = document.getElementById("password");
                var passwordMessage = document.getElementById("passwordMessage");

                if (passwordInput.value.length < 8) {
                    passwordMessage.textContent = "Password must be at least 8 characters long.";
                } else {
                    passwordMessage.textContent = "";
                }
            }

            function validateConfirmPassword() {
                var passwordInput = document.getElementById("password");
                var confirmPasswordInput = document.getElementById("confirmPassword");
                var confirmPasswordMessage = document.getElementById("confirmPasswordMessage");

                if (confirmPasswordInput.value !== passwordInput.value) {
                    confirmPasswordMessage.textContent = "Passwords do not match.";
                } else {
                    confirmPasswordMessage.textContent = "";
                }
            }
             
             function validateMobile() {
                var mobilenum = document.getElementById("mobileNumber");
                var mobilemessage = document.getElementById("mobileMessage");

                var mobileValue = mobilenum.value;

                if (mobileValue.length < 10) {
                    mobilemessage.innerHTML = "Mobile number should be maximum 10 digits.";
                    return false;
                } else {
                    mobilemessage.innerHTML = "";
                    return true;
                }
            }

            function validateForm() {
                validateUsername();
                validateEmail();
                validatePassword();
                validateConfirmPassword();
                validateMobile();

                var validationMessages = document.getElementsByClassName("validation-message");

                for (var i = 0; i < validationMessages.length; i++) {
                    if (validationMessages[i].textContent !== "") {
                        return false; // Prevent form submission if any validation message is present
                    }
                }

                return true; // Allow form submission if all validations pass
            }
            function validateTeacherUsername() {
                var usernameInput = document.getElementsByName("teacherId")[0];
                var usernameMessage = document.getElementById("teacherUsernameMessage");
                var username = usernameInput.value;
                var usernameRegex = /^[A-Z][a-zA-Z]*$/;

                if (!usernameRegex.test(username)) {
                    usernameMessage.textContent = "Username must start with a capital letter and must contain only 12 characters.";
                } else {
                    usernameMessage.textContent = "";
                }
            }

            function validateTeacherEmail() {
                var emailInput = document.getElementsByName("teacherEmail")[0];
                var emailMessage = document.getElementById("teacherEmailMessage");
                var email = emailInput.value;
                var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

                if (!emailRegex.test(email)) {
                    emailMessage.textContent = "Please enter a valid email address.";
                } else {
                    emailMessage.textContent = "";
                }
            }

            function validateTeacherPassword() {
                var passwordInput = document.getElementById("teacherPassword");
                var passwordMessage = document.getElementById("teacherPasswordMessage");

                if (passwordInput.value.length < 8) {
                    passwordMessage.textContent = "Password must be at least 8 characters long.";
                } else {
                    passwordMessage.textContent = "";
                }
            }

            function validateTeacherConfirmPassword() {
                var passwordInput = document.getElementById("teacherPassword");
                var confirmPasswordInput = document.getElementById("teacherConfirmPassword");
                var confirmPasswordMessage = document.getElementById("teacherConfirmPasswordMessage");

                if (confirmPasswordInput.value !== passwordInput.value) {
                    confirmPasswordMessage.textContent = "Passwords do not match.";
                } else {
                    confirmPasswordMessage.textContent = "";
                }
            }
            
            function validateTeacherMobile() {
                var mobilenum = document.getElementById("teacherMobileNumber");
                var mobilemessage = document.getElementById("mobileMessage");

                var mobileValue = mobilenum.value;

                if (mobileValue.length < 10) {
                    mobilemessage.innerHTML = "Mobile number should be maximum 10 digits.";
                    return false;
                } else {
                    mobilemessage.innerHTML = "";
                    return true;
                }
            }

            function validateTeacherForm() {
                validateTeacherUsername();
                validateTeacherEmail();
                validateTeacherPassword();
                validateTeacherConfirmPassword();
                validateTeacherMobile();

                var validationMessages = document.getElementsByClassName("validation-message");

                for (var i = 0; i < validationMessages.length; i++) {
                    if (validationMessages[i].textContent !== "") {
                        return false; // Prevent form submission if any validation message is present
                    }
                }

                return true; // Allow form submission if all validations pass
            }
        </script>


        <%-- Retrieve the form data --%>
        <%
            String userType = request.getParameter("userType");
            String studentId = request.getParameter("studentId");
            String teacherId = request.getParameter("teacherId");

            // JDBC connection details
            String dbURL = "jdbc:mysql://localhost:3306/EduMe";
            String dbUsername = "root";
            String dbPassword = "root";

            // Establish the database connection
            Connection conn = null;
            try {
                String un = request.getParameter("studentId");
                String em = request.getParameter("gmail");
                String pass = request.getParameter("password");
                String cpass = request.getParameter("confirmPassword");
                String mob = request.getParameter("mobileNumber");
                
                String tun = request.getParameter("teacherId");
                String tem = request.getParameter("teacherEmail");
                String tpass = request.getParameter("teacherPassword");
                String tcpass = request.getParameter("teacherConfirmPassword");
                String tmob = request.getParameter("teacherMobileNumber");

                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
                Statement st = conn.createStatement();

                // Perform login processing based on user type
                if (userType != null && userType.equals("student")) {
                    st.execute("insert into SignUp values('" + un + "','" + em + "','" + pass + "','" + cpass + "','" + mob + "');");
                    //               out.print("value inserted");
                    out.println("<script type=\"text/javascript\">"); // Start the script tag 
                    out.println("alert('Registered successfully!!');"); // JavaScript code to generate an alert box 
                    out.println("window.location.href = 'sign.html';");
                    out.println("</script>");
                    st.close();
                    conn.close();

                } else if (userType != null && userType.equals("teacher")) {
                    
                    Statement stm = conn.createStatement();
                    st.execute("insert into Teachers values(default,'" + tun + "','" + tem + "','" + tpass + "','" + tcpass + "','" + tmob + "');");                    
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
</html>