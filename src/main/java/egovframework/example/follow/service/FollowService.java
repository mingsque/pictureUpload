package egovframework.example.follow.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface FollowService {

	void insertFollow(Map<String, Object> resMap) throws Exception;

	List<EgovMap> selectFollowList(String id) throws Exception;

	List<EgovMap> selectFollowBoardList(String id) throws Exception;

	List<EgovMap> selectFollowedList(String id) throws Exception;

}
