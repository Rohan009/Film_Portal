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
public class press_material extends HttpServlet {

    @Override

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doPost(req, resp); //To change body of generated methods, choose Tools | Templates.
        //doGet(req, resp);
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        MultipartRequest m = new MultipartRequest(req, "D:/projeCT/Film_Portal/web/Material/PressMaterial", 1024 * 1024 * 1024);
        String press_name = m.getFilesystemName("press_material");
        File press_path = m.getFile("press_material");
        String ptype = m.getContentType("press_material");
        int press_size = (int) press_path.length();
        int psize = press_size / (1024 * 1024);
        String ide = m.getParameter("fid");
        
        String group=m.getParameter("gn");
        out.println("yeppi "+group);    

        HttpSession session = req.getSession();

        try {
            String userid = (String) session.getAttribute("userid");
           String ppath = "Material/PressMaterial/" + press_name;
            String id = (String) session.getAttribute("film_id");
            if (ide != null) {
                id = ide;
            }
            ServletContext ctx = getServletContext();
            Connection C1 = (Connection) ctx.getAttribute("mycon");
            Statement st = C1.createStatement();
            String dquery = "insert into press_info(press_name,press_type,press_size,user_id,press_path,film_id,group_name) values('" + press_name + "','" + ptype + "','" + psize + "','" + userid + "','" + ppath + "','" + id + "','" + group + "')";
            st.executeUpdate(dquery);
out.println("yeppi");
            String getstatus = "select status from film_information where Film_id='" + id + "'";
            Statement st2 = C1.createStatement();
            Statement st3 = C1.createStatement();
            ResultSet rs1 = st2.executeQuery(getstatus);
            String stat = "";
            while (rs1.next()) {
                stat = rs1.getString("status");
            }
            stat = stat.concat(",5");
out.println("yeppi");
            String sendstatus = "update film_information set status='" + stat + "' where Film_id=" + id + "";
            st3.executeUpdate(sendstatus);


//            if (ide != null) {
//                
//           } else {
                resp.sendRedirect("Press_Material.jsp");
//           }

        } catch (Exception e) {

        }
        
    }

}
