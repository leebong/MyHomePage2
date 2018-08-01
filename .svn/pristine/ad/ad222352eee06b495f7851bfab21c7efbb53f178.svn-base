package kr.green.springwebproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.green.springwebproject.dao.User;
import kr.green.springwebproject.dao.UserMapper;

@Service
public class UserService {
	/*
	 * 회원가입 페이지에서 입력받은 유저를 입력받아 회원가입이 진행 돼으면
	 * true를 반환하고, 진행하지 못했으면(유저 정보가  있으면) false 반환 
	 */
	@Autowired
	private UserMapper userMapper;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	public boolean signup(User user) {
		User searchUser = 
				userMapper.loginById(user.getId());
		
		if(searchUser != null)
			return false;
		else {
			String encPw = passwordEncoder.encode(user.getPw());
			user.setPw(encPw);
			user.setAdmin("USER");
			userMapper.signup(user);
			return true;
		}
		
	}
	
	
	public User login(String id, String pw) {
		User user = userMapper.loginById(id);
		if(user != null && passwordEncoder.matches(pw, user.getPw())) {
			return user;
		}
		else
			return null;
	}
	
	
	public User modify(User nowUser, User newUser) {
		try {
			newUser.setId(nowUser.getId());
			newUser.setAdmin(nowUser.getAdmin());
			if(newUser.getPw() == null || newUser.getPw().length() == 0) {
				newUser.setPw(nowUser.getPw());
			}
			else {
				String encPw = passwordEncoder.encode(newUser.getPw());
				newUser.setPw(encPw);			
			}
			userMapper.updateUser(newUser);
			return newUser;
		}catch(Exception e) {
			System.out.println("회원정보 수정에서 예외처리 발생!!");
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean withdraw(User user) {
		try {
			userMapper.withdraw(user);
			return true;
		}catch(Exception e) {
			System.out.println("회원 탈퇴에서 예외처리 발생!!");
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean isAdmin(User user) {
		if(user.getAdmin().compareTo("USER") != 0)
			return true;
		return false;
	}
	
	public boolean checkUser(String id) {
		User user = userMapper.loginById(id);
		if(user != null)
			return true;
		return false;
	}
	
}
