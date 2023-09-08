package com.stefanie.store.repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.stefanie.store.models.Cart;
@Repository
public interface CartRepository extends CrudRepository<Cart, Long> {
	List<Cart> findAll();

}
