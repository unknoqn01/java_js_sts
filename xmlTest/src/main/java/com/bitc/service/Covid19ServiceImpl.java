package com.bitc.service;

import java.io.File;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;

import org.springframework.stereotype.Service;

import com.bitc.dto.Covid19DataBodyDto;
import com.bitc.dto.Covid19DataDto;
import com.bitc.dto.Covid19DataItemDto;
import com.bitc.dto.Covid19DataItemsDto;

@Service
public class Covid19ServiceImpl implements Covid19Service {

	@Override
	public List<Covid19DataItemDto> getItemList() throws Exception {
		JAXBContext jc = JAXBContext.newInstance(Covid19DataDto.class);
		Unmarshaller um = jc.createUnmarshaller();
		
		Covid19DataDto fullData = (Covid19DataDto)um.unmarshal(new File("C://java404//covid19.xml"));
		
		Covid19DataBodyDto body = fullData.getBody();
		Covid19DataItemsDto items = body.getItems();
		List<Covid19DataItemDto> itemList = items.getItemList();
		
		return itemList;
	}

	@Override
	public List<Covid19DataItemDto> getItemListRange(String strUrl) throws Exception {
		List<Covid19DataItemDto> itemList = null;
		
//		URL : 외부 리소스 주소를 지정하는 클래스
		URL url = null;
//		HttpURLConnection : http 프로토콜을 이용하여 지정된 URL로 네트워크 접속
		HttpURLConnection urlConn = null;
		
		try {
			url = new URL(strUrl);
			urlConn = (HttpURLConnection)url.openConnection();
			urlConn.setRequestMethod("GET");
			
			JAXBContext jc = JAXBContext.newInstance(Covid19DataDto.class);
			Unmarshaller um = jc.createUnmarshaller();
			
			Covid19DataDto fullData = (Covid19DataDto)um.unmarshal(url);
			
			Covid19DataBodyDto body = fullData.getBody();
			Covid19DataItemsDto items = body.getItems();
			itemList = items.getItemList();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if (urlConn != null) {
				urlConn.disconnect();
			}
		}
		
		return itemList;
	}

}









