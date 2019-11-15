package com.cg.ibs.rm.controller;

import java.math.BigInteger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cg.ibs.rm.exception.IBSExceptions;
import com.cg.ibs.rm.service.CustomerService;

@RequestMapping("/")
@Controller
public class UserController {

	@Autowired
	CustomerService customerService;

	@RequestMapping("/")
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

	@RequestMapping(method = RequestMethod.GET, value = "/userinput")
	public String logout() {
		return "userinput";
	}

	@ExceptionHandler(IBSExceptions.class)
	@RequestMapping(method = RequestMethod.POST, value = "/userinput")
	public ModelAndView getName(@RequestParam("userId") String userName) {
		ModelAndView modelAndView = new ModelAndView();
		try {
			BigInteger uci = customerService.returnUCI(userName);

			modelAndView.addObject("name", customerService.returnName(uci));
			modelAndView.setViewName("custfinal");

		} catch (IBSExceptions e) {
			modelAndView.setViewName("custfinal");
			modelAndView.addObject("name", e.getMessage());
		}
		return modelAndView;
	}
}
