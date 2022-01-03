package com.bitc.board.common;

import java.io.File;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bitc.board.dto.BoardFileDto;

//	@Component : 스프링프레임워크가 자동으로 객체를 실행할 자바 클래스, @Bean과 동일한 기능을 가지고 있음, @Bㄷ무과의 차이점 @Bea은 스프링프레임워크에  기본 등록되어 있는 라이브러리이고, @Commponent는 사용자가 필요에 따라서 작성하여 추가하는 것 
@Component 
public class FileUtils {

	public List<BoardFileDto> parseFleInfo(int boardIdx, MultipartHttpServletRequest mulfiFiles) throws Exception {
		
		if (ObjectUtils.isEmpty(mulfiFiles)) {
			return null;
		}
		
		List<BoardFileDto> fileList = new ArrayList<>();
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyyMMdd");
		ZonedDateTime current = ZonedDateTime.now();
		String path = "images/" + current.format(format);
		File file = new File(path);
		
		if (file.exitsts() == false) {
				file.mkdirs();
			}
		
		Iterator<String> iterator = multifiles.getFileNames()
		String newFileName;
		String originalFileExtension;
		String contentType;
		
		while (iterator.hasNext()) {
			String name = iterator.next();
			List<MultipartFile> list = multiFiles.getFiles(name);
			
			for (MultipartFile mfile : list) {
				if (mFile.isEmpty() == false) {
					cotentType = mFile.getContentType();
					if (ObjectUtils.isEmpty(contentType)) {
						break;
					}
					else {
						if (contentType.contains("image/jpeg")) {
							originalFileExtension = ".jpg";
						}
						else if (contentType.contains("image/png")) {
							originalFileExtension = ".png";
						}
						else if (contentType.contains("image/gif")) {
							originalFileExtension = ".gif";
						} 
						else {
							break;
						}
					}
				}
			}
		}
		return null;
	}
	
}
