package com.bitc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitc.dto.RestBoardDto;

@Mapper
public interface RestBoardMapper {

	public List<RestBoardDto> selectBoardList() throws Exception;

	public void insertBoard(RestBoardDto restBoard) throws Exception;

	public RestBoardDto selectBoardDetail(int idx) throws Exception;

	public void deleteBoard(int idx) throws Exception;
}
