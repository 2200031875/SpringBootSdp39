<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Student</title>
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
            font-size: 22px;
            margin-bottom: 20px;
            text-align: center;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            font-size: 18px;
            padding: 12px 15px;
            margin: 5px 0;
            border-radius: 5px;
            transition: background-color 0.3s ease, color 0.3s ease;
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
            width: calc(100% - 250px); /* Adjusts content width dynamically */
        }

        .content {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h3 {
            text-align: center;
            color: #2c3e50;
            font-size: 28px;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px 15px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #1abc9c;
            color: white;
            text-transform: uppercase;
        }

        tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tbody tr:hover {
            background-color: #e9f7f6;
        }

        .action-link {
            color: #e74c3c;
            text-decoration: none;
            font-weight: bold;
        }

        .action-link:hover {
            text-decoration: underline;
            color: #c0392b;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .sidebar {
                width: 200px;
            }

            .main-content {
                margin-left: 200px;
                width: calc(100% - 200px);
            }

            th, td {
                font-size: 14px;
            }
        }

        @media (max-width: 480px) {
            .sidebar {
                width: 100px;
            }

            .sidebar a {
                font-size: 14px;
                padding: 10px;
            }

            .main-content {
                margin-left: 100px;
                width: calc(100% - 100px);
            }

            th, td {
                font-size: 12px;
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
            <h3><u>Delete Student</u></h3>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>NAME</th>
                        <th>GENDER</th>
                        <th>DATE OF BIRTH</th>
                        <th>DEPARTMENT</th>
                        <th>LOCATION</th>
                        <th>EMAIL</th>
                        <th>CONTACT</th>
                        <th>STATUS</th>
                        <th>ACTION</th>
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
                            <td>
                                <a href="<c:url value='delete?id=${student.id}'/>" class="action-link" onclick="return confirmDelete();">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to delete this student?");
        }
    </script>

</body>
</html>
