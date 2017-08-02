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


public class data_pool extends HttpServlet {

    @Override

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doPost(req, resp); //To change body of generated methods, choose Tools | Templates.
        //doGet(req, resp);
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        HttpSession session=req.getSession();        

        try {
           ServletContext ctx=getServletContext();  
    Connection C1=(Connection)ctx.getAttribute("mycon");            
            int id=(int)session.getAttribute("film_id");
            String getstatus="select status from film_information where Film_id="+id+"";
            Statement st2 = C1.createStatement();
            Statement st3 = C1.createStatement();
            ResultSet rs1=st2.executeQuery(getstatus);
            String stat="";
            while(rs1.next())
            {
                stat=rs1.getString("status");
            }
            stat=stat.concat(",5");
            
            String sendstatus="update film_information set status='"+stat+"' where Film_id="+id+"";
            st3.executeUpdate(sendstatus);

        } catch (Exception e) {

        }
        resp.sendRedirect("Trailer.jsp");
    }

}
