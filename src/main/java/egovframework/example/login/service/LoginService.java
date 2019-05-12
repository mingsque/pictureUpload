package egovframework.example.login.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface LoginService {

	List<EgovMap> selectRegisterResultServiceList() throws Exception;

	void selectRegisterResultService(Map<String, String> param) throws Exception;

	List<UserVO> selectLoginResultList() throws Exception;

	UserVO selectUserInfo(String id) throws Exception;

	void updateUserInfo(Map<String, String> param) throws Exception;

}
