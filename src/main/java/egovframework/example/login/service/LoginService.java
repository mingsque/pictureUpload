package egovframework.example.login.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface LoginService {

	List<EgovMap> selectRegisterResultServiceList() throws Exception;

	void selectRegisterResultService(UserVO uservo) throws Exception;

	List<UserVO> selectLoginResultList() throws Exception;

	UserVO selectUserInfo(String id) throws Exception;

	void updateUserInfo(UserVO uservo) throws Exception;


}
