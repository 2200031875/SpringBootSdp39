<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Success</title>
    <style>
        /* General Body Styling */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f9fc;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Container Styling */
        .container {
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            padding: 30px;
            width: 80%;
            max-width: 400px;
            text-align: center;
            animation: fadeIn 1s ease-in;
        }

        /* Heading Styling */
        h2 {
            font-size: 2rem;
            color: #2ecc71;
            margin-bottom: 20px;
        }

        /* Message Styling */
        .message {
            font-size: 1.1rem;
            color: #2c3e50;
            margin-bottom: 20px;
            padding: 15px;
            border: 2px solid #2ecc71;
            background-color: #ecf8f2;
            border-radius: 5px;
        }

        /* Link Styling */
        a {
            font-size: 1.1rem;
            text-decoration: none;
            color: #3498db;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #2980b9;
        }

        /* Animation for fade-in */
        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
                width: 90%;
            }
            h2 {
                font-size: 1.5rem;
            }
            .message {
                font-size: 1rem;
            }
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
        <a href="studentlogin">Login Here</a>
    </div>

</body>
</html>
