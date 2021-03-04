<%@page import="com.mycompany.book.helper.Helper"%>
<%@page import="com.mycompany.book.entities.Category"%>
<%@page import="com.mycompany.book.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.book.entities.Product"%>
<%@page import="com.mycompany.book.dao.ProductDao"%>
<%@page import="com.mycompany.book.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <!-------start----of image part-------->
             
        
        
        <br>
        <div id="">
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                  <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                  <div class="carousel-item active">
                      <img class="d-block w-100" src="img/slides/ib1.jpeg" height="600px" alt="First slide">
                      <div class="carousel-caption d-none d-md-block">
                          <h5 style="color: black;">“If you don’t like to read, you haven’t found the right book.”</h5>
                        <p>– J.K. Rowling</p>
                      </div>
                  </div>
                  <div class="carousel-item">
                    <img class="d-block w-100" src="img/slides/ib2.jpg" height="600px" alt="Second slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h5 style="color: black;">“There is more treasure in books than in all the pirate’s loot on Treasure Island.”</h5>
                        <p>– Walt Disney</p>
                      </div>
                  </div>
                  <div class="carousel-item">
                    <img class="d-block w-100" src="img/slides/ib3.jpg" height="600px" alt="Third slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h5 style="color: black;">“If there is a book that you want to read, but it hasn’t been written yet, you must be the one to write it.”</h5>
                        <p>– Toni Morrison</p>
                      </div>
                  </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="sr-only">Next</span>
                </a>
              </div>
        </div>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
           <!-------end----of image part------>  
        
        
        
        <div class="container-fluid">
            
        
        <div class="row mt-3 mx-2">
            
            <%
                //for url name
               String cat=request.getParameter("category");
                //out.println(cat);
                //end-------for url name
                
               ProductDao dao = new ProductDao(FactoryProvider.getFactory());
               List<Product> list=null;
               //initial(run/load)page
               if(cat==null || cat.trim().equals("all"))
               {
                  list=dao.getAllProducts();
                  
               }else{
                  int cid=Integer.parseInt(cat.trim());
                  list=dao.getAllProductsById(cid);
               }
               
               
               
               CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
               List<Category> clist = cdao.getCategories();
              %> 
               
           
            <!----------show categories------>
            <div class="col-md-2">
               
                <div class="list-group mt-4">
                    
                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                        All Products
                    </a>
                    
                    
                    
                
                
                <% 
                  for (Category c : clist){
                      %>
                      
                      
                      <a href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle()  %></a>
                     
                     <%
                  }
                %>
                
                </div>
            </div>
            
            <!------------show product-------->
             
            <div class="col-md-10">
                
               <!-----row------>
               <div id="products" class="row mt-4">
                   <div class="col-md-12">
                       <div class="card-columns" ><!----------card-deck---------->
                           <!-------traversing products-------->
                           
                           <%  
                              for(Product p:list){
                           %>
                           
                           <div class="card product-card">
                               <div class="container text-center">
                                   <img class="card-img-top" src="img/products/<%=p.getpPhoto() %>" style="max-heigth: 200px;max-width: 100%;width: auto;" alt="Card image cap">
                               </div>
                               <div class="card-body">
                                   <h5 class="card-title" style="color:#660033 ;"><%= p.getpName() %></h5>
                                   <h6 class="card-title" style="font-style: italic; color:#b30059 ;"> <%= p.getpAuthor() %></h6>
                                   <h6 class="card-title" style="color:#b30059 ;">&#8377;. <%= p.getpPrice() %></h6>
                                   
                                   
                                   <!-------------desc code comes here------------------->
                                   
                               </div>
                                   <div class="card-footer text-center">
                                       <button class="btn custom-bg text-white" onclick="add_to_cart(<%=p.getpId()%>,'<%=p.getpName()%>',<%=p.getpPrice()%>)">Add to cart</button>
                                       
                                       <button class="btn btn-warning"  onclick="window.location.href = 'view.jsp';add_to_view( <%=p.getpId()%>, '<%=p.getpName()%>', '<%=p.getpAuthor()%>', <%=p.getpYear()%>, <%=p.getpPrice()%>, '<%=p.getpPhoto()%>', '<%=p.getpDesc()%>');">View</button>
                                       
                                       
                                       
                                       
                                   </div>
                           </div>
                           
                           <% } 
                           
                           if(list.size() == 0)
                            {
                               out.println("<h3>No item add yet..<h3>");
}
                           
                           %>
                           
                       </div>
                   </div>
                   
               </div>
              
            </div>
            
            <!-------end-----show product-------->
        </div>
        </div>   
              <!-------start-----view button-------->
            
           <!-------end-----view-------->                
           
                      
           
           
           
           
           
           
           
           
           
           
           
           
           
           
                           
                           
                           
        <!-------start-----cart-------->
        <%@include file="components/common_modals.jsp" %>              
           <!-------end-----cart-------->      
           
           
           
           <!-------start-----cart-------->
          
        <%@include file="components/common_footer.jsp" %>              
           <!-------end-----cart-------->  
    </body>
</html>
