<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Profile</title>

    <style>
        body {
            font-family: Arial;
            background: linear-gradient(135deg, #6A9CFD, #89C4FF);
        }

        .container {
            width: 50%;
            background: white;
            margin: 50px auto;
            padding: 30px;
            border-radius: 15px;
        }

        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
        }

        button {
            background: #2980B9;
            color: white;
            padding: 10px;
            border: none;
            width: 100%;
        }
    </style>
</head>
<body>

<div class="container">
<h2>Edit Student Profile</h2>

<%
    String studentId = request.getParameter("studentId");

    Connection con = DriverManager.getConnection(
        "jdbc:derby://localhost:1527/student_profiles", "app", "app");

    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM profile WHERE student_id=?");
    ps.setString(1, studentId);

    ResultSet rs = ps.executeQuery();
    rs.next();
%>

<form action="UpdateProfileServlet" method="post">
    <input type="hidden" name="studentId" value="<%= rs.getString("student_id") %>">

    Name:
    <input type="text" name="name" value="<%= rs.getString("name") %>">

    Email:
    <input type="text" name="email" value="<%= rs.getString("email") %>">

    Programme:
    <input type="text" name="programme" value="<%= rs.getString("programme") %>">

    Hobby:
    <input type="text" name="hobby" value="<%= rs.getString("hobby") %>">

    <button type="submit">Update Profile</button>
</form>

</div>

</body>
</html>
