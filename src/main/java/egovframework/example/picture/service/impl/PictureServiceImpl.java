package egovframework.example.picture.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.picture.service.PictureService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("pictureService")
public class PictureServiceImpl implements PictureService {

	@Resource(name = "pictureMapper")
	private PictureMapper pictureMapper;
	
	@Override
	public void insertPitureBoardInfo(EgovMap insertInfo) throws Exception {
		
		pictureMapper.insertPitureBoardInfo(insertInfo);
	}

	@Override
	public EgovMap selectPictureDetail(String parameter) throws Exception {
		// TODO Auto-generated method stub
		return pictureMapper.selectPictureDetail(parameter);
	}

	@Override
	public void insertPictureBoardReply(EgovMap param) throws Exception {
		// TODO Auto-generated method stub
		pictureMapper.insertPictureBoardReply(param);
	}

	@Override
	public List<EgovMap> selectPictureBoardReplyList(String parameter) throws Exception {
		// TODO Auto-generated method stub
		return pictureMapper.selectPictureBoardReplyList(parameter);
	}

	@Override
	public void updateReply(Map<String, Object> resMap) throws Exception {
		// TODO Auto-generated method stub
		pictureMapper.updateReply(resMap);
	}

	@Override
	public void deleteReply(Map<String, Object> resMap) throws Exception {
		// TODO Auto-generated method stub
		pictureMapper.deleteReply(resMap);
	}

	@Override
	public void deleteFavorite(Map<String, Object> resMap) throws Exception {
		// TODO Auto-generated method stub
		pictureMapper.deleteFavorite(resMap);
	}

	@Override
	public void insertFavorite(Map<String, Object> resMap) throws Exception {
		// TODO Auto-generated method stub
		pictureMapper.insertFavorite(resMap);
	}

	@Override
	public String myFavorite(EgovMap parameter) throws Exception {
		// TODO Auto-generated method stub
		return pictureMapper.myFavorite(parameter);
	}

}
