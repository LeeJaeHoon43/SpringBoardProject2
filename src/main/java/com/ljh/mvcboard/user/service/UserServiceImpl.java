package com.ljh.mvcboard.user.service;

import java.util.Date;
import javax.inject.Inject;
import org.mindrot.jbcrypt.BCrypt;
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

	@Override
	public boolean isValidUserPw(String userId, String userPw) throws Exception {
		String hashedUserPw = userDAO.getUserPw(userId);
        return BCrypt.checkpw(userPw, hashedUserPw);
	}

	@Override
	public void userInfoModify(UserVO userVO) throws Exception {
		userDAO.userInfoUpdate(userVO);
	}

	@Override
	public void userPwModify(String userId, String newUserPw) throws Exception {
		userDAO.userPwUpdate(userId, newUserPw);
	}

	@Override
	public void userImgModify(String userId, String userImg) throws Exception {
		userDAO.userImgUpdate(userId, userImg);
	}

	@Override
	public void userDelete(UserVO userVO) throws Exception {
		userDAO.userDelete(userVO);
	}

	@Override
	public int passChk(UserVO vo) throws Exception {
		int result = userDAO.passChk(vo);
		return result;
	}
}
