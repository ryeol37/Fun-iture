package com.my.mailing;

import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;




@Controller
public class MailingController{
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	MailingService mailingService;
	
	
	@RequestMapping(value = "/admailing/list")
	public ModelAndView list(HttpSession session) throws Exception {
		
		session.getAttribute("session_id");
		if(session.getAttribute("session_id")!=null) {
			
			String id = (String) session.getAttribute("session_id");
		}
		
		List<MailingModel> list = mailingService.list(); // 쿼리문 호출
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("ad/mailing/adMailList");
		mav.addObject("list",list); // list 값 저장 후 jsp에서 list이름으로 사용함.
		return mav;
	}
	
	@RequestMapping(value="mailing/insert", method = RequestMethod.POST)
	@ResponseBody
	public void insert(HttpServletRequest request,MailingModel model) throws Exception {
		
		String email = request.getParameter("email");
		System.out.println(email);
		
		model.setEmail(email);
		
		mailingService.insert(model);
		
		return;
		
		
	}
	
	 @RequestMapping(value = "admailing/write", method = RequestMethod.GET)
	 @ResponseBody
		public ModelAndView write(@RequestParam(value="email",required=false)String email, HttpServletRequest request) {
			
			ModelAndView mav = new ModelAndView();
			
			String[] mail = request.getParameterValues("email");
			
			System.out.println(mail[0]);
			
			mav.addObject("email",mail[0]);
			mav.setViewName("adMailWrite");
			
			return mav;
		}
	 
	@RequestMapping(value="admailing/write", method = RequestMethod.POST)
	public String mailSend(HttpServletRequest request,@RequestParam(value="email",required=false)String email) {
		
		
		String from = "rhddbid18@gmail.com";
		String subject = request.getParameter("subject");
		System.out.println(subject);
		
		String[] mail = email.split(",");
		/*String email[] = request.getParameterValues("email");*/
		for (String emaillist : mail) // 배열에 이용되는 for문 for(변수 : 배열) 'mail'배열에 들어있는 값들을 하나씩 'maillist' 변수에 대입 시키기.
		{
			System.out.println("////////////배열에서 뽑아낸 값"+emaillist);
		}
		/*String email = request.getParameter("email");*/
		String content = request.getParameter("content");
		try {
			MimeMessage message = mailSender.createMimeMessage(); // 메일전송
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(from.trim()); // 보내는 사람
			messageHelper.setSubject(subject.trim()); // 메일 제목 (생략가능)
			messageHelper.setText(content.trim()); // 메일 내용
			
			for(int i=0; i<mail.length; i++) {
				// for(초기화; 조건; 반복) : i변수를 0으로 초기화 하고, i가 mail 사이즈보다 작을 경우에 반복하고, 반복문 수행할 때마다 i를 1씩 증가 시키기. 
			messageHelper.setTo(mail[i]); // 받는 사람
			
			mailSender.send(message);
			
			} 
			
			
		} catch(Exception e) {
			System.out.println(e);
		}
		
		return "redirect:/admailing/list";
	}
}
