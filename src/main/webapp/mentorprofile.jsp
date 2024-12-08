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
    <title>My Profile</title>
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

        /* Profile container styles */
        .profile-container {
            margin-left: 270px; /* Leave space for the sidebar */
            width: 70%; /* Decrease the width of the profile container */
            padding: 20px;
        }

        .profile-container h3 {
            text-align: center;
            font-size: 1.6rem;
            color: #2ecc71;
            margin-bottom: 20px;
        }

        /* Card styling for profile */
        .profile-card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 80%; /* Decrease card width */
            margin: 0 auto; /* Center the card */
            text-align: left;
        }

        .profile-card h4 {
            font-size: 1.2rem;
            color: #2c3e50;
            margin-bottom: 10px;
        }

        .profile-card p {
            font-size: 1rem;
            margin: 5px 0;
            color: #7f8c8d;
        }

        /* Card item labels */
        .profile-card b {
            font-weight: bold;
            color: #2c3e50;
        }

        /* Mobile responsiveness */
        @media (max-width: 768px) {
            .sidebar {
                width: 200px;
                padding: 20px;
            }

            .profile-container {
                margin-left: 220px;
                width: 80%; /* Increase width on mobile */
            }

            .profile-card {
                padding: 20px;
                width: 90%; /* Make card take more width on mobile */
            }

            .sidebar a {
                font-size: 14px;
                padding: 10px 15px;
            }

            .profile-card b {
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>

    <!-- Sidebar Section -->
    <div class="sidebar">
        <h2>Mentor Dashboard</h2>
        <a href="/mentorhome" class="active">Home</a>
        <a href="mentorprofile">My Profile</a>
        <a href="/updatementor">update profile</a>
        <a href="adminviewprojects">Student Projects</a>
        <a href="viewmystudents">View All Students</a> 
        <a href="/mentorlogout">Logout</a>
    </div>

    <!-- Profile Section -->
    <div class="profile-container">
        <h3>My Profile</h3>

        <!-- Profile Card -->
        <div class="profile-card">
            <h4>Personal Information</h4>
            <p><b>ID:</b> <%= mentor.getId() %></p>
            <p><b>Name:</b> <%= mentor.getName() %></p>
            <p><b>Gender:</b> <%= mentor.getGender() %></p>
            <p><b>Date of Birth:</b> <%= mentor.getDateofbirth() %></p>
            <p><b>Department:</b> <%= mentor.getDepartment() %></p>
            <p><b>Desgination:</b> <%= mentor.getDesignation() %></p>
            <p><b>Qualification:</b> <%= mentor.getQualification() %></p>
            <p><b>Email:</b> <%= mentor.getEmail() %></p>
            <p><b>Contact:</b> <%= mentor.getContact() %></p>
        </div>
    </div>

</body>
</html>
