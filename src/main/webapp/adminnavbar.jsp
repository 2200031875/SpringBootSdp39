<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
    <style>
        /* General body styling */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f9fc;
        }

        /* Sidebar and dashboard container */
        div {
            width: 250px;
            background-color: #2c3e50;
            color: white;
            padding: 20px;
            height: 100vh;
            position: fixed;
        }

        /* Dashboard title */
        div > div {
            font-size: 1.8rem;
            margin-bottom: 30px;
            color: #ecf0f1;
            font-weight: bold;
            text-align: center;
        }

        /* Sidebar links */
        a {
            display: block;
            color: #ecf0f1;
            padding: 15px 20px;
            text-decoration: none;
            font-size: 1.1rem;
            margin: 10px 0;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        /* Active link */
        a.active {
            background-color: #1abc9c;
            font-weight: bold;
        }

        /* Sidebar link hover effect */
        a:hover {
            background-color: #34495e;
        }

        /* Logout button styling */
        a:last-child {
            background-color: #e74c3c;
            color: white;
            font-weight: bold;
            text-align: center;
        }

        a:last-child:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>

    <div>
        <div>Admin Dashboard</div>
        <a href="adminhome" class="active"><i class="bx bx-home"></i> Home</a>
         <a href="addstudent">Add Student</a>
        <a href="viewallstudents">View Students</a>
        <a href="deletestudent">Delete Student</a>
        <a href="mentorreg">Mentor Registration</a>
        <a href="viewallmentors">View All Mentors</a>
        <a href="deletementor">Delete Mentor</a>
        <a href="adminlogout">Logout</a>
    </div>

</body>
</html>
