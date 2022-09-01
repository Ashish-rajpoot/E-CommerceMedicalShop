package com.mycart.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(length = 100, name = "ctId")
	private int CategoryId;

	@Column(length = 1000, name = "ctTitle")
	private String CategoryTitle;

	@Column(length = 3000, name = "ctDesc")
	private String CategoryDescription;
	
	@OneToMany(mappedBy = "category")
	private List<Product> products = new ArrayList<Product>();
	

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public int getCategoryId() {
		return CategoryId;
	}

	public void setCategoryId(int categoryId) {
		CategoryId = categoryId;
	}

	public String getCategoryTitle() {
		return CategoryTitle;
	}

	public void setCategoryTitle(String categoryTitle) {
		CategoryTitle = categoryTitle;
	}

	public String getCategoryDescription() {
		return CategoryDescription;
	}

	public void setCategoryDescription(String categoryDescription) {
		CategoryDescription = categoryDescription;
	}

	public Category(int categoryId, String categoryTitle, String categoryDescription) {
		super();
		CategoryId = categoryId;
		CategoryTitle = categoryTitle;
		CategoryDescription = categoryDescription;
	}

	public Category(String categoryTitle, String categoryDescription) {
		super();
		CategoryTitle = categoryTitle;
		CategoryDescription = categoryDescription;
	}

	
	public Category(String categoryTitle, String categoryDescription, List<Product> products) {
		super();
		CategoryTitle = categoryTitle;
		CategoryDescription = categoryDescription;
		this.products = products;
	}

	public Category(int categoryId, String categoryTitle, String categoryDescription, List<Product> products) {
		super();
		CategoryId = categoryId;
		CategoryTitle = categoryTitle;
		CategoryDescription = categoryDescription;
		this.products = products;
	}

	public Category() {
		// TODO Auto-generated constructor stub
	}
}
