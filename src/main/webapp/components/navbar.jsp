<%@page import="com.mycompany.book.entities.User"%>
<%
    User user1 =(User) session.getAttribute("current-user");
    %>



<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
    <div class="container">
        
        <a class="navbar-brand" href="index.jsp" class="px-5" ><h2 style="font-family: Copperplate, Papyrus, fantasy;">Insight</h2></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav  mr-auto">
        
      <li class="nav-item active">
          <a class="nav-link" href="index.jsp" style="color: black;">Home <span class="sr-only">(current)</span></a>
        
               
      </li>
      
     <!-------------<li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Category
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>------------------->
      
      <li class="nav-item ">
        <a class="nav-link" href="#products" style="color: black;">Products</a>
      </li>
      
      <li class="nav-item ">
        <a class="nav-link" href="#About" style="color: black;">About</a>
      </li>
      
      <li class="nav-item ">
        <a class="nav-link" href="#Contact" style="color: black;">Contact us</a>
      </li>
      
      
      <li class="nav-item ">
        <a class="nav-link" href="#Design" style="color: black;">Designed by</a>
      </li>
      
    </ul>
    
      <ul class="navbar-nav ml-auto" >
          
          <li class="nav-item active">
              <a class="nav-link" href="#!" data-toggle="modal" data-target="#cart"><i class="fa fa-cart-plus" style="font-size: 25px; "></i><span class="cart-items">(0)</span></a>
          </li>
          
          
          <%
              if(user1==null)
              {
                  %>
                  
                 <li class="nav-item active">
                 <a class="nav-link" href="login.jsp">Login </a>
                 </li>
                 <li class="nav-item active">
                 <a class="nav-link" href="register.jsp">Register </a>
                 </li>
                  
                  
                  <%
              }
              else
              {
              
               %>
               
               <li class="nav-item active">
                   <a class="nav-link" href="#!"> <%= user1.getUserName() %> </a>
               </li>
               <li class="nav-item active">
                  <a class="nav-link" href="LogoutServlet">Logout</a>
               </li>
               
               <%
              }
              

              %>
          
          
          
          
      
      </ul>
      
  </div>
    </div>
</nav>
