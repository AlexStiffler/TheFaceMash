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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

			<!-- HomePage -->
			<form action="TheFacemashHome" method="get">
				<div class="mdl-grid">
					<div class="mdl-layout-spacer"></div>
					<div class="mdl-cell mdl-cell--1-col"></div>
					<div class="mdl-cell mdl-cell--5-col">
						<img src=${url1 } />
					</div>
					<div class="mdl-cell mdl-cell--1-col"></div>
					<div class="mdl-cell mdl-cell--5-col">
						<img src=${url2 } />
					</div>
					<div class="mdl-cell mdl-cell--2-col"></div>
					<div class="mdl-cell mdl-cell--2-col">
						<input
							class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored"
							type="submit" name="g1" value="Vote">
					</div>
					<div class="mdl-cell mdl-cell--2-col"></div>
					<div class="mdl-cell mdl-cell--2-col"></div>
					<div>
						<input
							class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored"
							type="submit" name="g2" value="Vote">
					</div>
					<div>
						<input type="hidden" name="id1" value=${id1}>
					</div>
					<div>
						<input type="hidden" name="id2" value=${id2}>
					</div>
				</div>
			</form>
		</div>
		</section> <section class="mdl-layout__tab-panel" id="fixed-tab-2">
		<div class="page-content">
			<!-- Ratings Tab -->
			<div class="mdl-grid">
				<div class="mdl-layout-spacer"></div>
				<div class="mdl-cell mdl-cell--8-col">

					<table
						class="mdl-data-table fullwidth mdl-js-data-table mdl-shadow--2dp">
						<thead>
							<tr>
								<th>Rank</th>
								<th>Face</th>
								<th class="mdl-data-table__cell--non-numeric fullwidth">Name</th>
								<th>Votes</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${tab}" var="fr">
								<tr>
									<td>${fr.rank}</td>
									<td><img src=${fr.url
										}
										style="border-radius: 50%; width: 50px; height: 50px;" /></td>
									<td class="mdl-data-table__cell--non-numeric">${fr.name}</td>
									<td>${fr.votes}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="mdl-layout-spacer"></div>
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