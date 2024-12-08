<%@page import="com.klef.jfsd.springboot.model.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
Student student = (Student) session.getAttribute("student");
if(student == null) {
    response.sendRedirect("studentsessionexpiry.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Student</title>
    <style>
        /* Body and general page styling */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            display: flex;
            flex-direction: column;
            height: 100vh;
            color: #34495e;
        }

        /* Sidebar styling */
        .sidebar {
            background-color: #2c3e50;
            color: white;
            width: 250px;
            padding: 30px;
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            box-shadow: 2px 0px 5px rgba(0, 0, 0, 0.1);
        }

        .sidebar h2 {
            font-size: 1.5rem;
            text-align: center;
            margin-bottom: 20px;
        }

        .sidebar a {
            display: block;
            color: #ecf0f1;
            padding: 12px 20px;
            font-size: 16px;
            text-decoration: none;
            margin: 8px 0;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .sidebar a:hover {
            background-color: #34495e;
            transform: translateX(5px);
        }

        .sidebar a.active {
            background-color: #1abc9c;
            font-weight: bold;
        }

        /* Content styling */
        #content {
            margin-left: 270px; /* Leave space for the sidebar */
            padding: 20px;
        }

        /* Form container styling */
        .form-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
            max-width: 600px; /* Reduced width of the form */
            margin: 20px auto; /* Center the form */
        }

        h3 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        table td {
            padding: 10px;
            font-size: 14px;
        }

        table td label {
            font-weight: bold;
        }

        table input, table select {
            width: 100%;
            padding: 8px;
            font-size: 14px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        table input[type="radio"] {
            width: auto;
        }

        /* Button container - side by side */
        .button-container {
            display: flex;
            justify-content: space-between;
            gap: 10px;
        }

        .button-container input[type="submit"], 
        .button-container input[type="reset"] {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #1abc9c;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 48%; /* Make buttons equal size */
        }

        .button-container input[type="submit"]:hover,
        .button-container input[type="reset"]:hover {
            background-color: #16a085;
        }

        /* Responsive Design for Mobile */
        @media (max-width: 768px) {
            .sidebar {
                width: 200px;
                padding: 20px;
            }

            .form-container {
                width: 90%;
                padding: 20px;
            }

            table td {
                font-size: 12px;
            }

            .button-container input[type="submit"], 
            .button-container input[type="reset"] {
                font-size: 14px;
                padding: 8px 15px;
            }
        }
    </style>
</head>
<body>

     <div class="sidebar">
        <h2>Student Dashboard</h2>
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

    <!-- Content Section -->
    <div id="content">
        <div class="form-container">
            <h3>Update Student Profile</h3>
            <form method="post" action="updatestudentprofile">
                <table>
                    <tr>
                        <td><label for="sid">Student ID</label></td>
                        <td><input type="number" id="sid" name="sid" readonly value="<%= student.getId() %>" required/></td>  
                    </tr>
                    <tr>
                        <td><label for="sname">Enter Name</label></td>
                        <td><input type="text" id="sname" name="sname" value="<%= student.getName() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label>Select Gender</label></td>
                        <td>
                            <input type="radio" id="male" name="sgender" value="MALE" <%= student.getGender().equals("MALE") ? "checked" : "" %> required/>
                            <label for="male">Male</label>
                            <input type="radio" id="female" name="sgender" value="FEMALE" <%= student.getGender().equals("FEMALE") ? "checked" : "" %> required/>
                            <label for="female">Female</label>
                            <input type="radio" id="others" name="sgender" value="OTHERS" <%= student.getGender().equals("OTHERS") ? "checked" : "" %> required/>
                            <label for="others">Others</label>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="sdob">Enter Date of Birth</label></td>
                        <td><input type="date" id="sdob" name="sdob" value="<%= student.getDateofbirth() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="sprogram">Select Program</label></td>
                        <td>
                            <select id="sprogram" name="sprogram" required>
                                <option value="">---Select---</option>
                                <option value="BTECH" <%= student.getProgram().equals("BTECH") ? "selected" : "" %>>B-Tech</option>
                                <option value="MTECH" <%= student.getProgram().equals("MTECH") ? "selected" : "" %>>M-Tech</option>
                                <option value="BBA" <%= student.getProgram().equals("BBA") ? "selected" : "" %>>BBA</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="sdept">Select Department</label></td>
                        <td>
                            <select id="sdept" name="sdept" required>
                                <option value="">---Select---</option>
                                <option value="CSE" <%= student.getDepartment().equals("CSE") ? "selected" : "" %>>CSE</option>
                                <option value="CS&IT" <%= student.getDepartment().equals("CS&IT") ? "selected" : "" %>>CS&IT</option>
                                <option value="MECH" <%= student.getDepartment().equals("MECH") ? "selected" : "" %>>Mechanics</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="slocation">Enter Location</label></td>
                        <td><input type="text" id="slocation" name="slocation" value="<%= student.getLocation() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="semail">Enter Email ID</label></td>
                        <td><input type="email" id="semail" name="semail" readonly value="<%= student.getEmail() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="spwd">Enter Password</label></td>
                        <td><input type="password" id="spwd" name="spwd" value="<%= student.getPassword() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="scontact">Enter Contact</label></td>
                        <td><input type="number" id="scontact" name="scontact" value="<%= student.getContact() %>" required/></td>
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
