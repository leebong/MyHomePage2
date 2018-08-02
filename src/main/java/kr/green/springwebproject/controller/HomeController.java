package kr.green.springwebproject.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.green.springwebproject.dao.Board;
import kr.green.springwebproject.dao.BoardMapper;
import kr.green.springwebproject.dao.User;
import kr.green.springwebproject.dao.UserMapper;
import kr.green.springwebproject.pagenation.Criteria;
import kr.green.springwebproject.pagenation.PageMaker;
import kr.green.springwebproject.service.BoardService;
import kr.green.springwebproject.service.UserService;



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	BoardService boardService;
	
	//2018-06-22 메일추가
	@Autowired
	private JavaMailSender mailSender;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request) {
				
		return "login";
	}
	
		@RequestMapping(value = "/index")
		public String index(Model model,Criteria cri
				,String search, Integer type, HttpServletRequest request) {
		
			if(cri == null) {
				cri = new Criteria();
			}
			cri.setPerPageNum(100);
			PageMaker pageMaker = new PageMaker();
			int totalCount = boardService.getCountByBoardList(type, search, cri);
			ArrayList<Board>list = boardService.getListBoard(type, search, cri);
			
			pageMaker.setCriteria(cri);
			pageMaker.setTotalCount(totalCount);
			
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			
			boolean admin = userService.isAdmin(user);
			
			model.addAttribute("admin", admin);
			model.addAttribute("list",list);
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("search", search);
			model.addAttribute("type", type);

	
			return "index";
		}
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String homePost(Model model, HttpServletRequest request) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		User user;
		if((user = userService.login(id, pw)) != null) {			
			model.addAttribute("user", user);
			return "redirect:/index";
		}
		return "redirect:/";
	}
	
	/*
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String homePost(Model model, HttpServletRequest request) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		User user;
		if((user = userService.login(id, pw)) != null) {			
			model.addAttribute("user", user);
			return "redirect:/board/list";
		}
		return "redirect:/";
	}	
	*/
	
	@RequestMapping(value ="/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		return "redirect:/";
	}
	
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public String signupGet(HttpServletRequest request) {
		return "signup";
	}
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public String signupPost(HttpServletRequest request, User user) {

		if(!userService.signup(user))
			return "redirect:/signup";
		else {
			return "redirect:/";
		}
	}
	
	@RequestMapping("/member/dup")
	@ResponseBody
	public Map<Object, Object> idcheck(@RequestBody String id){
	    int count = 0;
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    if(userService.checkUser(id))
	        count = 1;
	    map.put("cnt", count);
	    System.out.println(id);
	    return map;
	}
	
	
	
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String ModifyGet(HttpServletRequest request,
			Model model) {
		HttpSession session = request.getSession();
		User nowUser = (User)session.getAttribute("user");
		model.addAttribute("nowUser", nowUser);
		return "/modify";
	}
	
	@RequestMapping(value="/member/withdraw")
	public String Withdraw(HttpServletRequest request,
			Model model) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		userService.withdraw(user);
		
		return "redirect:/logout";
	}
	
	
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String ModifyPost(HttpServletRequest request,
			Model model, User user) {
		HttpSession session = request.getSession();
		//user의 정보를 이용해서 UserMapper에 있는 xxx메소드를 호출
		//하여 db의 정보를 수정
		User nowUser = (User)session.getAttribute("user");
		user = userService.modify(nowUser, user);
		if(user != null) {
			session.removeAttribute("user");
			session.setAttribute("user", user);
		}
		return "redirect:/board/list";
	}
	
	// 2018-06-22 mailSending 코드
	@RequestMapping(value = "/mail/mailForm")
	public String mailForm() {

	    return "mail";
	} 
	
	// 2018-06-22 mailSending 코드
	@RequestMapping(value = "/mail/mailSending")
	public String mailSending(HttpServletRequest request) {

	    String setfrom = "bong2you@gmail.com";         
	    String tomail  = request.getParameter("tomail");     // 받는 사람 이메일
	    String title   = request.getParameter("title");      // 제목
	    String content = request.getParameter("content");    // 내용

	    try {
	        MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper messageHelper 
	            = new MimeMessageHelper(message, true, "UTF-8");

	        messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	        messageHelper.setTo(tomail);     // 받는사람 이메일
	        messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	        messageHelper.setText(content);  // 메일 내용

	        mailSender.send(message);
	    } catch(Exception e){
	        System.out.println(e);
	    }

	    return "redirect:/mail/mailForm";
	}
	
	
	@RequestMapping(value = "/test", method=RequestMethod.GET)
	public String TestGet() {
	
	
		return "/test";
	}
	@ResponseBody
	@RequestMapping(value = "/test", method=RequestMethod.POST, 
		produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> TestPost(MultipartFile file) {
		
	
		return new ResponseEntity<String>(file.getOriginalFilename(),
				HttpStatus.OK);
	}
	
	
	//Start Bootstrap 
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGet(Model model, HttpServletRequest request) {
				
		return "login";
	}
	
	/*
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String index(Model model, HttpServletRequest request) {
				
		return "home";
	}
	*/
	
	@RequestMapping(value = "/blank", method = RequestMethod.GET)
	public String blank(Model model, HttpServletRequest request) {
				
		return "blank";
	}
	
	@RequestMapping(value = "/cards", method = RequestMethod.GET)
	public String cards(Model model, HttpServletRequest request) {
				
		return "cards";
	}
	
	
	/*@RequestMapping(value = "/chart", method = RequestMethod.GET)
	public String charts(Model model, HttpServletRequest request) {
				
		return "/jsp/chart";
	}*/
	
	
	/*  2018-08-01 수정
	 *  package com.canvasjs.controllers;

		import org.springframework.stereotype.Controller;
		import org.springframework.ui.ModelMap;
		import org.springframework.web.bind.annotation.RequestMapping;
		import org.springframework.web.bind.annotation.RequestMethod;
		import org.springframework.web.servlet.ModelAndView;
		
		@Controller
		public class HomeController {
	*/ 	
		@RequestMapping(value = "/charts", method = RequestMethod.GET)
		public ModelAndView chart(ModelMap model) {
			ModelAndView modelAndView = new ModelAndView("/charts");
			modelAndView.addObject("title", "Home");
			return modelAndView;
		}
	
	
	
	
	@RequestMapping(value = "/forgot-password", method = RequestMethod.GET)
	public String forgotpassword(Model model, HttpServletRequest request) {
				
		return "forgot-password";
	}
	/*
	@RequestMapping(value = "/gulpfile", method = RequestMethod.GET)
	public String gulpfile(Model model, HttpServletRequest request) {
				
		return "gulpfile";
	}
	
	@RequestMapping(value = "/navbar", method = RequestMethod.GET)
	public String navbar(Model model, HttpServletRequest request) {
				
		return "navbar";
	}
	*/
	/*
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String rigster(Model model, HttpServletRequest request) {
				
		return "register";
	}
	*/
	
	
	//SpringWebChart

	/*@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(ModelMap model) {
		ModelAndView modelAndView = new ModelAndView("index");
		modelAndView.addObject("title", "Home");
		return modelAndView;
	}*/
	
	
	
}








