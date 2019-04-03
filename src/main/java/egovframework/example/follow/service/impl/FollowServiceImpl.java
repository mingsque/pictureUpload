package egovframework.example.follow.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.follow.service.FollowService;

@Service("followService")
public class FollowServiceImpl implements FollowService {

	@Resource(name="followMapper")
	private FollowMapper followMapper;
	
}
