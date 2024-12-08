<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Mentors</title>
    <style>
        /* Reset and base styling */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            color: #34495e;
            display: flex;
            height: 100vh;
            overflow-x: hidden;
        }

        /* Sidebar Styling */
        .sidebar {
            width: 250px;
            background-color: #2c3e50;
            color: white;
            padding: 20px 10px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            box-shadow: 2px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .sidebar h2 {
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
            color: #ecf0f1;
        }

        .sidebar a {
            display: block;
            color: #ecf0f1;
            text-decoration: none;
            font-size: 16px;
            padding: 12px 15px;
            margin: 8px 0;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .sidebar a:hover {
            background-color: #34495e;
            transform: translateX(5px);
        }

        .sidebar a.active {
            background-color: #1abc9c;
            font-weight: bold;
        }

        /* Main Content Styling */
        .content {
            margin-left: 270px;
            padding: 20px;
            width: calc(100% - 270px);
            transition: margin-left 0.3s ease;
        }

        .content h2 {
            font-size: 2rem;
            color: #2c3e50;
            text-align: center;
            margin-bottom: 20px;
        }

        .content p {
            text-align: center;
            font-size: 16px;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        /* Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
            margin: 0 auto 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #3498db;
            color: white;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #ecf0f1;
        }

        td {
            font-size: 14px;
        }

        /* Button for Registering New Mentors */
        .register-mentor {
            text-align: center;
        }

        .register-mentor a {
            padding: 12px 20px;
            background-color: #27ae60;
            color: white;
            font-weight: bold;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            display: inline-block;
        }

        .register-mentor a:hover {
            background-color: #2ecc71;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .sidebar {
                width: 200px;
            }

            .content {
                margin-left: 220px;
                width: calc(100% - 220px);
            }

            table {
                font-size: 14px;
            }

            .register-mentor a {
                font-size: 14px;
                padding: 8px 15px;
            }
        }

        @media (max-width: 480px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }

            .content {
                margin-left: 0;
                width: 100%;
            }

            table {
                font-size: 12px;
            }

            .register-mentor a {
                font-size: 12px;
            }

            th, td {
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <!-- Sidebar Section -->
    <div class="sidebar">
        <h2>Admin Dashboard</h2>
         <a href="adminhome" class="active"><i class="bx bx-home"></i> Home</a>
         <a href="addstudent">Add Student</a>
        <a href="viewallstudents">View Students</a>
        <a href="deletestudent">Delete Student</a>
        <a href="mentorreg">Mentor Registration</a>
        <a href="viewallmentors">View All Mentors</a>
        <a href="deletementor">Delete Mentor</a>
        <a href="adminlogout">Logout</a>
    </div>

    <!-- Main Content Section -->
    <div class="content">
        <h2>Mentor List</h2>

        <!-- Display mentor count -->
        <p>Total Mentors: ${count}</p>

        <!-- Table to display mentor details -->
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Department</th>
                    <th>Designation</th>
                    <th>Email</th>
                    <th>Contact</th>
                </tr>
            </thead>
            <tbody>
                <!-- Iterate over the mentor list -->
                <c:forEach var="mentor" items="${mentorlist}">
                    <tr>
                        <td>${mentor.id}</td>
                        <td>${mentor.name}</td>
                        <td>${mentor.department}</td>
                        <td>${mentor.designation}</td>
                        <td>${mentor.email}</td>
                        <td>${mentor.contact}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Register New Mentor Button -->
        <div class="register-mentor">
            <a href="mentorreg">Register New Mentor</a>
        </div>
    </div>
</body>
</html>
