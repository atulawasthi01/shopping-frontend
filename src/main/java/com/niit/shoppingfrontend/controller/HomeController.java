package com.niit.shoppingfrontend.controller;


import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.shoppingbackend.model.BillingAddress;
import com.niit.shoppingbackend.model.Category;
import com.niit.shoppingbackend.model.Customer;
import com.niit.shoppingbackend.model.Product;
import com.niit.shoppingbackend.model.ShippingAddress;
import com.niit.shoppingbackend.model.Supplier;
import com.niit.shoppingbackend.repository.CategoryRepository;
import com.niit.shoppingbackend.repository.CustomerRepository;
import com.niit.shoppingbackend.repository.ProductRepository;
import com.niit.shoppingbackend.repository.SupplierRepository;
import com.niit.shoppingbackened.service.EmailService;

@Controller
public class HomeController {
	@Autowired
	Category category;
	@Autowired
	Product product;
	@Autowired
	Supplier supplier;
	@Autowired
	CategoryRepository categoryRepository;
	@Autowired
	ProductRepository productRepository;
	@Autowired
	SupplierRepository supplierRepository;
	@Autowired
	Customer customer;
	@Autowired 
	ShippingAddress shippingAddress;
	@Autowired
	BillingAddress billingAddress;
	@Autowired
	CustomerRepository customerRepository;
	@Autowired
	HttpSession session;
	@Autowired
	EmailService emailService;
	@Autowired 
	HttpServletRequest request;

	
	@RequestMapping("/")
	public String homePage()
	{
		Principal principal = request.getUserPrincipal();
		List<Category> categoryList = categoryRepository.getAllCategories();
		session.setAttribute("catList", categoryList);
		System.out.println("PRINCIPAL IS  NOT ACTIVE " + principal);
		if(principal!=null){
			String customerEmail = principal.getName();
			System.out.println("PRINCIPAL IS ACTIVE " + customerEmail);
			Customer customer = customerRepository.getCustomerByEmail(customerEmail);
			session.setAttribute("customer", customer);
		}
		return "index";
	}
	@RequestMapping("/logg")
	public String logg()
	{
		return "redirect:/";
	}
	@RequestMapping("/welcome/{id}")
	public String welcome(@PathVariable("id")int customerId)
	{
		Customer customer = customerRepository.getCustomerById(customerId);
		customer.setEnable(1);
		customerRepository.updateCustomer(customer);
		return "redirect:http://www.gmail.com";
	}
	@RequestMapping("/login")
	public String loginPage()
	{
		System.out.println("hello world");
		return "login";
	}
	
	@RequestMapping("/signup")
	public String signupPage(Model model)
	{
		customer.setShippingAddress(shippingAddress);
		customer.setBillingAddress(billingAddress);
		model.addAttribute("customer", customer);
		return "signup";
	}
	@RequestMapping("/adminpage")
	public String adminPage()
	{
		System.out.println("hello world");
		return "adminpage";
	}
	
	@RequestMapping("/category")
	public String categoryPage(Model model)
	{
		List<Category> categoryList = categoryRepository.getAllCategories();
		System.out.println("dello " + category.getCategoryId());
		model.addAttribute("category",category);
		model.addAttribute("categoryList",categoryList);
		return "category";
	}
	
	@RequestMapping("/product")
	public String productPage(Model model)
	{
		List<Category> categoryList = categoryRepository.getAllCategories();
		List<Product> productList = productRepository.getAllProducts();
		model.addAttribute("productList",productList);
		model.addAttribute("categoryList",categoryList);
		model.addAttribute("product",product);
		return "product";
	}
	
	@RequestMapping("/supplier")
	public String supplierPage(Model model)
	{
		List<Supplier> supplierList = supplierRepository.getAllSuppliers();
		model.addAttribute("supplierList",supplierList);
		model.addAttribute("supplier",supplier);
		return "supplier";
	}
	
	@RequestMapping("/addCustomer")
	public String addCustomer(@ModelAttribute("customer") Customer customer,Model model)
	{
		System.out.println("hello");
		System.out.println(customer.getCustomerId());
		if(customer.getCustomerId() == 0){
			customerRepository.addCustomer(customer);
			emailService.approvedUserMessage(customer);
			return "redirect:/signup";
		}
		else
		{
			//emailService.approvedUserMessage(customer);
			customerRepository.updateCustomer(customer);
			model.addAttribute("customer", customerRepository.getCustomerById(customer.getCustomerId()));
			return "confirmdetails";
		}
	}
	@RequestMapping("/view/{categoryId}")
	public String viewPage(@PathVariable("categoryId") int categoryId,Model model)
	{
		List<Product>productList = productRepository.getProductListByCategoryId(categoryId);
		model.addAttribute("productList", productList);
		return "view";
	}
	@RequestMapping("/details/{id}")
	public String detailsPage(@PathVariable("id") int productId,Model model)
	{
		Product product = productRepository.getProductById(productId);
		model.addAttribute("product", product);
		return "details";
	}
}
