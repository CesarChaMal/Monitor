package com.monitor.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.monitor.controller.UserManager;
import com.monitor.filter.LoginFilter;

public class LoginFilter implements Filter {

    private static final Logger LOGGER = LoggerFactory
            .getLogger(LoginFilter.class);

    public static final String LOGIN_PAGE = "Monitor/login.xhtml";

    @Override
    public void doFilter(ServletRequest servletRequest,
            ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {

        HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;
        HttpServletResponse httpServletResponse = (HttpServletResponse) servletResponse;

        // managed bean name is exactly the session attribute name
        UserManager userManager = (UserManager) httpServletRequest
                .getSession().getAttribute("userManager");

        if (userManager != null) {
            if (userManager.isLoggedIn()) {
                LOGGER.debug("usuario esta logueado");
                // user is logged in, continue request
                filterChain.doFilter(servletRequest, servletResponse);
            } else {
                LOGGER.debug("usuario no esta logueado");
                // user is not logged in, redirect to login page
                httpServletResponse.sendRedirect(
                        httpServletRequest.getContextPath()
                                + LOGIN_PAGE);
            }
        } else {
            LOGGER.debug("Usuario  no encontrado");
            // user is not logged in, redirect to login page
            httpServletResponse.sendRedirect(
                    httpServletRequest.getContextPath() + LOGIN_PAGE);
        }
    }

    @Override
    public void init(FilterConfig arg0) throws ServletException {
        LOGGER.debug("LoginFilter iniciado");
    }

    @Override
    public void destroy() {
        // close resources
    }
}
