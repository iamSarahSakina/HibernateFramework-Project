function add_to_view(pid,pname,pauthor,pyear,price,pimage,pdesc)
{
    let view=localStorage.getItem("view");
    
    let product={productId:pid, productName:pname, productAuthor:pauthor, productYear:pyear, productPrice:price, productImage:pimage, productDesc:pdesc};
    localStorage.setItem("view", JSON.stringify(product));
}

function updateView()
{
    let viewString=localStorage.getItem("view"); //viewString -it is string
    let view=JSON.parse(viewString);             //view - it is object
 
    let image=`
        
        
        
                <img src="img/products/${view.productImage}"
                  class="img-fluid z-depth-1">
        
        
   
           `;
    $(".zero").html(image);
    
    let data=`<h2>${view.productName}</h2>
       <p  style="display:inline;">by. </p><h4 style="display:inline; font-style: italic; color:#b30059 ;" >${view.productAuthor}</h4><br><br>
       <p  style="display:inline;">Published year: </p><h6  style="display:inline; color: #b30000; ">${view.productYear}</h6>
      
      <p class="mb-2 text-muted text-uppercase small"></p>
      
     
      <h4><span class="mr-1"><strong> &#x20B9;. ${view.productPrice}</strong></span></h4>
      <p style="color: #ff6f00;">inclusive of all taxes</p>
      <p>free delivery</p>
      
      <br/>
      
      <button type="button" class="btn btn-primary " onclick="window.location.href = 'checkout.jsp';">Buy now</button>
      <button class="btn btn-warning" onclick="add_to_cart(${view.productId},'${view.productName}',${view.productPrice})">Add to cart</button>
      
    

      `;
    $(".one").html(data);
    
    let detail=`
        <p class="pt-1"><strong>Details: </strong>${view.productDesc}</p>

`;
   $(".details").html(detail); 
}

$(document).ready(function(){
    updateView()
})

