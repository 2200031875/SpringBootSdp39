<%@page import="com.klef.jfsd.springboot.model.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
Student student = (Student) session.getAttribute("student");
if(student == null) {
    response.sendRedirect("studentsessionexpiry.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #34495e;
        }

        /* Sidebar styling */
        .sidebar {
            background-color: #2c3e50;
            color: white;
            width: 250px;
            padding: 30px;
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            box-shadow: 2px 0px 5px rgba(0, 0, 0, 0.1);
        }

        .sidebar h2 {
            font-size: 1.5rem;
            text-align: center;
            margin-bottom: 20px;
        }

        .sidebar a {
            display: block;
            color: #ecf0f1;
            padding: 12px 20px;
            font-size: 16px;
            text-decoration: none;
            margin: 8px 0;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .sidebar a:hover {
            background-color: #34495e;
            transform: translateX(5px);
        }

        .sidebar a.active {
            background-color: #1abc9c;
            font-weight: bold;
        }

        /* Main Content Area - centered */
        #content {
            margin-left: 270px; /* Leave space for the sidebar */
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            padding: 20px;
            height: 100vh; /* Full screen height */
        }

        /* Card Container */
        .form-container {
            background-color: white;
            padding: 30px;
            width: 400px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h3 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        table td {
            padding: 10px;
            font-size: 14px;
        }

        table td label {
            font-weight: bold;
        }

        table input, table textarea, table select {
            width: 100%;
            padding: 8px;
            font-size: 14px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        /* Button container - side by side */
        .button-container {
            display: flex;
            justify-content: space-between;
            gap: 10px;
        }

        .button-container input[type="submit"], 
        .button-container input[type="reset"] {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #1abc9c;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 48%; /* Equal width for both buttons */
        }

        .button-container input[type="submit"]:hover,
        .button-container input[type="reset"]:hover {
            background-color: #16a085;
        }

        /* Responsive Design for Mobile */
        @media (max-width: 768px) {
            .sidebar {
                width: 200px;
                padding: 20px;
            }

            .form-container {
                width: 90%;
                padding: 20px;
            }

            table td {
                font-size: 12px;
            }

            .button-container input[type="submit"], 
            .button-container input[type="reset"] {
                font-size: 14px;
                padding: 8px 15px;
            }
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Student Dashboard</h2>
        <a href="studenthome" class="active">Home</a>
        <a href="studentprofile">Profile</a>
        <a href="updatestudent">Update Profile</a>
        <a href="studentcontactus">Contact Us</a>
        <a href="uploadproject">Upload Project</a>
        <a href="viewprojects">View Projects</a>
        <a href="studentlogout">Logout</a>
    </div>

    <!-- Main content area -->
    <div id="content">
        <div class="form-container">
            <h3>Contact Us</h3>
            <form method="post" action="sendemail">
                <table>
                    <tr>
                        <td><label for="name">Name</label></td>
                        <td><input type="text" id="name" name="name" required/></td>
                    </tr>
                    <tr>
                        <td><label for="email">Email ID</label></td>
                        <td><input type="email" id="email" name="email" required/></td>
                    </tr>
                    <tr>
                        <td><label for="subject">Subject</label></td>
                        <td><input type="text" id="subject" name="subject" required/></td>
                    </tr>
                    <tr>
                        <td><label for="message">Message</label></td>
                        <td><textarea name="message" id="message" required></textarea></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="button-container">
                            <input type="submit" value="Send"/>
                            <input type="reset" value="Clear"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

</body>
</html>
