
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.sessionfactory.Helper"%>
<%@page import="com.mycart.entity.Product"%>
<%@page import="com.mycart.dao.ProductDao"%>
<%@page import="com.mycart.entity.Category"%>
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
	<%
	CategoryDAo categoryDAo = new CategoryDAo(Factory.getFactory());
	List<Category> clist = categoryDAo.getAllCategory();

	ProductDao productDao = new ProductDao(Factory.getFactory());
	List<Product> plist = productDao.getAllProduct();
	List<Product> sortedList = productDao.sortedProducts();
	List<Product> reversSortedList = productDao.reversSortedProducts();

	String cate = request.getParameter("category");
	String med = request.getParameter("");

	try {
		if (cate.equals("all") || cate.equals(null)) {
			plist = productDao.getAllProduct();
		}else if(cate.equals("atoz")) {
			plist = productDao.sortedProducts();	
		}
		else if(cate.equals("ztoa")) {
			plist = productDao.reversSortedProducts();	
		}
		
		else {
			plist = productDao.getAllProductByCategoryId(Integer.parseInt(cate));
		}
	} catch (Exception e) {
		plist = productDao.getAllProduct();
	}

	/*  List<Product> list =productDao.getProductByCategoryByName("operation");	
	for(Product p : list){
		out.println("hello this is search result med Name" + p.getpName());
	} 
	 */
	%>

	<div class="container-fluid">
		<div class="row mt-4 mx-4 ">
			<div class="col-md-2">
				<div class="list-group">
					<a href="index.jsp?category=all"
						class="list-group-item list-group-item-action active ctname-bg"
						aria-current="true"> All Category
						</h1>
					</a>
					<%
					for (Category c : clist) {
					%>
					<a href="index.jsp?category=<%=c.getCategoryId()%>"
						class="list-group-item list-group-item-action  ctname-bg "><%=c.getCategoryTitle()%></a>
					<%
					}
					%>
<br><br>
				<!-- Sorting Start -->
					<div class="list-group">
						<a href="#"
							class="list-group-item list-group-item-action active ctname-bg"
							aria-current="true"> Sort
						</a>
						<a href="demosort.jsp?category=atoz"
							class="list-group-item list-group-item-action  ctname-bg ">A to Z</a>
						<a href="demosort.jsp?category=ztoa"
							class="list-group-item list-group-item-action  ctname-bg ">Z to A</a>
					</div>
					
					<!-- Sorting End  -->
				</div>
			</div>
			<div class="col-md-10">

				<section>
					<div class="row product">
						<div class="col-md-12">
							<div class="card-columns">
								<%
								for (Product c : plist) {
								%>
								<div class="card product-card ">
									<div class="container text-center">
										<img alt="<%=c.getpPhoto()%>"
											src="img/products/<%=c.getpPhoto()%>"
											class="card-img-top  mt-3"
											sytle=" width:100px; max-height: 270px; max-width:100%;" />
									</div>
									<!-- </div> -->
									<div class="card-body">
										<h4 class="card-title">
											<%=c.getpName()%>
										</h4>
										<p class="card-text">
											<%=Helper.get10Words(c.getpDescription())%>
										</p>
										<div class="card-footer">
											<button class="btn btn-secondary text-white"
												onclick="addToCart(<%=c.getpId()%>,'<%=c.getpName()%>',<%=c.getpPrice()%>)">
												Add to Cart</button>
											<span style="font-size: 15px"> <span
												style="color: green"> &#x20b9 <%=c.getpPrice()%>/-,
											</span> <span class="text-decoration-line-through"
												style="color: red">&#x20b9 <%=Helper.discount(c.getpPrice(), c.getpDiscount())%>
											</span>, <span style="color: green"> <%=c.getpDiscount()%>%_off
											</span>
											</span>
										</div>
									</div>
								</div>
<%-- 								
								<div class="card mb-2">
    <img src="img/products/<%=c.getpPhoto()%>" class="card-img-top">
    <div class="card-body">
        <h5 class="card-title">Canon EOS 1500D</h5>
        <p class="card-text">Lorem ipsum dolor sit amet, consectetur
            adipiscing exercitationem elit.</p>
        <div class="mb-2">
            <span class="font-bold"><strong>&#x20b9 <%=c.getpPrice()%>.00</strong></span>
            <span class="font-bold text-decoration-line-through"><strong> <%=Helper.discount(c.getpPrice(), c.getpDiscount())%>.00</strong></span>
            <span class="font-bold"><strong><%=c.getpDiscount()%>%_off</strong></span>
            
        </div>
        <div class="card-footer">
            <div class="row">
                <div class="col-md-6 mb-2">
                    <span class="align-middle glyphicon glyphicon-star"
                        aria-hidden="true"></span> <span
                        class="align-middle glyphicon glyphicon-star"
                        aria-hidden="true"></span> <span
                        class="align-middle glyphicon glyphicon-star"
                        aria-hidden="true"></span> <span
                        class="align-middle glyphicon glyphicon-star"
                        aria-hidden="true"></span> <span
                        class="align-middle glyphicon glyphicon-star-empty"
                        aria-hidden="true"></span>
                </div>
                <div class="col-md-6">
                    <button type="button"
                        class="btn btn-primary btn-sm btn-block"
                        id="addToCart-1" onclick="addToCart(<%=c.getpId()%>,'<%=c.getpName()%>',<%=c.getpPrice()%>)">
                        <span class="glyphicon glyphicon-shopping-cart"
                            aria-hidden="true"></span> ADD TO CART
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
 --%>								<%
								}

								if (plist.size() == 0) {
								%>
								<div class="container mx-5 ">
									<div class="row mx-5">
										<div class="col-md-4 mx-5">
											<img alt="emptyCart" src="img/cart_empty.png"
												class=" d-block mx-5" />
										</div>
									</div>
								</div>
								<%
								}
								%>
							</div>
						</div>
					</div>


				</section>
				
				
			</div>
		</div>
	</div>
	<%@ include file="component/common_modal.jsp"%>
</body>
</html>