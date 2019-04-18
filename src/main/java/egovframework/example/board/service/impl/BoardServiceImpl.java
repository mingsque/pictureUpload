package egovframework.example.board.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import egovframework.example.board.service.BoardService;
import egovframework.example.board.service.PagingVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Resource(name = "boardMapper")
	private BoardMapper boardMapper;
	
	@Override
	public List<EgovMap> selectMainBoard() throws Exception {
		
		return null;
	}

	@Override
	public List<EgovMap> selectAllFaqList() throws Exception {
		return boardMapper.selectAllFaqList();
	}

	@Override
	public List<EgovMap> selectCheckFaqList(String seqNo) throws Exception {
		return boardMapper.selectCheckFaqList(seqNo);
	}

	@Override
	public List<EgovMap> selectNoticeBoardList() throws Exception {
		return boardMapper.selectNoticeBoardList();
	}

	@Override
	public List<EgovMap> selectNoticeBoardView(String seqNo) throws Exception {
		return boardMapper.selectNoticeBoardView(seqNo);
	}

	@Override
	public List<EgovMap> selectAllNoticeList() throws Exception {
		return boardMapper.selectAllNoticeList();
	}

	@Override
	public int updateFaq(HashMap<String, Object> map) throws Exception {
		try {
			boardMapper.updateFaq(map);
			return 1;
		}catch(Exception e){
			return 0;
		}
	}

	@Override
	public int insertFaq(HashMap<String, Object> map) throws Exception {
		try {
			boardMapper.insertFaq(map);
			return 1;
		} catch (Exception e) {
			return 0;
		}
	}

	@Override
	public int deleteFaq(int seqNo) throws Exception {
		try {
			boardMapper.deleteFaq(seqNo);
			return 1;
		} catch (Exception e) {
			return 0;
		}
	}

	@Override
	public List<EgovMap> selectMngPsList() throws Exception {
		
		return boardMapper.selectMngPsList();
	}



	@Override
	public EgovMap selectQnaBoardDetail(String no) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.selectQnaBoardDetail(no);
	}

	@Override
	public void updateQnaBoard(EgovMap map) throws Exception {
		// TODO Auto-generated method stub
		boardMapper.updateQnaBoard(map);
	}

	@Override
	public void insertQnaBoard(EgovMap map) throws Exception {
		// TODO Auto-generated method stub
		boardMapper.insertQnaBoard(map);
	}

	@Override
	public void deleteQnaBoard(EgovMap map) throws Exception {
		// TODO Auto-generated method stub
		boardMapper.deleteQnaBoard(map);
	}

	@Override
	public void insertQnaboardReply(EgovMap map) throws Exception {
		// TODO Auto-generated method stub
		boardMapper.insertQnaboardReply(map);
	}

	@Override
	public List<EgovMap> selectQnaBoardReplyList(String no) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.selectQnaBoardReplyList(no);
	}

	@Override
	public void deleteQnaBoardReply(EgovMap map) throws Exception {
		// TODO Auto-generated method stub
		boardMapper.deleteQnaBoardReply(map);
	}

	@Override
	public List<EgovMap> selectQnaBoardList(PagingVO pagingV0) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.selectQnaBoardList(pagingV0);
	}

	@Override
	public EgovMap selectQnaBoardListCnt(PagingVO pagingVO) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.selectQnaBoardListCnt(pagingVO);
	}

	@Override
	public void insertNoticeBoard(EgovMap map) throws Exception {
		// TODO Auto-generated method stub
		boardMapper.insertNoticeBoard(map);
	}

	@Override
	public EgovMap selectNoticeBoardListCnt(PagingVO pagingVO) throws Exception{
		// TODO Auto-generated method stub
		return boardMapper.selectNoticeBoardListCnt(pagingVO);
	}

	@Override
	public List<EgovMap> selectNoticeBoardList(PagingVO pagingVO) throws Exception{
		// TODO Auto-generated method stub
		return boardMapper.selectNoticeBoardList(pagingVO);
	}

	@Override
	public EgovMap selectNoticeBoardDetail(String seq_no) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.selectNoticeBoardDetail(seq_no);
	}

	@Override
	public void updateNoticeBoard (EgovMap param) throws Exception {
		// TODO Auto-generated method stub
		boardMapper.updateNoticeBoard(param);
	}

}
