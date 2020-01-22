package com.my.aop;

import org.aspectj.lang.ProceedingJoinPoint;

public class Profiler {

	public Object processTime(ProceedingJoinPoint joinPoint) throws Throwable{
		String sigString = joinPoint.getSignature().toShortString();
		long start = System.currentTimeMillis();
		try {
			Object result = joinPoint.proceed();
			return result;
		}finally {
			long finish = System.currentTimeMillis();
			System.out.println(sigString+" : 정상 종료. 실행시간 ("+(finish-start)+" ms)");
		}
	}
}