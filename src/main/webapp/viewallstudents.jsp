
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Students</title>
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
            min-height: 100vh;
        }

        /* Sidebar Styling */
        .sidebar {
            width: 250px;
            background-color: #2c3e50;
            padding: 20px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            display: flex;
            flex-direction: column;
        }

        .sidebar h2 {
            color: white;
            font-size: 24px;
            margin-bottom: 30px;
            text-align: center;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            font-size: 18px;
            padding: 12px 20px;
            margin: 10px 0;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .sidebar a:hover {
            background-color: #34495e;
        }

        .sidebar a.active {
            background-color: #1abc9c;
            font-weight: bold;
        }

        /* Main Content Styling */
        .main-content {
            margin-left: 250px;
            padding: 20px;
            width: calc(100% - 250px); /* Take the rest of the screen width */
        }

        .content {
            padding: 20px;
        }

        .total-students {
            font-size: 18px;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #1abc9c;
            color: white;
        }

        tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        /* Media Query for smaller screens */
        @media (max-width: 768px) {
            .form-container {
                width: 90%;
            }

            .sidebar {
                width: 200px;
            }

            .main-content {
                margin-left: 200px;
                width: calc(100% - 200px);
            }

            td {
                font-size: 16px;
                padding: 8px 12px;
            }
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Admin Dashboard</h2>
         <a href="adminhome" class="active"><i class="bx bx-home"></i> Home</a>
         <a href="addstudent">Add Student</a>
        <a href="viewallstudents">View Students</a>
        <a href="deletestudent">Delete Student</a>
        <a href="mentorreg">Mentor Registration</a>
        <a href="viewallmentors">View All Mentors</a>
        <a href="deletementor">Delete Mentor</a>
        <a href="adminlogout">Logout</a>
        </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="content">
            
            
            <div class="total-students">
                Total Students = <c:out value="${count}"></c:out>
            </div>

            <h3><u>View All Students</u></h3>

            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>NAME</th>
                        <th>GENDER</th>
                        <th>DATE OF BIRTH</th>
                        <th>PROGRAM</th>
                        <th>DEPARTMENT</th>
                        <th>LOCATION</th>
                        <th>EMAIL</th>
                        <th>CONTACT</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${studentlist}" var="student">
                        <tr>
                            <td><c:out value="${student.id}"/></td>
                            <td><c:out value="${student.name}"/></td>
                            <td><c:out value="${student.gender}"/></td>
                            <td><c:out value="${student.dateofbirth}"/></td>
                            <td><c:out value="${student.program}"/></td>
                            <td><c:out value="${student.department}"/></td>
                            <td><c:out value="${student.location}"/></td>
                            <td><c:out value="${student.email}"/></td>
                            <td><c:out value="${student.contact}"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>
