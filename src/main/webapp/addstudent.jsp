<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
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

        h3 {
            text-align: center;
            color: #2c3e50;
            margin-top: 20px;
            font-size: 30px;
            text-decoration: underline;
        }

        .form-container {
            width: 60%;
            margin: 30px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 12px 15px;
            text-align: left;
        }

        label {
            font-size: 18px;
            color: #2c3e50;
        }

        input[type="text"], input[type="date"], input[type="email"], input[type="password"], input[type="number"], select {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            border: 2px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus, input[type="date"]:focus, input[type="email"]:focus, input[type="password"]:focus, input[type="number"]:focus, select:focus {
            border-color: #1abc9c;
            outline: none;
        }

        input[type="radio"] {
            margin-right: 5px;
        }

        .button-container {
            text-align: center;
            margin-top: 20px;
        }

        input[type="submit"], input[type="reset"] {
            background-color: #1abc9c;
            color: white;
            font-size: 18px;
            padding: 12px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover, input[type="reset"]:hover {
            background-color: #16a085;
        }

        .radio-label {
            font-size: 16px;
            margin-right: 15px;
            color: #2c3e50;
        }

        /* Media Query for smaller screens */
        @media (max-width: 768px) {
            .form-container {
                width: 90%;
            }

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

    <!-- Main Content -->
    <div class="main-content">
        <h3><u>Add Student</u></h3>
        <div class="form-container">
            <form method="post" action="insertstudent">
                <table>
                    <tr>
                        <td><label for="sname">Enter Name</label></td>
                        <td><input type="text" id="sname" name="sname" required/></td>
                    </tr>
                    <tr>
                        <td><label>Select Gender</label></td>
                        <td>
                            <input type="radio" id="male" name="sgender" value="MALE" required/>
                            <label class="radio-label" for="male">Male</label>
                            <input type="radio" id="female" name="sgender" value="FEMALE" required/>
                            <label class="radio-label" for="female">Female</label>
                            <input type="radio" id="others" name="sgender" value="OTHERS" required/>
                            <label class="radio-label" for="others">Others</label>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="sdob">Enter Date of Birth</label></td>
                        <td><input type="date" id="sdob" name="sdob" required/></td>
                    </tr>
                    <tr>
                        <td><label for="sprogram">Select Program</label></td>
                        <td>
                            <select id="sprogram" name="sprogram" required>
                                <option value="">---Select---</option>
                                <option value="BTECH">B-Tech</option>
                                <option value="MTECH">M-Tech</option>
                                <option value="BBA">BBA</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="sdept">Select Department</label></td>
                        <td>
                            <select id="sdept" name="sdept" required>
                                <option value="">---Select---</option>
                                <option value="CSE">CSE</option>
                                <option value="CS&IT">CSIT</option>
                                <option value="MECH">Mechanics</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="slocation">Enter Location</label></td>
                        <td><input type="text" id="slocation" name="slocation" required/></td>
                    </tr>
                    <tr>
                        <td><label for="semail">Enter Email ID</label></td>
                        <td><input type="email" id="semail" name="semail" required/></td>
                    </tr>
                    <tr>
                        <td><label for="spwd">Enter Password</label></td>
                        <td><input type="password" id="spwd" name="spwd" required/></td>
                    </tr>
                    <tr>
                        <td><label for="scontact">Enter Contact</label></td>
                        <td><input type="number" id="scontact" name="scontact" required/></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="button-container">
                            <input type="submit" value="Add"/>
                            <input type="reset" value="Clear"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

</body>
</html>
