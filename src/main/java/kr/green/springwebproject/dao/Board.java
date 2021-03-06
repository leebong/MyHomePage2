package kr.green.springwebproject.dao;

import java.text.SimpleDateFormat;
import java.util.Date;

/* DB에서 게시판 정보를 가져와 저장할 클래스 */
public class Board {
	/* 멤버 : DB 테이블(board)에 있는 속성과 이름을
	 * 일치 시켜야한다. */
	private Integer number;
	private String title;
	private String author;
	private String contents;
	private String disable="FALSE";
	private Date created_date;
	private String email;
	private Integer hit;
	private String filepath;
	
	
	public String getDisable() {
		return disable;
	}
	public void setDisable(String disable) {
		this.disable = disable;
	}
	public Integer getNumber() {
		return number;
	}
	public String getTitle() {
		return title;
	}
	public String getAuthor() {
		return author;
	}
	public String getContents() {
		return contents;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getHit() {
		return hit;
	}
	public void setHit(Integer hit) {
		this.hit = hit;
	}
	/*	public Date getCreated_date() {
		return created_date;
	}
	
*/	
	public String getCreated_date() {
		 SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String date = myFormat.format(created_date);

		return date;
	}
	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	
	@Override
	public String toString() {
		return "Board [number=" + number + ", title=" + title + ", author=" + author + ", contents=" + contents + "]";
	}
	
	
}
