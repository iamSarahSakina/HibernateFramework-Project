<%@page import="java.util.Map"%>
<%@page import="com.mycompany.book.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.book.entities.Category"%>
<%@page import="com.mycompany.book.dao.CategoryDao"%>
<%@page import="com.mycompany.book.helper.FactoryProvider"%>
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
    if(user.getUserType().equals("normal"))
    {
    session.setAttribute("message", "You do not have permission to access this page!!!");
    response.sendRedirect("login.jsp");
    return;
    }
    }
    

    %>
<!------- category list------->

<% 
   CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
   List<Category> list=cdao.getCategories();
     
   //getting count from helper class
  Map<String,Long>m = Helper.getCounts(FactoryProvider.getFactory());
 %>
    
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin login Page</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        
        <%@include file="components/navbar.jsp" %>
        
        <div class="container admin">
            
            <!---start success msg for add category----->
            <div class="container-fluid mt-3">
                
                <%@include file="components/message.jsp" %>
                
            </div>
            <!---end success msg for add category----->
            
            
            <div class="row mt-3">
                <!---first col--->
                <div class="col-md-4">
                    <div class="card" >
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/users.png" alt="user-icon">
                            </div>
                            
                            <h1><%=m.get("userCount")%></h1>
                            <h1 class="text-uppercase text-muted">Users</h1>
                        </div>
                    </div>
                    
                    
                </div>
                <!---2nd col--->
                <div class="col-md-4">
                    
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/categories1.png" alt="user-icon">
                            </div>
                            
                            <h1><%=list.size()%></h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>
                    
                </div>
                <!---3rd col--->
                <div class="col-md-4">
                    
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/product.png" alt="user-icon">
                            </div>
                            
                            <h1><%=m.get("productCount")%></h1>
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div>
                    
                    
                </div>
                
            </div>
            
            <!----2nd row---->
            <div class="row mt-3">
                
                <!----1st col---->
                <div class="col-md-6">
                    
                    
                     <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/add_category.png" alt="user-icon">
                            </div>
                            
                            <p class="mt-2">click here to add new category</p>
                            <h1 class="text-uppercase text-muted">Add Category</h1>
                        </div>
                    </div>
                    
                    
                </div>
                <!----2nd col---->
                <div class="col-md-6">
                    
                    
                     <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/products/add_product1.png" alt="user-icon">
                            </div>
                            
                            <p class="mt-2">click here to add new product</p>
                            <h1 class="text-uppercase text-muted">Add Product</h1>
                        </div>
                    </div>
                
                    
                </div>
          
            </div>
          
            
        </div>
        
        <!----  start add category  modal (pop up)----->
        
        

        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
              <div class="modal-header custom-bg text-white">
                <h5 class="modal-title" id="exampleModalLabel">FILL CATEGORY DETAILS</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                
                 
                  <form action="ProductOperationServlet" method="post">
                      
                      <input type="hidden" name="operation" value="addcategory">
                      
                      <div class="form-group">
                          <input type="text" class="form-control" name="catTitle" placeholder="Enter category" required />
                      </div>
                      
                      <div class="form-group">
                          <textarea style="height: 300px" class="form-control" placeholder="Enter category description" name="catDescription" required></textarea>
                      </div>
                      
                      <div class="container text-center">
                          
                          <button class="btn btn-outline-success">Add Category</button>
                          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                          
                      </div>
                      
                      
                      
                  </form>
                  
                  <a href="index.jsp"></a>
              </div>
              
            </div>
          </div>
        </div>
        
        <!----  end add category  modal (pop up)----->
        <!-------------==============================================-------------->
        <!----  start add product  modal (pop up)----->
        

            <!-- Modal -->
            <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                 <!----------start add product form-------->
                 <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                     <input type="hidden" name="operation" value="addproduct"/>
                     
                     
                     
                     
                     
                     
                     <div class="form-group">
                         
                         <input type="text" class="form-control" placeholder="Enter Book Title" name="pName" required />
                      
                     </div>
                     
                     <div class="form-group">
                         
                         <input type="text" class="form-control" placeholder="Enter Author name" name="pAuthor" required />
                      
                     </div>
                     
                     <div class="form-group">
                    
                         <input type="number" class="form-control" placeholder="Enter Published Year" name="pYear" required />
                      
                     </div>
                     
                     
                     <div class="form-group">
                         <textarea style="height:150px;" class="form-control" placeholder="Enter product Description" name="pDesc"></textarea>
                     
                     </div>
                     <div class="form-group">
                    
                         <input type="number" class="form-control" placeholder="Enter Product Price" name="pPrice" required />
                      
                     </div>
                     <!----<div class="form-group">
                    
                         <input type="number" class="form-control" placeholder="Enter Product Discount" name="pDiscount" required />
                      
                     </div>
                     <div class="form-group">
                    
                         <input type="number" class="form-control" placeholder="Enter Product Quantity" name="pQuantity" required />
                      
                     </div>---->
                     
                     
                     
                     
                     
                     
                     <div class="form-group">
                         <label for="catId">Select Category the Product belongs to: </label>
                         <br>
                         <select name="catId" class="form-control" id="catId">
                             
                             <% 
                             for(Category c:list ){
                             %>
                             <option value="<%= c.getCategoryId() %>"><%= c.getCategoryTitle() %></option>
                             
                             <% } %>
                             
                         </select>
                         
                      
                     </div>
                     <div class="form-control">
                         <label for="pPic">Select Picture of Product</label>
                         <br>
                         <input type="file" id="pPic" name="pPic" required/>
                     </div>
                     
                      <div class="container text-center mt-3">
                          
                          <button class="btn btn-outline-success">Add Product</button>
                          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                          
                      </div>
                     
                 </form>
                      
                      
                      
                      
                      
                     <!----------end add product form--------> 
                  </div>
                  
                </div>
              </div>
            </div>

        
        <!----  end add product modal (pop up)----->
        
        <!-------start-----cart-------->
        <%@include file="components/common_modals.jsp" %>              
           <!-------end-----cart-------->  
    </body>
</html>
