package egovframework.example.manage.service;

import java.util.List;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface ManageService {

	List<EgovMap> selectBikeCategoryList() throws Exception;
}
