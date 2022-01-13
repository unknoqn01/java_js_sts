package com.bitc.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface LoginMapper {

	int selectMemberInfoYn(@Param("userId") String userId, @Param("userPw") String userPw) throws Exception;

}
