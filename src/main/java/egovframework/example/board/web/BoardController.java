package egovframework.example.board.web;

import java.util.HashMap;
import java.util.List;
import java.util.logging.Logger;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.board.service.BoardService;
import egovframework.example.board.service.PagingVO;
import egovframework.example.login.service.UserVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class BoardController {
	
	@Resource(name = "boardService")
	private BoardService boardService; 
	
	@RequestMapping(value = "qnaBoard.do")
	public String qnaBoard( ModelMap model) throws Exception{
		List<EgovMap> boardList = null;
		
		PagingVO pagingVO = new PagingVO();

		System.out.println(pagingVO.getRows());
		
		int pageGroup = (int) Math.ceil((double)pagingVO.getPage()/pagingVO.getPageScale());
		
		long startPage = (pageGroup -1) * pagingVO.getPageScale() + 1;
		pagingVO.setStartPage(startPage);
		
		long endPage = startPage + pagingVO.getPageScale() - 1;
		pagingVO.setEndPage(endPage);
		
		long prePage	= (pageGroup-2) * pagingVO.getPageScale() + 1;
		long nextPage	= pageGroup * pagingVO.getPageScale() + 1;
		
		HashMap<String, Object> resMap = new HashMap<String, Object>();
		
		EgovMap pagingList = boardService.selectQnaBoardListCnt(pagingVO);
		
		resMap.put("pageGroup",	pageGroup);
		resMap.put("startPage",	startPage);
		resMap.put("endPage",	endPage);
		resMap.put("prePage",	prePage);
		resMap.put("nextPage",	nextPage);
		resMap.put("page", 		pagingVO.getPage());
		resMap.put("pageScale", pagingVO.getPageScale());
		resMap.put("totalPage", pagingList.get("totalPage"));
		
		System.out.println(startPage);
		System.out.println(pageGroup);
		System.out.println(endPage);
		
		try{
			boardList = boardService.selectQnaBoardList(pagingVO);	
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(boardList);
		
		model.addAttribute("qnaBoardList",	boardList);
		model.addAttribute("resMap", 		resMap);
		
		return "board/qnaBoard.tiles";
	}
	
	@RequestMapping("goPage.do")
	public String goPage(HttpServletRequest request, ModelMap model) throws Exception {
		PagingVO pagingVO = new PagingVO();
		pagingVO.setPage(Long.parseLong(request.getParameter("page")));
		
		List<EgovMap> boardList = boardService.selectQnaBoardList(pagingVO);
		
		int pageGroup = (int) Math.ceil((double)pagingVO.getPage()/pagingVO.getPageScale());
		
		long startPage = (pageGroup -1) * pagingVO.getPageScale() + 1;
		pagingVO.setStartPage(startPage);
		
		long endPage = startPage + pagingVO.getPageScale() - 1;
		pagingVO.setEndPage(endPage);
		
		long prePage	= (pageGroup-2) * pagingVO.getPageScale() + 1;
		long nextPage	= pageGroup * pagingVO.getPageScale() + 1;
		
		HashMap<String, Object> resMap = new HashMap<String, Object>();
		
		EgovMap pagingList = boardService.selectQnaBoardListCnt(pagingVO);
		
		resMap.put("pageGroup",	pageGroup);
		resMap.put("startPage",	startPage);
		resMap.put("endPage",	endPage);
		resMap.put("prePage",	prePage);
		resMap.put("nextPage",	nextPage);
		resMap.put("page", 		pagingVO.getPage());
		resMap.put("pageScale", pagingVO.getPageScale());
		resMap.put("totalPage", pagingList.get("totalPage"));
		
		
		model.addAttribute("qnaBoardList",	boardList);
		model.addAttribute("resMap", 		resMap);
		
		return "board/qnaBoard.tiles";
	}
		
	@RequestMapping(value = "boardDetail.do")
	public String boardDetail(HttpServletRequest request, ModelMap model) throws Exception{
		EgovMap qnaBoardDetail = null;
		List<EgovMap> qnaBoardReplyList = null;
		String no = request.getParameter("no");
		
		try{
			qnaBoardDetail 		= boardService.selectQnaBoardDetail(no);	
			qnaBoardReplyList	= boardService.selectQnaBoardReplyList(no);
		} catch(Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("qnaBoardDetail", 			qnaBoardDetail);
		model.addAttribute("qnaBoardReplyList",			qnaBoardReplyList);
		model.addAttribute("enter", "\r\n");
		System.out.println(qnaBoardDetail);
		System.out.println(qnaBoardReplyList);
	
		return "board/qnaBoardDetail.tiles";
	}
	
	@RequestMapping(value = "qnaBoardModify.do")
	public String qnaBoardModify(HttpServletRequest request, ModelMap model) throws Exception{
		EgovMap qnaBoardDetail = null;	
		String no = request.getParameter("no");
		
		System.out.println(no);
		
		try{
			qnaBoardDetail = boardService.selectQnaBoardDetail(no);	
		} catch(Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("qnaBoardDetail", qnaBoardDetail);
		System.out.println(qnaBoardDetail);
		
		return "board/qnaBoardModify.tiles";
	}
	
	
	@RequestMapping(value = "qnaBoardModifySet.do")
	public String qnaBoardModifySet(HttpServletRequest request) throws Exception{
		
		String no = request.getParameter("no");
		EgovMap map = new EgovMap();
		
		System.out.println(request.getParameter("title") + "=========");
		
		map.put("no", 		request.getParameter("no"));
		map.put("title", 	request.getParameter("title"));
		map.put("content",	request.getParameter("content"));
		
		try{
			boardService.updateQnaBoard(map);	
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/boardDetail.do?no="+no;
	}
	
	@RequestMapping(value = "qnaBoardWrite.do")
	public String qnaBoardWrite() throws Exception{
		
		return "board/qnaBoardWrite.tiles";
	}
	
	
	
	@RequestMapping(value = "qnaBoardWriteSet.do")
	public String qnaBoardWriteSet(HttpServletRequest request) throws Exception{
		
		//String no = request.getParameter("no");
		EgovMap map = new EgovMap();
		
		map.put("writer", 	request.getParameter("writer"));
		//map.put("no", 		request.getParameter("no"));
		map.put("title", 	request.getParameter("title"));
		map.put("content",	request.getParameter("content"));
		map.put("category", request.getParameter("category"));
		
		try{
			boardService.insertQnaBoard(map);	
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/qnaBoard.do";
	}
	
	@RequestMapping(value = "qnaBoardDelete.do")
	public String qnaBoardDelete(HttpServletRequest request) throws Exception{
		
		EgovMap map = new EgovMap();
		map.put("no", 		request.getParameter("no"));
		
		try{
			boardService.deleteQnaBoard(map);	
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/qnaBoard.do";
	}
	
	@RequestMapping(value = "insertReply.do")
	public String insertReply(HttpServletRequest request) throws Exception{
		
		EgovMap map = new EgovMap();
		
		System.out.println(request.getParameter("content"));
		
		map.put("no", 		request.getParameter("no"));
		map.put("writer", 	request.getParameter("writer"));
		map.put("content", 	request.getParameter("content"));
		
		try{
			boardService.insertQnaboardReply(map);	
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/boardDetail.do?no="+request.getParameter("no");
	}
	
	
	@RequestMapping(value = "deleteQnaBoardReply.do")
	public String deleteQnaBoardReply(HttpServletRequest request) throws Exception{
		
		EgovMap map = new EgovMap();
		map.put("seqNo", 		request.getParameter("seqNo"));
	
		try{
			boardService.deleteQnaBoardReply(map);	
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/boardDetail.do?no="+request.getParameter("no");
	}


	/*
	 * mainBoard
	 * 게시판 메인에서 사용 
	 * 
	 *  */
	@RequestMapping(value = "mainBoard.do")
	public String mainBoard() throws Exception{
		
		List<EgovMap> boardMain = boardService.selectMainBoard();
		
		return "board/mainBoard.tiles";
	}
	
	/* writeBoard
	 * 게시판 글쓰기 
	 *  */
	@RequestMapping(value = "writeBoard.do")
	public String witeBoard() throws Exception{
		
		return "board/writeBoard.tiles";
	}
	
	/*
	 * faqBoard
	 * 게시판 FAQ 
	 * 
	 *  */
	@RequestMapping(value = "faqBoard.do")
	public String faqBoard(HttpServletRequest request, ModelMap model) throws Exception{
		
		List<EgovMap> allFaqList = boardService.selectAllFaqList();
		
		model.addAttribute("allFaqList", allFaqList);
		
		return "board/faqBoard.tiles";
	}
	
	
	/*
	 * noticeBoard
	 * 게시판 공지사항  
	 * 
	 *  */
	@RequestMapping(value = "noticeBoard.do")
	public String noticeBoard(HttpServletRequest request, ModelMap model) throws Exception{

		List<EgovMap> boardList = null;
		
		PagingVO pagingVO = new PagingVO();
		
		int pageGroup = (int) Math.ceil((double)pagingVO.getPage()/pagingVO.getPageScale());
		
		long startPage = (pageGroup -1) * pagingVO.getPageScale() + 1;
		pagingVO.setStartPage(startPage);
		
		long endPage = startPage + pagingVO.getPageScale() - 1;
		pagingVO.setEndPage(endPage);
		
		long prePage	= (pageGroup-2) * pagingVO.getPageScale() + 1;
		long nextPage	= pageGroup * pagingVO.getPageScale() + 1;
		
		HashMap<String, Object> resMap = new HashMap<String, Object>();
		
		EgovMap pagingList = boardService.selectNoticeBoardListCnt(pagingVO);
		
		resMap.put("pageGroup",	pageGroup);
		resMap.put("startPage",	startPage);
		resMap.put("endPage",	endPage);
		resMap.put("prePage",	prePage);
		resMap.put("nextPage",	nextPage);
		resMap.put("page", 		pagingVO.getPage());
		resMap.put("pageScale", pagingVO.getPageScale());
		resMap.put("totalPage", pagingList.get("totalPage"));
		
		try{
			boardList = boardService.selectNoticeBoardList(pagingVO);	
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(boardList);
		model.addAttribute("noticeBoardList",	boardList);
		model.addAttribute("resMap", 		resMap);
		
		return "board/noticeBoard.tiles";
	}
	
	/* noticeBoardView
	 * 게시판 공지사항 상세보기 
	 *  */
	@RequestMapping(value = "noticeBoardDetail.do")
	public String noticeBoardDetail (HttpServletRequest request, ModelMap model) throws Exception{

		EgovMap noticeBoardDetail = null;
		String seq_no = request.getParameter("seq_no");
		
		try{
			noticeBoardDetail = boardService.selectNoticeBoardDetail(seq_no);	
		} catch(Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("noticeBoardDetail", noticeBoardDetail);
		model.addAttribute("enter", "\r\n");
		System.out.println(noticeBoardDetail);
		
		return "board/noticeBoardDetail.tiles";
	}
	
	
	@RequestMapping(value = "noticeBoardWrite.do")
	public String noticeBoardWrite() throws Exception{
		
		return "board/noticeBoardWrite.tiles";
	}
	
	
	@RequestMapping(value = "noticeBoardWriteAction.do")
	public String noticeBoardWriteAction (HttpServletRequest request) throws Exception{
		
		System.out.println("notice board write");
		System.out.println(request.getParameter("category"));
		EgovMap map = new EgovMap();
		
		map.put("writer", 	request.getParameter("writer"));
		map.put("title", 	request.getParameter("title"));
		map.put("content",	request.getParameter("content"));
		map.put("category", request.getParameter("category"));
		
		try{
			boardService.insertNoticeBoard(map);	
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/noticeBoard.do";
	}	
	
	
	@RequestMapping(value = "noticeBoardModify.do")
	public String noticeBoardModify(HttpServletRequest request, ModelMap model) throws Exception{
		EgovMap noticeBoardDetail = null;	
		String seqNo = request.getParameter("seq_no");
		
		try{
			noticeBoardDetail = boardService.selectNoticeBoardDetail(seqNo);	
		} catch(Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("noticeBoardDetail", noticeBoardDetail);
		model.addAttribute("enter", "\r\n");
		
		return "board/noticeBoardModify.tiles";
	}
	
	@RequestMapping(value = "noticeBoardModifyAction.do")
	public String noticeBoardModifyAction(HttpServletRequest request, ModelMap model) throws Exception{
		
		System.out.println();
		
		EgovMap param = new EgovMap();
		param.put("seqNo", request.getParameter("seq_no"));
		param.put("title", request.getParameter("title"));
		param.put("content", request.getParameter("content"));
		try{
			boardService.updateNoticeBoard(param);	
		} catch(Exception e) {
			e.printStackTrace();
		}

		return "redirect:/noticeBoardDetail.do?seq_no="+request.getParameter("seq_no");
	}

		
	/*
	 * personalBoard
	 * 1:1 문의   
	 * 
	 *  */
	@RequestMapping(value = "personalBoard.do")
	public String personalBoard() throws Exception{
		
		return "board/personalBoard.tiles";
	}
	
	/*
	 * uploadPicture
	 * 사진 업로드  
	 * 
	 *  */
	@RequestMapping(value = "uploadPicture.do")
	public String uploadPicture() throws Exception{
		
		return "board/uploadPicture.pop";
	}
	
	
	
	/* ------------------------------------ 매니저 단 ---------------------------------------------------------- */
	
	/*
	 * 
	 * FAQ 관리자 페이지*/
	@RequestMapping(value = "/manage/mngFaq.do")
	public String mngFaq(HttpServletRequest request, ModelMap model) throws Exception{
		
		List<EgovMap> allFaqList = boardService.selectAllFaqList();
		
		model.addAttribute("allFaqList", allFaqList);
		
		return "manage/board/mngFaq.manage";
	}
	
	/*
	 * 
	 * FAQ 상세 페이지*/
	
	@RequestMapping(value = "/manage/mngFaqView.do")
	public String mngFaqView(
			@RequestParam String seqNo,
			HttpServletRequest request,
			ModelMap model) throws Exception{
		
		System.out.println("넘어온 seqNo :" + seqNo);
		
		List<EgovMap> checkFaqList = boardService.selectCheckFaqList(seqNo);
		
		System.out.println("checkFaqList : "+ checkFaqList.get(0));
		
		System.out.println("title : " +checkFaqList.get(0).get("title"));
		
		model.addAttribute("checkFaqList" , checkFaqList.get(0));
		
		return "manage/board/mngFaqView.manage";
	}
	
	/*
	 * 
	 * 공지사항 관리자 페이지*/
	@RequestMapping(value = "/manage/mngNotice.do")
	public String mngNotice(HttpServletRequest request, ModelMap model) throws Exception{
		
		List<EgovMap> allNoticeList = boardService.selectAllNoticeList();
		
		model.addAttribute("allNoticeList", allNoticeList);
		
		return "manage/board/mngNotice.manage";
	}
	/*
	 * faq 수정 버튼 
	 * 수정버튼 클릭시 변경 사항 저장 후 
	 * mngFaq로 이동
	 * 
	 * */
	
	@RequestMapping(value = "/manage/mngFaqModify.do")
	public String mngFaqModify(HttpServletRequest request,
			@RequestParam HashMap<String, Object> map,
			ModelMap model) throws Exception{
		
		System.out.println("map : "+ map);
		
		boardService.updateFaq(map);
		
		List<EgovMap> allFaqList = boardService.selectAllFaqList();
		
		model.addAttribute("allFaqList", allFaqList);
		
		return "manage/board/mngFaq.manage";
	}
	
	/*
	 * 긓쓰기 페이지로 이동
	 * 
	 * */
	
	@RequestMapping(value = "/manage/mngFaqWrite.do")
	public String mngFaqWrite(HttpServletRequest request,
			ModelMap model) throws Exception{
		
		return "manage/board/mngFaqWrite.manage";
		
	}
	
	/*
	 * 글 쓴 내용 저장 이동
	 * insert 시키기
	 * 
	 * */
	
	
	@RequestMapping(value = "/manage/mngFaqInsert.do")
	public String mngFaqInsert(HttpServletRequest request,
			@RequestParam HashMap<String, Object> map,
			ModelMap model) throws Exception{
		
		System.out.println("map : "+ map);
		
		boardService.insertFaq(map);
		
		List<EgovMap> allFaqList = boardService.selectAllFaqList();
		
		model.addAttribute("allFaqList", allFaqList);
		
		return "manage/board/mngFaq.manage";
		
		//왜 안되는지...
		//return "redirect:/manage/board/mngFaq.manage";
		
	}
	
	/*
	 * 삭제버튼 클릭
	 * delete 시키기
	 * 
	 * */
	
	@RequestMapping(value = "/manage/mngFaqDelete.do")
	public String mngFaqDelete(HttpServletRequest request,
			@RequestParam int seqNo,
			ModelMap model) throws Exception{
		
		System.out.println("seqNo : "+ seqNo);
		
		boardService.deleteFaq(seqNo);
		
		List<EgovMap> allFaqList = boardService.selectAllFaqList();
		
		model.addAttribute("allFaqList", allFaqList);
		
		return "manage/board/mngFaq.manage";
		
		
		
	}
	
	
	/*
	 * 1:1 페이지로 이동 
	 * 번호 제목 조회수 답변유무 가져옴
	 * 
	 * */
	
	@RequestMapping(value = "/manage/mngPs.do")
	public String mngPs(HttpServletRequest request,
			ModelMap model) throws Exception{
		
		List<EgovMap> selectMngPsList = boardService.selectMngPsList();
		
		return "manage/board/mngPs.manage";
		
		
		
	}
	
	
	
}
