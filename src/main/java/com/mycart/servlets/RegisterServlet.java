package com.mycart.servlets;

import java.io.IOException;
import java.io.Serializable;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mycart.dao.UserDao;
import com.mycart.entity.User;
import com.sessionfactory.Factory;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession();

		try {

			String username = request.getParameter("username");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			String type = request.getParameter("type");

			UserDao userDao = new UserDao(Factory.getFactory());
			User existingUser = userDao.selectUserByEmail(email);
			if(existingUser!=null) {
				session.setAttribute("errorMsg", "User Exists!!!");
				response.sendRedirect("register.jsp");
			}else {
				Session hibernateSession = Factory.getFactory().openSession();
				Transaction tx = hibernateSession.beginTransaction();
				User user = new User(username, email, password, phone, address, type);
				hibernateSession.save(user);
				tx.commit();
				hibernateSession.close();
				session.setAttribute("successMsg", "Registerd Successfully!!!");
				response.sendRedirect("register.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
