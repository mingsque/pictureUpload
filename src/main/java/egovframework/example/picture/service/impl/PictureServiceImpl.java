package egovframework.example.picture.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.picture.service.PagingVO;
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

	@Override
	public List<EgovMap> selectPictureList(PagingVO pageParam) throws Exception {
		// TODO Auto-generated method stub
		return pictureMapper.selectPictureList(pageParam);
	}


	@Override
	public int selectPictureCount() throws Exception {
		// TODO Auto-generated method stub
		return pictureMapper.selectPictureCount();
	}

	@Override
	public List<EgovMap> selectFavoritePictureList(PagingVO pageParam) throws Exception {
		// TODO Auto-generated method stub
		return pictureMapper.selectFavoritePictureList(pageParam);
	}

	@Override
	public List<EgovMap> selectSearchPictureList(Map pageParam) throws Exception {
		// TODO Auto-generated method stub
		return pictureMapper.selectSearchPictureList(pageParam);
	}

	@Override
	public int selectSearchPictureListCount(String keyword) throws Exception {
		// TODO Auto-generated method stub
		return pictureMapper.selectSearchPictureListCount(keyword);
	}

	@Override
	public int selectPictureListCountByWriter(String writer) throws Exception {
		// TODO Auto-generated method stub
		return pictureMapper.selectPictureListCountByWriter(writer);
	}

	@Override
	public List<EgovMap> selectPictureListByWriter(PagingVO pageParam) throws Exception {
		// TODO Auto-generated method stub
		return pictureMapper.selectPictureListByWriter(pageParam);
	}

}
