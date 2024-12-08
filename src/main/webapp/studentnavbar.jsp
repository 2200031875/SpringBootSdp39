<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Nav Bar</title>
    <style>
        /* General body styling */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #34495e;
            display: flex;
            height: 100vh;
        }

        /* Sidebar Styling */
        div {
            background-color: #2c3e50;
            color: white;
            width: 250px;
            height: 100%;
            position: fixed;
            top: 0;
            left: 0;
            padding-top: 30px;
            box-shadow: 2px 0px 10px rgba(0, 0, 0, 0.1);
        }

        div div {
            text-align: center;
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 30px;
        }

        div a {
            display: block;
            color: #ecf0f1;
            padding: 15px;
            font-size: 18px;
            text-decoration: none;
            border-radius: 5px;
            margin: 10px 0;
            transition: background-color 0.3s, transform 0.3s;
        }

        div a:hover {
            background-color: #34495e;
            transform: translateX(5px);
        }

        div a.active {
            background-color: #1abc9c;
            font-weight: bold;
        }

        /* Main content area */
        #content {
            margin-left: 250px;
            padding: 20px;
            width: calc(100% - 250px);
            transition: margin-left 0.3s ease;
        }

        /* Responsive Design for smaller screens */
        @media (max-width: 768px) {
            div {
                width: 200px;
            }

            #content {
                margin-left: 210px;
                width: calc(100% - 200px);
            }

            div a {
                font-size: 16px;
                padding: 12px 20px;
            }
        }
    </style>
</head>
<body>

    <!-- Sidebar Section -->
    <div>
        <div>Student Dashboard</div>
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

    <!-- Main Content Section -->
    <div id="content">
        <!-- Your content goes here -->
    </div>

</body>
</html>
