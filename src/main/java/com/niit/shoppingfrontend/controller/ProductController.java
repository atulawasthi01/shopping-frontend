package com.niit.shoppingfrontend.controller;


import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.shoppingbackend.model.Category;
import com.niit.shoppingbackend.model.Product;
import com.niit.shoppingbackend.repository.CategoryRepository;
import com.niit.shoppingbackend.repository.ProductRepository;



@Controller
public class ProductController {
	
	@Autowired
	ProductRepository productRepository;
	@Autowired
	CategoryRepository categoryRepository;
	
	@RequestMapping(value = "/addProduct" ,method = RequestMethod.POST)
	public String addProduct(@ModelAttribute("product") Product product,RedirectAttributes redirectAttribute,HttpSession session)
	{
		if(product.getProductId() == 0){
			if(!product.getProductImage().isEmpty()){
				productRepository.addProduct(product);
				try{
					byte[] bytes = product.getProductImage().getBytes();
					ServletContext context = session.getServletContext();
					String path = context.getRealPath("/resources/images/");
					String location = path + product.getProductId() + ".jpg";
					FileOutputStream fos = new FileOutputStream(location);
					fos.write(bytes);
					fos.close();
					
				}
				catch(Exception exception)
				{
					exception.printStackTrace();
				}
			}
			else 
			{
				redirectAttribute.addFlashAttribute("message","Please select a file");
			}
		}
		else 
		{
			if(!product.getProductImage().isEmpty()){
				productRepository.updateProduct(product);
				try{
					byte[] bytes = product.getProductImage().getBytes();
					ServletContext context = session.getServletContext();
					String path = context.getRealPath("/resources/images/");
					String location = path + product.getProductId() + ".jpg";
					FileOutputStream fos = new FileOutputStream(location);
					fos.write(bytes);
					fos.close();
				}
				catch(Exception exception)
				{
					exception.printStackTrace();
				}
			}
			else 
			{
				redirectAttribute.addFlashAttribute("message","Please select a file");
			}
		}
		return "redirect:/product";
	}
	
	@RequestMapping("/editProduct/{id}")
	public String editProduct(@PathVariable("id") int productId,Model model)
	{
		Product product = productRepository.getProductById(productId);
		model.addAttribute("product",product);
		List<Category> categoryList = categoryRepository.getAllCategories();
		model.addAttribute("categoryList",categoryList);
		return "product";
	}
	
	@RequestMapping("/deleteProduct/{id}")
	public String deleteCategory(@PathVariable("id") int productId,Model model)
	{
		productRepository.deleteProduct(productId);
		return "redirect:/product";
	}


}
