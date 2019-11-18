package com.cg.ibs.rm.controller;

import java.io.IOException;
import java.math.BigInteger;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cg.ibs.rm.exception.IBSExceptions;
import com.cg.ibs.rm.model.AccountBean;
import com.cg.ibs.rm.model.AutoPayment;
import com.cg.ibs.rm.model.Beneficiary;
import com.cg.ibs.rm.model.CreditCard;
import com.cg.ibs.rm.model.ServiceProvider;
import com.cg.ibs.rm.model.ServiceProviderId;
import com.cg.ibs.rm.service.AccountService;
import com.cg.ibs.rm.service.AutoPaymentService;
import com.cg.ibs.rm.service.BeneficiaryAccountService;
import com.cg.ibs.rm.service.CreditCardService;
import com.cg.ibs.rm.service.CustomerService;
import com.cg.ibs.rm.ui.Type;

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
	private AccountService accountService;
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
			modelAndView.setViewName("custfinal");

		} catch (IBSExceptions e) {
			modelAndView.setViewName("exceptionpage");
			modelAndView.addObject("exception", e.getMessage());
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
			mv.addObject("name", customerService.returnName(uci));
			mv.setViewName("submitcard");

		} catch (IBSExceptions e) {
			mv.setViewName("exceptionpage");
			mv.addObject("exception", e.getMessage());
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
			mv.setViewName("exceptionpage");
			mv.addObject("exception", e.getMessage());
		}
		return mv;
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
				modelAndView.setViewName("exceptionpage");
				modelAndView.addObject("exception", e.getMessage());
			}
		}

		return modelAndView;

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
			mv.addObject("name", customerService.returnName(uci));
			mv.setViewName("submitben");
		} catch (IBSExceptions e) {
			mv.setViewName("exceptionpage");
			mv.addObject("exception", e.getMessage());
		}
		return mv;
	}

	@RequestMapping(method = RequestMethod.POST, value = "/otherbank")
	public ModelAndView addOtherBeneficiary(@ModelAttribute Beneficiary beneficiary) {
		ModelAndView mv = new ModelAndView();
		beneficiary.setTimestamp(LocalDateTime.now());
		try {
			beneficiaryservice.saveBeneficiaryAccountDetails(uci, beneficiary);
			mv.addObject("name", customerService.returnName(uci));
			mv.setViewName("submitben");
		} catch (IBSExceptions e) {
			mv.setViewName("exceptionpage");
			mv.addObject("exception", e.getMessage());
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
			mv.setViewName("exceptionpage");
			mv.addObject("exception", e.getMessage());
		}
		return mv;
	}

	@RequestMapping(method = RequestMethod.GET, value = "/modifybeneficiary")
	public ModelAndView modifybeneficiary(@RequestParam("accountNumber") BigInteger accountNumber) {
		ModelAndView mv = new ModelAndView();
		Beneficiary beneficiary;
		try {
			beneficiary = beneficiaryservice.getBeneficiary(accountNumber);
			if (beneficiary.getType().equals(Type.MYACCOUNTINIBS)
					|| beneficiary.getType().equals(Type.OTHERSACCOUNTINIBS)) {
				mv.addObject(beneficiary);
				mv.setViewName("modifyinibs");
			} else {
				mv.addObject(beneficiary);
				mv.setViewName("modifyinother");
			}
		} catch (IBSExceptions e) {
			mv.setViewName("exceptionpage");
			mv.addObject("exception", e.getMessage());
		}
		return mv;
	}

	@RequestMapping(method = RequestMethod.GET, value = "/modifyinibs")
	public String modifyibs() {
		return "modifyinibs";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/modifyinother")
	public String modifyother() {
		return "modifyinother";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/modifyinother")
	public ModelAndView modifyOtherBeneficiary(@ModelAttribute Beneficiary beneficiary) {
		ModelAndView mv = new ModelAndView();
		beneficiary.setTimestamp(LocalDateTime.now());
		try {
			beneficiaryservice.modifyBeneficiaryAccountDetails(beneficiary.getAccountNumber(), beneficiary);
			mv.addObject("name", customerService.returnName(uci));
			mv.setViewName("submitben");
		} catch (IBSExceptions | IOException e) {
			mv.setViewName("exceptionpage");
			mv.addObject("exception", e.getMessage());
		}
		return mv;
	}

	@RequestMapping(method = RequestMethod.POST, value = "/modifyinibs")
	public ModelAndView modifyIbsBeneficiary(@ModelAttribute Beneficiary beneficiary) {
		ModelAndView mv = new ModelAndView();
		beneficiary.setTimestamp(LocalDateTime.now());
		try {
			beneficiary.setBankName("IBS");
			beneficiary.setIfscCode("IBS45623778");
			beneficiaryservice.modifyBeneficiaryAccountDetails(beneficiary.getAccountNumber(), beneficiary);
			mv.addObject("name", customerService.returnName(uci));
			mv.setViewName("submitben");

		} catch (IBSExceptions | IOException e) {
			mv.setViewName("exceptionpage");
			mv.addObject("exception", e.getMessage());
		}
		return mv;
	}

	@RequestMapping("/deleteben")
	public ModelAndView deletebeneficiary(@RequestParam BigInteger accountNumber, @RequestParam String delete) {
		ModelAndView modelAndView = new ModelAndView();
		if (delete.equalsIgnoreCase("Delete")) {
			try {
				boolean check = beneficiaryservice.deleteBeneficiaryAccountDetails(accountNumber);
				if (check) {
					modelAndView.addObject("savedBeneficiaries", beneficiaryservice.showBeneficiaryAccount(uci));
					modelAndView.setViewName("viewben");
				}

			} catch (IBSExceptions e) {
				modelAndView.setViewName("exceptionpage");
				modelAndView.addObject("exception", e.getMessage());
			}
		}
		return modelAndView;
	}

	@RequestMapping("/autopayment")
	public String showAutoPaymentHome() {
		return "autopaymenthome";
	}

	@RequestMapping("/autopaymentnav")
	public String autoPaymentNav() {
		return "autopaymentnav";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/addautopayment")
	public ModelAndView addAutoPayment() {
		ModelAndView mv = new ModelAndView();
		try {
			Set<AccountBean> accounts = accountService.getAccountsOfUci(uci);
			mv.addObject("accounts", accounts);
			mv.setViewName("addautopayment");

		} catch (IBSExceptions e) {
			mv.setViewName("exceptionpage");
			mv.addObject("exception", e.getMessage());
		}
		mv.setViewName("addautopayment");
		return mv;
	}

	@RequestMapping(method = RequestMethod.POST, value = "/addautopayment")
	public ModelAndView addAutoPaymentDetails(@ModelAttribute AutoPayment autoPayment,
			@RequestParam("account") BigInteger accountNumber) {
		ModelAndView mv = new ModelAndView();
		BigInteger spId = null;
		Set<ServiceProvider> serviceProviders = autoPaymentService.showIBSServiceProviders();
		for (ServiceProvider serviceProvider : serviceProviders) {
			if (serviceProvider.getNameOfCompany().equals(autoPayment.getServiceName())) {
				spId = serviceProvider.getSpi();
			}
		}
		autoPayment.setServiceProviderId(new ServiceProviderId(spId, uci));
		try {
			autoPaymentService.autoDeduction(spId, accountNumber, autoPayment);
			mv.addObject("name", customerService.returnName(uci));
			mv.setViewName("submitautopayment");

		} catch (IBSExceptions e) {
			mv.setViewName("exceptionpage");
			mv.addObject("exception", e.getMessage());
		}
		return mv;
	}

	@RequestMapping(method = RequestMethod.GET, value = "/viewautopayment")
	public ModelAndView viewAutoPayments() {
		ModelAndView mv = new ModelAndView();
		try {
			mv.addObject("savedBeneficiaries", beneficiaryservice.showBeneficiaryAccount(uci));
			mv.setViewName("viewautopayment");
		} catch (IBSExceptions e) {
			mv.setViewName("exceptionpage");
			mv.addObject("exception", e.getMessage());
		}
		return mv;
	}

	@RequestMapping("/deleteautopayment")
	public ModelAndView deleteAutoPayment(@RequestParam BigInteger accountNumber, @RequestParam String delete) {
		ModelAndView modelAndView = new ModelAndView();
		if (delete.equalsIgnoreCase("Delete")) {
			try {
				boolean check = beneficiaryservice.deleteBeneficiaryAccountDetails(accountNumber);
				if (check) {
					modelAndView.addObject("beneficiaries", beneficiaryservice.showBeneficiaryAccount(uci));
					modelAndView.setViewName("viewautopayment");
				}

			} catch (IBSExceptions e) {
				modelAndView.setViewName("exceptionpage");
				modelAndView.addObject("exception", e.getMessage());
			}
		}

		return modelAndView;

	}

}
