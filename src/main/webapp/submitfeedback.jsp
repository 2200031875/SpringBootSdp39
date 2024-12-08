<%@ page import="com.klef.jfsd.springboot.model.Mentor, com.klef.jfsd.springboot.model.Project" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
    Mentor mentor = (Mentor) session.getAttribute("mentor");
    if (mentor == null) {
%>
    <script type="text/javascript">
        alert("Session Expired. Please Login Again");
        window.location.href = "mentorlogin"; // Redirect to mentor login page
    </script>
<%
    } else {
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit Feedback</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        
        h2 {
            text-align: center;
            margin-top: 30px;
            color: #333;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-size: 16px;
            color: #333;
            margin-bottom: 5px;
            display: block;
        }

        .form-group textarea {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 2px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
            resize: vertical;
            transition: border-color 0.3s ease;
        }

        .form-group textarea:focus {
            border-color: #16a085;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #16a085;
            color: white;
            font-size: 18px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #1abc9c;
        }

        .response-message {
            text-align: center;
            font-size: 18px;
            color: green;
            margin-top: 20px;
        }

        .error-message {
            text-align: center;
            font-size: 18px;
            color: red;
            margin-top: 20px;
        }

    </style>
</head>
<body>

 <div class="sidebar">
       <h2>Mentor Dashboard</h2>
        <a href="/mentorhome" class="active">Home</a>
        <a href="mentorprofile">My Profile</a>
        <a href="/updatementor">update profile</a>
        <a href="adminviewprojects">Student Projects</a>
        <a href="viewmystudents">View All Students</a> 
        <a href="/mentorlogout">Logout</a>
    </div>

    <div class="container">
        <h2>Submit Feedback for Project</h2>
        <form action="submitFeedback" method="post">
            <input type="hidden" name="projectId" value="${project.id}" />
            
            <div class="form-group">
                <label for="feedback">Feedback:</label>
                <textarea id="feedback" name="feedback" rows="5" placeholder="Enter feedback for the project" required></textarea>
            </div>

            <button type="submit" method="post">Submit Feedback</button>
        </form>

        <!-- Displaying messages -->
        <c:if test="${not empty message}">
            <div class="response-message">
                <h3>${message}</h3>
            </div>
        </c:if>

        <c:if test="${not empty errorMessage}">
            <div class="error-message">
                <h3>${errorMessage}</h3>
            </div>
        </c:if>
    </div>
</body>
</html>
<%
    }
%>
