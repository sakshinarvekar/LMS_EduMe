<%-- 
    Document   : QueryForm
    Created on : 25-Jun-2023, 1:26:41 pm
    Author     : rupal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Help Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        h1 {
            text-align: center;
        }

        .form-container {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f2f2f2;
            border-radius: 5px;
        }

        .form-container label {
            font-weight: bold;
        }

        .form-container input[type="text"],
        .form-container textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            resize: vertical;
        }

        .form-container button[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .form-container button[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>FeedBack Form</h1>

    <div class="form-container">
        <form action="submit_help_form.php" method="POST">
            <label for="studentName">Your Name:</label>
            <input type="text" id="studentName" name="studentName" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="subject">Subject:</label><br>
            <input type="text" id="subject" name="Grade" required>

            <label for="question">FeedBack/Query:</label>
            <textarea id="question" name="question" rows="4" required></textarea>

            <button type="submit">Submit</button>
        </form>
    </div>
</body>
</html>
