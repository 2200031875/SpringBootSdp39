<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Feedback</title>
</head>
<body>
    <h2>Feedback Details</h2>

    <c:if test="${not empty message}">
        <p style="color: red;">${message}</p>
    </c:if>

    <div>
        <label>Project Title:</label>
        <span>${project.title}</span>
    </div>

    <div>
        <label>Mentor Name:</label>
        <span>${feedback.mentor.name}</span>
    </div>

    <div>
        <label>Remarks:</label>
        <p>${feedback.remarks}</p>
    </div>

    <div>
        <label>Grade:</label>
        <span>${feedback.grade}</span>
    </div>
</body>
</html>
