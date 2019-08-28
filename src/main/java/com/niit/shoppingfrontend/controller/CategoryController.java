package com.niit.shoppingfrontend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.shoppingbackend.model.Category;
import com.niit.shoppingbackend.repository.CategoryRepository;

@Controller
public class CategoryController {
	@Autowired
	CategoryRepository categoryRepository;
	
	@RequestMapping(value = "/addCategory",method = RequestMethod.POST)
	public String addCategory(@ModelAttribute("category") Category category)
	{
		
		if(category.getCategoryId()==0)
		categoryRepository.addCategory(category);
		else
			categoryRepository.updateCategory(category);
		return "redirect:/category";
	}
	
	@RequestMapping("/editCategory/{id}")
	public String editCategory(@PathVariable("id") int categoryId,Model model)
	{
		System.out.println(categoryId);
		Category category = categoryRepository.getCategoryById(categoryId);
		model.addAttribute("category",category);
		return "category";
	}
	
	@RequestMapping("/deleteCategory/{id}")
	public String deleteCategory(@PathVariable("id") int categoryId,Model model)
	{
		System.out.println(categoryId);
		categoryRepository.deleteCategory(categoryId);
		return "redirect:/category";
	}

}
