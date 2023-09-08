package com.stefanie.store.repos;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.stefanie.store.models.Purchase;

@Repository
public interface PurchaseRepository extends CrudRepository<Purchase, Long> {
	List<Purchase> findAll();

	@Query(value = "SELECT * FROM purchases p WHERE p.cart_id = :cartId", nativeQuery = true)
	List<Purchase> findByCartId(@Param("cartId") Long cartId);

	@Query(value = "SELECT * FROM purchases p WHERE p.cart_id = :cartId AND p.product_id = :productId", nativeQuery = true)
	List<Purchase> findProductInCart(@Param("productId") Long productId, @Param("cartId") Long cartId);

	@Modifying
	@Transactional
	@Query(value = "DELETE FROM purchases p WHERE p.cart_id = :cartId AND p.product_id = :productId", nativeQuery = true)
	void deleteProductInCart(@Param("productId") Long productId, @Param("cartId") Long cartId);

}
