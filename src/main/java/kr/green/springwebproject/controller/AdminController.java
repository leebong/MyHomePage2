package kr.green.springwebproject.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.green.springwebproject.dao.Board;
import kr.green.springwebproject.dao.User;
import kr.green.springwebproject.pagenation.Criteria;
import kr.green.springwebproject.pagenation.PageMaker;
import kr.green.springwebproject.service.AdminService;
@Controller
@RequestMapping(value="/admin/*")
public class AdminController {
		
	@Autowired
	AdminService adminService;
	
	@RequestMapping(value ="board", method=RequestMethod.GET)
	public String adminMain(Model model, Criteria cri
			, HttpServletRequest request) {
		
		int totalCount = adminService.getCountAdminBoards();
		ArrayList<Board> list = adminService.getAdminBoards(cri);
		
		if(cri == null) {
			cri = new Criteria();
		}
		
		PageMaker pageMaker = new PageMaker();	
		
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		boolean admin = !adminService.isSuperAdmin(user);
		
		pageMaker.setCriteria(cri);
		pageMaker.setTotalCount(totalCount);
		
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list",list);
		model.addAttribute("admin", admin);
				
		return "admin/board";
	}
	
	@RequestMapping(value="board/disable")
	public String boardDisable(Model model, Integer number, String disable
			, Integer page) {
		adminService.setBoardDisable(number, disable);
		if(page == null)
			page = 1;	
		model.addAttribute("page", page);
		return "redirect:/admin/board";
	}
	
	@RequestMapping(value="board/delete")
	public String delete(Model model, Integer number, Integer page) {
			
		if(page == null)
			page = 1;
		
		model.addAttribute("page", page);
		adminService.deleteBoard(number);
		return "redirect:/admin/board";
	}
	
	
	@RequestMapping(value="user")
	public String adminUser(HttpServletRequest request, Model model,
			Criteria cri) {
		
		HttpSession session = request.getSession();
		User nowUser = (User)session.getAttribute("user");
		
		if(!adminService.isSuperAdmin(nowUser))
			return "redirect:/admin/board";
		if(cri == null)
			cri = new Criteria();
		PageMaker pageMaker = new PageMaker();
		
		int totalCount = adminService.countUsersExceptLoginUser(nowUser);
		ArrayList<User> list = adminService.userListExceptLoginUser(nowUser, cri);
		
		
		pageMaker.setCriteria(cri);
		pageMaker.setTotalCount(totalCount);
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", list);
		
		return "/admin/user";
	}

	@RequestMapping(value="/user/set")
	public String adminUserSet(Model model,	Integer page, String admin, String id) {
		adminService.setUserAdmin(id, admin);
		model.addAttribute("page", page);
		return "redirect:/admin/user";
	}
	
	
}
