package com.bitc.quizbjg.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.bitc.quizbjg.dto.MemberDto;

@Mapper
public interface BoardMapper {

	public int selectMemberInfoYn(@Param("userId") String userId, @Param("userPw") String userPw);

	public void insertMember(MemberDto member) throws Exception;

}
