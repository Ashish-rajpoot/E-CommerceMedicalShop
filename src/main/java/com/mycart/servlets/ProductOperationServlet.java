package com.mycart.servlets;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.mycart.dao.CategoryDAo;
import com.mycart.dao.ProductDao;
import com.mycart.dao.UserDao;
import com.mycart.entity.Category;
import com.mycart.entity.User;
import com.sessionfactory.Factory;

/**
 * Servlet implementation class ProductOperationServlet
 */
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductOperationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("in Product Operation Servlet");
		HttpSession session = request.getSession();
		String op = request.getParameter("operation");
		String nam= request.getParameter("pName");
		System.out.println(op);
		if (op == null) {
			System.out.println(nam);
			System.out.println(op);
			try {
		String deleteProductId = request.getParameter("deleteProductId");
		String path = request.getContextPath() + "/ProductOperationServlet?deleteProductId=" + deleteProductId;
				if (path.equals(request.getContextPath() + "/ProductOperationServlet?deleteProductId=" + deleteProductId)) {
					System.out.println("ok" + path);
					int deleteProductById = Integer.parseInt(deleteProductId);
					
					/*
					 * CategoryDAo categoryDAo = new CategoryDAo(Factory.getFactory()); int status =
					 * categoryDAo.deleteCategory(ctid);
					 */
					ProductDao productDao = new ProductDao(Factory.getFactory());
					productDao.deleteProductById(deleteProductById);
					session.setAttribute("successMsg", "Product Deleted SuccessFully !!!");
					response.sendRedirect("productoperation.jsp?category=product");
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}  else if (op.trim().equals("updateProduct")) {

				System.out.println(op);
				try {

					Part file = request.getPart("pImage");
					// Select the file name
					String fileName = file.getSubmittedFileName();

					// Local Path to upload file
					String uploadPath = "F:/Eclipse/E-CommerceMedicalShop/src/main/webapp/img/products/" + fileName;
					FileOutputStream fos = new FileOutputStream(uploadPath);
					InputStream is = file.getInputStream();

					byte[] data = new byte[is.available()];
					is.read(data);
					fos.write(data);
					fos.close();

					int ctId = Integer.parseInt(request.getParameter("ctId"));
					int pId = Integer.parseInt(request.getParameter("pId"));
					String pName = request.getParameter("pName").trim();
					int pPrice = Integer.parseInt(request.getParameter("pPrice"));
					int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
					int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
					String pDesc = request.getParameter("pDesc").trim();

					CategoryDAo categoryDAo = new CategoryDAo(Factory.getFactory());
					Category category = categoryDAo.getCategoryById(ctId);

					ProductDao productDao = new ProductDao(Factory.getFactory());
					int updatedId = productDao.updateProduct(pName, pDesc, fileName, pPrice, pDiscount, pQuantity, category, pId);
	
					
						session.setAttribute("successMsg", "Product Added SuccessFully !!!");
						response.sendRedirect("adminHome.jsp");

				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
					session.setAttribute("errorMsg", " Error Occur while Product Adding !!!");
					response.sendRedirect("adminHome.jsp");
				}

			}else if (op.trim().equals("updateUser")) {

				System.out.println(op);
				try {
					
					int uId = Integer.parseInt(request.getParameter("uId"));
					String uName = request.getParameter("username").trim();
					String uType= request.getParameter("type");
					String uEmail =request.getParameter("email");
					String uPass = request.getParameter("password");
					String uPhone = request.getParameter("phone").trim();
					String uAddress = request.getParameter("address").trim();

					UserDao userDao = new UserDao(Factory.getFactory());
					int oneUser = userDao.updateUser(uName, uType, uEmail, uPass, uPhone, uAddress, uId);

						session.setAttribute("successMsg", "User UpdatedSuccessFully !!!");
						response.sendRedirect("adminHome.jsp");

				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
					session.setAttribute("errorMsg", " Error Occur while Updating User !!!");
					response.sendRedirect("adminHome.jsp");
				}

			} 
 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
