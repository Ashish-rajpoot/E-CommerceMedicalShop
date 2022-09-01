function addToCart(pId, pName, pPrice) {

	let cart = localStorage.getItem("cart");
	if (cart == null) {

		let products = [];
		let product = { productId: pId, productName: pName, productQuantity: 1, productPrice: pPrice };
		products.push(product);
		localStorage.setItem("cart", JSON.stringify(products));
		showToast("Product is Added to cart");
	} else {
		let pCart = JSON.parse(cart);
		let oldProduct = pCart.find((item) => item.productId == pId)
		if (oldProduct) {
			oldProduct.productQuantity = oldProduct.productQuantity + 1
			pCart.map((item) => {
				if (item.productId == oldProduct.productId) {
					item.productQuantity = oldProduct.productQuantity
				}
			})
			localStorage.setItem("cart", JSON.stringify(pCart));
			showToast(oldProduct.productName + "'s Quantity is Incresed to ( " + oldProduct.productQuantity + " )");
		} else {

			let product = { productId: pId, productName: pName, productQuantity: 1, productPrice: pPrice };
			pCart.push(product);
			localStorage.setItem("cart", JSON.stringify(pCart));
			showToast("Product is Added to cart");
		}
	}
	updateCart();
}

function increseProductById(pId) {
	let cart = localStorage.getItem("cart");
	let pCart = JSON.parse(cart);
	let oldProduct = pCart.find((item) => item.productId == pId)
	if (oldProduct) {
		oldProduct.productQuantity = oldProduct.productQuantity + 1
		pCart.map((item) => {
			if (item.productId == oldProduct.productId) {
				item.productQuantity = oldProduct.productQuantity
			}
		})
		localStorage.setItem("cart", JSON.stringify(pCart));
		showToast(oldProduct.productName + "'s Quantity is Incresed to ( " + oldProduct.productQuantity + " )");
	}
	updateCart();
}

/* Update Cart*/

function updateCart() {

	let cartString = localStorage.getItem("cart");
	let pCart = JSON.parse(cartString);

	if (pCart == null || pCart.length == 0) {

		$(".cart-btn").html("( 0 )");
		$(".cart-body").html("<h3> Cart is Empty</h3>");
		$(".checkout-btn").addClass("disabled");

	} else {

		$(".cart-btn").html(`( ${pCart.length} )`);

		let table = `
		<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Item Name</th>
      <th scope="col">Price</th>
      <th scope="col">Quantity</th>
      <th scope="col">Total Price</th>
      <th scope="col"></th>
       <th scope="col">Action</th>
       <th scope="col"></th>
    </tr>
  </thead>
  		
		`;

		let totalPrice = 0;
		pCart.map((item) => {
			table += `
			
			<tr>
				<td>${item.productName}</td>
				<td>${item.productPrice}</td>
				<td> 
					<button onclick='increseProductById(${item.productId})' style="border:none"> <i class="fa fa-circle-plus"></i></button>
				 		${item.productQuantity} 
					<button onclick='decreseProductById(${item.productId})' style="border:none"> <i class="fa fa-circle-minus"></i></button>
				   </td>
				<td>${item.productPrice * item.productQuantity}</td>
				<td><button onclick='deleteItemFromCart(${item.productId})' class="btn btn-danger">Remove</button></td>

			</tr>			
			`;

			totalPrice += item.productPrice * item.productQuantity;

		})

		table = table + `
		<tr>
		<td colspan='5' class="text-right font-weight-bold m-5" >Total Price : ${totalPrice}</td>

			</tr>	
		</table>`
		$(".cart-body").html(table);
	}

}

/* Delete Product */
function deleteItemFromCart(pId) {
	let cart = JSON.parse(localStorage.getItem("cart"));
	let newCart = cart.filter((item) => item.productId != pId);
	localStorage.setItem("cart", JSON.stringify(newCart));
	updateCart();
	showToast("Product is Removed from cart");
}

/* Decreasing Product */
function decreseProductById(pId) {
	let cart = localStorage.getItem("cart");
	let pCart = JSON.parse(cart);
	let oldProduct = pCart.find((item) => item.productId == pId)
	if (oldProduct) {
		oldProduct.productQuantity = oldProduct.productQuantity - 1
		if (oldProduct.productQuantity == 0) {
			deleteItemFromCart(oldProduct.productId);

		} else {
			pCart.map((item) => {
				if (item.productId == oldProduct.productId) {
					item.productQuantity = oldProduct.productQuantity
				}
			})

			localStorage.setItem("cart", JSON.stringify(pCart));
			updateCart();
			showToast(oldProduct.productName + "'s Quantity is Decreased to ( " + oldProduct.productQuantity + " )");

		}
	}
}

/* Getting Cart Ready*/


$(document).ready(function() {
	updateCart();
});


/* Toast Function*/
function showToast(content) {
	$("#toast").addClass("display");
	$("#toast").html(content);
	setTimeout(() => {
		$("#toast").removeClass("display");
	}, 2000);
}