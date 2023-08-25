package kh.lclass.spring2.board.model.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class AttachFileVo {
	private int bno;
	private String filepath;
	private String fileno;

}
