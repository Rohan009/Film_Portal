<%-- 
    Document   : test
    Created on : 29 Jun, 2017, 3:35:21 PM
    Author     : Lenovo
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        
    </head>
       
    <body>
        
        <%
              ServletContext ctx=getServletContext();  
    Connection C1=(Connection)ctx.getAttribute("mycon");
            
            
            Statement st2 = C1.createStatement();
            
             String searchquery="select Film_Title from film_information";
            ResultSet rs_search=st2.executeQuery(searchquery);
            
             ArrayList mylist = new ArrayList();
            while (rs_search.next())
            {
                mylist.add("\""+rs_search.getString("Film_Title")+"\"");
            }
            mylist.toArray().toString();
            out.println(mylist);
            
            
            
            %>
    </body>
</html>
