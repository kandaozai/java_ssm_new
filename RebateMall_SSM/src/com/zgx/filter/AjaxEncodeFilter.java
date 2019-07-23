package com.zgx.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @title: AjaxEncodeFilter.java
 * @description: 对AJAX进行字符编码过滤
 */
public class AjaxEncodeFilter implements Filter {
	public void doFilter(ServletRequest servletRequest,
			ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;

		String requestedWith = request.getHeader("x-requested-with");
		String type = request.getContentType();
		if (requestedWith != null && "XMLHttpRequest".equals(requestedWith)
				&& null != type
				&& "application/x-www-form-urlencoded".equals(type)) {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
		}

		filterChain.doFilter(request, response); // 继续执行  
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
}
