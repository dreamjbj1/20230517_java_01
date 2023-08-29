package kh.lclass.spring2.common;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileUpload {

		// @return : 저장한 파일명
	public String saveFile(MultipartFile multi, HttpServletRequest req) {
		String resultFileName = null;
		
		String realPath = req.getSession().getServletContext().getRealPath("");
		String savePath = "resources/upload";
		File folder = new File(resultFileName+savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		return resultFileName;
	}
		
}
