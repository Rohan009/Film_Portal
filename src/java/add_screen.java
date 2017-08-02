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
public class add_screen extends HttpServlet {

    @Override

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doPost(req, resp); //To change body of generated methods, choose Tools | Templates.
        //doGet(req, resp);
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        String path="D:/projeCT/Film_Portal/web/";

        MultipartRequest m = new MultipartRequest(req, path+"Material/Screener", 1024 * 1024 * 1024);
        String screen_name = m.getFilesystemName("screen");
        File screen_path = m.getFile("screen");
        int screen_size = (int) screen_path.length();
        int ssize = screen_size / (1024 * 1024);
        String ide = m.getParameter("fid");
        
        HttpSession session=req.getSession();
        String userid=(String) session.getAttribute("userid");
        
//        out.println("name "+press_name+"type "+ptype+"size "+psize);

        try {
           ServletContext ctx=getServletContext();  
    Connection C1=(Connection)ctx.getAttribute("mycon");
            Statement st = C1.createStatement();
           String id=(String)session.getAttribute("film_id");
           
            if (ide != null) {
                id = ide;
            }
            
             String spath="Material/Screener/"+screen_name;
          
            String dquery = "insert into screener_info(screener_name,screener_size,user_id,film_id,screener_path) values('" + screen_name + "','" + ssize + "','" + userid + "','" + id + "','"+spath+"')";
            st.executeUpdate(dquery);
            
            
            
            String getstatus="select status from film_information where Film_id='"+id+"'";
            Statement st2 = C1.createStatement();
            Statement st3 = C1.createStatement();
            ResultSet rs1=st2.executeQuery(getstatus);
            String stat="";
            while(rs1.next())
            {
                stat=rs1.getString("status");
            }
            stat=stat.concat(",6");
            
            String sendstatus="update film_information set status='"+stat+"' where Film_id='"+id+"'";
            st3.executeUpdate(sendstatus);
              if (ide != null) {
                resp.sendRedirect("film_edit.jsp?fid=" + id);
            } else {
                resp.sendRedirect("Screen.jsp");
            }
            

        } catch (Exception e) {

        }
       
    }

}
