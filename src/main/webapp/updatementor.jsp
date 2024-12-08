<%@page import="com.klef.jfsd.springboot.model.Mentor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
Mentor mentor = (Mentor) session.getAttribute("mentor");
if(mentor == null) {
    response.sendRedirect("mentorsessionexpiry.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Mentor</title>
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
        #content {
            margin-left: 250px;
            padding: 20px;
            width: calc(100% - 250px);
        }

        .form-container {
            background: #ffffff;
            padding: 20px 30px;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: auto;
        }

        .form-container h3 {
            margin-bottom: 20px;
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        table td {
            padding: 10px;
            text-align: left;
        }

        label {
            font-weight: bold;
            color: #333;
        }

        input[type="text"], input[type="email"], input[type="number"], input[type="password"], select {
            width: 100%;
            padding: 8px 10px;
            margin: 5px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        input[type="submit"], input[type="reset"] {
            padding: 10px 15px;
            margin: 10px 5px 0 0;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"] {
            background-color: #1abc9c;
        }

        input[type="submit"]:hover {
            background-color: #16a085;
        }

        input[type="reset"] {
            background-color: #e74c3c;
        }

        input[type="reset"]:hover {
            background-color: #c0392b;
        }

        .button-container {
            text-align: right;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .sidebar {
                width: 200px;
            }

            #content {
                margin-left: 200px;
                width: calc(100% - 200px);
            }

            .form-container {
                width: 90%;
                padding: 15px;
            }
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Mentor Dashboard</h2>
         <a href="/mentorhome" class="active">Home</a>
        <a href="mentorprofile">My Profile</a>
        <a href="/updatementor">update profile</a>
        <a href="adminviewprojects">Student Projects</a>
        <a href="viewmystudents">View All Students</a> 
        <a href="/mentorlogout">Logout</a>
    </div>

    <!-- Main Content -->
    <div id="content">
        <div class="form-container">
            <h3>Update Mentor Profile</h3>
            <form method="post" action="updatementorprofile">
                <table>
                    <tr>
                        <td><label for="mid">Mentor ID</label></td>
                        <td><input type="number" id="mid" name="mid" readonly value="<%= mentor.getId() %>" required/></td>  
                    </tr>
                    <tr>
                        <td><label for="mname">Enter Name</label></td>
                        <td><input type="text" id="mname" name="mname" value="<%= mentor.getName() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="mdepartment">Select Department</label></td>
                        <td>
                            <select id="mdepartment" name="mdepartment" required>
                                <option value="">---Select---</option>
                                <option value="CSE" <%= mentor.getDepartment().equals("CSE") ? "selected" : "" %>>CSE</option>
                                <option value="CS&IT" <%= mentor.getDepartment().equals("CS&IT") ? "selected" : "" %>>CS&IT</option>
                                <option value="AIDS" <%= mentor.getDepartment().equals("AIDS") ? "selected" : "" %>>AIDS</option>
                                <option value="EEE" <%= mentor.getDepartment().equals("EEE") ? "selected" : "" %>>EEE</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="mdesignation">Enter Designation</label></td>
                        <td><input type="text" id="mdesignation" name="mdesignation" value="<%= mentor.getDesignation() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="memail">Enter Email ID</label></td>
                        <td><input type="email" id="memail" name="memail" readonly value="<%= mentor.getEmail() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="mpwd">Enter Password</label></td>
                        <td><input type="password" id="mpwd" name="mpwd" value="<%= mentor.getPassword() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="mcontact">Enter Contact</label></td>
                        <td><input type="number" id="mcontact" name="mcontact" value="<%= mentor.getContact() %>" required/></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="button-container">
                            <input type="submit" value="Update"/>
                            <input type="reset" value="Clear"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</body>
</html>
