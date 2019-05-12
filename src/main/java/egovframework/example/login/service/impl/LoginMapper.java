package egovframework.example.login.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.example.login.service.UserVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("loginMapper")
public interface LoginMapper {

	List<EgovMap> selectRegisterResultServiceList() throws Exception;

	void selectRegisterResultService(Map<String, String> param) throws Exception;

	List<UserVO> selectLoginResultList() throws Exception;

	UserVO selectUserInfo(String id) throws Exception;

	void updateUserInfo(Map<String, String> param) throws Exception;

}
