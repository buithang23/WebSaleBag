/**
 * 
 */
$(document).ready(function() {
	cartfunction = function(id,name,price,img){
		var pricenew = parseFloat(price);
		var content = document.getElementById('checkout_items').innerHTML;
		document.getElementById('checkout_items').innerHTML = Number(content) + 1;
		console.log(typeof(pricenew))
	    $.ajax({
	      type: "GET",
	      url: "/WebBag/insertProduct.htm",
	      data: {
	        id: id,
	        name: name,
			price: pricenew,
			img: img,
	      },
	      success: function (result) {
				
	      },
	    });
	}
});
  