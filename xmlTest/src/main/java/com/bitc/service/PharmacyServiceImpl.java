package com.bitc.service;

import java.io.File;
import java.util.List;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;

import org.springframework.stereotype.Service;

import com.bitc.dto.PharmacyFullDataBodyDto;
import com.bitc.dto.PharmacyFullDataDto;
import com.bitc.dto.PharmacyFullDataItemDto;
import com.bitc.dto.PharmacyFullDataItemsDto;

@Service
public class PharmacyServiceImpl implements PharmacyService {

	@Override
	public List<PharmacyFullDataItemDto> getItemList() throws Exception {
//		JAXB란?
//		Java Architecture for XML Binding의 줄임말로 Java Object를 XML로 직렬화하고, XML을 역직렬화하여 Java Object로 변환해주는 API
//		JDK9버전 까지는 자바 기본 라이브러이에 있었으나 이후로 제거 됨
		
//		Marshalling : Java Object를 XML 로 변환
//		UnMarshalling : XML을 Java Object로 변환
		
//		JAXB 클래스 객체 생성(싱글톤 방식이기 때문에 newInstance() 메서드 사용)
//		사용할 데이터의 전체 구조를 가지고 있는 클래스를 선택
		JAXBContext jc = JAXBContext.newInstance(PharmacyFullDataDto.class);
		
//		XML 데이터를 파싱하기 위해서 Ummarshaller 클래스 객체를 생성
		Unmarshaller um = jc.createUnmarshaller();
		
//		실제 데이터를 언마샬러를 통하여 Java Object로 변환
//		unmarshal() 메서드는 변환한 데이터를 Object 타입으로 반환함
		PharmacyFullDataDto fullData = (PharmacyFullDataDto)um.unmarshal(new File("C://java404//pharmacydata.xml"));
		
//		전체 데이터 중 body 태그가 가지고 있는 모든 정보를 가져옴
		PharmacyFullDataBodyDto body = fullData.getBody();
//		body 데이터 중 items 정보를 모두 가져옴
		PharmacyFullDataItemsDto items = body.getItems();
//		items 데이터 중 item의 모든 정보를 가져옴
		List<PharmacyFullDataItemDto> itemList = items.getItemList();
		
		return itemList;
	}
}







