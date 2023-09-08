package com.stefanie.store.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stefanie.store.models.Product;
import com.stefanie.store.repos.ProductRepository;




@Service
public class ProductService {
	//constructor for dependency injection 
		@Autowired
		private  ProductRepository  productRepo;

		// returns all
		public List< Product> allProduct() {
			return productRepo.findAll();
		}

		// CREATE
		public  Product createProduct( Product b) {
			return productRepo.save(b);
		}

		// -READ ONE
		public  Product findProduct(Long id) {
			
		
			Optional<Product> optionalProduct = productRepo.findById(id);
			
			//return optionalExpense.isPresent()? optionalExpense.get():null;
			
			if (optionalProduct.isPresent()) {
				return optionalProduct.get();
			} else {
				return null;
			}
		}

	    //update
		public Product updateProduct(Product b) {
			Product updatedproduct = productRepo.save(b);
			return updatedproduct;
		}

	//    
		// delette
		public void deleteProduct(Long id) {
			productRepo.deleteById(id);
		}



}
