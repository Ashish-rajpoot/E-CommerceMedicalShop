package com.mycart.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.mycart.entity.Category;
import com.mycart.entity.Product;

public class CategoryDAo {
	private SessionFactory factory;

	public CategoryDAo(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	// Add Category
	public int addCategory(Category cat) {

		Session session = this.factory.openSession();
		Transaction tx = session.beginTransaction();
		int ctId = (int) session.save(cat);
		tx.commit();
		session.close();

		return ctId;
	}

//	Get All Category
	public List<Category> getAllCategory() {

		Session session = this.factory.openSession();
		String query = "from Category";
		Query q = session.createQuery(query);
		List<Category> list = q.list();
		return list;
	}

//	Get Category by Id;
	 public Category getCategoryById(int ctid) {
		 Category category = null; 
		 Session session = this.factory.openSession();
		 category = session.get(Category.class, ctid); 
		 session.close();
		 return category; }

	 //Update Category by Id
	 public int updateCategory(String title, String Desc, int id) {
		 boolean f = false;
			Session session = this.factory.openSession();
		 Transaction tx=session.beginTransaction();  
		 Query q=session.createQuery("update Category set CategoryTitle=:n, CategoryDescription=:d where CategoryId=:i");  
		 q.setParameter("n",title);  
		 q.setParameter("d",Desc);  
		 q.setParameter("i",id);  
		   
		 int status=q.executeUpdate();  
		 
		 System.out.println(status);  
		 tx.commit();
		 return status;
	 }
	 
//	 Delete Category By Id
		 public int deleteCategory( int ctid) {
			 boolean f = false;
				Session session = this.factory.openSession();
			 Transaction tx=session.beginTransaction();  
			 Query q=session.createQuery("delete Category where CategoryId=:i");  
			 q.setParameter("i",ctid);  
			   
			 int status=q.executeUpdate();  
			 
			 System.out.println(status);  
			 tx.commit();
			 return status;
		 }
		
	 
}
