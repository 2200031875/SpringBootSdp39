<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mentor Registration</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            display: flex;
            justify-content: flex-start;
            align-items: flex-start;
            min-height: 100vh;
        }

        /* Sidebar Styling */
        .sidebar {
            background-color: #2c3e50;
            width: 250px;
            height: 100vh;
            position: fixed;
            padding: 30px 20px;
            box-shadow: 4px 0 6px rgba(0, 0, 0, 0.1);
        }

        .sidebar h2 {
            color: white;
            margin-bottom: 20px;
            text-align: center;
            font-size: 20px;
        }

        .sidebar a {
            color: white;
            display: block;
            padding: 10px 15px;
            text-decoration: none;
            font-size: 16px;
            margin-bottom: 8px;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }

        .sidebar a:hover {
            background-color: #34495e;
        }

        .sidebar a.active {
            background-color: #1abc9c;
            font-weight: bold;
        }

        /* Main Content Area */
        .main-content {
            margin-left: 270px; /* Sidebar width */
            width: calc(100% - 270px);
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        /* Form Container Styling */
        .form-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }

        form {
            width: 100%;
        }

        table {
            width: 100%;
        }

        td {
            padding: 10px;
            font-size: 14px;
        }

        label {
            font-weight: bold;
            color: #333;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        select {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border-radius: 6px;
            border: 1px solid #ccc;
            margin-top: 6px;
        }

        input[type="submit"] {
            background-color: #1abc9c;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #16a085;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .sidebar {
                width: 200px;
                padding: 20px 10px;
            }

            .main-content {
                margin-left: 220px;
                width: calc(100% - 220px);
            }

            .form-container {
                padding: 20px;
                width: 100%;
                margin-left: 0;
            }

            h2 {
                font-size: 22px;
            }

            td {
                font-size: 14px;
            }
        }

        @media (max-width: 480px) {
            .sidebar {
                width: 150px;
                padding: 10px;
            }

            .main-content {
                margin-left: 170px;
                width: calc(100% - 170px);
            }

            .form-container {
                padding: 15px;
            }

            h2 {
                font-size: 18px;
            }

            td {
                font-size: 12px;
            }

            input[type="submit"] {
                font-size: 14px;
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

<!-- Main Content Area -->
<div class="main-content">
    <!-- Form Container -->
    <div class="form-container">
        <h2>Mentor Registration Form</h2>
        <form action="mentorregistration" method="POST">
            <table>
                <tr>
                    <td><label for="name">Name:</label></td>
                    <td><input type="text" id="name" name="mname" required></td>
                </tr>
                <tr>
                        <td><label for="gender">Select Gender</label></td>
                        <td>
                            <input type="radio" id="male" name="mgender" value="MALE" required/>
                            <label class="radio-label" for="male">Male</label>
                            <input type="radio" id="female" name="mgender" value="FEMALE" required/>
                            <label class="radio-label" for="female">Female</label>
                            <input type="radio" id="others" name="mgender" value="OTHERS" required/>
                            <label class="radio-label" for="others">Others</label>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="dob">Enter Date of Birth</label></td>
                        <td><input type="date" id="dob" name="mdob" required/></td>
                    </tr>
                <tr>
                    <td><label for="department">Department:</label></td>
                    <td>
                        <select id="department" name="mdept" required>
                            <option value="">---Select Department---</option>
                            <option value="CSE">CSE</option>
                            <option value="CS&IT">CS&IT</option>
                            <option value="AIDS">AIDS</option>
                            <option value="EEE">EEE</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="designation">Designation:</label></td>
                    <td>
                        <select  id="designation" name="mdesignation" required>
                            <option value="">---Select Designation---</option>
                            <option value="PROFESSOR">PROFESSOR</option>
                            <option value="ASST. PROFESSOR">ASST. PROFESSOR</option>
                            <option value="ASSOC. PROFESSOR">ASSOC. PROFESSOR</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="qualification">Qualification:</label></td>
                    <td>
                        <select  id="qualification" name="mqualification" required>
                            <option value="">---Select Qualification---</option>
                            <option value="M.TECH">M.TECH</option>
                            <option value="PHD">PHD</option>
                            <option value="BCOM">BCOM</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="memail">Email ID:</label></td>
                    <td><input type="email" id="memail" name="memail" required></td>
                </tr>
                <tr>
                    <td><label for="mpwd">Password:</label></td>
                    <td><input type="password" id="mpwd" name="mpwd" required></td>
                </tr>
                <tr>
                    <td><label for="contact">Contact:</label></td>
                    <td><input type="text" id="contact" name="mcontact" required></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Register Mentor">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>

</body>
</html>
