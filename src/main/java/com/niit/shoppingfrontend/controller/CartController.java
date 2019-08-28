package com.niit.shoppingfrontend.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.shoppingbackend.model.Cart;
import com.niit.shoppingbackend.model.Customer;
import com.niit.shoppingbackend.model.Item;
import com.niit.shoppingbackend.repository.CartRepository;
import com.niit.shoppingbackend.repository.CustomerRepository;
import com.niit.shoppingbackend.repository.ItemRepository;
import com.niit.shoppingbackend.repository.ProductRepository;
import com.niit.shoppingbackened.service.EmailService;

@Controller
public class CartController {

	@Autowired
	ItemRepository itemRepository;
	@Autowired
	Item item;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	CartRepository cartRepository;
	@Autowired
	ProductRepository productRepository;
	@Autowired 
	Cart cart;
	@Autowired
	CustomerRepository customerRepository;
	@Autowired 
	EmailService emailService;
	
	@RequestMapping("/addToCart/{id}")
	public String addToCart(@PathVariable("id") int productId,Model model)
	{
		HttpSession session = request.getSession();
		int customerId = ((Customer)session.getAttribute("customer")).getCustomerId();
		System.out.println(customerId+" skljbf");
		
		Item item1=itemRepository.getItemByProductIdAndCustomerId(productId,customerId);
		cart = cartRepository.getCartBYCustomer(customerId);
		System.out.println(cart.getCartId() + "hello");
		if(item1 == null)
		{
			item.setCustomerId(customerId);
			item.setCart(cart);
			item.setPrice(productRepository.getProductById(productId).getProductPrice());
			item.setProduct(productRepository.getProductById(productId));
			item.setQuantity(1);
			itemRepository.addItem(item);
			cart.getItems().add(item);
		}
		else
		{
			item1.setQuantity(item1.getQuantity()+1);
			itemRepository.updateItem(item1);
		}
		System.out.println(cart.getItems().size() + "jsdjn");
		return "redirect:/placeOrder";
	}
	
	@RequestMapping("/placeOrder")
	public String placeorder(Model model)
	{
		HttpSession session = request.getSession();
		int customerId =((Customer)session.getAttribute("customer")).getCustomerId();
		Cart cart = cartRepository.getCartBYCustomer(customerId);
		List<Item> itemList = itemRepository.getItemListByCartId(cart.getCartId());
		model.addAttribute("itemList",itemList);
		return "placeorder";
	}
	
	@RequestMapping("/increaseQuantity/{id}")
	public String increaseQuantity(@PathVariable("id") int itemId,Model model)
	{
		itemRepository.increaseQuantity(itemId);
		return "redirect:/placeOrder";
	}
	
	@RequestMapping("/decreaseQuantity/{id}")
	public String decreaseQuantity(@PathVariable("id") int itemId,Model model)
	{
		itemRepository.decreaseQuantity(itemId);
		return "redirect:/placeOrder";
	}
	@RequestMapping("/deleteItem/{id}")
	public String deleteItem(@PathVariable("id") int itemId,Model model)
	{
		itemRepository.deleteItem(itemId);
		return "redirect:/placeOrder";
	}
	@RequestMapping("/confirmDetails")
	public String confirmDetails(Model model)
	{
		HttpSession session = request.getSession();
		int customerId = ((Customer)session.getAttribute("customer")).getCustomerId();
		Customer customer = customerRepository.getCustomerById(customerId);
		model.addAttribute("customer", customer);
		return "confirmdetails";
	}
	
	public int totalPurchaseAmount(List<Item> itemList)
	{
		int amount = 0;
		for(Item item: itemList)
		{
			amount += item.getPrice()*item.getQuantity();
		}
		return amount;
	}
	
	@RequestMapping("/confirmOrder")
	public String confirmOrder(Model model)
	{
		HttpSession session = request.getSession();
		int customerId =((Customer)session.getAttribute("customer")).getCustomerId();
		Cart cart = cartRepository.getCartBYCustomer(customerId);
		List<Item> itemList = itemRepository.getItemListByCartId(cart.getCartId());
		model.addAttribute("itemList",itemList);
		model.addAttribute("totalPurchaseAmount", totalPurchaseAmount(itemList));
		return "orderitems";
	}
	@RequestMapping("/editDetails")
	public String editDetails(Model model)
	{
		HttpSession session = request.getSession();
		int customerId = ((Customer)session.getAttribute("customer")).getCustomerId();
		Customer customer = customerRepository.getCustomerById(customerId);
		model.addAttribute("customer", customer);
		return "signup";
	}
	@RequestMapping("/place")
	public String place()
	{
		HttpSession session = request.getSession();
		Customer customer = (Customer)session.getAttribute("customer");
		emailService.orderPlaced(customer);
		return "index";
	}
}
