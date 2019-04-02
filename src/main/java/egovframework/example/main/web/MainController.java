package egovframework.example.main.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.main.service.MainService;
import egovframework.example.main.service.PagingVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class MainController {
   
	@Resource(name = "mainService")
	private MainService mainService;
	
	@RequestMapping(value = "main.do")
	public String initMain(ModelMap model) throws Exception {

		System.out.println("main controller");
		
		PagingVO pageParam = new PagingVO();
		
		List<EgovMap> pictureList = mainService.selectPictureList(pageParam);
		
		int pictureListCount = mainService.selectPictureCount();

		int page		= (int) pageParam.getPage();
		int pageScale	= (int) pageParam.getPageScale();
		int pageGroup	= (page - 1) / pageScale + 1;
		int startPage	= (pageGroup-1)*(pageScale) + 1;
		int endPage		= pageGroup*pageScale; 
		int lastPage	= pictureListCount/(int)pageParam.getRows() + 1;
		int lastGroup	= lastPage / pageScale + 1;
		
		if (endPage > lastPage) {
			
			endPage = lastPage;
		}
		
		model.addAttribute("pictureListCount", pictureListCount);
		model.addAttribute("pictureList", pictureList);
		model.addAttribute("page", page);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageGroup", pageGroup);
		model.addAttribute("pageScale", pageParam.getPageScale());
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("lastGroup", lastGroup);
		
		return "main/main.tiles";
	}
	
	@RequestMapping("getPage.do")
	public String getPage(HttpServletRequest request, ModelMap model) throws Exception {
		
		PagingVO pageParam = new PagingVO();
		pageParam.setPage(Long.parseLong(request.getParameter("page")));
		
		
		List<EgovMap> pictureList = mainService.selectPictureList(pageParam);
		
		int pictureListCount = mainService.selectPictureCount();

		int page		= (int) pageParam.getPage();
		int pageScale	= (int) pageParam.getPageScale();
		int pageGroup	= (page - 1) / pageScale + 1;
		int startPage	= (pageGroup-1)*(pageScale) + 1;
		int endPage		= pageGroup*pageScale; 
		int lastPage	= pictureListCount/(int)pageParam.getRows() + 1;
		int lastGroup	= lastPage / pageScale + 1;
		
		if (endPage > lastPage) {
			
			endPage = lastPage;
		}
		
		System.out.println(pictureListCount);
		System.out.println(startPage);
		System.out.println(endPage);
		System.out.println(lastGroup);
		
		model.addAttribute("pictureListCount", pictureListCount);
		model.addAttribute("pictureList", pictureList);
		model.addAttribute("page", page);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageGroup", pageGroup);
		model.addAttribute("pageScale", pageParam.getPageScale());
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("lastGroup", lastGroup);
		
		return "main/main.tiles";
	}
	
	
	
	
}