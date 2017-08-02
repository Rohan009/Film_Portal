import java.sql.Connection; 
import java.sql.DriverManager; 
import java.sql.SQLException; 
import java.util.logging.Level; 
import java.util.logging.Logger; 
import javax.servlet.ServletContext; 
import javax.servlet.ServletContextEvent; 
import javax.servlet.ServletContextListener; 
public class ConnectionDatabase implements ServletContextListener { 

Connection con=null; 
public void contextInitialized(ServletContextEvent event) { 


String driver=event.getServletContext().getInitParameter("driver"); 
String jdbcURL=event.getServletContext().getInitParameter("jdbcURL"); 
String userName=event.getServletContext().getInitParameter("userName"); 
String password="";
try{ 
Class.forName(driver); 
con=DriverManager.getConnection(jdbcURL, userName,password); 
event.getServletContext().setAttribute("mycon",con); 
//System.out.println("DB Object get's Created"); 
} 
catch(Exception e) 
{ 
e.printStackTrace(); 
} 


} 


public void contextDestroyed(ServletContextEvent sce) { 
try { 
con.close(); 
} catch (SQLException ex) { 
System.out.println("Exception in Litener ....."); 
} 
} 
} 
//
// <div id="page-content-wrapper">  
//                <div class="container">
//         
//                   
//                    <h4>Your Trailers</h4>
//                        <div>
//
//                         <% while (rs.next()) { %>
//
//                            <div class=trailer_list_item>
//                                <a href='film_edit.jsp?fid=<%out.println(rs.getString("Film_id"));%>'>
//                                    <img src="<% out.println(rs.getString("Poster_Path")); %>" alt="Poster" style="height:177px !important;width:125px !important;">
//                                </a>
//                                <a href="film_edit.jsp?fid=<% out.println(rs.getString("Film_id"));%>"><h6><% out.println(rs.getString("Film_Title")); %></h6></a>
//                                <span class=distributor-name><% out.println(rs.getString("Genre")); %></span><br>
//                                <span class=release-date>Release Date: <% out.println(rs.getString("Cinema_Start")); %></span>
//                            </div>
//
//                            <%  }%>
//
//                        </div>
//                    
//          </div>
//                </div>     