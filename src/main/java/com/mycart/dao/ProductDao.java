package com.mycart.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.mycart.entity.Category;
import com.mycart.entity.Product;

public class ProductDao {
	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}

//	add Product
	public boolean addProduct(Product product) {
		boolean f = false;
		try {
			Session session = this.factory.openSession();
			Transaction tx = session.beginTransaction();
			session.save(product);
			tx.commit();
			session.close();
			f = true;
		} catch (Exception e) {
			// TODO: handle exception
			f = false;
		}
		return f;

	}

//	Get all Product
	public List<Product> getAllProduct() {
		Session session = this.factory.openSession();
		Query query = session.createQuery("from Product");
		List<Product> list = query.list();
		return list;
	}

	// Get Product by Category id
	public List<Product> getAllProductByCategoryId(int cate) {
		Session session = this.factory.openSession();
		Query query = session.createQuery("from Product as p where p.category.CategoryId=:e");
		query.setParameter("e", cate);
		List<Product> list = query.list();
		return list;
	}
	
	// Get Product by Product id :ok
	public Product getAllProductByProductId(int pId) {
		 Product product = null; 
		 Session session = this.factory.openSession();
		 product = session.get(Product.class, pId); 
		 session.close();
		 return product;
	}


//	Update Product by Id : ok
	public int updateProduct(String pName, String pDesc, String pPhoto, int pPrice, int pDiscount, int pQuantity, Category category,
			int pId) {
		boolean f = false;
		Session session = this.factory.openSession();
		Transaction tx = session.beginTransaction();
		Query q = session.createQuery(
				"update Product set pName=:a, pDescription=:b, pPhoto=:c, pPrice=:d, pDiscount=:e, pQuantity=:f, category=:g where pId=:h");
		q.setParameter("a", pName);
		q.setParameter("b", pDesc);
		q.setParameter("c", pPhoto);
		q.setParameter("d", pPrice);
		q.setParameter("e", pDiscount);
		q.setParameter("f", pQuantity);
		q.setParameter("g", category);
		q.setParameter("h", pId);

		int status = q.executeUpdate();

		System.out.println(status);
		tx.commit();
		return status;
	}

//	 Delete Product  : ok
	public int deleteProductById(int pId) {
		boolean f = false;
		Session session = this.factory.openSession();
		Transaction tx = session.beginTransaction();
		Query q = session.createQuery("delete Product as p where p.pId=:i");
		q.setParameter("i", pId);

		int status = q.executeUpdate();

		System.out.println(status);
		tx.commit();
		return status;
	}
	
//	 Delete Product By Category Id : ok
	public int deleteProductByCategoryId(int ctid) {
		boolean f = false;
		Session session = this.factory.openSession();
		Transaction tx = session.beginTransaction();
		Query q = session.createQuery("delete Product as p where p.category.CategoryId=:i");
		q.setParameter("i", ctid);
		
		int status = q.executeUpdate();
		
		System.out.println(status);
		tx.commit();
		return status;
	}
	
	
	

//	Get Product by %name% : not Working
	public List<Product> getProductByCategoryByName(String searchMed) {
		Session session = this.factory.openSession();
		Query query = session.createQuery("from Product where pName like :e ");
//		Query query = session.createQuery("select p from Product p where p.pName like :e ");
		query.setParameter("e", searchMed);
		List<Product> list = query.list();
		return list;
	}

}
