package AOP_Basic_05;

import java.lang.reflect.Method;
import java.util.Arrays;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.aop.AfterReturningAdvice;

public class LogPrintAfterAdvice implements AfterReturningAdvice {

	@Override
	public void afterReturning(Object returnvalue, Method method, Object[] args, Object target) throws Throwable {
		// TODO Auto-generated method stub
		Log log = LogFactory.getLog(this.getClass());
		log.info("[After Advice Start]");
		log.info("[보조업무] 주업무 함수가 실행되고 돌아와서바로 실행되는 함수 ");	
		log.info("method: " + method.getName());
		log.info("returnvalue: "+returnvalue);
		log.info("target: "+target.toString());
	}

	
	
}
