<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mentor Nav Bar</title>
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
            margin: 0;
        }

        /* Navbar Styling */
        .navbar {
            display: flex;
            justify-content: center;
            background-color: #2c3e50;
            padding: 15px;
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .navbar a {
            color: white;
            padding: 12px 20px;
            text-decoration: none;
            font-size: 18px;
            margin: 0 10px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .navbar a:hover {
            background-color: #34495e;
        }

        .navbar a.active {
            background-color: #1abc9c;
            font-weight: bold;
        }

        /* Body Content Styling */
        body {
            padding-top: 60px; /* To prevent content from being hidden under the sticky navbar */
        }
    </style>
</head>
<body>

    <div class="navbar">
        <a href="/mentorhome" class="active">Home</a>
        <a href="mentorprofile">My Profile</a>
        <a href="/updatementor">update profile</a>
        <a href="adminviewprojects">Student Projects</a>
        <a href="viewmystudents">View All Students</a> 
        <a href="/mentorlogout">Logout</a>
    </div>

</body>
</html>
