$(document).ready(function() {

  login = function () {
	var emaillog = document.getElementById("emaillogin").value;
    var passwordlog = $("#passwordlogin").val();
	console.log(emaillog)
    $.ajax({
      url: "/WebBag/login",
      type: "GET",
      data: {
        emaillogin : emaillog,
        pswdlogin : passwordlog
      },
      success: function( ) {

      },
    });
	};
});
