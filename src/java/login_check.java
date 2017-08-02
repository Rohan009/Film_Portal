/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.awt.event.WindowEvent;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
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
public class login_check extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String uname = request.getParameter("mail");
        String pwd = request.getParameter("password");

        try {
            ServletContext ctx=getServletContext();  
    Connection C1=(Connection)ctx.getAttribute("mycon");
            Statement st = C1.createStatement();
            String query = "select * from registration where E_mail='" + uname + "' and Password='" + pwd + "'";
            ResultSet rs = st.executeQuery(query);
            HttpSession session = request.getSession();
            

            int uid=0;
            String ut="";

            if (rs.next()) {
                ut = rs.getString("user_type");
                uid = rs.getInt("user_id");
               
                session.setAttribute("usertype", ut);
              session.setAttribute("userid", uid);
                
               

            } else {
                response.sendRedirect("login.jsp?login=fail");
            }
            
            if(ut.equals("0"))
            {
                response.sendRedirect("index.jsp?ut=0&uid="+uid);
            }
            if(ut.equals("1"))
            {
             
                 response.sendRedirect("distributor_data.jsp?u="+uid);
            }

//            
//           if(rs.next())
//           {
//              check=1;
//           }
//           
//           if(check==1)
//           {
//               session.setAttribute("username",uname);
//               response.sendRedirect("Film_infos.jsp");
//           }
        } catch (Exception e) {

        }

//        response.sendRedirect("Film_infos.jsp");
    }

}
