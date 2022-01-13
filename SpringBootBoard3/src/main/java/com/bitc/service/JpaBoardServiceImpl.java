package com.bitc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitc.entity.BoardEntity;
import com.bitc.repository.JpaBoardRepository;

@Service
public class JpaBoardServiceImpl implements JpaBoardService {

	@Autowired
	private JpaBoardRepository jpaBoardRepository;
	@Override
	public List<BoardEntity> selectBoardList() throws Exception {
		return jpaBoardRepository.findAllByOrderByIdxDesc();
	}

	
}
