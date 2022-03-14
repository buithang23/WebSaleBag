/**
 * 
 */
$(document).ready(function() {
	Deletefunction = function(id){
		var html = document.querySelector("#detele")
		html.remove();
		console.log(html)
	    $.ajax({
	      type: "GET",
	      url: "/WebBag/deleteProduct.htm",
	      data: {
	        id: id,
	      },
	      success: function (result) {
				
	      },
	    });

	}

      Editfunction = function (id,name,gender,description,price,img) {
		console.log(name)
		document.getElementById('name').value = name
		document.getElementById('description').value = description
		document.getElementById('price').value = price
		document.getElementById('idproduct').value = id;
		var a = document.getElementById('idproduct').value
		console.log(a)
		 var image = document.getElementById('img').src="./resources/images/"+img;
	
		if(gender==="Men"){
			$('#select option[value=Men]').attr('selected','selected');
		}else{
			$('#select option[value=Women]').attr('selected','selected');
		}
		
	      document.getElementById("form1").style.display = "block";
	      document.getElementById("form2").style.display = "none";

      
     };
     Updatefunction = function () {
		var id = document.getElementById('idproduct').innerText;
		var productname = document.getElementById('name').value;
		var description = document.getElementById('description').value;
		var price = document.getElementById('price').value = price
  		var img = document.getElementById('imgvalue').value;
		var gender = $('#select').find(":selected").text();

		console.log(gender);
	      document.getElementById("form1").style.display = "none";
	      document.getElementById("form2").style.display = "block";
     };
	insertfunction = function(){
		var id = document.getElementById('productid2').innerText;
		var productname = document.getElementById('productname2').value;
		var description = document.getElementById('description2').value;
		var price = document.getElementById('price2').value
  		var img = document.getElementById('imgvalue2').value;
		var gender = document.getElementById('checked2').value;
		var type = document.getElementById('checked3').value;
		console.log(id)
		console.log(productname)
		console.log(description)
		console.log(price)
		console.log(img)
		console.log(gender)
		console.log(type)
			    $.ajax({
	      type: "GET",
	      url: "/WebBag/insert.htm",
	      data: {
			producttype: type,
			gender: gender,
			description: description,
			price: price,
			img: img,
	        id: id,
			productname: productname,

	      },
	      success: function (result) {
				
	      },
	    });
	}
	
});
  