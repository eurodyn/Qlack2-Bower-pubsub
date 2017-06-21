<html>
<head>
	<link rel="stylesheet"
				href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
				integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
				crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
					integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
					crossorigin="anonymous"></script>
	<script src="qlack2-bower-pubsub.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore-min.js"></script>

	<script>
		window.onload = function () {
			QPubSub.init("server", true, ["http://localhost:8080", "http://localhost:9080"]);

			QPubSub.subscribe("server-channel", function(msg) {
			  console.debug(msg);
				var textArea = document.getElementById('server_list');
				var textArray = textArea.value.split("\n");
				textArray[textArray.length] = msg.msg + "[" + msg.originalClientID + "]";
				textArea.value = textArray.join("\n");
			});
		};
	</script>

	<style>
		body {
			margin-top: 60px;
		}
	</style>
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">PubSub test app1</a>
		</div>
	</div>
</nav>

<div class="container">

	<div class="starter-template">
		<h1>Hosting app</h1>
		<p class="lead">Demo<p>
		<p>You can try different scenarios:<p>
		<ul>
			<li><a href="index.jsp">demo1</a>: Hosting app and IFrame1 + IFrame2 hosted under the same context, referenced with relative URLs</li>
			<li><a href="index2.jsp">demo2</a>: Hosting app and IFrame1 + IFrame2 hosted under the same context, referenced with absolute URLs</li>
			<li><a href="index3.jsp">demo3</a>: Hosting app and IFrame1 hosted under the same context, IFrame2 hosted under a different context with absolute URL</li>
			<li><a href="index4.jsp">demo4</a>: Hosting app and IFrame1 hosted under the same context, IFrame2 hosted under a different context with relative URL</li>
			<li><a href="index5.jsp">demo5</a>: Hosting app in one context, IFrame1 + IFrame2 in another context, absolute URLs</li>
			<li><a href="index6.jsp">demo6</a>: Hosting app in one context, IFrame1 + IFrame2 in another context, relative URLs</li>
		</ul>
		<br>
	</div>

	<div class="row">
		<div class="col-md-4">
			<h1 style="margin-top:0">Server channel</h1>
			<p>
				<button type="button" class="btn btn-default"
								onclick="QPubSub.publish('frame1-channel', 'Hello from Server')">Post to Frame 1</button>
				<button type="button" class="btn btn-default"
								onclick="QPubSub.publish('frame2-channel', 'Hello from Server')">Post to Frame 2</button>
			</p>
			<textarea id="server_list" style="width: 100%; height: 400px;"></textarea>
		</div>
