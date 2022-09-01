package com.mycart.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mycart.dao.UserDao;
import com.mycart.entity.User;
import com.sessionfactory.Factory;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
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
	

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			HttpSession session = request.getSession();
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String type = request.getParameter("type");
			
			UserDao userDao = new UserDao(Factory.getFactory());
			User user = userDao.selectUserByEmailAndPass(email, password,type);

			if (user != null){
				if(user.getUserType().equals("admin")) {
					session.setAttribute("adminObj", user);
					response.sendRedirect("adminHome.jsp");
				}else if(user.getUserType().equals("user")) {
					session.setAttribute("userObj", user);
					response.sendRedirect("userHome.jsp");
				}
			}else {
				session.setAttribute("userNull", null);
				session.setAttribute("errorMsg", "Invalid Ceredential !!!");
				response.sendRedirect("login.jsp");
			}
		

		} catch (Exception e) {
			// TODO: handle exception
		}

	}

}
