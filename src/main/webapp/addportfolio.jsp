<%@ page import="com.klef.jfsd.springboot.model.Student" %>
<%@ page import="com.klef.jfsd.springboot.model.Mentor" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
Student student = (Student) session.getAttribute("student");
if (student == null) {
    response.sendRedirect("studentsessionexpiry.jsp");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Portfolio</title>
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

<div class="container">
    <header>Add Portfolio</header>

    <form action="/addportfolio" method="post" class="form">
        <h4><c:out value="${message}"></c:out></h4>

        <div class="input-box">
            <label for="studentId">Student ID:</label>
            <input type="number" id="studentId" name="studentId" required />
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

	 <h2>Achievement</h2>
        <div class="input-box">
            <label for="achievementType">Achievement Type:</label>
            <input type="text" id="achievementType" name="achievementType" required />
        </div>

        <div class="input-box">
            <label for="achievementTitle">Achievement Title:</label>
            <input type="text" id="achievementTitle" name="achievementTitle" required />
        </div>

        <div class="input-box">
            <label for="achievementDescription">Achievement Description:</label>
            <textarea id="achievementDescription" name="achievementDescription" required></textarea>
        </div>
		
		<h2>Article</h2>
        <div class="input-box">
            <label for="articleTitle">Article Title:</label>
            <input type="text" id="articleTitle" name="articleTitle" required />
        </div>

        <div class="input-box">
            <label for="publicationDate">Publication Date:</label>
            <input type="date" id="publicationDate" name="publicationDate" required />
        </div>

        <div class="input-box">
            <label for="articleLink">Article Link:</label>
            <input type="url" id="articleLink" name="articleLink" required />
        </div>
	
		<h2>Personal Information</h2>
        <div class="input-box">
            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName" required />
        </div>

        <div class="input-box">
            <label for="dateOfBirth">Date of Birth:</label>
            <input type="date" id="dateOfBirth" name="dateOfBirth" required />
        </div>

        <div class="input-box">
            <label for="gender">Gender:</label>
            <input type="text" id="gender" name="gender" required />
        </div>

        <div class="input-box">
            <label for="contactNumber">Contact Number:</label>
            <input type="text" id="contactNumber" name="contactNumber" required />
        </div>

        <div class="input-box">
            <label for="emailAddress">Email Address:</label>
            <input type="email" id="emailAddress" name="emailAddress" required />
        </div>

		 <h2>Skills</h2>
        <div class="input-box">
            <label for="skillType">Skill Type:</label>
            <input type="text" id="skillType" name="skillType" required />
        </div>

        <div class="input-box">
            <label for="skillName">Skill Name:</label>
            <input type="text" id="skillName" name="skillName" required />
        </div>

        <div class="input-box">
            <label for="proficiencyLevel">Proficiency Level:</label>
            <input type="text" id="proficiencyLevel" name="proficiencyLevel" required />
        </div>

		<h2>Project Portfolio</h2>
        <div class="input-box">
            <label for="projectTitle">Project Title:</label>
            <input type="text" id="projectTitle" name="projectTitle" required />
        </div>

        <div class="input-box">
            <label for="projectDescription">Project Description:</label>
            <textarea id="projectDescription" name="projectDescription" required></textarea>
        </div>

        <div class="input-box">
            <label for="technologiesUsed">Technologies Used:</label>
            <input type="text" id="technologiesUsed" name="technologiesUsed" required />
        </div>

        <div class="input-box">
            <label for="duration">Project Duration:</label>
            <input type="text" id="duration" name="duration" required />
        </div>

        <div class="input-box">
            <label for="projectLink">Project Link:</label>
            <input type="url" id="projectLink" name="projectLink" required />
        </div>

        <button type="submit">Submit</button>
    </form>
</div>

</body>
</html>
