package egovframework.example.manage.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("manageMapper")
public interface ManageMapper {

	List<EgovMap> selectBikeCategoryList() throws Exception;

}
