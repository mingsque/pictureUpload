package egovframework.example.board.service.impl;

import java.util.HashMap;
import java.util.List;

import egovframework.example.board.service.PagingVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("boardMapper")
public interface BoardMapper {
	
	List<EgovMap> selectAllFaqList() throws Exception;

	List<EgovMap> selectCheckFaqList(String seqNo) throws Exception;

	List<EgovMap> selectNoticeBoardList() throws Exception;

	List<EgovMap> selectNoticeBoardView(String seqNo) throws Exception;

	List<EgovMap> selectAllNoticeList() throws Exception;

	void updateFaq(HashMap<String, Object> map) throws Exception;

	void insertFaq(HashMap<String, Object> map) throws Exception;

	void deleteFaq(int seqNo) throws Exception;

	List<EgovMap> selectMngPsList()throws Exception;

	List<EgovMap> selectQnaBoardList(PagingVO pagingV0) throws Exception;

	EgovMap selectQnaBoardDetail(String no) throws Exception;

	void updateQnaBoard(EgovMap map) throws Exception;

	void insertQnaBoard(EgovMap map) throws Exception;

	void deleteQnaBoard(EgovMap map) throws Exception;

	void insertQnaboardReply(EgovMap map) throws Exception;

	List<EgovMap> selectQnaBoardReplyList(String no) throws Exception;

	void deleteQnaBoardReply(EgovMap map) throws Exception;

	EgovMap selectQnaBoardListCnt(PagingVO pagingVO) throws Exception;
}
