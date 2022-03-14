/**
 * 
 */
$(document).ready(function() {
	Tongtien();
	
	function Tongtien(){
		var tongtiensp = 0.0;
		$(".price").each(function(index){
			var find = "total"+index;
			var giatien = document.getElementById(find).innerHTML;
			console.log(giatien)
			tongtiensp = parseFloat(tongtiensp) + parseFloat(giatien);
			console.log(tongtiensp)
			document.getElementById('totalprice').innerHTML = tongtiensp

		});
	};
	

	Deletefunction = function(id){
		var html2 = document.querySelector("#xoagiohang")
				console.log(html2)
		html2.remove(); 
		var content = document.getElementById('checkout_items').innerHTML; // giảm giỏ hàng khi xoa
		document.getElementById('checkout_items').innerHTML = Number(content) - 1;

	    $.ajax({
	      type: "GET",
	      url: "/WebBag/deleteSP.htm",
	      data: {
	        id: id,
	      },
	      success: function (result) {
				
	      },
	    });
	}
	login = function(){
		alert("Bạn Chưa Đăng Nhập Mời Đăng Nhập")
	}
	thanhtoan = function(){
		alert("Cảm Ơn Bạn Đã Mua Hàng Mời Kiểm Tra Email")
		var totalpricce = document.getElementById('totalprice').innerHTML;
		console.log(totalpricce);
	    $.ajax({
	      type: "GET",
	      url: "/WebBag/buySP.htm",
		  data:{
			totalprice: totalpricce,
			},
	      success: function (result) {
				
	      },
	    });
	}
});
  