package kh.lclass.io;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.SQLException;

public class TestFileIO {
	public void testFile() /*throws SQLException */ {
//			File f1= new File("D: /data/aaa.txt");
//			f1.mkdir();
			String path = "D:/data2/test";
			String filename = "aaa.txt";
			
			new File(path).mkdirs(); //디렉토리 생성
			File f2 = new File(path, filename);
			FileWriter fw = null;
			try {
			  f2.createNewFile(); // 파일생성
			  
			  fw = new FileWriter(f2);
			  fw.write("abcdefgsss");
			  fw.flush();
			  return;
			  
			  
			
			  
			  
			}catch (IOException e) {
			  System.out.println("file 생성 못함");
				e.printStackTrace();
			} finally {
				try {
					if(fw != null) fw.close();					
				} catch (IOException e) {
					e.printStackTrace();
			}
			
		}
	}
	
}
