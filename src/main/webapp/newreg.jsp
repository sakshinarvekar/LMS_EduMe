<%-- 
    Document   : newreg
    Created on : Jul 3, 2023, 2:32:36 PM
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
        /* ... CSS styles ... */
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.slim.min.js" integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI=" crossorigin="anonymous"></script>
    <script src="jquery.js"></script>
    <script src="jquery.validate.js"></script>
</head>
<body>
    <!-- ... HTML form ... -->
    <script>

        //Calling inbuilt functions
        $(document).ready(function() {
            $.validator.setDefaults({
            
            });
        
            //Validating using ID names
            $("#studentForm").validate({
                rules: {
                    studentId: {
                        required: true,
                        pattern: /^(?=.*[A-Za-z])[A-Za-z0-9._]{5,15}$/
                    },
                    gmail: {
                        required: true,
                        email: true
                    },
                    password: {
                        required: true,
                        minlength: 8
                    },
                    confirmPassword: {
                        required: true,
                        equalTo: "#password"
                    },
                    mobileNumber: {
                        digits: true
                    }
                },
                messages: {
                    studentId: {
                        required: "Please enter your username",
                        pattern: "Username should include at least one character and should not use special characters except . _." +
                            " It should be a minimum of 5 and a maximum of 15 characters."
                    },
                    gmail: {
                        required: "Please enter your email",
                        email: "Please enter a valid email address"
                    },
                    password: {
                        required: "Please enter your password",
                        minlength: "Password should be at least 8 characters long"
                    },
                    confirmPassword: {
                        required: "Please confirm your password",
                        equalTo: "Passwords do not match"
                    },
                    mobileNumber: {
                        digits: "Please enter a valid mobile number"
                    }
                }
            });

            $("#teacherForm").validate({
                rules: {
                    studentId: {
                        required: true
                    },
                    gmail: {
                        required: true,
                        email: true
                    },
                    password: {
                        required: true,
                        minlength: 8
                    },
                    confirmPassword: {
                        required: true,
                        equalTo: "#password"
                    },
                    mobileNumber: {
                        digits: true
                    }
                },
                messages: {
                    studentId: {
                        required: "Please enter your username"
                    },
                    gmail: {
                        required: "Please enter your email",
                        email: "Please enter a valid email address"
                    },
                    password: {
                        required: "Please enter your password",
                        minlength: "Password should be at least 8 characters long"
                    },
                    confirmPassword: {
                        required: "Please confirm your password",
                        equalTo: "Passwords do not match"
                    },
                    mobileNumber: {
                        digits: "Please enter a valid mobile number"
                    }
                }
            });
        });

    </script>
</body>
</html>
