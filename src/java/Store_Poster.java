/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.*;

import com.oreilly.servlet.MultipartRequest;

import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.MultipartConfig;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 100, // 10 MB 
        maxFileSize = 1024 * 1024 * 100, // 50 MB
        maxRequestSize = 1024 * 1024 * 100)
public class Store_Poster extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        String path = "D:/projeCT/Film_Portal/web/";
        MultipartRequest m = new MultipartRequest(req, path + "Posters");
        HttpSession session = req.getSession();
        String poster_name = m.getFilesystemName("screen");
        String posterpath = "Posters/" + poster_name;
//        out.println("Success "+screen_name+" "+screen_path);
        String Title = m.getParameter("Film_title");
        String Cinema_start = m.getParameter("Cinema_start");
        String Genre = m.getParameter("Genre");
        String Length = m.getParameter("Length");
        String Director = m.getParameter("director");
        String Year = m.getParameter("year");
        String Actor = m.getParameter("actor");
        String Production_country = m.getParameter("Production_country");
        String Website = m.getParameter("website");
        String Language = m.getParameter("Language");

        String Subtitle = m.getParameter("subtitle");
        String Fram_rate = m.getParameter("frame_rate");
        String Picture_format = m.getParameter("picture_format");
        String Audio_format = m.getParameter("audio_format");

        String Version = m.getParameter("version");
        String Rated = m.getParameter("rated");
        String Video_format = m.getParameter("video_format");
        String Dvd_start = m.getParameter("dvd_start");

        String Vod_start = m.getParameter("vod_start");
        String Description = m.getParameter("description");

        String userid = (String) session.getAttribute("userid");
        String status = "1";
        int filmupload = 0;

        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            java.sql.Connection C1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/film_portal?", "root", "");
            ServletContext ctx=getServletContext();  
Connection C1=(Connection)ctx.getAttribute("mycon");
//            ServletContext ctx = getServletContext();
//            Connection C1 = (Connection) ctx.getAttribute("mycon");

            Statement st = C1.createStatement();
            Statement st1 = C1.createStatement();

            String query = "insert into film_information(Film_Title,Cinema_Start,Genre,Length,Director,Year,Actor,Production_Country,Website,Language,Subtitle,Framerate,Picture_Format,Audio_Format,Version,Rated,Video_format,Dvd_Start,Vod_start,Description,Poster_Path,user_id,status,film_upload) values('" + Title + "','" + Cinema_start + "','" + Genre + "','" + Length + "','" + Director + "','" + Year + "','" + Actor + "','" + Production_country + "','" + Website + "','" + Language + "','" + Subtitle + "','" + Fram_rate + "','" + Picture_format + "','" + Audio_format + "','" + Version + "','" + Rated + "','" + Video_format + "','" + Dvd_start + "','" + Vod_start + "','" + Description + "','" + posterpath + "','" + userid + "','" + status + "','" + filmupload + "')";
            st.executeUpdate(query);

            String idquery = "select Film_id from film_information order by Film_id desc limit 1";
            ResultSet rs = st1.executeQuery(idquery);

            int ids = 0;

            while (rs.next()) {
                ids = rs.getInt("Film_id");
            }

            String id = String.valueOf(ids);

            resp.sendRedirect("Multiple_Destinies.jsp?film=" + id);
        } catch (Exception e) {

        }

    }

}

//    @Override
//
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
//        resp.setContentType("text/html");
//        PrintWriter out = resp.getWriter();
//        MultipartRequest mm = new MultipartRequest(req, "D:/MSP", 1024 * 1024 * 10);
//       
//       // resp.sendRedirect("confirm_film_info.jsp");
//
////        String Cinema_start = m.getParameter("Cinema_start");
////        String Genre = m.getParameter("Genre");
////        String Length = m.getParameter("Length");
////        String Director = m.getParameter("director");
////        String Year = m.getParameter("year");
////        String Actor = m.getParameter("actor");
////        String Production_country = m.getParameter("Production_country");
////        String Website = m.getParameter("website");
////        String Language = m.getParameter("Language");
////
////        String Subtitle = m.getParameter("subtitle");
////        String Fram_rate = m.getParameter("frame_rate");
////        String Picture_format = m.getParameter("picture_format");
////        String Audio_format = m.getParameter("audio_format");
////
////        String Version = m.getParameter("version");
////        String Rated = m.getParameter("rated");
////        String Video_format = m.getParameter("video_format");
////        String Dvd_start = m.getParameter("dvd_start");
////
////        String Vod_start = m.getParameter("vod_start");
////        String Description = m.getParameter("description");
//    }
//
//}
