package egovframework.example.login.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.login.service.LoginService;
import egovframework.example.login.service.UserVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("loginService")
public class LoginServiceImpl implements LoginService {

	@Resource(name = "loginMapper")
	private LoginMapper loginMapper;
	
	@Override
	public List<EgovMap> selectRegisterResultServiceList() throws Exception {
		// TODO Auto-generated method stub
		return loginMapper.selectRegisterResultServiceList();
	}

	@Override
	public void selectRegisterResultService(UserVO uservo) throws Exception {
		// TODO Auto-generated method stub
		loginMapper.selectRegisterResultService(uservo);
	}

	@Override
	public List<UserVO> selectLoginResultList() throws Exception {
		// TODO Auto-generated method stub
		return loginMapper.selectLoginResultList();
	}

	@Override
	public UserVO selectUserInfo(String id) throws Exception {
		// TODO Auto-generated method stub
		return loginMapper.selectUserInfo(id);
	}

	@Override
	public void updateUserInfo(UserVO uservo) throws Exception {
		// TODO Auto-generated method stub
		loginMapper.updateUserInfo(uservo);
	}

}
