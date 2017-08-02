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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Lenovo
 */
public class UpdatePassword extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession ss = request.getSession();

        String mail = (String) ss.getAttribute("mail");
        String new_pwd = request.getParameter("new_password");
        String con_pwd = request.getParameter("con_password");
        out.println("mail " + mail + "pwd  " + new_pwd + "confirm " + con_pwd);
        try {
            ServletContext ctx=getServletContext();  
    Connection C1=(Connection)ctx.getAttribute("mycon");
            Statement st = C1.createStatement();
            
            String str1 = "update registration set Password='" + new_pwd + "',Confirm_Password='" + con_pwd + "' where E_Mail='" + mail + "' ";
            st.executeUpdate(str1);
            ss.removeAttribute(mail);
            response.sendRedirect("index.jsp");

        } catch (Exception e) {

        }

    }

}
