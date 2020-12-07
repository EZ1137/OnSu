package com.kh.onsu.admin.snslogin;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.oauth.OAuth20Service;

@Component
public class KakaoLoginBo {
	
	private final static String K_CLIENT_ID = "364e9da7a7f03e4c08c303728a4a777e";
	private final static String K_REDIRECT_URI = "http://localhost:8787/onsu/kcallback"; 
	private final static String SESSION_STATE = "oauth_state_k";

	public String getAuthorizationUrl(HttpSession session) { 

		String kakaoUrl = "https://kauth.kakao.com/oauth/authorize?"
						+ "client_id=" + K_CLIENT_ID
						+ "&redirect_uri=" + K_REDIRECT_URI
						+ "&response_type=code"; 
		
		return kakaoUrl; 
	}

    /* http session에 데이터 저장 */
    private void setSession(HttpSession session, String state) {
        session.setAttribute(SESSION_STATE, state);     
    }

    /* http session에서 데이터 가져오기 */ 
    private String getSession(HttpSession session) {
        return (String) session.getAttribute(SESSION_STATE);
    }
	
	/* 네이버아이디로 Callback 처리 및  AccessToken 획득 Method */
    public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException{

        /* Callback으로 전달받은 세선검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인 */
        String sessionState = getSession(session);
        if (StringUtils.pathEquals(sessionState, state)) {

            OAuth20Service oauthService = new ServiceBuilder()
                    .apiKey(K_CLIENT_ID)
                    .callback(K_REDIRECT_URI)
                    .state(state)
                    .build(NaverLoginApi.instance());

            /* Scribe에서 제공하는 AccessToken 획득 기능으로 네아로 Access Token을 획득 */
            OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
            return accessToken;
        }
        return null;
    }
	
}
