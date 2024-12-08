<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About</title>
    <style>
        /* General Body Styling */
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            color: #333;
        }

        /* Sidebar Styling */
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            width: 250px;
            height: 100%;
            background-color: #2c3e50;
            padding-top: 30px;
            box-shadow: 4px 0 6px rgba(0, 0, 0, 0.1);
            z-index: 1000;
            transition: width 0.3s ease;
        }

        .sidebar a {
            display: block;
            color: white;
            text-decoration: none;
            padding: 15px 20px;
            font-size: 18px;
            margin-bottom: 10px;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s;
        }

        .sidebar a:hover {
            background-color: #34495e;
            transform: translateX(5px);
        }

        .sidebar a.active {
            background-color: #1abc9c;
            font-weight: bold;
        }

        /* Main Content Area */
        #admin {
            margin-left: 270px;
            padding: 30px;
            color: #333;
            transition: margin-left 0.3s ease;
        }

        /* Header Styling */
        h3 {
            font-size: 32px;
            color: #2c3e50;
            border-bottom: 3px solid #1abc9c;
            padding-bottom: 10px;
            margin-bottom: 20px;
            font-weight: bold;
        }

        h3:hover {
            color: #1abc9c;
        }

        /* Paragraph Styling */
        p {
            font-size: 18px;
            line-height: 1.8;
            margin-top: 20px;
            color: #555;
            transition: color 0.3s ease;
        }

        p:hover {
            color: #2c3e50;
        }

        /* About Section Styling */
        #about-section {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        /* Unordered List Styling */
        ul {
            list-style-type: none;
            padding-left: 0;
            margin-top: 20px;
        }

        li {
            margin: 15px 0;
            font-size: 18px;
            color: #555;
            transition: color 0.3s ease, transform 0.3s;
        }

        li:hover {
            color: #1abc9c;
            transform: translateX(10px);
        }

        /* Fade-In Animation */
        #admin, h3, ul, li, p {
            opacity: 0;
            animation: fadeIn 1s forwards;
        }

        #admin {
            animation-delay: 0.5s;
        }

        h3 {
            animation-delay: 0.7s;
        }

        ul {
            animation-delay: 0.9s;
        }

        li {
            animation-delay: 1s;
        }

        p {
            animation-delay: 1.2s;
        }

        @keyframes fadeIn {
            to {
                opacity: 1;
            }
        }

        /* Media Queries for Responsiveness */
        @media (max-width: 768px) {
            .sidebar {
                width: 200px;
            }

            #admin {
                margin-left: 220px;
                padding: 20px;
            }

            h3 {
                font-size: 24px;
            }

            li {
                font-size: 16px;
            }

            p {
                font-size: 16px;
            }
        }

        @media (max-width: 480px) {
            .sidebar {
                width: 100%;
                position: relative;
            }

            #admin {
                margin-left: 0;
            }

            .sidebar a {
                font-size: 16px;
            }

            h3 {
                font-size: 22px;
            }

            li {
                font-size: 14px;
            }

            p {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>

    <!-- Sidebar Section -->
    <div class="sidebar">
        <a href="/" class="active">Home</a>
        <a href="/about.jsp">About</a>
        <a href="/contactus.jsp">Contact Us</a>
        
        <a href="adminlogin">Admin Login</a>
        <a href="studentlogin">Student Login</a>
        <a href="mentorlogin">Mentor Login</a>
    </div>

    <!-- Main Content Area -->
    <div id="admin">
        <div id="about-section">
            <h3>About</h3>
            <p>The Student Projects and Portfolio Management System is designed to help students showcase their projects and manage their portfolios efficiently. This system provides a platform for students to upload, organize, and present their work in a user-friendly manner.</p>

            <ul>
                <li>User-friendly interface for project submissions.</li>
                <li>Portfolio management tools to organize projects.</li>
                <li>Feedback and rating system from peers and instructors.</li>
                <li>Secure login for students and administrators.</li>
            </ul>

            <h3>Purpose</h3>
            <p>This system aims to enhance the visibility of student work and provide a centralized platform for managing academic projects. By facilitating easier access to portfolios, we hope to encourage collaboration and feedback among students.</p>
        </div>
    </div>

</body>
</html>
