<%@ page import="com.klef.jfsd.springboot.model.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <title>Student Home</title>
    <style>
        /* General body styling */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            display: flex;
            height: 100vh;
            color: #34495e;
        }

        /* Sidebar Styling */
        .sidebar {
            background-color: #2c3e50;
            color: white;
            width: 250px;
            height: 100%;
            padding: 30px 20px;
            position: fixed;
            top: 0;
            left: 0;
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

        /* Main content styling */
        #content {
            margin-left: 270px;
            padding: 30px;
            flex-grow: 1;
            transition: margin-left 0.3s ease;
        }

        .welcome-container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .welcome-container h2 {
            font-size: 2rem;
            color: #2ecc71;
            margin-bottom: 20px;
        }

        .student-name {
            font-size: 1.5rem;
            color: #34495e;
            font-weight: bold;
        }

        /* Mobile responsiveness */
        @media (max-width: 768px) {
            .sidebar {
                width: 200px;
                padding: 20px;
            }

            #content {
                margin-left: 220px;
            }

            .sidebar a {
                font-size: 14px;
                padding: 10px 15px;
            }

            .welcome-container {
                padding: 20px;
            }

            .student-name {
                font-size: 1.2rem;
            }
        }
    </style>
</head>
<body>

    <!-- Sidebar Section -->
    <div class="sidebar">
        <h2>Student Dashboard</h2>
        <a href="studenthome" class="active">Home</a>
        <a href="studentprofile">Profile</a>
        <a href="updatestudent">Update Profile</a>
        <a href="uploadproject">Upload Project</a>
        <a href="viewprojects">View Projects</a>
        <a href="viewfeedback">View Feedback</a>
        <a href="addportfolio">Create Portfolio</a>
        <a href="updateportfolio?studentId=${student.id}">Update Portfolio</a>
        <a href="viewportfolio?studentId=${student.id}">View Portfolio</a>
        <a href="studentlogout">Logout</a>
    </div>

    <!-- Main Content -->
    <div id="content">
        <div class="welcome-container">
            <h2>Welcome Back,</h2>
            <div class="student-name">
                <%= student.getName() %>
            </div>
        </div>
    </div>

</body>
</html>
