package com.ljh.mvcboard.user.persistence;

import java.util.Date;
import com.ljh.mvcboard.user.domain.LoginDTO;
import com.ljh.mvcboard.user.domain.UserVO;

public interface UserDAO {
	// 회원가입 처리.
	public void register(UserVO userVO) throws Exception;
	
	// 로그인 처리.
	public UserVO login(LoginDTO loginDTO) throws Exception;
	
	// 로그인 유지 처리.
	public void keepLogin(String userId, String sessionId, Date sessionLimit) throws Exception;
		
	// 세션키 검증.
	public UserVO checkUserWithSessionKey(String value) throws Exception;
	
	// 회원비밀번호.
	public String getUserPw(String userId) throws Exception;

    // 회원정보 수정처리.
    public void userInfoUpdate(UserVO userVO) throws Exception;

    // 회원 비밀번호 수정.
    public void userPwUpdate(String userId, String newUserPw) throws Exception;

    // 회원 프로필 사진파일 수정.
    public void userImgUpdate(String userId, String userImg) throws Exception;
    
    // 비밀번호 체크.
    public int passChk(UserVO vo) throws Exception;
    
    // 회원 탈퇴.
 	public void userDelete(UserVO userVO) throws Exception;
}
