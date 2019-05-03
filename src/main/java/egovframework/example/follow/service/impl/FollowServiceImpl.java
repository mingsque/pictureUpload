package egovframework.example.follow.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.follow.service.FollowService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("followService")
public class FollowServiceImpl implements FollowService {

	@Resource(name="followMapper")
	private FollowMapper followMapper;

	@Override
	public void insertFollow(Map<String, Object> resMap) throws Exception {
		// TODO Auto-generated method stub
		followMapper.insertFollow(resMap);
	}

	@Override
	public List<EgovMap> selectFollowList(String id) throws Exception {
		// TODO Auto-generated method stub
		return followMapper.selectFollowList(id);
	}

	@Override
	public List<EgovMap> selectFollowBoardList(String id) throws Exception {
		// TODO Auto-generated method stub
		return followMapper.selectFollowBoardList(id);
	}

	@Override
	public List<EgovMap> selectFollowedList(String id) throws Exception {
		// TODO Auto-generated method stub
		return followMapper.selectFollowedList(id);
	}
	
}
