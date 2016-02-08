package com.nastation.pm.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * 把所有的请求字符转成UTF8编码
 * 
 * @author sun 
 */
public class SetCharacterEncodingFilter implements Filter {

	public static final String UTF8 = "UTF-8";

	public void destroy() {
	}

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		req.setCharacterEncoding(UTF8);
		chain.doFilter(req, res);
	}

	public void init(FilterConfig arg0) throws ServletException {
	}

}
