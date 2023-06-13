package kh.lclass.exception;

public class UserException extends Throwable {
	
	public UserException() {
		super("유저익센셥 메시지입니다.");
	}
	 public UserException(String msg) {
	 	super(msg);
	 }
}
