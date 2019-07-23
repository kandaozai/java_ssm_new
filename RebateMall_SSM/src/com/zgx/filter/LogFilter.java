package com.zgx.filter;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 日志过滤器 打印servlet日志
 * 
 * @ClassName LogFilter
 * @author en
 * @date 2018年4月22日 下午8:52:10
 */
public class LogFilter implements Filter {
	private Log log;

	public void init(FilterConfig config) throws ServletException {
		log = LogFactory.getLog(this.getClass());
		String filterName = config.getFilterName();// 获取 Filter的 name，启动Filter
		log.info(filterName+" 初始化完成....");//
	}

	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;

		String requestURI = request.getRequestURI(); // 获取访问的URI
		String methode = request.getMethod();// 请求方式
		String addr = request.getRemoteAddr();// 客户端地址
		String servletName = "";//servlet名称 和web.xml中名字
		//使用正则表达式从请求地址中匹配servlet名称
		String regex = "(?<=/)[a-zA-Z]+(Servlet)";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(requestURI);
		if (matcher.find()) {
			servletName = matcher.group(0);
		}
		//基本日志
		String strlog = addr + " " + methode + "方式  Servlet[" + servletName + "]";
		//StringBuffer 构建打印日志
		StringBuffer stringBuffer = new StringBuffer();
		stringBuffer.append(strlog);
		stringBuffer.append("\n\n");
		stringBuffer.append("\n----------------------------------------------------------------------------------------------");
		//变量所有的parameters
		Enumeration<String> em = request.getParameterNames();
		String parameterName;
		String parameterValue;
		while (em.hasMoreElements()) {
			parameterName = em.nextElement();
			parameterValue = req.getParameter(parameterName);
			if(parameterValue!=null){  
				//判断是否乱码，如果乱码，ISO-8859-1转UTF-8
			    if(!(java.nio.charset.Charset.forName("GBK").newEncoder().canEncode(parameterValue))){  
			        try {  
			        	parameterValue = new String(parameterValue.getBytes("ISO-8859-1"),"UTF-8");  
			        } catch (UnsupportedEncodingException e) {  
			            e.printStackTrace();  
			        }     
			    }     
			} 
			stringBuffer.append("\n " + parameterName + " => " + parameterValue);
		}
		stringBuffer.append("\n----------------------------------------------------------------------------------------------");
		log.info(stringBuffer.toString());

		long startTime = System.currentTimeMillis(); // 运行前的时间

		chain.doFilter(request, response);//继续转发
		
		long endTime = System.currentTimeMillis(); // 结束的时间
		log.info(strlog + ", 总用时 " + (endTime - startTime) + " 毫秒。");
	}

	public void destroy() { // 销毁时记录日志
	}
}
