package com.nastation.pm.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nastation.pm.Global;
import com.nastation.pm.bean.User;

/**
 * 检查用户是否登陆, session是否过期
 * 
 * @author Kris
 * @version 2009-1-13
 */
public class LoginValidFilter implements Filter {

    private String loginURI;

    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession();

        User user = (User) session.getAttribute(Global.SESSION_USER);
        if (user == null) {
            res.sendRedirect(req.getContextPath() + loginURI);
            return;
        }
        chain.doFilter(request, response);
    }

    public void init(FilterConfig filterConfig) throws ServletException {
        loginURI = filterConfig.getInitParameter("loginURI");
        if (loginURI == null) {
            throw new ServletException("Error: The loginURI parameter not found!");
        }
    }

}
