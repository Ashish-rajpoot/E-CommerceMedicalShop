package com.mycart.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.mycart.entity.Category;

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

	public List<Category> getAllCategory() {

		Session session = this.factory.openSession();
		String query = "from Category";
		Query q = session.createQuery(query);
		List<Category> list = q.list();
		return list;
	}

	public Category getCategoryById(int ctid) {
		Category category = null;
		System.out.println("in getCAtegorybYId function");
		Session session = this.factory.openSession();
		category = session.get(Category.class, ctid);
		System.out.println(category);
		session.close();
		return category;
	}

}
