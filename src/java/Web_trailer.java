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
public class Web_trailer extends HttpServlet {

    @Override

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doPost(req, resp); //To change body of generated methods, choose Tools | Templates.
        //doGet(req, resp);
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        String path="D:/projeCT/Film_Portal/web/";
        
        MultipartRequest m = new MultipartRequest(req,path+"Material/Trailer/Webtrailer", 1024 * 1024 * 1024);
        String web_name = m.getFilesystemName("web_trailer");
        File file_path = m.getFile("web_trailer");
        
        HttpSession session=req.getSession();
        String userid=(String) session.getAttribute("userid");
        
        int web_size = (int)file_path.length();
        int size=web_size/(1024*1024);
         String ide = m.getParameter("fid");
        
        String web_path="Material/Trailer/Webtrailer/"+web_name;
        
        try {
           ServletContext ctx=getServletContext();  
    Connection C1=(Connection)ctx.getAttribute("mycon");
            Statement st = C1.createStatement();
            Statement st1 = C1.createStatement();
            String query="select Film_id,Film_Title from film_information order by Film_id desc Limit 1";
           ResultSet rs=st1.executeQuery(query);
           String filmname="";
           while(rs.next())
           {
               filmname=rs.getString("Film_Title");
           }
              
            String id=(String)session.getAttribute("film_id");
            
             if (ide != null) {
                id = ide;
            }
            
            String query1 = "insert into web_trailerinfo(Wtrailer_name,Wtrailer_size,Wtrailer_path,film_name,user_id,film_id) values('" + web_name + "','" + size + "','"+web_path+"','"+filmname+"','"+userid+"','"+id+"')";
            st.executeUpdate(query1);
            
          
            String getstatus="select status from film_information where Film_id='"+id+"'";
            Statement st2 = C1.createStatement();
            Statement st3 = C1.createStatement();
            ResultSet rs1=st2.executeQuery(getstatus);
            String stat="";
            while(rs1.next())
            {
                stat=rs1.getString("status");
            }
            stat=stat.concat(",4");
            out.println(stat);
            String sendstatus="update film_information set status='"+stat+"' where Film_id='"+id+"'";
            st3.executeUpdate(sendstatus);
            
            if (ide != null) {
                resp.sendRedirect("film_edit.jsp?fid=" + id);
            } else {
                resp.sendRedirect("Trailer.jsp");
            }
            
        } catch (Exception e) {

        }
 
    }

}
