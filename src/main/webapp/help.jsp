<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Foodly | Help</title>
    <link rel="stylesheet" href="Styles/help.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>

<body>

<%
    String loggedUser = (String) session.getAttribute("userName");

    // Redirect ONLY after navbar loads
%>

<!-- NAVBAR (ALWAYS VISIBLE) -->
<nav class="main-nav">

    <div class="nav-left">
        <div class="logo">🍔 Foodly</div>
    </div>

    <div class="nav-center">
        <ul>
            <li><a href="home.jsp">Home</a></li>
            <li><a href="restaurant">Restaurants</a></li>
            <li><a href="offers.jsp">Offers</a></li>
            <li><a href="help.jsp" class="active">Help</a></li>
        </ul>
    </div>

    <div class="nav-right">

        <% if (loggedUser == null) { %>

            <a href="login.jsp" class="nav-btn">Login</a>
            <a href="register.jsp" class="nav-btn signup-btn">Sign Up</a>

        <% } else { %>

            <span class="welcome">Welcome, <%= loggedUser %> 👋</span>
            <a href="logout" class="nav-btn logout-btn">Logout</a>

        <% } %>

    </div>

</nav>

<%
    // NOW check login – after navbar
    if (loggedUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!-- HELP CONTENT (shown only if logged in) -->
<h1 class="title">Help & Support</h1>
<p class="subtitle">We are here 24/7 to help you</p>

<div class="help-container">
    <div class="help-card"><h3>Order Issues</h3><p>Late delivery, missing items</p></div>
    <div class="help-card"><h3>Refunds</h3><p>Payment failed or refund pending</p></div>
    <div class="help-card"><h3>Restaurant Issues</h3><p>Food quality or hygiene problems</p></div>
    <div class="help-card"><h3>Account Issues</h3><p>Login or password issues</p></div>
    <div class="help-card"><h3>Delivery Support</h3><p>Delivery partner issues</p></div>
    <div class="help-card"><h3>Safety</h3><p>Food safety complaints</p></div>
</div>

<div class="contact-box">
    <h3>📞 Contact Support</h3>
    <p>Email: support@foodly.com</p>
    <p>Phone: +91 99999 99999</p>
</div>

<footer>© 2025 Foodly — Created by Suresh</footer>

</body>
</html>
