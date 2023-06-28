<%-- 
    Document   : PdfUpload
    Created on : 28-Jun-2023, 11:39:49 pm
    Author     : rupal
--%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.http.Part" %>

<%
   Connection conn = null;
   PreparedStatement pstmt = null;

   try {
      // Establish a database connection
      Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12629246", "sql12629246", "nSsVYGGiJc");
      // Prepare the SQL statement
      String query = "INSERT INTO pdf_files (grade, subject, chapter_name, file_name, file_location) VALUES (?, ?, ?, ?, ?)";
      pstmt = conn.prepareStatement(query);
      pstmt.setString(1, request.getParameter("grade"));
      pstmt.setString(2, request.getParameter("subject"));
      pstmt.setString(3, request.getParameter("chapter_name"));
      pstmt.setString(4, request.getParameter("file_name"));

      // Read the PDF file from the request
      Part filePart = request.getPart("file");
      String fileName = getFileName(filePart);

      // Save the uploaded file to a directory on the server
      String savePath = "/Users/sakshi/NetBeansProjects/demo/LMS_EduMe-master/src/main/webapp/videos/"; // Specify the directory where you want to save the file
      File file = new File(savePath + fileName);
      try (InputStream inputStream = filePart.getInputStream();
           FileOutputStream outputStream = new FileOutputStream(file)) {
         byte[] buffer = new byte[4096];
         int bytesRead;
         while ((bytesRead = inputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, bytesRead);
         }
      }

      // Store the file location (file path) in the database
      pstmt.setString(5, file.getAbsolutePath());

      // Execute the query
      pstmt.executeUpdate();

      out.println("PDF file inserted successfully!");
   } catch (Exception e) {
      out.println("Error: " + e.getMessage());
   } finally {
      // Close all resources
      if (conn != null) {
         try {
            conn.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
      if (pstmt != null) {
         try {
            pstmt.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
   }
%>
<%!
   // Helper method to extract the file name from the Part
   private String getFileName(Part part) {
      String contentDisp = part.getHeader("content-disposition");
      String[] tokens = contentDisp.split(";");
      for (String token : tokens) {
         if (token.trim().startsWith("filename")) {
            return token.substring(token.indexOf("=") + 2, token.length() - 1);
         }
      }
      return "";
   }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Upload PDF</title>
</head>
<body>
    <h1>Upload PDF</h1>
    <form action="" method="post" enctype="multipart/form-data">
        <label for="grade">Grade:</label>
        <input type="text" name="grade" required><br><br>
        
        <label for="subject">Subject:</label>
        <input type="text" name="subject" required><br><br>
        
        <label for="chapter_name">Chapter Name:</label>
        <input type="text" name="chapter_name" required><br><br>
        
        <label for="file_name">File Name:</label>
        <input type="text" name="file_name" required><br><br>
        
        <label for="file">PDF File:</label>
        <input type="file" name="file" required><br><br>
        
        <input type="submit" value="Upload">
    </form>
</body>
</html>
