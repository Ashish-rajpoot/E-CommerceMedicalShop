
<%@page import="com.mycart.entity.User"%>
<%@page import="com.mycart.dao.UserDao"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.sessionfactory.Helper"%>
<%@page import="com.mycart.entity.Product"%>
<%@page import="com.mycart.dao.ProductDao"%>
<%@page import="com.mycart.entity.Category"%>
<%@page import="com.mycart.dao.CategoryDAo"%>
<%@page import="com.sessionfactory.Factory"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- <link rel="styleSheet" href="css/style.css"> -->
<%@include file="component/allcss.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<br>
	<br>
	<br>

	<div class="container">
		<%@include file="component/massage.jsp"%>
		<%
		User user = (User) session.getAttribute("adminObj");

		if (user == null) {
			session.setAttribute("errorMsg", "Please Login !!!");
			response.sendRedirect("login.jsp");
			return;
		}

		if (request.getParameter("categoryid") != null) {
			String cate = request.getParameter("categoryid");
			String path = request.getContextPath() + "/update.jsp?categoryid=" + cate;

			/* if(path.equals(request.getContextPath()+"/update.jsp?categoryid="+cate)){ */

			int ctid = Integer.parseInt(cate);
			CategoryDAo categoryDAo = new CategoryDAo(Factory.getFactory());
			List<Category> clist = categoryDAo.getAllCategory();
			Category oneCategory = categoryDAo.getCategoryById(ctid);
		%>


		<div class="row">
			<div class="col-md-6 offset-md-3">
				<form action="CategoryOperationServlet" method="post"
					autocomplete="off">
					<input type="hidden" name="operation" value="updateCategory">
					<div class="form-group">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">Category Id: </span> <input
									type="text" name="ctId"
									value="<%=oneCategory.getCategoryId()%>" class="form-control"
									placeholder="Product Name" aria-label="Product Name"
									aria-describedby="basic-addon1" required="required"
									readonly="readonly">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">Enter Category Name: </span> <input
									type="text" name="CategoryTitle"
									value="<%=oneCategory.getCategoryTitle()%>"
									class="form-control" placeholder="Product Name"
									aria-label="Product Name" aria-describedby="basic-addon1"
									required="required">

							</div>
						</div>
					</div>

					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">Category Description</span>
						</div>
						<textarea class="form-control" name="CategoryDescription"
							value="<%=oneCategory.getCategoryDescription()%>"
							aria-label="With textarea" required="required"
							style="height: 300px"></textarea>
					</div>
					<div class="row mt-4">
						<div class="form-group">
							<button class="btn btn-outline-success" type="submit">
								Update</button>
							<!-- <button class="btn btn-outline-warning" type="sumit">
								Delete</button> -->
						</div>
					</div>
				</form>
			</div>
		</div>

		<!-- End Edit category modal-->

		<!--  Start Product Modal -->
		<%
		}  if (request.getParameter("productId") != null) {
		String productid = request.getParameter("productId");
		String path2 = request.getContextPath() + "/update.jsp?productId=" + productid;

		/* 		path2.equals(request.getContextPath()+"/update.jsp?productId="+productid)) { */

		int pId = Integer.parseInt(productid);
		ProductDao productDao = new ProductDao(Factory.getFactory());
		List<Product> pList = productDao.getAllProduct();
		Product oneProduct = productDao.getAllProductByProductId(pId);
		CategoryDAo categoryDAo = new CategoryDAo(Factory.getFactory());
		List<Category> clist = categoryDAo.getAllCategory();
		%>
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<form action="ProductOperationServlet" method="post"
					autocomplete="off" enctype="multipart/form-data">
					<input type="hidden" name="operation" value="updateProduct">
					<div class="form-group">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">Product Id: </span> <input
									type="text" name="pId" value="<%=oneProduct.getpId()%>"
									class="form-control" placeholder="Product Name"
									aria-label="Product Name" aria-describedby="basic-addon1"
									required="required" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">Enter Product Name: </span> <input
									type="text" name="pName" value="<%=oneProduct.getpName()%>"
									class="form-control" placeholder="Product Name"
									aria-label="Product Name" aria-describedby="basic-addon1"
									required="required">

							</div>
						</div>
					</div>

					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">Category : </span>
						</div>

						<select name="ctId" id="ctId" class="form-select"
							aria-label="Default select example">
							<%
							for (Category c : clist) {
							%>
							<option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>
							<%
							}
							%>
						</select>
					</div>

					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">Product Price ( &#8377 ) :
							</span>
						</div>
						<input type="number" class="form-control" name="pPrice"
							value="<%=oneProduct.getpPrice()%>"
							aria-label="Amount (to the nearest dollar)" required="required">
						<div class="input-group-append">
							<span class="input-group-text">.00</span>
						</div>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">Product Discount (%) :</span>
						</div>
						<input type="number" name="pDiscount"
							value="<%=oneProduct.getpDiscount()%>" class="form-control"
							aria-label="Amount" required="required">

					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">Product Quantity </span>
						</div>
						<input type="number" name="pQuantity"
							value="<%=oneProduct.getpQuantity()%>" class="form-control"
							aria-label="Qunatity" required="required">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">Product Image </span>
						</div>
						<input type="file" name="pImage"
							value="<%=oneProduct.getpPhoto()%>" class="form-control"
							aria-label="Image" required="required">
					</div>

					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">Product Description</span>
						</div>
						<textarea class="form-control" name="pDesc"
							value="<%=oneProduct.getpDescription()%>"
							aria-label="With textarea" required="required"></textarea>
					</div>
					<div class="row mt-4">
						<div class="form-group">
							<button class="btn btn-outline-success" type="submit">
								Update</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		</div>

		<%
		} if (request.getParameter("userId") != null) {
			String userid = request.getParameter("userId");
			String path2 = request.getContextPath() + "/update.jsp?userId=" +userid;

			/* 		path2.equals(request.getContextPath()+"/update.jsp?productId="+productid)) { */

			int uid = Integer.parseInt(userid);
			UserDao userDao = new UserDao(Factory.getFactory());
			User oneUser = userDao.getUserById(uid);
			%>
	<div class="row">
		<div class="col-md-6 offset-md-3">
			<form action="ProductOperationServlet" autocomplete="off"
				method="post">
				<input type="hidden" name="operation" value="updateUser">
								<div class="form-group">
					<label for="username">User Id</label> <input type="text"
						name="uId" value="<%=oneUser.getUserId() %>"
						class="form-control" id="username" placeholder="username"
						required="required" readonly="readonly" >
				</div>
				<div class="form-group">
					<label class="form-label" for="type">Choose a Role:</label> <select
						name="type" id="role" class="form-select"
						aria-label="Default select example">
						<!-- <option value="admin">Admin</option> -->
						<option value="<%=oneUser.getUserType()%>"><%=oneUser.getUserType() %></option>
					</select>
				</div>
				<div class="form-group">
					<label for="username">User Name</label> <input type="text"
						name="username" value="<%=oneUser.getUserName() %>"
						class="form-control" id="username" placeholder="username"
						required="required">
				</div>
				<div class="form-group">
					<label for="email">User Email</label> <input type="email"
						name="email" value="<%=oneUser.getUserEmail() %>"
						class="form-control" id="email" placeholder="email"
						required="required">
				</div>
				<div class="form-group">
					<label for="password">User Password</label> <input type="password"
						name="password" value="<%=oneUser.getUserPass() %>"
						class="form-control" id="password" placeholder="password"
						required="required">
				</div>
				<div class="form-group">
					<label for="phone">User Phone</label> <input type="number"
						name="phone" value="<%=oneUser.getUserPhone() %>"
						class="form-control" id="phone" placeholder="phone"
						required="required">
				</div>
				<div class="form-group">
					<label for="address">User Address</label>
					<textarea name="address" value="<%=oneUser.getUserAddress()%>"
						style="height: 100px" class="form-control" id="username"
						placeholder="Enter your Address" required="required">
				</textarea>
				</div>
				<div class="row mt-4">
					<div class="form-group">
						<button class="btn btn-outline-success" type="submit">
							Update</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<%}
		;
		%>
		<!-- End Edit product modal-->
	<%@ include file="component/common_modal.jsp"%>
</body>
</html>