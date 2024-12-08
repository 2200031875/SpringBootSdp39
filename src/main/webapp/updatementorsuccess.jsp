<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Success</title>
</head>
<body>
    <div>
        <h1>Update Successful!</h1>
        <p>
            <c:out value="${message}"></c:out>
        </p>
        <a href="updatementor">Back to Update Profile</a>
    </div>

</body>
</html>
