package egovframework.example.manage.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.manage.service.ManageService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("manageService")
public class ManageServiceImpl implements ManageService {

	@Resource(name = "manageMapper")
	private ManageMapper manageMapper;
	
	
	@Override
	public List<EgovMap> selectBikeCategoryList() throws Exception {
		
		return manageMapper.selectBikeCategoryList();
	}

}
