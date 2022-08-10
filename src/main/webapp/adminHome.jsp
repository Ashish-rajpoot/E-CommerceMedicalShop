
<%@page import="com.mycart.dao.CategoryDAo"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="java.util.List"%>
<%@page import="com.mycart.entity.Category"%>
<%@page import="com.mycart.dao.AdminDao"%>
<%
User user = (User) session.getAttribute("adminObj");
if (user == null) {
	session.setAttribute("errorMsg", "Please Login !!!");
	response.sendRedirect("login.jsp");
	return;
}
%>

<%@page import="com.mycart.entity.User"%>
<%@page import="com.sessionfactory.Factory"%>
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



	<div class="container admin">
		<div class="row mt-5 ">
			<div>
				<%@include file="component/massage.jsp"%>
			</div>
			<div class="col-md-4 mt-3">
				<div class="card shadow-lg p-3 mb-5  rounded">
					<div class="card-body text-center">
						<div class="container ">
							<img style="max-width: 125px;" src="img/add-user.png" alt="na">
						</div>
						<h3>2562</h3>
						<h3>Users</h3>
					</div>
				</div>
			</div>
			<div class="col-md-4 mt-3">
				<div class="card shadow-lg p-3 mb-5  rounded">
					<div class="card-body text-center">
						<div class="container ">
							<img style="max-width: 125px;" src="img/addProduct_2.png"
								alt="na">
						</div>
						<h3>2562</h3>
						<h3>Category</h3>
					</div>
				</div>
			</div>
			<div class="col-md-4 mt-3">
				<div class="card shadow-lg p-3 mb-5  rounded">
					<div class="card-body text-center">
						<div class="container ">
							<img style="max-width: 125px;" src="img/addProduct_3.png"
								alt="na">
						</div>
						<h3>2562</h3>
						<h3>Product</h3>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-3">
			<div class="col-md-6 mt-3">
				<div class="card shadow-lg p-3 mb-5  rounded" data-bs-toggle="modal"
					data-bs-target="#addCategory">
					<div class="card-body text-center">
						<div class="container ">
							<img style="max-width: 125px;" src="img/addProduct_4.png"
								alt="na">
						</div>
						<p class="mt-3">Click Here To Add Category</p>
						<h3 class="mt-3">Add Category</h3>
					</div>
				</div>
			</div>
			<div class="col-md-6 mt-3">
				<div class="card shadow-lg p-3 mb-5  rounded" data-bs-toggle="modal"
					data-bs-target="#addProduct">
					<div class="card-body text-center">
						<div class="container ">
							<img style="max-width: 125px;" src=img/addProduct_1.png alt="na">
						</div>
						<p class="mt-3">Click Here To Add Category</p>
						<h3 class="mt-3">Add Product</h3>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Start Category Modal -->

	<!-- Modal -->
	<div class="modal fade" id="addCategory" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Add Category</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post"
						autocomplete="off">
						<input type="hidden" name="operation" value="category">
						<div class="form-group">
							<label for="CategoryTitle">Enter Category Title</label> <input
								type="text" name="CategoryTitle" class="form-control"
								id="CategoryTitle" placeholder="CategoryTitle"
								required="required">
						</div>
						<div class="form-group">
							<label for="CategoryDescription">Enter Category
								Description</label>
							<textarea name="CategoryDescription" style="height: 300px"
								class="form-control" id="CategoryDescription"
								placeholder="Enter Category Description " required="required">
                            </textarea>
						</div>
						<div class="row mt-4">
							<div class="form-group">
								<button class="btn btn-outline-success" type="submit">
									Add</button>
								<button class="btn btn-outline-warning" type="reset">
									Reset</button>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">

					<button type="button" class="btn btn-outline-danger"
						data-bs-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>


	<!-- End Category Modal -->


	<!-- Start Add Product Modal -->
	<!-- Modal -->
	<div class="modal fade" id="addProduct" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Add Products</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post"
						autocomplete="off" enctype="multipart/form-data">
						<input type="hidden" name="operation" value="product">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">Product Name :</span>
							</div>
							<input type="text" name="pName" class="form-control"
								placeholder="Product Name" aria-label="Product Name"
								aria-describedby="basic-addon1" required="required">
						</div>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">Category :
								</span>
							</div>
							<%
								CategoryDAo categoryDAo = new CategoryDAo(Factory.getFactory());
								List<Category> list = categoryDAo.getAllCategory();
							%>
							
							<select
								name="ctId" id="ctId" class="form-select"
								aria-label="Default select example">
								<% for(Category c: list) {%>
									<option value="<%=c.getCategoryId() %>"><%=c.getCategoryTitle() %></option>
								<%}%>
<!-- 								<option value="admin">Admin</option>
								<option value="user">User</option> -->
							</select>
						</div>

						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">Product Price ( &#8377 ) :
								</span>
							</div>
							<input type="number" class="form-control" name="pPrice"
								aria-label="Amount (to the nearest dollar)" required="required">
							<div class="input-group-append">
								<span class="input-group-text">.00</span>
							</div>
						</div>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">Product Discount (%) :</span>
							</div>
							<input type="number" name="pDiscount" class="form-control"
								aria-label="Amount" required="required">

						</div>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">Product Quantity </span>
							</div>
							<input type="number" name="pQuantity" class="form-control"
								aria-label="Qunatity" required="required">
						</div>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">Product Image </span>
							</div>
							<input type="file" name="pImage" class="form-control"
								aria-label="Image" required="required">
						</div>

						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">Product Description</span>
							</div>
							<textarea class="form-control" name="pDesc"
								aria-label="With textarea" required="required"></textarea>
						</div>

						<div class="row mt-4">
							<div class="form-group">
								<button class="btn btn-outline-success" type="submit">
									Add</button>
								<button class="btn btn-outline-warning" type="reset">
									Reset</button>
							</div>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>

	<!-- End Add Product Modal -->



</body>
</html>