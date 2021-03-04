package com.mycompany.book.servlets;

import com.mycompany.book.dao.UserDao;
import com.mycompany.book.entities.User;
import com.mycompany.book.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            
            
            
            //coding area
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            
            //vlidation area
            
            //authenticate user
            UserDao userDoa=new UserDao(FactoryProvider.getFactory());
            User user =userDoa.getUserByEmailAndPassword(email, password);
            //  System.out.println(user);
            HttpSession httpSession = request.getSession();
          if(user==null)
          {
          
          httpSession.setAttribute("message", "Invalid Details !! Try Again");
          response.sendRedirect("login.jsp");
          return;
          
          }else{
             out.println("<h1> Welcome "+ user.getUserName()+"</h1>");
             //login
             httpSession.setAttribute("current-user", user);
             //admin.jsp
             if(user.getUserType().equals("admin"))
             {
               response.sendRedirect("admin.jsp");
              }
                          //normal.jsp

             else if(user.getUserType().equals("normal"))
             {
               response.sendRedirect("index.jsp");     //normal.jsp
              }
             else
             {
               out.println("Un-identifiable User Type");
             }
             
           
          }
          
            
        }
    }

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
        processRequest(request, response);
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
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
