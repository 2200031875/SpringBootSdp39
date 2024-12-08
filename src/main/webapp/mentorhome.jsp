<%@ page import="com.klef.jfsd.springboot.model.Mentor" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
Mentor mentor = (Mentor) session.getAttribute("mentor");
if(mentor == null) {
    response.sendRedirect("mentorsessionexpiry.jsp");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mentor Home</title>
    <style>
        /* Basic Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
        }

        /* Sidebar Styling */
        .sidebar {
            width: 250px;
            background-color: #2c3e50;
            padding: 20px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            display: flex;
            flex-direction: column;
        }

        .sidebar h2 {
            color: white;
            font-size: 24px;
            margin-bottom: 30px;
            text-align: center;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            font-size: 18px;
            padding: 12px 20px;
            margin: 10px 0;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .sidebar a:hover {
            background-color: #34495e;
        }

        .sidebar a.active {
            background-color: #1abc9c;
            font-weight: bold;
        }

        /* Main Content Styling */
        .content {
            margin-left: 250px;  /* Make space for the sidebar */
            padding: 20px;
            width: calc(100% - 250px); /* Subtract the width of the sidebar */
        }

        .content h2 {
            color: #2c3e50;
            font-size: 28px;
            margin-bottom: 20px;
        }

        .stats {
            display: flex;
            justify-content: center;
            gap: 30px;
        }

        .stats div {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 150px;
            text-align: center;
        }

        .stats div h3 {
            font-size: 22px;
            color: #2c3e50;
        }

        .stats div p {
            font-size: 18px;
            color: #16a085;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Mentor Dashboard</h2>
        <a href="/mentorhome" class="active">Home</a>
        <a href="mentorprofile">My Profile</a>
        <a href="/updatementor">update profile</a>
        <a href="adminviewprojects">Student Projects</a>
        <a href="viewmystudents">View All Students</a> 
        <a href="/mentorlogout">Logout</a>
    </div>

    <!-- Main Content -->
    <div class="content">
        <h2>Welcome to Mentor Home</h2>
        <div class="stats">
            
        </div>
    </div>

</body>
</html>
