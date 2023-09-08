package com.stefanie.store.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;



@Entity
@Table(name="products")
public class Product {
 @Id
 @GeneratedValue(strategy = GenerationType.IDENTITY)
 private Long id;
 private String name;
 private String description;
 private String size;
 private String image;
 private double price;
// private int amount;

 @OneToMany(mappedBy="product", fetch = FetchType.LAZY)
 private List<Purchase> purchases;
 
 
 
 
 
 // This will not allow the createdAt column to be updated after creation
 @Column(updatable=false)
 @DateTimeFormat(pattern="yyyy-MM-dd")
 private Date createdAt;
 @DateTimeFormat(pattern="yyyy-MM-dd")
 private Date updatedAt;
 //date
 @PrePersist
 protected void onCreate(){
     this.createdAt = new Date();
 }
 @PreUpdate
 protected void onUpdate(){
     this.updatedAt = new Date();
 }
 
 
 public Product() {}
 
 
 ///getters and setters
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public String getSize() {
	return size;
}
public void setSize(String size) {
	this.size = size;
}
public String getImage() {
	return image;
}
public void setImage(String image) {
	this.image = image;
}
public double getPrice() {
	return price;
}
public void setPrice(double price) {
	this.price = price;
}

//public int getAmount() {
//	return amount;
//}
//public void setAmount(int amount) {
//	this.amount = amount;
//}
public Date getCreatedAt() {
	return createdAt;
}
public void setCreatedAt(Date createdAt) {
	this.createdAt = createdAt;
}
public Date getUpdatedAt() {
	return updatedAt;
}
public void setUpdatedAt(Date updatedAt) {
	this.updatedAt = updatedAt;
}
public List<Purchase> getPurchases() {
	return purchases;
}
public void setPurchases(List<Purchase> purchases) {
	this.purchases = purchases;
}

 
 
 
}
 
 
 