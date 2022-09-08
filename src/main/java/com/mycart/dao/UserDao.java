package com.mycart.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.util.List;

import org.hibernate.Query;

import com.mycart.entity.Category;
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
	
	public List<User> getAllUser() {

		Session session = this.factory.openSession();
		String query = "from User";
		Query q = session.createQuery(query);
		List<User> list = q.list();
		return list;
	}
	
//	Get User by Id;
	 public User getUserById(int uid) {
		 User user = null; 
		 Session session = this.factory.openSession();
		 user = session.get(User.class, uid); 
		 session.close();
		 return user; }

	 //Update Category by Id
	 public int updateUser(String uName, String uType,String uEmail,String uPass, String uPhone,String uAddress, int uId) {
		 boolean f = false;
			Session session = this.factory.openSession();
		 Transaction tx=session.beginTransaction();  
		 Query q=session.createQuery("update User set userName=:a, userType=:b, userEmail=:c,"
		 		+ "userPass=:d, userPhone=:e, userAddress=:f where userId=:g");  
		 q.setParameter("a",uName);  
		 q.setParameter("b",uType);  
		 q.setParameter("c",uEmail);  
		 q.setParameter("d",uPass);  
		 q.setParameter("e",uPhone);  
		 q.setParameter("f",uAddress);  
		 q.setParameter("g",uId);  
		   
		 int status=q.executeUpdate();  
		 
		 System.out.println(status);  
		 tx.commit();
		 return status;
	 }
	 
//	 Delete Category By Id
		 public int deleteUser( int uId) {
				Session session = this.factory.openSession();
			 Transaction tx=session.beginTransaction();  
			 Query q=session.createQuery("delete User as u where u.userId=:i");  
			 q.setParameter("i",uId);  
			   
			 int status=q.executeUpdate();  
			 
			 System.out.println(status);  
			 tx.commit();
			 return status;
		 }
}





