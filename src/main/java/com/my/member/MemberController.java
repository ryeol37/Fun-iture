package com.my.member;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.my.validator.MemberValidator;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	ModelAndView mav = new ModelAndView();
	
	// 로그인 페이지
	@RequestMapping(value="/loginform", method = RequestMethod.GET)
	public String loginForm(){
		return "member/loginform";
	}

	  //아이디 중복 확인
	  @RequestMapping(value = "/checkId", method = RequestMethod.POST)
	  @ResponseBody
	    public String checkId(HttpServletRequest request, MemberModel member) {
	        String id = request.getParameter("id");
	        System.out.println("id="+id);
	        int rowcount= memberService.checkId(id);
	        System.out.println("count="+ rowcount);
	        if(rowcount==0) {
	        		rowcount = 1;
	        }else if(rowcount > 0){
	        		rowcount = 2;
	        }
	        return String.valueOf(rowcount);
	    }

	// 로그인 여부
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public ModelAndView memberLogin(HttpServletRequest request, MemberModel mem){
		
		MemberModel result = memberService.memberLogin(mem);
		
		if(result != null){
			String status = result.getStatus();
			if(status.equals("Y")) {
			System.out.println("로그인 성공");
			HttpSession session = request.getSession();
			
			session.setAttribute("mem", result);
			session.setAttribute("session_id", result.getId());
			session.setAttribute("session_name" ,result.getName());
			session.setAttribute("session_no" ,result.getNo());
			session.setAttribute("session_status" ,result.getStatus());

			
			mav.setViewName("member/loginSuccess");
			mav.setViewName("redirect:/main");
			return mav;
			}else {
				// 로그인 실패
				mav.setViewName("member/loginError");
				return mav;
			}

		}else {
			mav.setViewName("member/loginError");
			return mav;
		}
	}
	
	// 로그아웃
	@RequestMapping("/logout")
	public ModelAndView memberLogout(HttpServletRequest request, MemberModel mem){
		HttpSession session = request.getSession(false);
		
		if(session != null){
			System.out.println("로그아웃 성공");
			session.invalidate();
		}
		
		mav.setViewName("member/logout");
		mav.setViewName("redirect:/main");
		return mav;
	}
	
	// 유효성 검사시 에러발생시 넘어가게 하는 로직 ( joinform 의 commandName )
	@ModelAttribute("member")
	public MemberModel formBack(){
		return new MemberModel();
	}
	
	// 이용약관 , 개인정보 동의
	@RequestMapping("/joinAgree")
	public ModelAndView joinAgree(){
		mav.setViewName("member/joinAgree");
		return mav;
	}
	
	// 회원정보 입력
	@RequestMapping("/joinform")
	public ModelAndView join(){
		mav.setViewName("member/joinform");
		return mav;
	}
	
	// 회원가입완료
	@RequestMapping("/joinFinish")
	public ModelAndView joinFinish(@ModelAttribute("member") MemberModel member, BindingResult result){
		
		// Validate Binding
		new MemberValidator().validate(member, result);
		
		// 에러가 있으면 회원가입폼으로 넘어감
		if(result.hasErrors()){
			mav.setViewName("member/joinform");
			return mav;
		}
		try{
			// 유효성 검사에 통과하면 회원가입완료
			memberService.insertMember(member);
			mav.setViewName("member/joinFinish");
			return mav;
		}catch(DuplicateKeyException e){
			// https://msdn.microsoft.com/ko-kr/library/system.data.linq.duplicatekeyexception(v=vs.110).aspx
			// db에서 id의 제약조건을 unique로 바꿨기 때문에 중복된 아이디로 가입하려하면 DuplicateKeyException이 뜨게되고
			// 예외처리로 properties파일에 등록된 "invalid"의 내용이 나오게 만들고 회원가입폼으로 돌아가게했음.
			// 아이디 중복검사
			result.reject("invalid", null);
			mav.setViewName("member/joinform");
			return mav;
		}
	}
	
	@RequestMapping("memberModifyform")
  	public ModelAndView memberModifyform(MemberModel member, HttpServletRequest request, HttpSession session) {	
		session.getAttribute("session_id");
		String id = (String) session.getAttribute("session_id");
			member =  memberService.getMember(id);
	
			mav.addObject("member", member);
			mav.setViewName("member/memberModify");
			return mav;
  	}
	
	// 회원정보 수정
	@RequestMapping("/memberModify")
	public ModelAndView memberModify(MemberModel member, HttpServletRequest request){
		
			memberService.memberModify(member);			
			mav.setViewName("redirect:/mypage/myform"); 
			return mav;
		}

	
	
	// 회원탈퇴폼
	@RequestMapping("/Deleteform")
	public ModelAndView memberDelete(){
		mav.setViewName("member/Deleteform");
		return mav;
	}
	
	// 회원탈퇴
	@RequestMapping("/memberDelete")
	public ModelAndView memberDelete(@ModelAttribute("member") MemberModel member, BindingResult result, HttpServletRequest requeset, HttpSession session){
		MemberModel memberModel;
		String id;
		String password;
		int deleteCheck;
		
		password = requeset.getParameter("password");
		
		id = session.getAttribute("session_id").toString();
		memberModel = (MemberModel)memberService.getMember(id);
		
		if(memberModel.getPassword().equals(password)){
			deleteCheck = 1;
			
			memberService.memberDelete(id);
			session.removeAttribute("session_id");
			session.removeAttribute("session_name");
			session.removeAttribute("session_no");
			session.invalidate();
		}else{
			deleteCheck = -1;	// 패스워드가 틀릴 때
		}
		
		mav.addObject("deleteCheck",deleteCheck);
		mav.setViewName("member/deleteResult");
		return mav;
	}
	
	//아이디 찾기 
	@RequestMapping("/findIdform")
	public ModelAndView memberIdFindForm(){
		mav.setViewName("member/findIdform");
		return mav;
	}
	
	@RequestMapping("/findId")
	public ModelAndView memberIdFind(@ModelAttribute("member") MemberModel member, HttpServletRequest request){
		
		int memberFindChk;
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		member.setName(name);
		member.setEmail(email);
		
		member = memberService.idFindByName(member);
		
		if(member == null){
			memberFindChk = 0;
			mav.addObject("memberFindChk",memberFindChk);
			mav.setViewName("member/findIdError");
			return mav;
		}else{
			if(member.getName().equals(name) && member.getEmail().equals(email)){
				memberFindChk = 1;
				mav.addObject("member",member);
				mav.addObject("memberFindChk",memberFindChk);
				mav.setViewName("member/findIdOk");
				return mav;
			}else{
				memberFindChk = -1;
				mav.addObject("memberFindChk",memberFindChk);
				mav.setViewName("member/findIdError");
				return mav;
			}
		}
	}
	
	//비밀번호 찾기
	@RequestMapping("/findPwform")
	public ModelAndView memberFindForm(){
		mav.setViewName("member/findPwform");
		return mav;
	}
	
	@RequestMapping("/findPw")
	public ModelAndView memberPwFind(@ModelAttribute("member") MemberModel member, HttpServletRequest request){
		
		int memberFindChk;
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		
		member.setId(id);
		member.setEmail(email);
		
		member = memberService.pwFindByName(member);
		
		if(member == null){
			memberFindChk = 0;
			mav.addObject("memberFindChk",memberFindChk);
			mav.setViewName("member/findPwError");
			return mav;
		}else{
			if(member.getId().equals(id) && member.getEmail().equals(email)){
				memberFindChk = 1;
				mav.addObject("member",member);
				mav.addObject("memberFindChk",memberFindChk);
				mav.setViewName("member/findPwOk");
				return mav;
			}else{
				memberFindChk = -1;
				mav.addObject("memberFindChk",memberFindChk);
				mav.setViewName("member/findPwError");
				return mav;
			}
		}
	}
	
}
