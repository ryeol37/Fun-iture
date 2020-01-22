package com.my.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.my.notice.NoticeModel;

public class NoticeValidator implements Validator{

	// 유효성 검사를 수행할 클래스를 설정하는 메소드
	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		System.out.println("validator 클래스의 유효성 검사할 클래스////////////  "+clazz.getName());
		return NoticeModel.class.isAssignableFrom(clazz);
	}
	
	// 실제 유효성 검사를 수행하는 메소드
	// target:유효성 검사를 수행할 대상
	// errors:유효성 검사에 실패했을 때 출력할 메시지를 저장하는 객체
	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		
		NoticeModel model = (NoticeModel)target;
		
		// 검사시작 : 유효성 검사하는 대상 값의 null 여부
		// subject에 값이 없으면 required.subject 라는 에러메시지를 전송한다는 설정.
		// content도 위와 같음.
		
		if(model.getSubject()==null||model.getSubject().trim().length()<1) {
			errors.rejectValue("subject", "required");
		}
		if(model.getContent()==null||model.getContent().trim().length()<1) {
			errors.rejectValue("content", "required");
		}
		
	}
	
	
}
