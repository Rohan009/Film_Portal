/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.*;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
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
public class checkstatus extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        try {
          ServletContext ctx=getServletContext();  
    Connection C1=(Connection)ctx.getAttribute("mycon");
            Statement st = C1.createStatement();
            Statement st1 = C1.createStatement();

            String id = (String) session.getAttribute("film_id");

            String query = "select status from film_information where Film_id=" + id + "";
            ResultSet rs1 = st.executeQuery(query);
            String status = "";
            while (rs1.next()) {
                status = rs1.getString("status");
            }
//            out.println(status+"howe");
            String[] array = status.split(",");
            List<String> status_arr = Arrays.asList(array);
            Collections.sort(status_arr, null);
            status_arr = status_arr.stream().distinct().collect(Collectors.toList());
            String final_status = String.join(",", status_arr);

            if (final_status.equals("1,2,3,4,5,6")) {

                String set = "update film_information set film_upload=1 where Film_id='"+id+"'";
                st1.executeUpdate(set);
                session.removeAttribute("film_id");
                response.sendRedirect("Screen.jsp?film=success");
            } 
            else {
                response.sendRedirect("Screen.jsp?film=fail");
            }
//             response.sendRedirect("Screen.jsp?film=fail");
////             
//            out.println("hey " + final_status);

        } catch (Exception ex) {
        }
    }
}
