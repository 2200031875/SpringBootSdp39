<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Mentor</title>
    <style>
        /* General body and layout styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #34495e;
            display: flex;
            height: 100vh;
        }

        /* Sidebar styles */
        .sidebar {
            width: 250px;
            background-color: #2c3e50;
            color: white;
            padding: 20px 10px;
            height: 100%;
            position: fixed;
            top: 0;
            left: 0;
            box-shadow: 2px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .sidebar .logo {
            font-size: 22px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
            color: #ecf0f1;
        }

        .sidebar a {
            display: block;
            color: #ecf0f1;
            text-decoration: none;
            font-size: 18px;
            padding: 15px;
            margin: 10px 0;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s;
        }

        .sidebar a:hover {
            background-color: #34495e;
            transform: translateX(5px);
        }

        .sidebar a.active {
            background-color: #1abc9c;
            font-weight: bold;
        }

        /* Main content area */
        .content {
            margin-left: 250px;
            padding: 20px;
            width: calc(100% - 250px);
            transition: margin-left 0.3s ease;
        }

        /* Header for Delete Mentor section */
        h3 {
            text-align: center;
            font-size: 1.8rem;
            margin-bottom: 20px;
            color: #2c3e50;
        }

        /* Table styling */
        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            background-color: white;
            border-radius: 8px;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #3498db;
            color: white;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #ecf0f1;
        }

        /* Action link styling */
        a {
            color: #e74c3c;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            color: #c0392b;
            text-decoration: underline;
        }

        /* Confirm Delete dialog */
        .confirm-dialog {
            font-size: 1.1rem;
            color: #2c3e50;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .sidebar {
                width: 200px;
            }

            .content {
                margin-left: 200px;
                width: calc(100% - 200px);
            }

            table {
                width: 100%;
                font-size: 14px;
                margin: 10px;
            }

            th, td {
                padding: 10px;
            }
        }
    </style>
    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to delete this Mentor?");
        }
    </script>
</head>
<body>

    <!-- Sidebar Section -->
    <div class="sidebar">
        <div class="logo">Admin Dashboard</div>
         <a href="adminhome" class="active"><i class="bx bx-home"></i> Home</a>
         <a href="addstudent">Add Student</a>
        <a href="viewallstudents">View Students</a>
        <a href="deletestudent">Delete Student</a>
        <a href="mentorreg">Mentor Registration</a>
        <a href="viewallmentors">View All Mentors</a>
        <a href="deletementor">Delete Mentor</a>
        <a href="adminlogout">Logout</a>
    </div>

    <!-- Main Content Section -->
    <div class="content">
        <h3><u>Delete Mentor</u></h3>

        <!-- Mentor List Table -->
        <table>
            <thead>
                <tr>
                    <th>Mentor ID</th>
                    <th>Name</th>
                    <th>Department</th>
                    <th>Designation</th>
                    <th>Contact</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${mentorlist}" var="mentor">
                    <tr>
                        <td><c:out value="${mentor.id}"/></td>
                        <td><c:out value="${mentor.name}"/></td>
                        <td><c:out value="${mentor.department}"/></td>
                        <td><c:out value="${mentor.designation}"/></td>
                        <td><c:out value="${mentor.contact}"/></td>
                        <td>
                            <a href="<c:url value='deletementorredirect?id=${mentor.id}'/>" onclick="return confirmDelete();">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</body>
</html>
