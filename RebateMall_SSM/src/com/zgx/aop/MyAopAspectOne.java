package com.zgx.aop;


import java.lang.reflect.Method;
import java.util.List;

import javax.annotation.Resource;
import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.jboss.weld.bootstrap.api.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;


import org.springframework.context.ApplicationContext;

import com.zgx.common.service.BaseService;
import com.zgx.po.Conpanytable;
import com.zgx.po.Signuptable;
import com.zgx.service.ISignupService;
import com.zgx.service.impl.CompanyServiceImpl;
import com.zgx.service.impl.SignupServiceImpl;

/**
 * 
* 定义切面（aop）
*
* @author 星月
*
*/

/**
 * 在类上使用 @Aspect 注解 使之成为切面类
 * 在类上使用 @Component 注解 把切面类加入到IOC容器中
 * 采用AOP的方式处理参数问题。（注解方式AOP）
 * @author 星月
 */
@Component  //放入Spring容器
@Aspect     //切面注解
//@Order(1)    //设置优先级
public class MyAopAspectOne {
	private static final Logger logger =LoggerFactory.getLogger(MyAopAspectOne.class);

	
	@Autowired
	private ISignupService signupService;//用户（登录）
	
	//配置切入点execution(* com.zgx.service.*.*(..)),该方法无方法体,主要为方便同类中其他方法使用此处配置的切入点
	//匹配com.gx.web包下所有的类  ???  不是com.zgx.service包下所有的类吗
	@Pointcut("execution(* com.zgx.service.*.*(..))")
	public void aspect(){ }
	
	
	
	
	/**
	* 前置通知, 在方法执行之前执行
	* 使用在方法aspect()上注册的切入点
	* @param joinPoint
	*/
	@Before(value="aspect()")
	public void beforeMethod(JoinPoint joinPoint){
		
		
		//logger.info(joinPoint.getTarget());
		
		//Service serviceTemp=applicationContext.getBean(SignupServiceImpl.class);
		//SignupServiceImpl serviceTemp= ApplicationContext.getBean(SignupServiceImpl.class);
		
		
//		System.out.println("123");
		
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		
		//response.sendRedirect(新地址);
		
		//List<Signuptable> xxx=signupService.findAll();
		String  MCs="";//名字
		int  BCs=0;//版次
		String  MC="";//名字
		int  BC=0;//版次
		//Signuptable sssf=signupService.findBySQL();  
		
		logger.info("查询的:\n"+"OK");
		
//		try{
//			Signuptable sessionYH = (Signuptable) session.getAttribute("SESSION_USER");// 获取登录数据
//			MCs=sessionYH.getSignupname();
//			int intt=sessionYH.getSignupId();
//			BCs=sessionYH.getEdition();//版次
//			
//			Signuptable  selectA=signupService.findByIdparmint(intt);
//			MC=selectA.getSignupname();
//			BC=selectA.getEdition();//版次
//		}catch (Exception e) {
//			MCs="出错";
//		}
//		
//     logger.info("session:\n"+"名字："+MCs+"\n 版次:"+BCs+"\n");
     //logger.info("查询的:\n"+"名字："+MC+"\n 版次:"+BC+"\n");
	}
	
	
	
	
	

//|------------------------------------| 说明  |------------------------------------|
	//1、JoinPoint
//	 java.lang.Object[] getArgs()：获取连接点方法运行时的入参列表； 
//	 Signature getSignature() ：获取连接点的方法签名对象； 
//	 java.lang.Object getTarget() ：获取连接点所在的目标对象； 
//	 java.lang.Object getThis() ：获取代理对象本身；
	   //getDeclaringTypeName返回方法所在的包名和类名
	   //getname() 返回方法名
	   //getthis()没有说其实也是返回一个对象生成的代理对象
//	
	//2、ProceedingJoinPoint
//	   ProceedingJoinPoint继承JoinPoint子接口，它新增了两个用于执行连接点方法的方法： 
//	 java.lang.Object proceed() throws java.lang.Throwable：通过反射执行目标对象的连接点处的方法； 
//	 java.lang.Object proceed(java.lang.Object[] args) throws java.lang.Throwable：通过反射执行目标对象连接点处的方法，不过使用新的入参替换原来的入参。 
	

}
