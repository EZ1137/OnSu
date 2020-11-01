package com.kh.onsoo.member.model.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.jdbc.JdbcDaoImpl;

public class UserJdbcDaoImpl extends JdbcDaoImpl {
	
	
	// security에서 넘어 온것이 loadUsersByUsername으로 넘어온다 
	@Override
	protected List<UserDetails> loadUsersByUsername(String member_id) {
								//security-context에서 넘어온 값이 쿼리문으로 들어와 
		return getJdbcTemplate().query(getUsersByUsernameQuery(), new String[] {member_id}, new RowMapper<UserDetails>() {
            public UserDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
            	String member_id = rs.getString(1);
                String member_pw = rs.getString(2);
                int r_enabled = rs.getInt(3);
                //해당 username, password, enabled 권한을 갖고온다 
                
                boolean enabled= false; 
                if(r_enabled ==1) enabled= true;
                
                System.out.println("username: " + member_id+", password: " + member_pw + "enabled: " + enabled);
                
                //새로운 new 객체를 생성해서 디비에 있는 값들을 하나씩 넣어줘서 새롭게 세팅 해준다 .
                return new User(member_id, member_pw, enabled, true, true, true,AuthorityUtils.NO_AUTHORITIES);            
             }
        });
	}
	
	
	//security에 있는 해당 쿼리문에 맞는 디비 값을 전달 받는다.  AuthoritiesByUsernameQuery 
	@Override
	protected List<GrantedAuthority> loadUserAuthorities(String member_id) {
		return getJdbcTemplate().query(getAuthoritiesByUsernameQuery(), new String[] {member_id},
			new RowMapper<GrantedAuthority>() {

				@Override
				public GrantedAuthority mapRow(ResultSet rs, int rowNum) throws SQLException {
					String roleName = getRolePrefix() + rs.getString(2);
					System.out.println("roleName: " + roleName);
					
					//해당 쿼리문에 맞는 값을 simpleGrantedAuthority에 넣어준다 
					return new SimpleGrantedAuthority(roleName);
				}
				
			});
	}
	
}
