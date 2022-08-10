package com.mycart.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Query;

import com.mycart.entity.User;

public class UserDao {

	private SessionFactory factory;

	public UserDao(SessionFactory factory) {
		this.factory = factory;
	}

	public User selectUserByEmailAndPass(String Email, String Pass,String Type) {

		User user = null;

		try {
			String query = "from User where userEmail =:e and userPass =:p and userType=: t";
			Session session = factory.openSession();
			Query q = session.createQuery(query);
			q.setParameter("e", Email);
			q.setParameter("p", Pass);
			q.setParameter("t", Type);
			user = (User) q.uniqueResult();
			session.close();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return user;
	}

	public User selectUserByEmail(String Email) {

		User user = null;

		try {
			String query = "from User where userEmail =:e";
			Session session = factory.openSession();
			Query q = session.createQuery(query);
			q.setParameter("e", Email);
			user = (User) q.uniqueResult();
			System.out.println(user.getUserId());
			session.close();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return user;
	}
}
