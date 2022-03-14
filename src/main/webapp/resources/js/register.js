/**
 * 
 */
$(document).ready(function() {
	$("#btnSignup").click(function () {
		let username = $("#username").val();
	    let email = $("#email").val();
	    let password = $("#pswdl").val();
    $.ajax({
      url: "/WebBag/register.htm",
      type: "POST",
      data: {
		username: username,
        email: email,
        pswd: password,
      },
      success: function (value) {
		console.log(value);
		var duongdanlogin = window.location.href;
		window.location = duongdanlogin;
      },
    });
  });
});
  