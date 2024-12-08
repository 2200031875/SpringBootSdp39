<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mentor Login Fail</title>
    <style>
        /* Basic Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }

        .message-container {
            text-align: center;
            background-color: #f44336; /* Red background */
            padding: 20px;
            border-radius: 8px;
            width: 80%;
            max-width: 400px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .message-container p {
            color: white;
            font-size: 18px;
            margin-bottom: 20px;
        }

        .retry-link {
            color: #fff;
            font-size: 16px;
            text-decoration: none;
            background-color: #1abc9c;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .retry-link:hover {
            background-color: #16a085;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .message-container {
                width: 90%;
            }
        }
    </style>
</head>
<body>

    <div class="message-container">
        <p><c:out value="${message}"/></p>
        <a href="mentorlogin" class="retry-link">Try Again</a>
    </div>

</body>
</html>
