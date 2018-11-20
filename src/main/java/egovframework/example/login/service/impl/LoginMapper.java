package egovframework.example.login.service.impl;

import java.util.List;

import egovframework.example.login.service.UserVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("loginMapper")
public interface LoginMapper {

	List<EgovMap> selectRegisterResultServiceList() throws Exception;

	void selectRegisterResultService(UserVO uservo) throws Exception;

	List<UserVO> selectLoginResultList() throws Exception;

	UserVO selectUserInfo(String id) throws Exception;

	void updateUserInfo(UserVO uservo) throws Exception;

}
