<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SDP Project</title>
    <style>
        /* General body styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7fc;
            display: flex;
            height: 100vh;
        }

        /* Sidebar Navigation */
        .sidebar {
            background-color: #2c3e50;
            width: 250px;
            height: 100%;
            position: fixed;
            top: 0;
            left: 0;
            padding: 20px;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
        }

        /* Sidebar links */
        .sidebar a {
            color: white;
            text-decoration: none;
            padding: 15px;
            font-size: 1.1rem;
            margin-bottom: 12px;
            border-radius: 5px;
            transition: all 0.3s ease;
            display: block;
        }

        /* Hover effect */
        .sidebar a:hover {
            background-color: #2980b9;
            padding-left: 30px;
            transition: all 0.3s ease;
        }

        /* Active link */
        .sidebar a.active {
            background-color: #16a085;
            color: white;
            font-weight: bold;
        }

        /* Main Content Area */
        #content {
            margin-left: 270px; /* Sidebar width */
            padding: 20px;
            background-color: #ecf0f1;
            height: 100%;
            flex-grow: 1;
            box-sizing: border-box;
        }

        /* Responsive Design for smaller screens */
        @media (max-width: 768px) {
            .sidebar {
                width: 200px;
            }

            #content {
                margin-left: 220px;
            }
        }

        @media (max-width: 480px) {
            .sidebar {
                width: 100%;
                position: relative;
                height: auto;
                padding: 10px;
            }

            #content {
                margin-left: 0;
            }

            .sidebar a {
                padding: 12px;
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
    <div id="content">
        <h1>Welcome</h1>
        <p>Student Project & Portfolio Management System</p>
    </div>

</body>
</html>
