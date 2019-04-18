package egovframework.example.main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.main.service.MainService;
import egovframework.example.main.service.PagingVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("mainService")
public class MainServiceImpl implements MainService {

	@Resource(name = "mainMapper")
	private MainMapper mainMapper;

	@Override
	public List<EgovMap> selectPictureList(PagingVO pageParam) throws Exception{
		// TODO Auto-generated method stub
		return mainMapper.selectPictureList(pageParam);
	}

	@Override
	public int selectPictureCount() throws Exception {
		// TODO Auto-generated method stub
		return mainMapper.selectPictureCount();
	}

	@Override
	public List<EgovMap> selectNoticeList() throws Exception {
		// TODO Auto-generated method stub
		return mainMapper.selectNoticeList();
	}
}
