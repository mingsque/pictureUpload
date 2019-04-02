package egovframework.example.picture.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface PictureService {

	void insertPitureBoardInfo(EgovMap insertInfo) throws Exception;

	EgovMap selectPictureDetail(String parameter) throws Exception;

	void insertPictureBoardReply(EgovMap param) throws Exception;

	List<EgovMap> selectPictureBoardReplyList(String parameter) throws Exception;

	void updateReply(Map<String, Object> resMap) throws Exception;

	void deleteReply(Map<String, Object> resMap) throws Exception;

	void deleteFavorite(Map<String, Object> resMap) throws Exception;

	void insertFavorite(Map<String, Object> resMap) throws Exception;

	String myFavorite(EgovMap parameter) throws Exception;

}
