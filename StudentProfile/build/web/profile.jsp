<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="studentprofile.ProfileBean" %>

<%
    ProfileBean profile = (ProfileBean) request.getAttribute("profile");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Profile Saved</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #6A9CFD, #89C4FF);
            margin: 0;
            padding: 0;
        }

        .container {
            width: 50%;
            background: white;
            margin: 50px auto;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 0px 20px rgba(0,0,0,0.15);
        }

        h2 {
            text-align: center;
            color: #2C3E50;
            margin-bottom: 20px;
        }

        .profile-item {
            margin-bottom: 12px;
            font-size: 16px;
        }

        .label {
            font-weight: bold;
            color: #2C3E50;
        }

        .btn {
            display: block;
            width: 100%;
            text-align: center;
            padding: 10px;
            background: #2980B9;
            color: white;
            font-size: 16px;
            border-radius: 8px;
            text-decoration: none;
            margin-top: 20px;
        }

        .btn:hover {
            background: #1A6AA8;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>Profile Saved Successfully</h2>

    <div class="profile-item">
        <span class="label">Student ID:</span>
        <%= profile.getStudentId() %>
    </div>

    <div class="profile-item">
        <span class="label">Name:</span>
        <%= profile.getName() %>
    </div>

    <div class="profile-item">
        <span class="label">Programme:</span>
        <%= profile.getProgramme() %>
    </div>

    <div class="profile-item">
        <span class="label">Hobby:</span>
        <%= profile.getHobby() %>
    </div>

    <a class="btn" href="viewProfiles.jsp">View All Profiles</a>
</div>

</body>
</html>
