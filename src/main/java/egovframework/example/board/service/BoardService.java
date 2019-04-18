package egovframework.example.board.service;

import java.util.HashMap;
import java.util.List;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface BoardService {
	
	List<EgovMap> selectMainBoard() throws Exception;

	List<EgovMap> selectAllFaqList()throws Exception;

	List<EgovMap> selectCheckFaqList(String seqNo) throws Exception;

	List<EgovMap> selectNoticeBoardList() throws Exception;

	List<EgovMap> selectNoticeBoardView(String seqNo) throws Exception;

	List<EgovMap> selectAllNoticeList() throws Exception;

	int updateFaq(HashMap<String, Object> map) throws Exception;

	int insertFaq(HashMap<String, Object> map) throws Exception;

	int deleteFaq(int seqNo) throws Exception;

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

	void insertNoticeBoard(EgovMap map) throws Exception;

	EgovMap selectNoticeBoardListCnt(PagingVO pagingVO) throws Exception;

	List<EgovMap> selectNoticeBoardList(PagingVO pagingVO) throws Exception;

	EgovMap selectNoticeBoardDetail(String seq_no) throws Exception;

	void updateNoticeBoard(EgovMap param) throws Exception;

}
