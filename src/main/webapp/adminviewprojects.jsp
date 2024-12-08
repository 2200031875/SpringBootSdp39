<%@ page import="com.klef.jfsd.springboot.model.Project"%>
<%@ page import="com.klef.jfsd.springboot.model.Admin"%>
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
    <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
    <title>Admin - All Projects</title>
    <style>
        /* Basic Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
            display: flex;
            min-height: 100vh;
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
        .main-content {
            margin-left: 250px;
            padding: 20px;
            width: calc(100% - 250px); /* Take the rest of the screen width */
        }

        .content {
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            font-size: 30px;
            margin-top: 20px;
            text-decoration: underline;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #1abc9c;
            color: white;
        }

        tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        /* Media Query for smaller screens */
        @media (max-width: 768px) {
            .sidebar {
                width: 200px;
            }

            .main-content {
                margin-left: 200px;
                width: calc(100% - 200px);
            }

            td {
                font-size: 16px;
                padding: 8px 12px;
            }
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
    <div class="main-content">
        <div class="content">
            <h2>All Student Projects</h2>
            <div class="view_main">
                <table>
                    <thead>
                        <tr>
                            <th>Project ID</th>
                            <th>Project Title</th>
                            <th>Description</th>
                            <th>Student Name</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="project" items="${projectslist}">
                            <tr>
                                <td><c:out value="${project.id}"/></td>
                                <td><c:out value="${project.title}"/></td>
                                 <td><c:out value="${project.description}"/></td>
                                <td><c:out value="${project.student.name}" /></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</body>
</html>
