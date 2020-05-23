package com.myspring.pro30.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.pro30.member.vo.MemberVO;


public interface MemberController {
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addMember(@ModelAttribute("info") MemberVO memberVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	// @ModelAttribute는 JSP에서 Form 태그를 통해 전달받은 파라미터들을 객체로 바인딩 시키는 경우에 사용할 수 있다.
	public ModelAndView removeMember(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView login(@ModelAttribute("member") MemberVO member,
                              RedirectAttributes rAttr,
                              HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView modMember(@ModelAttribute("info") MemberVO member, HttpServletRequest request, HttpServletResponse response) throws Exception;
	// @ModelAttribute는 JSP에서 Form 태그를 통해 전달받은 파라미터들을 객체로 바인딩 시키는 경우에 사용할 수 있다.

}
