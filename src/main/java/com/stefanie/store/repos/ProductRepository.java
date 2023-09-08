package com.stefanie.store.repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.stefanie.store.models.Product;
@Repository

public interface ProductRepository extends CrudRepository<Product, Long> {
	List<Product> findAll();

}
