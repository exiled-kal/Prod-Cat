package com.tseringkalden.prodcat.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tseringkalden.prodcat.models.Category;
import com.tseringkalden.prodcat.models.Product;
import com.tseringkalden.prodcat.services.MainService;

@Controller
public class MainController {
	private final MainService mainService;
	
	public MainController(MainService mainService) {
		this.mainService = mainService;
	}
	
	@GetMapping("/")
	public String index(@ModelAttribute("product") Product product) {
		return "index.jsp";
	}
	
	@PostMapping("/products/new")
	public String newProd(@Valid @ModelAttribute("product") Product product, BindingResult results) {
		if (results.hasErrors()) {
			return "index.jsp";
		}
		mainService.createProduct(product);
		return "redirect:/category/new";
	}
	
	@GetMapping("/category/new")
	public String cat(@Valid @ModelAttribute("category") Category category, BindingResult results) {
		return "category.jsp";
	}
	
	@PostMapping("/category/new")
	public String newCat(@Valid @ModelAttribute("category") Category category, BindingResult results) {
		if (results.hasErrors()) {
			return "category.jsp";
		}
		mainService.createCategory(category);
		return "redirect:/category/new";
	}
	@GetMapping("/products/{id}")
	public String viewProduct(@PathVariable("id") Long id, Model model) {
		Product product = mainService.findProduct(id);
		List <Category> allCategories = mainService.getAllCategories();
		model.addAttribute("product", product);
		model.addAttribute("allCategories", allCategories);
		return "showproduct.jsp";
	}
	@PostMapping("/products/{id}")
	public String addCatToProd(@PathVariable("id")Long productId, @RequestParam("category") Long categoryId) {
		Product product = mainService.findProduct(productId);
		Category category = mainService.findCategory(categoryId);
		product.getCategories().add(category);
		mainService.createProduct(product);
		return "redirect:/products/"+productId;
	}
	@DeleteMapping("/products/{id}")
	public String deleteCatToProd(@PathVariable("id")Long productId, @RequestParam("category") Long categoryId) {
		Product product = mainService.findProduct(productId);
		Category category = mainService.findCategory(categoryId);
		product.getCategories().remove(category);
		mainService.createProduct(product);
		return "redirect:/products/"+productId;
	}
}