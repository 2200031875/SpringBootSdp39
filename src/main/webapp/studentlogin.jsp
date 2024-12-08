<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Login</title>
    <style>
        /* General body styling */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f9fc;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Sidebar Styling */
        .sidebar {
            background-color: #2c3e50;
            color: white;
            width: 250px;
            height: 100%;
            position: fixed;
            left: 0;
            top: 0;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            padding-top: 20px;
        }

        .sidebar a {
            display: block;
            color: #ecf0f1;
            padding: 15px 25px;
            font-size: 18px;
            text-decoration: none;
            transition: background-color 0.3s ease, transform 0.3s ease;
            border-radius: 5px;
            margin: 10px 0;
        }

        .sidebar a:hover {
            background-color: #34495e;
            transform: translateX(5px);
        }

        .sidebar a.active {
            background-color: #1abc9c;
            font-weight: bold;
        }

        /* Main content container */
        .main-content {
            margin-left: 260px; /* Adjust for sidebar */
            width: calc(100% - 250px);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Card container for login */
        .card {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            padding: 40px;
            text-align: center;
        }

        h3 {
            font-size: 1.8rem;
            color: #2ecc71;
            margin-bottom: 30px;
        }

        /* Form table */
        table {
            width: 100%;
            border-spacing: 10px;
        }

        td {
            text-align: left;
            font-size: 1rem;
        }

        /* Input fields */
        input[type="email"], input[type="password"] {
            width: 100%;
            padding: 12px;
            font-size: 1rem;
            border: 2px solid #ccc;
            border-radius: 5px;
            margin-bottom: 20px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }

        input[type="email"]:focus, input[type="password"]:focus {
            border-color: #2ecc71;
            outline: none;
        }

        /* Button container */
        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        /* Submit and reset buttons */
        input[type="submit"], input[type="reset"] {
            padding: 12px 20px;
            font-size: 1rem;
            border: none;
            background-color: #2ecc71;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            width: 48%;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover, input[type="reset"]:hover {
            background-color: #27ae60;
        }

        /* Error message */
        h4 {
            font-size: 1.2rem;
            color: red;
            margin-top: 10px;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .sidebar {
                width: 200px;
            }

            .main-content {
                margin-left: 210px;
                width: calc(100% - 200px);
            }

            .card {
                padding: 20px;
            }

            h3 {
                font-size: 1.5rem;
            }

            input[type="submit"], input[type="reset"] {
                width: 100%;
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>

    <!-- Sidebar Section -->
    <div class="sidebar">
        <a href="/" class="active">Home</a>
        <a href="/about.jsp">About</a>
        <a href="/contactus.jsp">Contact Us</a> 
        <a href="adminlogin">Admin Login</a>
        <a href="studentlogin">Student Login</a>
        <a href="mentorlogin">Mentor Login</a>
    </div>

    <!-- Main Content Section -->
    <div class="main-content">
        <!-- Message Display -->
        <h4 align="center" style="color:red">
            <c:out value="${message}"></c:out>
        </h4>

        <!-- Card with Login Form -->
        <div class="card">
            <h3><u>Student Login</u></h3>
            <form method="post" action="checkstudentlogin">
                <table>
                    <tr>
                        <td><label for="semail">Enter Email ID</label></td>
                        <td><input type="email" id="semail" name="semail" required/></td>
                    </tr>
                    <tr>
                        <td><label for="spwd">Enter Password</label></td>
                        <td><input type="password" id="spwd" name="spwd" required/></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="button-container">
                            <input type="submit" value="Login"/>
                            <input type="reset" value="Clear"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

</body>
</html>
