/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lenovo
 */
public class sortyear extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String s = request.getParameter("sendyear");
        try {
            ServletContext ctx=getServletContext();  
    Connection C1=(Connection)ctx.getAttribute("mycon");
            Statement st = C1.createStatement();
            response.sendRedirect("index.jsp?sorty="+s);

        } catch (Exception e) {

        }
        
    }

}
