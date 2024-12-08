<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Error</title>
    <style>
        /* Basic Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
            color: #333;
        }

        .error-container {
            text-align: center;
            background-color: #ff4d4d; /* Red background to indicate error */
            padding: 30px;
            border-radius: 8px;
            width: 80%;
            max-width: 500px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .error-container h2 {
            color: #fff; /* White text for the error message */
            font-size: 24px;
            margin-bottom: 15px;
        }

        .error-container p {
            font-size: 18px;
            color: #fff; /* White text for the description */
            margin-bottom: 25px;
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
            .error-container {
                width: 90%;
            }
        }
    </style>
</head>
<body>

    <div class="error-container">
        <h2>Error: ${message}</h2>
        <p>There was an issue while updating. Please try again.</p>
        <a href="updatestudent" class="back-link">Back</a>
    </div>

</body>
</html>
