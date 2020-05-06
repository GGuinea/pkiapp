<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>

<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="862838389425-l3n518fj9ge39nqnipqcu35qsucjhqtv.apps.googleusercontent.com">

<title>Servlet OAuth</title>
</head>
<body>
	<h2>Servlet OAuth</h2>
	<br>
	<div class="g-signin2" data-onsuccess="onSignIn"></div>

	<script>
		//google callback. This function will redirect to our login servlet
		function onSignIn(googleUser) {
			var profile = googleUser.getBasicProfile();
			console.log('ID: ' + profile.getId());
			console.log('Name: ' + profile.getName());
			console.log('Image URL: ' + profile.getImageUrl());
			console.log('Email: ' + profile.getEmail());
			console.log('id_token: ' + googleUser.getAuthResponse().id_token);

			var redirectUrl = 'hello';

			var form = $('<form action="' + redirectUrl + '" method="post">'
					+ '<input type="text" name="id_token" value="'
					+ googleUser.getAuthResponse().id_token + '" />'
					+ '</form>');
			$('body').append(form);
			form.submit();
		}

		function statusChangeCallback(response) {
			console.log('statusChangeCallback');
			console.log(response);
			if (response.status === 'connected') {
				testAPI();
			} else if (response.status === 'not_authorized') {
				document.getElementById('status').innerHTML = 'Login with Facebook ';
			} else {
				document.getElementById('status').innerHTML = 'Login with Facebook ';
			}
		}
		function checkLoginState() {
			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});
		}
		window.fbAsyncInit = function() {
			FB.init({
				appId : '654660768430587',
				cookie : true,
				xfbml : true, 
				version : 'v2.2' 
			});

			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});
		};
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_US/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));

		function testAPI() {
			console.log('Welcome! Fetching your information.... ');
			FB.api('/me?fields=name,email', function(response) {
				console.log('Successful login for: ' + response.name);

				document.getElementById("status").innerHTML = '<p>Welcome '
						+ response.name
						+ '! <a href=fbLogin.jsp?user_name='
						+ response.name.replace(" ", "_") + '&user_email='
						+ response.email
						+ '>Continue with facebook login</a></p>'
			});
		}
	</script>
		<br>
		<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
		</fb:login-button>
		<div id="status"></div>
		<script type="text/javascript">
			
		</script>
</body>
</html>