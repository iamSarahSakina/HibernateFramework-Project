<%@page import="com.mycompany.book.entities.User"%>
<%
    User user =(User) session.getAttribute("current-user");
    if(user == null)
    {
     session.setAttribute("message", "You have to log in first !!!");
     response.sendRedirect("login.jsp");
     return;
    }
    else
    {
    if(user.getUserType().equals("admin"))
    {
    session.setAttribute("message", "You do not have permission to access this page!!!");
    response.sendRedirect("login.jsp");
    return;
    }
    }    


    %>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Normal login Page</title>
    </head>
    <body>
        <h1>Hello User!</h1>
    </body>
</html>
