package com.stefanie.store.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stefanie.store.models.Cart;
import com.stefanie.store.repos.CartRepository;

@Service
public class CartService {
	
	//constructor for dependency injection 
		@Autowired
		private CartRepository cartRepo;

		// returns all
		public List<Cart> allCart() {
			return cartRepo.findAll();
		}

		// CREATE
		public Cart createCart(Cart b) {
			return cartRepo.save(b);
		}

		// -READ ONE
		public Cart findCart(Long id) {
			
		
			Optional<Cart> optionalCart= cartRepo.findById(id);
			
			//return optionalExpense.isPresent()? optionalExpense.get():null;
			
			if (optionalCart.isPresent()) {
				return optionalCart.get();
			} else {
				return null;
			}
		}

	    //update
		public Cart updateCart(Cart b) {
			Cart updatedCart = cartRepo.save(b);
			return updatedCart;
		}

	//    
		// delette
		public void deleteBook(Long id) {
			cartRepo.deleteById(id);
		}


	}



