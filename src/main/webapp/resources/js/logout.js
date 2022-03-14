/**
 * 
 */
$(document).ready(function() {
	logout = function() {
	    $.ajax({
	      type: "GET",
	      url: "/WebBag/logout.htm",
	      success: function (result) {
	      },
	    });
	}



});
  