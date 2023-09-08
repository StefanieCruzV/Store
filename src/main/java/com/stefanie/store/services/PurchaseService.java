package com.stefanie.store.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stefanie.store.models.Purchase;
import com.stefanie.store.repos.PurchaseRepository;

@Service
public class PurchaseService {
	@Autowired
	private PurchaseRepository purchaseRepo;
	
	// returns all
	public List<Purchase> allPurchase() {
		return purchaseRepo.findAll();
	}
	
	

	// CREATE
	public Purchase createPurchase(Purchase b) {
		return purchaseRepo.save(b);
	}

	// -READ ONE
	public Purchase findPurchase(Long id) {
		
	
		Optional<Purchase> optionalPurchase = purchaseRepo.findById(id);
		
		//return optionalExpense.isPresent()? optionalExpense.get():null;
		
		if (optionalPurchase.isPresent()) {
			return optionalPurchase.get();
		} else {
			return null;
		}
	}

    //update
	public Purchase updatePurchase(Purchase b) {
		Purchase updatedPurchase = purchaseRepo.save(b);
		return updatedPurchase;
	}

//    
	// delete
	public void deletePurchase(Long id) {
		purchaseRepo.deleteById(id);
	}

	// returns all in the cart
	public List<Purchase> allPurchaseCart(Long cartId) {
		return purchaseRepo.findByCartId(cartId);
	}
	
	// CREATE
		public Purchase findProductInCart(Long productId, Long cartId) {
			Optional<List<Purchase>> optionalPurchase = Optional.ofNullable(purchaseRepo.findProductInCart(productId, cartId));
			
			System.out.println(optionalPurchase.isPresent());
			if (optionalPurchase.isPresent()) {
				System.out.println(optionalPurchase.get().size());
			}
			if (optionalPurchase.isPresent() && optionalPurchase.get().size() > 0) {
				return optionalPurchase.get().get(0);
			} else {
				return null;
			}
		}
		

	    
		// delete
		public void deletePurchaseCart(Long productId, Long cartId) {
			purchaseRepo.deleteProductInCart(productId, cartId);
		}


}
