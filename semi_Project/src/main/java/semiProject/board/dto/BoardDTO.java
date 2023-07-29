package semiProject.board.dto;

public class BoardDTO {

	private int board_id;
	private String user_id;
	private String title;
	private int rating;
	private String content;
	private String registerDate;
	private String modifyDate;
	private int readCount;
	
	public BoardDTO() {
	
	}

	public int getBoard_id() {
		return board_id;
	}

	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}

	public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	@Override
	public String toString() {
		return "BoardDTO [board_id=" + board_id + ", user_id=" + user_id + ", title=" + title + ", rating=" + rating
				+ ", content=" + content + ", registerDate=" + registerDate + ", modifyDate=" + modifyDate
				+ ", readCount=" + readCount + "]";
	}

	
	
	
	
	
}
