package com.mycart.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(length = 100, name = "userId")
	private int userId;

	@Column(length = 100, name = "userName")
	private String userName;

	@Column(length = 100, name = "userType")
	private String userType;

	@Column(length = 100, name = "userEmail")
	private String userEmail;

	@Column(length = 100, name = "userPass")
	private String userPass;

	@Column(length = 100, name = "userPhone")
	private String userPhone;

	@Column(length = 1000, name = "userAddress")
	private String userAddress;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPass() {
		return userPass;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	
	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public User(int userId, String userName, String userEmail, String userPass, String userPhone, String userAddress, String userType) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPass = userPass;
		this.userPhone = userPhone;
		this.userAddress = userAddress;
		this.userType= userType;
	}

	public User(String userName, String userEmail, String userPass, String userPhone, String userAddress, String userType) {
		super();
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPass = userPass;
		this.userPhone = userPhone;
		this.userAddress = userAddress;
		this.userType= userType;
	}

	public User() {
		// TODO Auto-generated constructor stub
	}
}
