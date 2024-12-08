<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Success</title>
    <style>
        /* Basic Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #e6f7e6; /* Light green background */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
            color: #333;
        }

        .success-container {
            text-align: center;
            background-color: #2ecc71; /* Green background to indicate success */
            padding: 40px;
            border-radius: 8px;
            width: 80%;
            max-width: 500px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .success-container h1 {
            color: #fff; /* White text for the success message */
            font-size: 28px;
            margin-bottom: 20px;
        }

        .success-container p {
            font-size: 18px;
            color: #fff; /* White text for the additional message */
            margin-bottom: 30px;
        }

        .back-link {
            color: #fff;
            font-size: 16px;
            text-decoration: none;
            background-color: #1abc9c;
            padding: 12px 25px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .back-link:hover {
            background-color: #16a085;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .success-container {
                width: 90%;
            }
        }
    </style>
</head>
<body>

    <div class="success-container">
        <h1>Update Successful!</h1>
        <p>
            <c:out value="${message}"></c:out>
        </p>
        <a href="updatestudent" class="back-link">Back to Update Profile</a>
    </div>

</body>
</html>
