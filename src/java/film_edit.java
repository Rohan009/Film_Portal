/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Lenovo
 */
public class film_edit extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String path = "D:/projeCT/Film_Portal/web/";
        MultipartRequest m = new MultipartRequest(request, path + "Posters");
        HttpSession session = request.getSession();
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

        String id = request.getParameter("id");
        try {
           ServletContext ctx=getServletContext();  
    Connection C1=(Connection)ctx.getAttribute("mycon");
            Statement st = C1.createStatement();
            
            String query="update film_information set Film_Title='"+Title+"',Cinema_Start='"+Cinema_start+"',Genre='"+Genre+"',Length='"+Length+"',Director='"+Director+"',Year='"+Year+"',Actor='"+Actor+"',Production_Country='"+Production_country+"',Website='"+Website+"',Language='"+Language+"',Subtitle='"+Subtitle+"',Framerate='"+Fram_rate+"',Picture_Format='"+Picture_format+"',Audio_Format='"+Audio_format+"',Version='"+Version+"',Rated='"+Rated+"',Video_format='"+Video_format+"',Dvd_Start='"+Dvd_start+"',Vod_start='"+Vod_start+"',Description='"+Description+"' where Film_id='"+id+"'";
           st.executeUpdate(query);    

        } catch (Exception e) {

        }
          response.sendRedirect("film_edit.jsp?fid=" + id);


    }

}
