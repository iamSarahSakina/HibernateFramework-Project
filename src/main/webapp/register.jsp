<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register page</title>
        
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            
            <div class="row mt-5">
            <div class="col-md-4 offset-md-4">
                <%@include file="components/message.jsp" %>
                <h3 class="text-center my-3">Sign up here</h3>
                
                <form action="RegisterServlet" method="post">
                   
                    <div class="form-group">
                        <label for="name">Enter Name</label>
                        <input name="user_name" type="text" class="form-control" id="name" placeholder="may i know ur name" aria-describedby="emailHelp" >
                    </div>
                    
                    <div class="form-group">
                        <label for="email">Enter Email</label>
                        <input name="user_email" type="email" class="form-control" id="email" placeholder="may i know ur email" aria-describedby="emailHelp" >
                    </div>
                    
                    <div class="form-group">
                        <label for="password">Enter Password</label>
                        <input name="user_password" type="password" class="form-control" id="password" placeholder="shh..." aria-describedby="emailHelp" >
                    </div>
                    
                    <div class="form-group">
                        <label for="phone">Enter Phone Number</label>
                        <input name="user_phone" type="number" class="form-control" id="phone" placeholder="10 digit" aria-describedby="emailHelp" >
                    </div>
                    
                    <div class="form-group">
                        <label for="password">Enter Address</label>
                        <textarea name="user_address" class="form-control" placeholder="enter ur Address"></textarea>
                    </div>
                    
                    
                    
                    <div class="container text-center">
                        <button class="btn btn-outline-success">Register</button>
                        <button class="btn btn-outline-warning">Reset</button>
                        
                    </div>
                    
                </form>
                
            </div>   
            </div>
            
        </div>
        
        
        
        
                
                
                <!-------start-----cart-------->
        <%@include file="components/common_modals.jsp" %>              
           <!-------end-----cart-------->    
                
    </body>
</html>
