package com.niit.shoppingfrontend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.shoppingbackend.model.Supplier;
import com.niit.shoppingbackend.repository.SupplierRepository;


@Controller
public class SupplierController {

	@Autowired
	SupplierRepository supplierRepository;
	
	@RequestMapping(value = "/addSupplier" ,method = RequestMethod.POST)
	public String addSupplier(@ModelAttribute("supplier") Supplier supplier)
	{
		if(supplier.getSupplierId() == 0)
		supplierRepository.addSupplier(supplier);
		else supplierRepository.updateSupplier(supplier);
		return "redirect:/supplier";
	}
	
	@RequestMapping("/editSupplier/{id}")
	public String editSupplier(@PathVariable("id") int supplierId,Model model)
	{
		Supplier supplier = supplierRepository.getSupplierById(supplierId);
		model.addAttribute(supplier);
		return "supplier";
	}
	
	@RequestMapping("/deleteSupplier/{id}")
	public String deleteSupplier(@PathVariable("id") int supplierId)
	{
		supplierRepository.deleteSupplier(supplierId);
		return "redirect:/supplier";
	}
}
