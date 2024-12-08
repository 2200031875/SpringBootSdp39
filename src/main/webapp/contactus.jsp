<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
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
        #main-content {
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

        /* Content Box Styling */
        .content-box {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        /* Paragraph Styling */
        p {
            font-size: 18px;
            line-height: 1.8;
            margin-top: 20px;
            color: #555;
            transition: color 0.3s ease;
        }

        p strong {
            color: #2c3e50;
            font-weight: bold;
        }

        p:hover {
            color: #2c3e50;
        }

        /* Media Queries for Responsiveness */
        @media (max-width: 768px) {
            .sidebar {
                width: 200px;
            }

            #main-content {
                margin-left: 220px;
                padding: 20px;
            }

            h3 {
                font-size: 24px;
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

            #main-content {
                margin-left: 0;
            }

            .sidebar a {
                font-size: 16px;
            }

            h3 {
                font-size: 22px;
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

    <!-- Main Content Section -->
    <div id="main-content">
        <h3>Contact Us</h3>
        <div class="content-box">
            <p>If you need assistance or have any questions about our platform, we're here to help. Please feel free to reach out to us using the contact information below:</p>
            <p><strong>Email:</strong> *****@gmail.com</p>
            <p><strong>Phone:</strong> 9*5*6*9*5*</p>
            <p>Our support team is available during regular business hours to assist you. Thank you for choosing our platform. We look forward to helping you succeed in your academic journey.</p>
        </div>
    </div>

</body>
</html>
