package egovframework.example.follow.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("followMapper")
public interface FollowMapper{

	void insertFollow(Map<String, Object> resMap) throws Exception;

	List<EgovMap> selectFollowList(String id) throws Exception;

	List<EgovMap> selectFollowBoardList(String id) throws Exception;

	List<EgovMap> selectFollowedList(String id) throws Exception;

}
