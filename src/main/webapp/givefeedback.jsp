<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Give Feedback</title>
</head>
<body>
    <h2>Provide Feedback</h2>

    <c:if test="${not empty message}">
        <p style="color: red;">${message}</p>
    </c:if>

    <form action="submitfeedback" method="post">
        <input type="hidden" name="projectId" value="${project.id}" />

        <div>
            <label>Project Title:</label>
            <span>${project.title}</span>
        </div>

        <div>
            <label>Student Name:</label>
            <span>${project.student.name}</span>
        </div>

        <div>
            <label>Remarks:</label>
            <textarea name="remarks" rows="5" cols="50" required></textarea>
        </div>

        <div>
            <label>Grade:</label>
            <input type="text" name="grade" maxlength="2" placeholder="e.g., A+" required />
        </div>

        <div>
            <button type="submit">Submit Feedback</button>
        </div>
    </form>
</body>
</html>
