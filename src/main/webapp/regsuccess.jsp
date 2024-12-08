<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Success</title>
    <style>
        /* Reset body margin and padding */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8; /* Light backgroAund color */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Full viewport height */
            flex-direction: column;
            text-align: center;
        }

        h2 {
            color: #4CAF50; /* Green color for success */
            font-size: 28px;
            margin-bottom: 20px;
        }

        .message {
            font-size: 18px;
            color: #333;
            margin: 20px 0;
        }

        a {
            font-size: 16px;
            color: #007BFF; /* Blue color for link */
            text-decoration: none;
            padding: 8px 20px;
            border: 2px solid #007BFF;
            border-radius: 4px;
            transition: background-color 0.3s, color 0.3s;
        }

        a:hover {
            background-color: #007BFF;
            color: white;
        }

        /* Optional: Add a shadow or border around the content */
        .container {
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Registration Successful!</h2>
        <div class="message">
            <c:out value="${message}" />
        </div>
        <br>
        <a href="mentorlogin">Login Here</a>
    </div>

</body>
</html>
