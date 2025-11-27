<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.tap.model.Restaurant"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Foodly | Offers</title>

<link rel="stylesheet" href="Styles/offers.css?v=12">
<link href="https://cdn-icons-png.flaticon.com/128/14063/14063185.png"
	rel="icon" />
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet" />

</head>

<body>

	<%
	String loggedUser = (String) session.getAttribute("userName");
	%>

	<!-- NAVBAR -->
	<nav class="main-nav">

		<div class="nav-left">
			<div class="logo">🍔 Foodly</div>
		</div>

		<div class="nav-center">
			<ul>
				<li><a href="home.jsp">Home</a></li>
				<li><a href="restaurant">Restaurants</a></li>
				<li><a href="offers.jsp">Offers</a></li>
				<li><a href="help.jsp">Help</a></li>
			</ul>
		</div>

		<div class="nav-right">
			<%
			if (loggedUser == null) {
			%>
			<a href="login.jsp" class="nav-btn">Login</a> 
			<%
			} else {
			%>
			<span class="welcome">Welcome, <%=loggedUser%> 👋
			</span> <a href="logout" class="nav-btn logout-btn">Logout</a>
			<%
			}
			%>
		</div>

	</nav>

	<main>

		<h2 class="section-title">Exclusive Offers</h2>
		<p class="section-subtitle">Special deals based on restaurants</p>

		<div class="offer-grid">

			<%
			List<Restaurant> list = (List<Restaurant>) request.getAttribute("restaurantList");

			if (list != null && !list.isEmpty()) {
				for (Restaurant r : list) {
			%>

			<a href="menuitems?restaurantId=<%=r.getRestaurantId()%>"
				class="offer-link">
				<div class="offer-card">

					<img src="<%=r.getImageUrl()%>" alt="Offer Image">

					<div class="offer-info">
						<h3>
							Offer at
							<%=r.getRestaurantName()%></h3>
						<p>
							<strong>Discount:</strong> Up to 50% OFF!
						</p>
						<p>
							<strong>Cuisine:</strong>
							<%=r.getCuisine()%></p>
					</div>

				</div>
			</a>

			<%
			}
			} else {
			%>

			<!-- ⭐ Dummy Offers (fallback if no backend data) -->
			<a href="#" class="offer-link">
				<div class="offer-card">
					<img src="https://t4.ftcdn.net/jpg/12/36/95/09/360_F_1236950902_WdmHKltisVpaQ3aJnfN5ag0IcAuKDNqs.jpg" alt="Biryani Offer">
					<div class="offer-info">
						<h3>Hyderabadi Chicken Biryani</h3>
						<p>
							<strong>Discount:</strong> 50% OFF
						</p>
						<p>
							<strong>Cuisine:</strong> Andhra / Hyderabadi
						</p>
					</div>
				</div>
			</a> <a href="#" class="offer-link">
				<div class="offer-card">
					<img src="https://i.ibb.co/xH4FNfF/mutton-biryani.jpg"
						alt="Mutton Biryani Offer">
					<div class="offer-info">
						<h3>Mutton Biryani Feast</h3>
						<p>
							<strong>Discount:</strong> Flat ₹120 OFF
						</p>
						<p>
							<strong>Cuisine:</strong> Telangana Special
						</p>
					</div>
				</div>
			</a> <a href="#" class="offer-link">
				<div class="offer-card">
					<img src="https://i.ibb.co/cg5cj1T/dosa.jpg" alt="Dosa Offer">
					<div class="offer-info">
						<h3>Masala Dosa Festival</h3>
						<p>
							<strong>Discount:</strong> 25% OFF
						</p>
						<p>
							<strong>Cuisine:</strong> South Indian Tiffins
						</p>
					</div>
				</div>
			</a> <a href="#" class="offer-link">
				<div class="offer-card">
					<img src="https://i.ibb.co/02fDL6r/idli.jpg" alt="Idli Offer">
					<div class="offer-info">
						<h3>Idli & Sambar Combo</h3>
						<p>
							<strong>Discount:</strong> ₹30 OFF
						</p>
						<p>
							<strong>Cuisine:</strong> Andhra Breakfast
						</p>
					</div>
				</div>
			</a> <a href="#" class="offer-link">
				<div class="offer-card">
					<img src="https://i.ibb.co/Dkt5jMx/meals.jpg" alt="Meals Offer">
					<div class="offer-info">
						<h3>South Meals Unlimited</h3>
						<p>
							<strong>Discount:</strong> 28% OFF
						</p>
						<p>
							<strong>Cuisine:</strong> Veg / Non-Veg Meals
						</p>
					</div>
				</div>
			</a> <a href="#" class="offer-link">
				<div class="offer-card">
					<img src="https://i.ibb.co/vQtgZqy/mandi.jpg" alt="Mandi Offer">
					<div class="offer-info">
						<h3>Arabian Chicken Mandi</h3>
						<p>
							<strong>Discount:</strong> ₹100 OFF
						</p>
						<p>
							<strong>Cuisine:</strong> Arabian & Andhra Fusion
						</p>
					</div>
				</div>
			</a> <a href="#" class="offer-link">
				<div class="offer-card">
					<img src="https://i.ibb.co/Nsmj7Vr/paneer-tikka.jpg"
						alt="Paneer Offer">
					<div class="offer-info">
						<h3>Paneer Tikka Treat</h3>
						<p>
							<strong>Discount:</strong> 30% OFF
						</p>
						<p>
							<strong>Cuisine:</strong> Tandoor Veg
						</p>
					</div>
				</div>
			</a> <a href="#" class="offer-link">
				<div class="offer-card">
					<img src="https://i.ibb.co/5YrM7CQ/burger.jpg" alt="Burger Offer">
					<div class="offer-info">
						<h3>Spicy Chicken Burger</h3>
						<p>
							<strong>Discount:</strong> Buy 1 Get 1
						</p>
						<p>
							<strong>Cuisine:</strong> Fast Food
						</p>
					</div>
				</div>
			</a>


			<%
			}
			%>

		</div>

	</main>

	<footer>© 2025 Foodly — Created by Suresh</footer>

</body>
</html>
