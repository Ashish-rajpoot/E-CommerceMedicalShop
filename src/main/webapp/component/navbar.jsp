


<%@page import="com.sessionfactory.Factory"%>
<%@page import="com.mycart.dao.UserDao"%>
<%@page import="com.mycart.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<nav class=" navbar fixed-top navbar-expand-lg navbar-dark  custom-bg">
	<div class="container">
		<a class="navbar-brand" href="index.jsp?category=all">MyCart</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<c:if test="${empty userObj and empty adminObj }">

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link"
						href="index.jsp?category=all">Home <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item "><a class="nav-link" href="demosort.jsp">demosort
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item "><a class="nav-link" href="payment.jsp">PaymentDemo
					</a></li>

<!-- 					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Category </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Action</a> <a
								class="dropdown-item" href="#">Another action</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Something else here</a>
						</div></li> -->

				</ul>

				<form action="index.jsp" method="get" class="form-inline "
					autocomplete="off">
					<!-- <input type="hidden" name="operation" value="contain"> -->
					<input class="form-control mr-sm-2" name="contain" type="search"
						placeholder="Search" aria-label="Search">
					<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
				</form>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="#"
						data-toggle="modal" data-target="#cart"><i
							class="fa fa-cart-plus"></i> <span class="ml-2 cart-btn"></span>
					</a></li>

					<li class="nav-item active"><a class="nav-link"
						href="login.jsp">Login </a></li>
					<li class="nav-item active"><a class="nav-link"
						href="register.jsp">Register </a></li>
				</ul>
			</div>
	</div>
</nav>
</c:if>


<c:if test="${not empty adminObj }">
<%
	User adminPass = (User) session.getAttribute("adminObj");
	UserDao useDao = new UserDao(Factory.getFactory());
	User currentUser = useDao.getUserById(adminPass.getUserId());
	%>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link"
				href="adminHome.jsp">Home <span class="sr-only">(current)</span>
			</a></li>

			<!-- <li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Category </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="#">Action</a> <a
						class="dropdown-item" href="#">Another action</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div></li>
 -->
		</ul>
		<ul class="navbar-nav ml-auto">
			<li class="nav-item active"><a class="nav-link" href="#"><%=currentUser.getUserName()%>
			</a></li>
			<li class="nav-item active"><a class="nav-link" href="#">Change
					Password</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="profile.jsp">Profile</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="LogoutServlet">Logout </a></li>
		</ul>
	</div>
	</div>
	</nav>
</c:if>


<c:if test="${not empty userObj}">
	<%
	User userPass = (User) session.getAttribute("userObj");
	UserDao useDao = new UserDao(Factory.getFactory());
	User currentUser = useDao.getUserById(userPass.getUserId());
	%>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link"
				href="index.jsp?category=all">Home <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item "><a class="nav-link" href="payment.jsp">PaymentDemo
			</a></li>

		</ul>
		<ul class="navbar-nav ml-auto">
			<li class="nav-item active"><a class="nav-link" href="#"
				data-toggle="modal" data-target="#cart"><i
					class="fa fa-cart-plus"></i> <span class="ml-2 cart-btn"></span> </a></li>

			<li class="nav-item active"><a class="nav-link" href="#"> <%=currentUser.getUserName()%>
			</a></li>
			<li class="nav-item active"><a class="nav-link" href="#">Change
					Password</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="profile.jsp">Profile</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="LogoutServlet">Logout </a></li>
		</ul>
	</div>
	</div>
	</nav>
</c:if>