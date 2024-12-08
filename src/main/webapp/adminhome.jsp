<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Home</title>
    <style>
        /* General body styling */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            display: flex;
            height: 100vh;
        }

        /* Sidebar Styling */
        div.sidebar {
            background-color: #2c3e50;
            color: white;
            width: 250px;
            height: 100%;
            padding-top: 20px;
            position: fixed;
            left: 0;
            top: 0;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }

        div.sidebar > div {
            text-align: center;
            font-size: 1.8rem;
            color: white;
            font-weight: bold;
            margin-bottom: 30px;
        }

        div.sidebar a {
            display: block;
            color: #ecf0f1;
            padding: 15px 25px;
            font-size: 18px;
            text-decoration: none;
            transition: background-color 0.3s ease, transform 0.3s ease;
            border-radius: 5px;
            margin: 10px 0;
        }

        div.sidebar a:hover {
            background-color: #34495e;
            transform: translateX(5px);
        }

        div.sidebar a.active {
            background-color: #1abc9c;
            font-weight: bold;
        }

        /* Main content area */
        #content {
            margin-left: 260px;
            padding: 20px;
            width: calc(100% - 250px);
            transition: margin-left 0.3s ease;
        }

        /* Student Info Section */
        .student-info {
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        .student-info h2 {
            font-size: 2rem;
            color: #2ecc71;
        }

        .student-info h3 {
            font-size: 1.5rem;
            color: #34495e;
        }

        .count {
            font-size: 2rem;
            color: #2ecc71;
            margin-top: 15px;
            padding: 15px;
            background-color: #ecf8f2;
            border-radius: 5px;
            text-align: center;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            div.sidebar {
                width: 200px;
            }

            #content {
                margin-left: 210px;
                width: calc(100% - 200px);
            }

            div.sidebar a {
                font-size: 16px;
                padding: 12px 18px;
            }

            .student-info {
                padding: 15px;
            }
        }
    </style>
</head>
<body>

    <!-- Sidebar Section -->
    <div class="sidebar">
        <div>Admin Dashboard</div>
        <a href="adminhome" class="active"><i class="bx bx-home"></i> Home</a>
        <a href="addstudent">Add Student</a>
        <a href="viewallstudents">View Students</a>
        <a href="deletestudent">Delete Student</a>
        <a href="mentorreg">Mentor Registration</a>
        <a href="viewallmentors">View All Mentors</a>
        <a href="deletementor">Delete Mentor</a>
        <!-- <a href="mentorstudentmapping">Mentor Student Mapping</a> -->
        <a href="adminlogout">Logout</a>
    </div>

    <!-- Main Content Section -->
    <div id="content">
        <div class="student-info">
            <h2>Welcome to Admin Home</h2>
            <h3>Total Mentors</h3>
            <div class="count">
                <c:out value="${count}" />
            </div>
            
        </div>
    </div>

</body>
</html>
