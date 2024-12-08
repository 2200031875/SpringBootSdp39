<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <style>
        /* General Body Styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
            color: #333;
            display: flex;
            height: 100vh;
            overflow: hidden;
        }

        /* Side Navbar Styling */
         #navbar {
            position: fixed;
            top: 0;
            left: 0;
            width: 250px;
            height: 100%;
            background-color: #2c3e50;
            padding-top: 30px;
            box-shadow: 4px 0 6px rgba(0, 0, 0, 0.1);
            transition: width 0.3s ease;
        }

        #navbar a {
            display: block;
            color: #ecf0f1;
            text-decoration: none;
            padding: 15px 20px;
            font-size: 18px;
            margin-bottom: 10px;
            transition: background-color 0.3s, transform 0.3s;
            border-radius: 5px;
        }

        #navbar a:hover {
            background-color: #34495e;
            transform: translateX(5px);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }

        #navbar a.active {
            background-color: #1abc9c;
            font-weight: bold;
        }
        /* Content Styling (Title + Cards) */
        .content {
            margin-left: 250px; /* Ensure content doesn't overlap with the sidebar */
            padding: 20px;
            width: calc(100% - 250px);
        }

        /* Title Styling */
        .main-title {
            font-size: 32px;
            font-weight: bold;
            color: #2c3e50;
            margin-top: 60px; /* Adjust space for the navbar */
            margin-bottom: 40px;
            text-align: center;
        }

        /* Card Container Styling */
.card-container {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 40px; /* Space between cards */
    flex-wrap: wrap;
    margin-top: 30px; /* Space between title and cards */
    padding: 20px; /* Prevent cards from colliding with the edges */
    position: relative; /* To manage z-index stacking */
}

/* Flip Card Styling */
.flip-card {
    background-color: transparent;
    width: 300px;
    height: 200px;
    perspective: 1200px; /* Enhanced perspective for better 3D depth */
    margin: 10px; /* Prevent overlap during flips */
    position: relative; /* Ensures proper stacking during hover */
}

.flip-card-inner {
    position: relative;
    width: 100%;
    height: 100%;
    text-align: center;
    transition: transform 0.6s ease-in-out;
    transform-style: preserve-3d;
    transform-origin: center; /* Prevent collision with perspective origin */
    z-index: 1; /* Maintain stacking order */
}

.flip-card:hover {
    z-index: 10; /* Bring hovered card to the top layer */
}

.flip-card:hover .flip-card-inner {
    transform: rotateY(180deg); /* Flip card on hover */
}

.flip-card-front, .flip-card-back {
    position: absolute;
    width: 100%;
    height: 100%;
    backface-visibility: hidden; /* Hide the back face during rotation */
    border-radius: 12px;
    overflow: hidden; /* Ensure clean card edges */
}

.flip-card-front {
    background-color: #fff;
    color: #333;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    padding: 20px;
    z-index: 2; /* Ensure front face is above by default */
}

.flip-card-back {
    background-color: #1abc9c;
    color: white;
    transform: rotateY(180deg); /* Back face rotates 180 degrees */
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    padding: 20px;
    z-index: 1; /* Ensure back face stays behind */
}

/* Fix for backward flip overlap */
.flip-card-inner:hover {
    z-index: 10; /* Ensure hovered card is above all others */
}

/* Responsive Design */
@media (max-width: 768px) {
    .card-container {
        flex-direction: column;
        gap: 20px; /* Reduce gap for smaller screens */
    }

    .flip-card {
        width: 100%; /* Allow cards to adapt to smaller screens */
    }
}

        }
    </style>
</head>
<body>
    <!-- Side Navbar -->
    <div id="navbar">
        <a href="/" class="active">Home</a>
        <a href="/about.jsp">About</a>
        <a href="/contactus.jsp">Contact Us</a>
        <a href="adminlogin">Admin Login</a>
        <a href="studentlogin">Student Login</a>
        <a href="mentorlogin">Mentor Login</a>
    </div>

    <!-- Content Area (Title + Cards) -->
    <div class="content">
        <!-- Title -->
        <div class="main-title">PROJECT AND PORTFOLIO MANAGEMENT SYSTEM</div>

        <!-- Card Container -->
        <div class="card-container">
            <!-- Admin Card -->
            <div class="flip-card" id="admin">
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <h3>Admin Section</h3>
                        <p>Click to view details</p>
                    </div>
                    <div class="flip-card-back">
                        <ul>
                            <li>Add Student</li>
                            <li>Add Mentor</li>
                            <li>Delete Student</li>
                            <li>Delete Mentor</li>
                            <li>View Student</li>
                            <li>View Mentor</li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Mentor Card -->
            <div class="flip-card" id="mentor">
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <h3>Mentor Section</h3>
                        <p>Click to view details</p>
                    </div>
                    <div class="flip-card-back">
                        <ul>
                            <li>View Student Portfolios</li>
                            <li>View Student Projects</li>
                            <li>Provide Feedback</li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Student Card -->
            <div class="flip-card" id="student">
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <h3>Student Section</h3>
                        <p>Click to view details</p>
                    </div>
                    <div class="flip-card-back">
                        <ul>
                            <li>Upload Projects</li>
                            <li>Manage Portfolios</li>
                            <li>View Admin Feedback</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
