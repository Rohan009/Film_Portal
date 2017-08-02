/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.oreilly.servlet.MultipartRequest;
import java.io.*;
import java.sql.*;
import java.sql.DriverManager;
import javax.servlet.ServletContext;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.MultipartConfig;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 100, // 10 MB 
        maxFileSize = 1024 * 1024 * 100, // 50 MB
        maxRequestSize = 1024 * 1024 * 100)
public class Dcp_trailer extends HttpServlet {

    @Override

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doPost(req, resp); //To change body of generated methods, choose Tools | Templates.
        //doGet(req, resp);
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        String path = "D:/projeCT/Film_Portal/web/";

        MultipartRequest m = new MultipartRequest(req, path + "Material/Trailer/Dcptrailer", 1024 * 1024 * 1024);
        String dcp_name = m.getFilesystemName("dcp_trailer");
        File file_path = m.getFile("dcp_trailer");

        int dcp_size = (int) file_path.length();
        int dsize = dcp_size / (1024 * 1024);

        HttpSession session = req.getSession();
        String userid = (String) session.getAttribute("userid");
        String ide = m.getParameter("fid");

        String trailer_path = "Material/Trailer/Dcptrailer/" + dcp_name;

        try {
            ServletContext ctx = getServletContext();
            Connection C1 = (Connection) ctx.getAttribute("mycon");
            Statement st = C1.createStatement();
            Statement st1 = C1.createStatement();
            String query = "select Film_id,Film_Title from film_information order by Film_id desc Limit 1";
            ResultSet rs = st1.executeQuery(query);
            String filmname = "";

            String fid = (String) session.getAttribute("film_id");

            if (ide != null) {
                fid = ide;
            }
            while (rs.next()) {
                filmname = rs.getString("Film_Title");
            }

            String dquery = "insert into dcp_trailerinfo(Trailer_name,Trailer_size,dcp_path,film_name,user_id,film_id) values('" + dcp_name + "','" + dsize + "','" + trailer_path + "','" + filmname + "','" + userid + "','" + fid + "')";
            st.executeUpdate(dquery);

            String id = (String) session.getAttribute("film_id");
            String getstatus = "select status from film_information where Film_id='" + id + "'";
            Statement st2 = C1.createStatement();
            Statement st3 = C1.createStatement();
            ResultSet rs1 = st2.executeQuery(getstatus);
            String stat = "";
            while (rs1.next()) {
                stat = rs1.getString("status");
            }
            stat = stat.concat(",4");

            String sendstatus = "update film_information set status='" + stat + "' where Film_id='" + id + "'";
            st3.executeUpdate(sendstatus);
            if (ide != null) {
                resp.sendRedirect("film_edit.jsp?fid=" + fid);
            } else {
                resp.sendRedirect("Trailer.jsp");
            }

        } catch (Exception e) {

        }

    }

}
