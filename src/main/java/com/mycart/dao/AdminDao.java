package com.mycart.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.mycart.entity.Category;
import com.mycart.entity.Product;

public class AdminDao {

	private SessionFactory factory;

	public AdminDao(SessionFactory factory) {
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

	public List<Category> getAllCategory() {

		Session session = this.factory.openSession();
		String query = "from Category";
		Query q = session.createQuery(query);
		List<Category> list = q.list();
		return list;
	}

	public Category getCategoryById(int ctid) {
		Category category = null;

		Session session = this.factory.openSession();
		category = session.get(Category.class, ctid);
		session.close();
		return category;
	}

//	add Product
	public int addProduct(Product product) {

		Session session = this.factory.openSession();
		Transaction tx = session.beginTransaction();
		int pId = (int) session.save(product);
		tx.commit();
		session.close();

		return pId;
	}

}
