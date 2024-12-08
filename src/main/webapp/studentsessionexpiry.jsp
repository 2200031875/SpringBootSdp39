<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Session Expired</title>
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
            color: #333;
        }

        .message-container {
            text-align: center;
            background-color: #ffcc00; /* Yellow background to signify warning */
            padding: 30px;
            border-radius: 8px;
            width: 80%;
            max-width: 400px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .message-container h2 {
            color: #e74c3c; /* Red color for the error message */
            font-size: 26px;
            margin-bottom: 15px;
        }

        .message-container p {
            font-size: 18px;
            color: #333;
            margin-bottom: 25px;
        }

        .retry-link {
            color: #fff;
            font-size: 16px;
            text-decoration: none;
            background-color: #1abc9c;
            padding: 12px 25px;
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
        <h2>OOPS... !!! Session Expired</h2>
        <p>Your session has expired. Please log in again to continue.</p>
        <a href="studentlogin" class="retry-link">Login Again</a>
    </div>

</body>
</html>
