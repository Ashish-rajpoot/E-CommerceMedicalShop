package com.mycart.servlets;

import java.io.Console;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.mycart.dao.CategoryDAo;
import com.mycart.dao.ProductDao;
import com.mycart.entity.Category;
import com.mycart.entity.Product;
import com.sessionfactory.Factory;

/**
 * Servlet implementation class CategoryOperationServlet
 */
@MultipartConfig
public class CategoryOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CategoryOperationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		HttpSession session = request.getSession();
		String op = request.getParameter("operation");
		String cate = request.getParameter("deletecategoryid");
		String path = request.getContextPath() + "/CategoryOperationServlet?deletecategoryid=" + cate;
		
		System.out.println(path);
		if (op == null) {
			try {
				if (path.equals(request.getContextPath() + "/CategoryOperationServlet?deletecategoryid=" + cate)) {
					System.out.println("ok" + path);
					int ctid = Integer.parseInt(cate);
					
					CategoryDAo categoryDAo = new CategoryDAo(Factory.getFactory());
					int status = categoryDAo.deleteCategory(ctid);
					ProductDao productDao = new ProductDao(Factory.getFactory());
					productDao.deleteProductByCategoryId(ctid); 
					session.setAttribute("successMsg", "Category Deleted SuccessFully !!!");
					response.sendRedirect("productoperation.jsp?category=category");
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} else {

			if (op.trim().equals("category")) {
				System.out.println(op);
				try {

					String categoryTitle = request.getParameter("CategoryTitle").trim();
					String categoryDesc = request.getParameter("CategoryDescription").trim();

					Category category = new Category();
					category.setCategoryTitle(categoryTitle);
					category.setCategoryDescription(categoryDesc);
					CategoryDAo categoryDAo = new CategoryDAo(Factory.getFactory());
					int ctId = categoryDAo.addCategory(category);
					session.setAttribute("successMsg", "Category Added SuccessFully !!!");
					response.sendRedirect("adminHome.jsp");
				} catch (Exception e) {
					// TODO: handle exception
					session.setAttribute("errorMsg", "Category already Exists!!!");
					response.sendRedirect("adminHome.jsp");
				}

			} else if (op.trim().equals("product")) {

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
					String pName = request.getParameter("pName").trim();
					int pPrice = Integer.parseInt(request.getParameter("pPrice"));
					int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
					int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
					String pDesc = request.getParameter("pDesc").trim();

					CategoryDAo categoryDAo = new CategoryDAo(Factory.getFactory());
					Category category = categoryDAo.getCategoryById(ctId);

					Product p = new Product();
					p.setpName(pName);
					p.setpDescription(pDesc);
					p.setpPrice(pPrice);
					p.setpQuantity(pQuantity);
					p.setpDiscount(pDiscount);
					p.setpPhoto(fileName);
					p.setCategory(category);

					ProductDao productDao = new ProductDao(Factory.getFactory());
					boolean pId = productDao.addProduct(p);
					if (pId) {
						session.setAttribute("successMsg", "Product Added SuccessFully !!!");
						response.sendRedirect("adminHome.jsp");
					} else {
						session.setAttribute("errorMsg", " Error Occur while Product Adding !!!");
						response.sendRedirect("adminHome.jsp");
					}

				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
					session.setAttribute("errorMsg", " Error Occur while Product Adding !!!");
					response.sendRedirect("adminHome.jsp");
				}

			} else if (op.trim().equals("updateCategory")) {

				System.out.println(op);
				try {

					int ctId = Integer.parseInt(request.getParameter("ctId"));

					String categoryTitle = request.getParameter("CategoryTitle").trim();
					String categoryDesc = request.getParameter("CategoryDescription").trim();

					System.out.println(ctId);
					System.out.println(categoryTitle);
					System.out.println(categoryDesc);

					CategoryDAo categoryDAo = new CategoryDAo(Factory.getFactory());
					int ctId2 = categoryDAo.updateCategory(categoryTitle, categoryDesc, ctId);
					session.setAttribute("successMsg", "Category update SuccessFully !!!");
					response.sendRedirect("adminHome.jsp");

				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
					session.setAttribute("errorMsg", " Category already Exists!!!");
					response.sendRedirect("adminHome.jsp");
				}

			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
