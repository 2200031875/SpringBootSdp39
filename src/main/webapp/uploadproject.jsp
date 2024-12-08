<%@ page import="com.klef.jfsd.springboot.model.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
    Student s = (Student) session.getAttribute("student");
    if (s == null) {
%>
    <script type="text/javascript">
        alert("Session Expired. Please Login Again");
        window.location.href = "studentlogin"; // Adjust this path to your login page
    </script>
<%
    } else {
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Project</title>
    <style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f9;
    }

    /* Sidebar Styling */
    .sidebar {
        width: 250px;
        height: 100vh;
        background-color: #2c3e50;
        color: white;
        position: fixed;
        top: 0;
        left: 0;
        padding-top: 20px;
    }

    .sidebar h2 {
        text-align: center;
        margin-bottom: 20px;
        font-size: 22px;
    }

    .sidebar a {
        display: block;
        padding: 15px;
        text-decoration: none;
        color: white;
        font-size: 18px;
        margin-bottom: 10px;
        border-radius: 4px;
        transition: background-color 0.3s ease;
    }

    .sidebar a:hover, .sidebar a.active {
        background-color: #16a085;
    }

    /* Main Content Section */
    .container {
        margin-left: 260px;
        padding: 20px;
        background-color: #fff;
        min-height: 100vh;
    }

    .container header {
        font-size: 28px;
        font-weight: bold;
        margin-bottom: 20px;
        color: #2c3e50;
    }

    .form {
        width: 60%;
        margin: 0 auto;
        background-color: #fff;
        padding: 20px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
    }

    .input-box {
        margin-bottom: 20px;
    }

    .input-box label {
        display: block;
        font-size: 18px;
        color: #333;
        margin-bottom: 5px;
    }

    .input-box input,
    .input-box select,
    .input-box textarea {
        width: 100%;
        padding: 10px;
        font-size: 16px;
        border: 2px solid #ddd;
        border-radius: 5px;
        box-sizing: border-box;
        margin-top: 5px;
        transition: border-color 0.3s ease;
    }

    .input-box input:focus,
    .input-box select:focus,
    .input-box textarea:focus {
        border-color: #1abc9c;
        outline: none;
    }

    button {
        width: 100%;
        padding: 12px;
        background-color: #1abc9c;
        color: white;
        font-size: 18px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    button:hover {
        background-color: #16a085;
    }

    h4 {
        text-align: center;
        color: green;
        font-size: 20px;
        margin-bottom: 15px;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        .sidebar {
            width: 200px;
        }

        .container {
            margin-left: 220px;
        }

        .form {
            width: 90%;
        }
    }

</style>

</head>
<body>
    <!-- Sidebar Section -->
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
    <!-- Main Content Section -->
    <section class="container">
        <header>Upload Project</header>
        <form action="addproject" method="post" class="form">
            <h4>
                <c:out value="${message}"></c:out>
            </h4>
            <!-- Project Title -->
            <div class="input-box">
                <label for="pname">Project Title</label>
                <input type="text" id="pname" name="pname" placeholder="Enter project title" required />
            </div>
            <!-- Project Description -->
            <div class="input-box">
                <label for="pdescription">Project Description</label>
                <textarea id="pdescription" name="pdescription" rows="4" placeholder="Enter project description" required></textarea>
            </div>
            <!-- Project Status -->
          <!--   <div class="input-box">
                <label for="pstatus">Project Status</label>
                <select id="pstatus" name="pstatus" required>
                 <option value="">--Select--</option>
                    <option value="Pending">Pending</option>
                    <option value="Completed">Completed</option>
                    <option value="In Progress">In Progress</option>
                </select>
            </div>  -->
            <!-- Project Link -->
            
            <!-- Start Date -->
      <!-- Start Date -->
      <div class="input-box">
      <label for="startDate">Start Date</label>
      <input type="date" id="startDate" name="startDate" required />
      </div>

        <!-- End Date -->
      <div class="input-box">
        <label for="endDate">End Date</label>
        <input type="date" id="endDate" name="endDate" required />
      </div>
            
            <div class="input-box">
                <label for="projectLink">Project Link</label>
                <input type="text" id="projectLink" name="plink" placeholder="Enter project link" />
            </div>
            
            <div class="input-box">
        <label for="mentor">Select Mentor</label>
        <select id="mentor" name="mentorId" required>
        <option>--Select--</option>
            <c:forEach items="${mentors}" var="mentor">
                <option value="${mentor.id}">${mentor.name}</option>
            </c:forEach>
        </select>
    </div>
    
     <!-- Checkbox for Project Completion -->
            <div class="input-box">
                <label for="completed">
                    <input type="checkbox" id="completed" name="completed" /> 
                    I confirm that the project is completed and ready for review.
                </label>
            </div>
    
            <button type="submit">Submit</button>
        </form>
    </section>

    <!-- External Scripts -->
    <script src="https://unpkg.com/ionicons@5.1.2/dist/ionicons.js"></script>
    <script src="uploadproject.js"></script>
    <script src="../script.js"></script>
</body>
</html>
<%
    }
%>
