package com.mycart.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.mycart.entity.User;

public class Demo {

	public SessionFactory factory;

	public Demo(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public User getAllUser() {
		User user = null;
				
		Session s = factory.openSession();
//		Query q = s.createQuery("from User");
		Query q = s.createQuery("from User where userEmail =:e and userPass =:p");
		q.setParameter("e", "ashishrajput142@gmail.com");
		q.setParameter("p", "123456");
		user =  (User) q.uniqueResult();
		System.out.println(user.getUserId());
//		List<User> list = q.list();
//		for(User u : list) {
//			System.out.println(u.getUserName());
//		}
		s.close();
		
				return user;
	}


}
