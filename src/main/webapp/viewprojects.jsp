<%@ page import="com.klef.jfsd.springboot.model.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    Student student = (Student) session.getAttribute("student");
    if (student == null) {
%>
<script type="text/javascript">
    alert("Session Expired. Please Login Again");
    setTimeout(function() {
        window.location.href = "studentlogin"; // Redirect after 3 seconds
    }, 3000);
</script>
<%
    } else {
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
    <title>Submitted Projects</title>

    <style>
        /* Basic Page Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7f6;
        }

        /* Navbar Styles */
        .navbar {
            background-color: #1abc9c;
            padding: 10px 20px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            width: 100%;
            top: 0;
            left: 0;
            z-index: 100;
        }

        .navbar .logo {
            font-size: 24px;
            font-weight: bold;
        }

        .navbar .nav-links a {
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            font-size: 18px;
            margin: 0 5px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .navbar .nav-links a:hover {
            background-color: #34495e;
        }

        .navbar .nav-links a.active {
            background-color: #16a085;
        }

        /* Sidebar Styles */
        .sidebar {
            position: fixed;
            top: 60px;
            left: 0;
            width: 250px;
            height: 100%;
            background-color: #2c3e50;
            padding: 20px;
            color: white;
            font-size: 18px;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .sidebar a {
            display: block;
            color: #ecf0f1;
            padding: 12px 20px;
            margin: 8px 0;
            text-decoration: none;
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

        /* Main Content Area */
        .wrapper {
            margin-left: 270px; /* To create space for the sidebar */
            padding: 80px 20px 20px 20px; /* Adjusted for navbar and sidebar */
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h2 {
            font-size: 28px;
            font-weight: bold;
            color: #34495e;
            margin-bottom: 20px;
            text-align: center;
        }

        .view_main {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            width: 100%;
        }

        .view_wrap {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            width: 100%;
            justify-content: center;
        }

        .view_item {
            width: 300px;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 20px;
        }

        .vi_left {
            flex: 1;
        }

        .vi_right {
            text-align: right;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: flex-end;
        }

        .vi_right .status {
            padding: 5px 10px;
            border-radius: 5px;
            font-weight: bold;
        }

        .complete {
            background-color: #27ae60;
            color: white;
        }

        .incomplete {
            background-color: #e74c3c;
            color: white;
        }

        .btn {
            display: inline-block;
            padding: 8px 16px;
            margin-top: 10px;
            color: white;
            background-color: #1abc9c;
            text-decoration: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #16a085;
        }

        .delete-btn {
            background-color: #e74c3c;
        }

        .delete-btn:hover {
            background-color: #c0392b;
        }

        .update-btn {
            background-color: #f39c12;
        }

        .update-btn:hover {
            background-color: #e67e22;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .view_item {
                width: 100%;
            }
        }
    </style>
</head>
<body>



    <!-- Sidebar -->
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

    <!-- Main Content Area -->
    <div class="wrapper">
        <h2>Submitted Projects</h2>
        <div class="view_main">
            <div class="view_wrap">
                <c:forEach var="project" items="${projectslist}">
                    <div class="view_item">
                        <div class="vi_left">
                            <p class="title"><b>Title: </b><c:out value="${project.title}"/></p>
                            <p class="description"><b>Description: </b><c:out value="${project.description}"/></p>
                            <%-- <p class="content"><b>Date Created: </b><c:out value="${project.datecreated}"/></p> --%>
                            <%-- <p class="content"><b>Mentor Name: </b><c:out value="${mentor.id}"/></p> --%>
                        </div>
                        <div class="vi_right">
                            <%-- <span class="status ${project.status == 'Completed' ? 'complete' : 'incomplete'}">
                                <c:out value="${project.status}"/>
                            </span> --%>
                            <div class="actions">
                                <a class="btn update-btn" href='<c:url value="updateproject?id=${project.id}"></c:url>'>Update</a>
                                <a href="<c:url value='deleteproject?id=${project.id}' />" 
                                   class="btn delete-btn" 
                                   onclick="return confirmDelete()">Delete</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to delete this project?");
        }
    </script>
</body>
</html>
<%
    }
%>
