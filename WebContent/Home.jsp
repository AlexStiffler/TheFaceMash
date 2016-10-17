<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.2.1/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.2.1/material.min.js"></script>
<title>TheFaceMash</title>
</head>
<body>

	<!-- Simple header with fixed tabs. -->
	<div
		class="mdl-layout mdl-js-layout mdl-layout--fixed-header
            mdl-layout--fixed-tabs">
		<header class="mdl-layout__header">
		<div class="mdl-layout__header-row">
			<!-- Title -->
			<span class="mdl-layout-title">TheFaceMash</span>
		</div>
		<!-- Tabs -->
		<div class="mdl-layout__tab-bar mdl-js-ripple-effect">
			<a href="#fixed-tab-1" class="mdl-layout__tab is-active">Home</a> <a
				href="#fixed-tab-2" class="mdl-layout__tab">Rating</a> <a
				href="#fixed-tab-3" class="mdl-layout__tab">About</a>
		</div>
		</header>
		<main class="mdl-layout__content"> <section
			class="mdl-layout__tab-panel is-active" id="fixed-tab-1">
		<div class="page-content">

			<div
				style="width: 1080px; margin: auto; text-align: center; margin-top: 35px;">
				<p>
					<strong>Were we let in for our looks? No. Will we be
						judged on them? Yes.</strong>
				</p>

				<h3>Who's Hotter? Click to Choose.</h3>
			</div>

			<%!Random random = new Random();
	int id1 = random.nextInt(50) + 1;
	String imgurl1 = "images/" + id1 + ".jpg";
	int id2 = random.nextInt(50) + 1;
	String imgurl2 = "images/" + id2 + ".jpg";%>

			<!-- HomePage -->
			<form action="TheFacemashHome" method="get">

				<div class="mdl-grid">
					<div class="mdl-layout-spacer"></div>
					<div class="mdl-cell mdl-cell--1-col"></div>
					<div class="mdl-cell mdl-cell--5-col">
						<img src="<%=imgurl1%>" height="320px" width="350px" />
					</div>
					<div class="mdl-cell mdl-cell--1-col"></div>
					<div class="mdl-cell mdl-cell--5-col">
						<img src="<%=imgurl2%>" height="320px" width="350px" />
					</div>
					<div class="mdl-cell mdl-cell--2-col"></div>
					<div class="mdl-cell mdl-cell--2-col">
						<input
							class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored"
							type="submit" name="img1" value="Vote">
					</div>
					<div class="mdl-cell mdl-cell--2-col"></div>
					<div class="mdl-cell mdl-cell--2-col"></div>
					<div class="mdl-cell mdl-cell--2-col">
						<input
							class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored"
							type="submit" name="img2" value="Vote">
					</div>
					<div>
						<input type="hidden" name="id1" value="<%=id1%>">
					</div>
					<div>
						<input type="hidden" name="id2" value="<%=id2%>">
					</div>
				</div>
			</form>
		</div>
		</section> <section class="mdl-layout__tab-panel" id="fixed-tab-2">
		<div class="page-content">
			<!-- Your content goes here -->
		</div>
		</section> <section class="mdl-layout__tab-panel" id="fixed-tab-3">
		<div class="page-content">
			<div
				style="width: 1080px; margin: auto; text-align: center; margin-top: 35px;">
				<p>
					<strong>Facemash, the Facebook's predecessor, opened on
						October 28, 2002. Initially, the website was invented by a Harvard
						student, Mark Zuckerberg, and three of his classmates - Andrew
						McCollum, Chris Hughes and Dustin Moskovitz. Zukerberg wrote the
						software for the facemash website when he was in his second year
						of college. The website was set up as a type of "hot or not" game
						for Harvard students. The website allowed visitors to compare two
						student pictures side-by-side and let them decide who was hot or
						not.</strong>
				</p>
				<hr>
				<p>
					<strong>This is my try to reimplement it using Google's
						Material Design Lite front end framework. </strong>
				</p>
			</div>
		</div>
		</section> </main>

	</div>

</body>
</html>