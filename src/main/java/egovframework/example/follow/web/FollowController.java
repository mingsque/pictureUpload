package egovframework.example.follow.web;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.follow.service.FollowService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class FollowController {
	
	@Resource(name = "followService")
	private FollowService followService;
			
	@RequestMapping("followMain.do")
	public String FollowMain(HttpServletRequest request, ModelMap model) throws Exception {
		
		HttpSession session = request.getSession(false);
		String id = session.getAttribute("id").toString();
		
		List<EgovMap> followList = followService.selectFollowList(id);
		List<EgovMap> followBoardList = followService.selectFollowBoardList(id);
		
		System.out.println("followContoller");
		System.out.println(followList);
		
		model.put("followList", followList);
		model.put("followBoardList", followBoardList);
		
		return "follow/main.tiles";
	}
	
	@RequestMapping("follow.do")
	public void Follow(@RequestBody String reqParam, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("followContoller");
		HttpSession session = request.getSession(false);
		
		System.out.println(session.getAttribute("id"));
		
		
		
		Map<String, Object> resMap = JsonUtil.JsonToMap(reqParam);;
		resMap.put("id", session.getAttribute("id"));
		
		System.out.println(resMap.get("followId"));
		
		followService.insertFollow(resMap);
		
		;
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("result", "success");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.write(JsonUtil.HashMapToJson(resultMap));
		
	}
	
	@RequestMapping("followed.do")
	public String followed (HttpServletRequest request, ModelMap model) throws Exception {

		HttpSession session = request.getSession(false);
		String id = session.getAttribute("id").toString();

		List<EgovMap> followedList = followService.selectFollowedList(id);

		System.out.println("followContoller");
		System.out.println(followedList);
		
		model.put("followedList", followedList);
		
		return "follow/followed.tiles";
	}
}
