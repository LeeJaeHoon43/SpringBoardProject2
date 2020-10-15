package com.ljh.mvcboard.user.service;

import java.util.Date;
import com.ljh.mvcboard.user.domain.LoginDTO;
import com.ljh.mvcboard.user.domain.UserVO;

public interface UserService {

	// 회원가입 처리.
	public void register(UserVO userVO) throws Exception;
	
	// 로그인 처리.
	public UserVO login(LoginDTO loginDTO) throws Exception;
	
	// 로그인 유지 처리.
	public void keepLogin(String userId, String sessionId, Date sessionLimit) throws Exception;
			
	// 세션키 검증.
	public UserVO checkLoginBefore(String value) throws Exception;
	
	public boolean isValidUserPw(String userId, String userPw) throws Exception;

    public void userInfoModify(UserVO userVO) throws Exception;

    public void userPwModify(String userId, String newUserPw) throws Exception;

    // 회원 프로필 사진파일 수정.
    public void userImgModify(String userId, String userImg) throws Exception;
    
    // 비밀번호 체크.
    public int passChk(UserVO vo) throws Exception;
    
    // 회원 탈퇴.
  	public void userDelete(UserVO userVO) throws Exception;
}
