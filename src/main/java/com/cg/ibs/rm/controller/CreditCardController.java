package com.cg.ibs.rm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cg.ibs.rm.exception.IBSExceptions;
import com.cg.ibs.rm.model.CreditCard;
import com.cg.ibs.rm.service.CreditCardService;
import com.cg.ibs.rm.service.CustomerService;

@Controller
public class CreditCardController {

	@Autowired
	private CreditCardService creditCard;
	@Autowired
	private CustomerService custService;

	@RequestMapping("/creditcard")
	public ModelAndView showcardHome() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("cardHome");
		return mv;
	}

	@RequestMapping("/cardnav")
	public String cardnav() {
		return "cardnav";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/addcard")
	public String addCardGo() {
		return "addcard";
	}

	@RequestMapping("/saveCard")
	public ModelAndView addCard(@ModelAttribute CreditCard card) {
		ModelAndView mv = new ModelAndView();
		try {
			creditCard.saveCardDetails(card.getCustomer().getUci(), card);
			mv.addObject("name", custService.returnName(card.getCustomer().getUci()));
			mv.setViewName("submitcard");
			
		} catch (IBSExceptions e) {
			mv.setViewName("custfinal");
			mv.addObject("name", e.getMessage());
		}
		return mv;
	}
	
	
	@RequestMapping(method = RequestMethod.GET, value = "/view")
	public String viewCard(@ModelAttribute CreditCard card) {
		return "viewcard";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/view")
	public ModelAndView viewCardPost(@ModelAttribute CreditCard card) {
		ModelAndView mv= new ModelAndView();
			mv.setViewName("submitcard");
		return mv;
		}

}
