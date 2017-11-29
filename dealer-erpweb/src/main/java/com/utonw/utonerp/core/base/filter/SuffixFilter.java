package com.utonw.utonerp.core.base.filter;

import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by WANGYJ on 2017/11/3.
 */
@Component
@WebFilter
public class SuffixFilter extends OncePerRequestFilter {
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        if ((request.getRequestURI().startsWith("/admin"))&&request.getRequestURI().endsWith(".jsp")&&(!request.getRequestURI().equals("index.jsp"))){
            request.getRequestDispatcher("/WEB-INF/views/"+request.getRequestURI().substring(7)).forward(request,response);
        }
        else if (request.getRequestURI().startsWith("/admin")){
            request.getRequestDispatcher(request.getRequestURI().substring(6)).forward(request,response);
        }else {
            filterChain.doFilter(request,response);
        }
    }
}
