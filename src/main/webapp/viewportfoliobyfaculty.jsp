<%@ page import="com.klef.jfsd.springboot.model.Student" %>
<%@ page import="com.klef.jfsd.springboot.model.Portfolio" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
Student student = (Student) session.getAttribute("student");
Portfolio portfolio = (Portfolio) request.getAttribute("portfolio");

if (portfolio == null) {
    out.println("<h2>No portfolio found for the student.</h2>");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <title>View Portfolio</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #34495e;
            line-height: 1.6;
        }

        .content {
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 800px;
        }

        h1, h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        .section {
            margin-bottom: 30px;
        }

        .section h3 {
            color: #1abc9c;
            margin-bottom: 10px;
        }

        .section p {
            margin: 5px 0;
        }

        .list-item {
            background: #ecf0f1;
            margin: 10px 0;
            padding: 10px;
            border-radius: 5px;
        }

        a {
            color: #1abc9c;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
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
    </style>
</head>
<body>

<div class="content">
    <%-- <h1>${student.Name}'s Portfolio</h1>
 --%>
    <!-- Personal Information -->
    <div class="section">
        <h3>Personal Information</h3>
        <p><strong>Full Name:</strong> ${portfolio.personalInformation.fullName}</p>
        <p><strong>Date of Birth:</strong> ${portfolio.personalInformation.dateOfBirth}</p>
        <p><strong>Gender:</strong> ${portfolio.personalInformation.gender}</p>
        <p><strong>Contact Number:</strong> ${portfolio.personalInformation.contactNumber}</p>
        <p><strong>Email Address:</strong> ${portfolio.personalInformation.emailAddress}</p>
    </div>

    <!-- Achievements -->
    <div class="section">
        <h3>Achievements</h3>
        <c:forEach items="${portfolio.achievements}" var="achievement">
            <div class="list-item">
                <p><strong>Type:</strong> ${achievement.type}</p>
                <p><strong>Title:</strong> ${achievement.title}</p>
                <p><strong>Description:</strong> ${achievement.description}</p>
            </div>
        </c:forEach>
    </div>

    <!-- Articles -->
    <div class="section">
        <h3>Articles</h3>
        <c:forEach items="${portfolio.articles}" var="article">
            <div class="list-item">
                <p><strong>Title:</strong> ${article.title}</p>
                <p><strong>Publication Date:</strong> ${article.publicationDate}</p>
                <p><strong>Link:</strong> <a href="${article.articleLink}" target="_blank">Read Article</a></p>
            </div>
        </c:forEach>
    </div>

    <!-- Skills -->
    <div class="section">
        <h3>Skills</h3>
        <c:forEach items="${portfolio.skills}" var="skill">
            <div class="list-item">
                <p><strong>Type:</strong> ${skill.skillType}</p>
                <p><strong>Name:</strong> ${skill.skillName}</p>
                <p><strong>Proficiency Level:</strong> ${skill.proficiencyLevel}</p>
            </div>
        </c:forEach>
    </div>

    <!-- Projects -->
    <div class="section">
        <h3>Project Portfolio</h3>
        <c:forEach items="${portfolio.projectPortfolios}" var="project">
            <div class="list-item">
                <p><strong>Title:</strong> ${project.title}</p>
                <p><strong>Description:</strong> ${project.description}</p>
                <p><strong>Technologies Used:</strong> ${project.technologiesUsed}</p>
                <p><strong>Duration:</strong> ${project.duration}</p>
                <p><strong>Link:</strong> <a href="${project.projectLink}" target="_blank">View Project</a></p>
              
            </div>
        </c:forEach>
    </div>
    <a href="viewmystudents">back</a>
</div>

</body>
</html>
