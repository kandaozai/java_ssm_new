package com.zgx.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

//@Component
//@Aspect
//@Order(2)    //设置优先级
public class Aoptow {
	private static final Logger logger =LoggerFactory.getLogger(Aoptow.class);

	@Pointcut("execution(* com.zgx.web.MainController.play(int)) && args(trackNumber)")
    public void pointcut(int trackNumber) { // 形参名必须和 args()一致
		
    }

    // @Around("pointcut(trackNumber)")中的 "trackNumber"
    // 不必与 args() 相同 ，可以另外命名的，但必须保证本通知内一致即可。
    @Around("pointcut(trackNumber)")
    public void countTrack(ProceedingJoinPoint pjp, int trackNumber) {
        try {
            pjp.proceed(); //调用被通知方法
            // 每次调用被通知方法成功之后。
            // System.out.println(" is tow ");
            logger.info(" is tow");
           
        } catch (Throwable e) {
            // 调用出现异常后的代码
        }
    }
	

}
