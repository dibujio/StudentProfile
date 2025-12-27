<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Profiles</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #6A9CFD, #89C4FF);
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
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

        .search-box {
            text-align: center;
            margin-bottom: 20px;
        }

        .search-box input[type="text"] {
            padding: 8px;
            width: 250px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        .search-box input[type="submit"] {
            padding: 8px 16px;
            background: #2980B9;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .search-box input[type="submit"]:hover {
            background: #1A6AA8;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: #2980B9;
            color: white;
            padding: 10px;
        }

        td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        tr:hover {
            background-color: #f2f6ff;
        }

        .back-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background: #2980B9;
            color: white;
            text-decoration: none;
            border-radius: 8px;
        }

        .back-btn:hover {
            background: #1A6AA8;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>All Student Profiles</h2>

    <div class="search-box">
        <form method="get">
            Search Student ID:
            <input type="text" name="sid">
            <input type="submit" value="Search">
        </form>
    </div>

    <table>
        <tr>
            <th>Student ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Programme</th>
            <th>Hobby</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>

        <%
            Connection con = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/student_profiles", "app", "app");

            String sid = request.getParameter("sid");
            PreparedStatement ps;

            if (sid != null && !sid.isEmpty()) {
                ps = con.prepareStatement("SELECT * FROM profile WHERE student_id=?");
                ps.setString(1, sid);
            } else {
                ps = con.prepareStatement("SELECT * FROM profile");
            }

            ResultSet rs = ps.executeQuery();

            while(rs.next()){
        %>
        <tr>
            <td><%= rs.getString("student_id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("programme") %></td>
            <td><%= rs.getString("hobby") %></td>
            <td>
             <a href="editProfile.jsp?studentId=<%= rs.getString("student_id") %>">
                Edit
             </a>
            </td>
            <td>
              <form action="DeleteProfileServlet" method="post"
                    onsubmit="return confirm('Are you sure you want to delete this record?');">
                <input type="hidden" name="studentId"
                    value="<%= rs.getString("student_id") %>">
                <input type="submit" value="Delete">
              </form>
            </td>
        </tr>
        <%
            }
            con.close();
        %>
    </table>

    <div style="text-align:center;">
        <a class="back-btn" href="index.html">Back to Form</a>
    </div>
</div>

</body>
</html>
