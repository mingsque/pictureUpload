package egovframework.example.follow.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.follow.service.FollowService;

@Controller
public class FollowController {
	
	@Resource(name = "followService")
	private FollowService followService;

	@RequestMapping("followMain.do")
	public String FollowMain() throws Exception {
		
		System.out.println("followContoller");
		
		return "follow/main.tiles";
	}
	
}
