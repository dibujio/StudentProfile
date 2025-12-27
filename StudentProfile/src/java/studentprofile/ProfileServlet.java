package studentprofile;  

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import studentprofile.ProfileBean;

public class ProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    // 1. Get form data
    String studentId = request.getParameter("studentId");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String programme = request.getParameter("programme");
    String hobby = request.getParameter("hobby");
    
    System.out.println("Programme = " + programme);
    System.out.println("Hobby = " + hobby);


    // 2. Create JavaBean
    ProfileBean profileBean = new ProfileBean();
    profileBean.setStudentId(studentId);
    profileBean.setName(name);
    profileBean.setEmail(email);
    profileBean.setProgramme(programme);
    profileBean.setHobby(hobby);

    // 3. Save to Derby DB
    try {
        String url = "jdbc:derby://localhost:1527/student_profiles";
        String user = "app";
        String pass = "app";

        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection con = DriverManager.getConnection(url, user, pass);

        String sql = "INSERT INTO profile (student_id, name, email, programme, hobby) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, studentId);
        ps.setString(2, name);
        ps.setString(3, email);
        ps.setString(4, programme);
        ps.setString(5, hobby);
        ps.executeUpdate();

        con.close();

    } catch (Exception e) {
        e.printStackTrace();
    }

    // 4. Forward to JSP
    request.setAttribute("profile", profileBean);
    request.getRequestDispatcher("profile.jsp").forward(request, response);
    }
}
