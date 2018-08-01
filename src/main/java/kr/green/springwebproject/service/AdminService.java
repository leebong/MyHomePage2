package kr.green.springwebproject.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.springwebproject.dao.Board;
import kr.green.springwebproject.dao.BoardMapper;
import kr.green.springwebproject.dao.User;
import kr.green.springwebproject.dao.UserMapper;
import kr.green.springwebproject.pagenation.Criteria;

@Service
public class AdminService {
	@Autowired
	BoardMapper boardMapper;
	
	@Autowired
	UserMapper userMapper;
	
	public int getCountAdminBoards() {
		return boardMapper.getCountBoardByAdmin();
		
	}
	
	public ArrayList<Board> getAdminBoards(Criteria cri){
		return (ArrayList)boardMapper.getListPageByAdmin(cri);
	}
	
	public boolean isSuperAdmin(User user) {
		if(user.getAdmin().compareTo("ADMIN")==0)
			return false;
		return true;
	}

	public void setBoardDisable(int number, String disable) {
		Board board = boardMapper.getBoardByNumber(number);
		board.setDisable(disable);
		boardMapper.modifyBoardByDisable(board);
	}
	
	public int countUsersExceptLoginUser(User nowUser) {
		return userMapper.countUsersExceptLoginUser(nowUser);
	}
	
	public ArrayList<User> userListExceptLoginUser(User nowUser, Criteria cri){
		return (ArrayList)userMapper.userListExceptLoginUser(nowUser, cri);
	}
	
	public boolean setUserAdmin(String id, String admin) {		
		User user = userMapper.loginById(id);
		if(user != null) {
			user.setAdmin(admin);
			userMapper.updateUser(user);
			return true;
		}
		return false;
	}
	
	public boolean deleteBoard(Integer number) {	
		if(number != null) {
			Board board = boardMapper.getBoardByNumber(number);
			boardMapper.deleteBoardByDisable(board);
			return true;
		}
		return false;
	}
	
	
}
