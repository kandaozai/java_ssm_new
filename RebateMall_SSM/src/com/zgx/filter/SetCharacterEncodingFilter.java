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

public class SetCharacterEncodingFilter implements Filter{
	private String encoding="utf-8";
	private boolean ignore=true; 
	
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		String encoding= filterConfig.getInitParameter("encoding");
		String ignore= filterConfig.getInitParameter("ignore");
		if (encoding!=null && !"".equals(encoding)) {
			this.encoding=encoding;
		}
		
		if (ignore!=null) {
			try {
				this.ignore=Boolean.valueOf(ignore);
			} catch (Exception e) {
			}
		}
		System.out.println("init");
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		if (this.ignore && (request.getCharacterEncoding() == null)) {
			if (encoding!=null) {
				request.setCharacterEncoding(encoding);
				response.setCharacterEncoding(encoding);
				System.out.println("doFilter");
			}
		}
		
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		encoding=null;
	}

}
