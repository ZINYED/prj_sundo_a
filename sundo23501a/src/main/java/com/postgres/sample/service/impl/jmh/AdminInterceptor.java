package com.postgres.sample.service.impl.jmh;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.postgres.sample.dto.UserInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AdminInterceptor extends EgovAbstractServiceImpl implements HandlerInterceptor {

	public AdminInterceptor() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		//return HandlerInterceptor.super.preHandle(request, response, handler);
		
		String requestURI = request.getRequestURI();        //  요청받은 페이지

        log.info("관리자 권한");
        log.info("requestURI : {}", requestURI);            //  요청받은 페이지

        UserInfo userInfo = (UserInfo) request.getSession(false).getAttribute("userInfo");        //  세션 내 UserInfo 받아옴
        String system_category = userInfo.getSystem_category();            //  사용자 UserInfo  ID

        log.info("관리자 시스템 {}: ", system_category.equals("1"));
        if (!system_category.equals("1")) {
            //  헤더의 내용 중 요청 이전의 URL을 String으로 받음.
            String referer = request.getHeader("Referer");
            String alertMessage = "관리자 권한이 없습니다.";

            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('" + alertMessage + "'); window.location.href='" + referer + "';</script>");
            out.flush();
            out.close();

            return false;
        }
        return true;
		
	}
}
