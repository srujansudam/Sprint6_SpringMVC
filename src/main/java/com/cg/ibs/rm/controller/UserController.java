package com.cg.ibs.rm.controller;

import java.math.BigInteger;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cg.ibs.rm.exception.IBSExceptions;
import com.cg.ibs.rm.model.Beneficiary;
import com.cg.ibs.rm.model.CreditCard;
import com.cg.ibs.rm.service.AutoPaymentService;
import com.cg.ibs.rm.service.BeneficiaryAccountService;
import com.cg.ibs.rm.service.CreditCardService;
import com.cg.ibs.rm.service.CustomerService;

@RequestMapping("/")
@Controller
@Scope("session")
public class UserController {
	@Autowired
	private AutoPaymentService autoPaymentService;

	BigInteger uci;
	@Autowired
	CustomerService customerService;
	@Autowired
	private CreditCardService creditCard;
	@Autowired
	private CustomerService custService;
	@Autowired
	private BeneficiaryAccountService beneficiaryservice;

	@RequestMapping({ "/", "/chooseidentity" })
	public String home() {
		return "chooseidentity";
	}

	@RequestMapping("/customer")
	public String customer() {
		return "userinput";
	}

	@RequestMapping("/custnav")
	public String custnav() {
		return "custnav";
	}

	@RequestMapping("/remittance")
	public String cust_rem() {
		return "remittance";
	}

	@RequestMapping("/remnav")
	public String remnav() {
		return "remnav";
	}

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

	@RequestMapping("/bennav")
	public String bennav() {
		return "bennav";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/userinput")
	public String logout() {
		return "userinput";
	}

	@ExceptionHandler(IBSExceptions.class)
	@RequestMapping(method = RequestMethod.POST, value = "/userinput")
	public ModelAndView getName(@RequestParam("userId") String userName) {
		ModelAndView modelAndView = new ModelAndView();
		try {
			uci = customerService.returnUCI(userName);
			modelAndView.addObject("name", customerService.returnName(uci));
			modelAndView.addObject("uci", uci);
			modelAndView.setViewName("custfinal");

		} catch (IBSExceptions e) {
			modelAndView.setViewName("custfinal");
			modelAndView.addObject("name", e.getMessage());
		}
		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.GET, value = "/addcard")
	public String addCardGo() {
		return "addcard";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/addcard")
	public ModelAndView addCard(@ModelAttribute CreditCard card) {
		ModelAndView mv = new ModelAndView();
		LocalDate date = LocalDate.of(card.getYear(), card.getMonth(), 27);
		card.setDateOfExpiry(date);
		try {
			creditCard.saveCardDetails(uci, card);
			mv.addObject("name", "ABC");
			mv.setViewName("submitcard");

		} catch (IBSExceptions e) {
			mv.setViewName("custfinal");
			mv.addObject("name", e.getMessage());
		}
		return mv;
	}

	@RequestMapping(method = RequestMethod.GET, value = "/viewcard")
	public ModelAndView viewCardDetails() {
		ModelAndView mv = new ModelAndView();
		try {
			mv.addObject("savedCards", creditCard.showCardDetails(uci));
			mv.setViewName("viewcard");
		} catch (IBSExceptions e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping("/beneficiary")
	public ModelAndView showBenHome() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("benhome");
		return mv;
	}

	@RequestMapping(method = RequestMethod.GET, value = "/addbentype")
	public String addBenGo() {
		return "addbentype";
	}

	@RequestMapping("/samebank")
	public String sambank() {
		return "samebank";
	}

	@RequestMapping("/otherbank")
	public String otherbank() {
		return "otherbank";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/samebank")
	public ModelAndView addSameBeneficiary(@ModelAttribute Beneficiary beneficiary) {
		ModelAndView mv = new ModelAndView();
		beneficiary.setBankName("IBS");
		beneficiary.setIfscCode("IBS45623778");
		beneficiary.setTimestamp(LocalDateTime.now());
		try {
			beneficiaryservice.saveBeneficiaryAccountDetails(uci, beneficiary);
			mv.addObject("name", "ABC");
			mv.setViewName("submitben");

		} catch (IBSExceptions e) {
			mv.setViewName("custfinal");
			mv.addObject("name", e.getMessage());
		}
		return mv;
	}

	@RequestMapping(method = RequestMethod.POST, value = "/otherbank")
	public ModelAndView addOtherBeneficiary(@ModelAttribute Beneficiary beneficiary) {
		ModelAndView mv = new ModelAndView();
		beneficiary.setTimestamp(LocalDateTime.now());
		try {
			beneficiaryservice.saveBeneficiaryAccountDetails(uci, beneficiary);
			mv.addObject("name", "ABC");
			mv.setViewName("submitben");

		} catch (IBSExceptions e) {
			mv.setViewName("custfinal");
			mv.addObject("name", e.getMessage());
		}
		return mv;
	}

	@RequestMapping(method = RequestMethod.GET, value = "/viewben")
	public ModelAndView viewBeneficiaries() {
		ModelAndView mv = new ModelAndView();
		try {
			mv.addObject("savedBeneficiaries", beneficiaryservice.showBeneficiaryAccount(uci));
			mv.setViewName("viewben");
		} catch (IBSExceptions e) {
			e.printStackTrace();
		}
		return mv;
	}

//
//	@RequestMapping(method = RequestMethod.POST, value = "/modifybeneficiary")
//	public ModelAndView modifybeneficiary() {
//
//	}
//
	@RequestMapping("/deleteben")
	public ModelAndView deletebeneficiary(@RequestParam BigInteger accountNumber, @RequestParam String delete) {
		ModelAndView modelAndView = new ModelAndView();
		if (delete.equalsIgnoreCase("Delete")) {
			try {
				boolean check = beneficiaryservice.deleteBeneficiaryAccountDetails(accountNumber);
				if (check) {
					modelAndView.addObject("beneficiaries", beneficiaryservice.showBeneficiaryAccount(uci));
					modelAndView.setViewName("viewben");
				}

			} catch (IBSExceptions e) {
				modelAndView.setViewName("viewben");
			}
		}

		return modelAndView;

	}

	@RequestMapping("/deletecard")
	public ModelAndView deleteCreditCard(@RequestParam BigInteger cardNumber, @RequestParam String delete) {
		ModelAndView modelAndView = new ModelAndView();
		if (delete.equalsIgnoreCase("Delete")) {
			try {
				boolean check = creditCard.deleteCardDetails(cardNumber);
				if (check) {
					modelAndView.addObject("savedCards", creditCard.showCardDetails(uci));
					modelAndView.setViewName("viewcard");
				}

			} catch (IBSExceptions e) {
				modelAndView.setViewName("viewcard");
			}
		}

		return modelAndView;

	}

}
