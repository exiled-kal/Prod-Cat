package com.tseringkalden.prodcat.services;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Service;

import com.tseringkalden.prodcat.models.Category;
import com.tseringkalden.prodcat.models.Product;
import com.tseringkalden.prodcat.repositories.CategoryRepository;
import com.tseringkalden.prodcat.repositories.ProductRepository;

@Service
public class MainService {
	private final CategoryRepository cR;
	private final ProductRepository pR;
	
	public MainService(CategoryRepository cR, ProductRepository pR) {
		this.cR = cR;
		this.pR = pR;
	}

	public void createProduct(@Valid Product product) {
		pR.save(product);
		
	}

	public void createCategory(@Valid Category category) {
		cR.save(category);
		
	}

	public Product findProduct(Long id) {
		Product product = pR.findById(id).orElse(null);
		if (product == null) {
			return null;
		}
		return  product;
	}

	public List<Category> getAllCategories() {
		return cR.findAll();
	}

	public Category findCategory(Long id) {
		Category category = cR.findById(id).orElse(null);
		if (category == null) {
			return null;
		}
		return category;
	}
}