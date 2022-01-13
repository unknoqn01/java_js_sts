package com.bitc.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.bitc.entity.BoardEntity;

public interface JpaBoardRepository extends CrudRepository<BoardEntity, Integer>{
	List<BoardEntity> findAllByOrderByIdsDesc();
}
