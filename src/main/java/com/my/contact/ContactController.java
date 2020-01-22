package com.my.contact;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ContactController {

	 @RequestMapping(value = "/contact", method = RequestMethod.GET)
		public ModelAndView contact() {
			
			ModelAndView mav = new ModelAndView();
			
			mav.setViewName("contact/contact");
			
			return mav;
		}
}
