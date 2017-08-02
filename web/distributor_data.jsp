<%-- 
    Document   : distributor_data
    Created on : 13 Jul, 2017, 5:45:24 PM
    Author     : Lenovo
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Distributor Page</title>
    </head>
    <body>
  
        
        <jsp:include page="menu.jsp"/>
        
        <%  
         ServletContext ctx=getServletContext();  
    Connection C1=(Connection)ctx.getAttribute("mycon");
            Statement st = C1.createStatement();
            String id=request.getParameter("u");
            String query="select * from film_information where user_id='"+id+"' and film_upload=1";
            ResultSet rs=st.executeQuery(query);
            session.setAttribute("userid",id);
        
        %>
        <div id="page-content-wrapper">  
                <div class="container">
         
                   
                    <h4>Your Trailers</h4>
                        <div>

                         <% while (rs.next()) { %>

                            <div class=trailer_list_item>
                                <a href='film_edit.jsp?fid=<%out.println(rs.getString("Film_id"));%>'>
                                    <img src="<% out.println(rs.getString("Poster_Path")); %>" alt="Poster" style="height:177px !important;width:125px !important;">
                                </a>
                                <a href="film_edit.jsp?fid=<% out.println(rs.getString("Film_id"));%>"><h6><% out.println(rs.getString("Film_Title")); %></h6></a>
                                <span class=distributor-name><% out.println(rs.getString("Genre")); %></span><br>
                                <span class=release-date>Release Date: <% out.println(rs.getString("Cinema_Start")); %></span>
                            </div>

                            <%  }%>

                        </div>
                    
          </div>
                </div>     
    </body>
</html>
