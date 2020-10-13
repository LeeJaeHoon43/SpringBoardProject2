package com.ljh.mvcboard.user.service;

import java.util.Date;

import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.ljh.mvcboard.user.domain.LoginDTO;
import com.ljh.mvcboard.user.domain.UserVO;
import com.ljh.mvcboard.user.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService{
	
	private UserDAO userDAO;
	
	@Inject
	public UserServiceImpl(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@Override
	public void register(UserVO userVO) throws Exception {
		userDAO.register(userVO);
	}

	@Override
	public UserVO login(LoginDTO loginDTO) throws Exception {
		return userDAO.login(loginDTO);
	}

	@Override
	public void keepLogin(String userId, String sessionId, Date sessionLimit) throws Exception {
		userDAO.keepLogin(userId, sessionId, sessionLimit);
	}

	@Override
	public UserVO checkLoginBefore(String value) throws Exception {
		return userDAO.checkUserWithSessionKey(value);
	}
}
