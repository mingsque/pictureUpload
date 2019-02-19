package egovframework.example.picture.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.picture.service.PictureService;

@Controller
public class PictureController {
	
	@Resource(name = "pictureService")
	private PictureService pictureService;

	@RequestMapping("pictureMain.do")
	public String pictureMain() throws Exception{
		
		return "picture/main.tiles";
	}

}
