 <%@page import="java.util.List"%>
<%@page import="com.mycart.entity.Category"%>
<%@page import="com.sessionfactory.Factory"%>
<%@page import="com.mycart.dao.CategoryDAo"%>

<!-- Modal -->

<%@page import="com.mycart.dao.CategoryDAo"%>
<div class="modal fade" id="cart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body cart-body">
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary checkout-btn" onclick="goToCheckout()">CheckOut</button>
      </div>
    </div>
  </div>
</div>

<!-- Start Edit category modal-->
 


<div class="modal fade" id="editCategory" data-bs-backdrop="static"
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
						<input type="hidden" name="operation" value="updateCategory">
						<div class="form-group">
							<label for="CategoryTitle">Enter Category Title</label> <input
								type="text" name="CategoryTitle" <%-- value="<%=category.getCategoryTitle() %>" --%> class="form-control"
								id="CategoryTitle" placeholder="CategoryTitle"
								required="required">
						</div>
						<div class="form-group">
							<label for="CategoryDescription">Enter Category
								Description</label>
							<textarea name="CategoryDescription" <%-- value="<%=category.getCategoryDescription() %>" --%>style="height: 300px"
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
	

	<!-- End Edit category modal-->
	


<!-- Modal -->
<div class="modal fade" id="editAdminButton" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle"><i class="fa-solid fa-triangle-exclamation"></i>  Warning</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Admin Cannot be Deleted! Please Contact to Super Admin.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<div id="toast"></div>