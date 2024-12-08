<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Login Fail</title>
    <style>
        /* General Body Styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f9fc;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* Message Container Styling */
        .message-container {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
            text-align: center;
            width: 100%;
            max-width: 400px;
        }

        /* Error Message */
        .message-container p {
            font-size: 1.2rem;
            color: red;
            margin-bottom: 20px;
        }

        /* Retry Link */
        .retry-link {
            font-size: 1rem;
            color: #2ecc71;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        .retry-link:hover {
            color: #27ae60;
        }
    </style>
</head>
<body>

    <div class="message-container">
        <p><c:out value="${message}"/></p>
        <a href="studentlogin" class="retry-link">Try Again</a>
    </div>

</body>
</html>
