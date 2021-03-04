<% 
User user =(User) session.getAttribute("current-user");
    if(user == null)
    {
     session.setAttribute("message", "You have to log in first to access checkout page !!!");
     response.sendRedirect("login.jsp");
     return;
    }
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout Page</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
         <%@include file="components/navbar.jsp" %>
        
        
         <div class="container">
             <div class="row mt-5">
                 <!--------------------cart data------------------------------>
                 <div class="col-md-6">
                     <div class="card">
                      <div class="card-body" style="background-color: #ccff90;">
                          <h3 class="text-center mb-5">Items in your cart</h3>
                          <div class="cart-body">
                              
                          </div>
                      </div>  
                     </div>
                 </div>
                 <!----------------------details form---------------------------->
                 <div class="col-md-6">
                     
                     <div class="card">
                      <div class="card-body" style="background-color: #b9f6ca;">
                          <h3 class="text-center mb-5">Delivery Details</h3>
                          <form action="#!">
                              <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input  type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                              </div>
                              <div class="form-group">
                                <label for="name">Your Name</label>
                                <input  type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name">
                                <small id="emailHelp" class="form-text text-muted">Your name</small>
                              </div>
                              <div class="form-group">
                                <label for="exampleFormControlTextarea1">Enter Address</label>
                                <textarea class="form-control" id="exampleFormControlTextarea1" placeholder="Enter address..." rows="3"></textarea>
                              </div>
                              
                              <div class="container text-center">
                                <!-----  <button class="btn btn-outline-success">Order now</button>----------->
                                <button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#exampleModal">Order now</button>
  
                                <button class="btn btn-outline-primary" onclick="window.location.href ='index.jsp';"><a href="index.jsp">Continue shopping</a></button>
                              </div>
                              
                          </form>
                          
                      </div>  
                     </div>
                     
                     
                 </div>
                 
             </div>
                 
         </div>
        

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
     <div class="modal-header">
       
      </div>
        <div class="modal-body" style="background-color: #ccff90;">
          Your order has been placed successfully :)<br>
          ....<br>
          Thank you for ordering.<br>
          .....<br>
          <h6 style="font-style: italic;">visit again.</h6><br>
      </div>
      <div class="modal-footer">
          
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          
      </div>
    </div>
  </div>
</div>
        <!------------------------ end order now modal--------------------------------->
        
        
        
        
        
        <!-------start-----cart-------->
        <%@include file="components/common_modals.jsp" %>              
           <!-------end-----cart-------->  
    </body>
</html>
